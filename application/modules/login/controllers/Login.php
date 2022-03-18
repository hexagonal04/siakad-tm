<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Login extends CI_Controller {
	function __construct() {
        parent::__construct();
        $this->sespre = $this->config->item('session_name_prefix');
        $this->d['admlevel'] = $this->session->userdata($this->sespre.'level');
        $this->d['nama_form'] = "f_login";
        $get_tasm = $this->db->query("SELECT tahun FROM tahun WHERE aktif = 'Y'")->row_array();
        $this->d['tasm'] = $get_tasm['tahun'];
        $this->d['ta'] = substr($this->d['tasm'], 0, 4);
    }
    public function index() {
    	$this->d['p'] = "login";
        $this->load->view("login2", $this->d);
    }
    public function do_login() {
    	$p = $this->input->post();
    	$u 		= $this->security->xss_clean($p['username']);
        $p 		= $this->security->xss_clean($p['password']);
        $p_enkrip = sha1(sha1($p));
		$q_cek	= $this->db->query("SELECT * FROM m_admin WHERE username = '".$u."' AND password = '".$p_enkrip."'");
		$j_cek	= $q_cek->num_rows();
		$d_cek	= $q_cek->row();
		//echo $j_cek;
        if($j_cek == 1) {
            $level = $d_cek->level;
            if ($level == "guru") {
                $cek_is_wali_kelas = $this->db->query("SELECT a.id_kelas, b.nama nmkelas FROM t_walikelas a INNER JOIN m_kelas b ON a.id_kelas = b.id WHERE a.tasm = '".$this->d['ta']."' AND a.id_guru = '".$d_cek->konid."'")->row_array();
                $detil_nama = $this->db->query("SELECT id, nama, nip, jk FROM m_guru WHERE id = '".$d_cek->konid."'")->row();
                if (!empty($cek_is_wali_kelas)) {
                    $data = array(
                                $this->sespre.'id' => $d_cek->id,
                                $this->sespre.'id_guru' => $detil_nama->id,
                                $this->sespre.'user' => $d_cek->username,
                                $this->sespre.'level' => $d_cek->level,
                                $this->sespre.'valid' => true,
                                $this->sespre.'konid' => $d_cek->konid,
                                $this->sespre.'nama' => $detil_nama->nama,
                                $this->sespre.'jk' => $detil_nama->jk,
                                $this->sespre.'nip' => $detil_nama->nip,
                                $this->sespre.'walikelas' => array("is_wali"=>true, "id_walikelas"=>$cek_is_wali_kelas['id_kelas'],"nama_walikelas"=>$cek_is_wali_kelas['nmkelas'])
                                );  
                } else {
                    $data = array(
                                $this->sespre.'id' => $d_cek->id,
                                $this->sespre.'id_guru' => $detil_nama->id,
                                $this->sespre.'user' => $d_cek->username,
                                $this->sespre.'level' => $d_cek->level,
                                $this->sespre.'valid' => true,
                                $this->sespre.'konid' => $d_cek->konid,
                                $this->sespre.'nama' => $detil_nama->nama,
                                $this->sespre.'jk' => $detil_nama->jk,
                                $this->sespre.'nip' => $detil_nama->nip,
                                $this->sespre.'walikelas' => array("is_wali"=>false, "id_walikelas"=>"","nama_walikelas"=>"")
                                );  
                }
            } else if ($level == "siswa") {
                $detil_nama = $this->db->query("SELECT id, nama, nis, nisn, jk FROM m_siswa WHERE id = '".$d_cek->konid."'")->row();
                $detil_kelas = $this->db->query("SELECT a.id_kelas, b.nama nmkelas FROM t_kelas_siswa a INNER JOIN m_kelas b ON a.id_kelas = b.id WHERE a.id_siswa = '".$d_cek->konid."'")->row();
                $data = array(
                            $this->sespre.'id' => $d_cek->id,
                            //$this->sespre.'id_siswa' => $detil_nama->id,
                            $this->sespre.'user' => $d_cek->username,
                            $this->sespre.'level' => $d_cek->level,
                            $this->sespre.'valid' => true,
                            $this->sespre.'konid' => $d_cek->konid,
                            $this->sespre.'nama' => $detil_nama->nama,
                            $this->sespre.'jk' => $detil_nama->jk,
                            $this->sespre.'nip' => $detil_nama->nis,
                            $this->sespre.'id_kelas' => $detil_kelas->id_kelas,
                            $this->sespre.'kelas' => $detil_kelas->nmkelas,
                            $this->sespre.'walikelas' => array("is_wali"=>false, "id_walikelas"=>"","nama_walikelas"=>"")
                            );  
            } else if ($level == "keuangan") {
                $detil_nama = $this->db->query("SELECT nama, jk FROM m_keuangan WHERE id = '".$d_cek->konid."'")->row();
                $data = array(
                            $this->sespre.'id' => $d_cek->id,
                            $this->sespre.'user' => $d_cek->username,
                            $this->sespre.'level' => $d_cek->level,
                            $this->sespre.'valid' => true,
                            $this->sespre.'konid' => $d_cek->konid,
                            $this->sespre.'nama' => $detil_nama->nama,
                            $this->sespre.'jk' => $detil_nama->jk,
                            $this->sespre.'walikelas' => array("is_wali"=>false, "id_walikelas"=>"","nama_walikelas"=>"")
                            );  
            } else if ($level == "ortu") {
                $detil_nama = $this->db->query("SELECT nama, jk, id_siswa FROM m_ortu_siswa WHERE id = '".$d_cek->konid."'")->row();
                 $data = array(
                            $this->sespre.'id' => $d_cek->id,
                            $this->sespre.'user' => $d_cek->username,
                            $this->sespre.'level' => $d_cek->level,
                            $this->sespre.'valid' => true,
                            $this->sespre.'konid' => $d_cek->konid,
                            $this->sespre.'nama' => $detil_nama->nama,
                            $this->sespre.'id_siswa' => $detil_nama->id_siswa,
                            $this->sespre.'jk' => $detil_nama->jk,
                            );  
                } else if ($level == "kepsek") {
                    $detil_nama = $this->db->query("SELECT nama, jk FROM m_kepsek WHERE id = '".$d_cek->konid."'")->row();
                     $data = array(
                            $this->sespre.'id' => $d_cek->id,
                            $this->sespre.'user' => $d_cek->username,
                            $this->sespre.'level' => $d_cek->level,
                            $this->sespre.'valid' => true,
                            $this->sespre.'konid' => $d_cek->konid,
                            $this->sespre.'nama' => $detil_nama->nama,
                            $this->sespre.'jk' => $detil_nama->jk,
                            );  
            } else {
            	$data = array(
                            $this->sespre.'id' => $d_cek->id,
                            $this->sespre.'user' => $d_cek->username,
                            $this->sespre.'level' => $d_cek->level,
                            $this->sespre.'valid' => true,
                            $this->sespre.'konid' => $d_cek->konid,
                            $this->sespre.'nama'    => "Administrator",
                            $this->sespre.'nip'     => "-",
                            $this->sespre.'walikelas' => array("is_wali"=>false, "id_walikelas"=>"","nama_walikelas"=>"")
                            );  
            }
            $this->load->helper('cookie');
            $this->input->cookie("name",true);
            $this->session->set_userdata($data);

            
            $d['status'] = "ok";
	       	$d['data'] = "Login berhasil";
        } else {	
			$d['status'] = "gagal";
            $d['data'] = "Username atau password salah...!";
		}	
		j($d); 	
    }
    public function logout() {
		$data = array(
                    $this->sespre.'id' 		=> "",
                    $this->sespre.'user' 	=> "",
                    $this->sespre.'level' 	=> "",
                    $this->sespre.'valid' 	=> false,
                    $this->sespre.'konid'   => "",
                    $this->sespre.'nama'    => "",
                    $this->sespre.'nip'     => "",
                    $this->sespre.'walikelas' 	=> null,
                    );
        $this->load->helper('cookie');
        $this->input->cookie("name",false);
        $this->session->sess_destroy();
        $this->session->set_userdata($data);
		redirect('login');
    }
}