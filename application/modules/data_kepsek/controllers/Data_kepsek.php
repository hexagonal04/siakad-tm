<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Data_kepsek extends CI_Controller {
	function __construct() {
        parent::__construct();
        $this->sespre = $this->config->item('session_name_prefix');

        $this->d['admlevel'] = $this->session->userdata($this->sespre.'level');
        $this->d['url'] = "data_kepsek";
        $this->d['idnya'] = "datakepsek";
        $this->d['nama_form'] = "f_datakepsek";

        $akses = array("admin");

        if (!cek_hak_akses($this->d['admlevel'], $akses)) {
            redirect('unauthorized_access');
        }
        
    }

    public function datatable() {
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $draw = $this->input->post('draw');
        $search = $this->input->post('search');

        $d_total_row = $this->db->query("SELECT id FROM m_kepsek")->num_rows();
    
        $qdata = $this->db->query("SELECT 
                                        a.*,
                                        (SELECT COUNT(id) FROM m_admin WHERE level = 'kepsek' AND konid = a.id) AS jml_aktif,
                                        b.username
                                        FROM m_kepsek a
                                        LEFT JOIN m_admin b ON CONCAT('kepsek',a.id) = CONCAT(b.level,b.konid) 
                                        WHERE a.nama LIKE '%".$search['value']."%' ORDER BY a.nama ASC LIMIT ".$start.", ".$length."");
        $q_datanya = $qdata->result_array();
        $j_datanya = $qdata->num_rows();

        $data = array();
        $no = ($start+1);

        foreach ($q_datanya as $d) {
            $data_ok = array();
            $data_ok[0] = $no++;
            $data_ok[1] = $d['jml_aktif'] > 0 ? $d['nama']." / <b><i>".$d['username']."</i></b> / <b><i>password</i></b>" : $d['nama'];
            $data_ok[2] = $d['jml_aktif'] > 0 ? '<span class="label label-success">Aktif</span>' : '<span class="label label-warning">Belum Aktif</span>';

            $link_aktif_user = $d['jml_aktif'] > 0 ? '<a href="#" onclick="return nonaktifkan(\''.$d['id'].'\');" class="btn btn-xs btn-warning"><i class="fa fa-user"></i> NonAktifkan User</a>' : '<a href="#" onclick="return aktifkan(\''.$d['id'].'\');" class="btn btn-xs btn-info"><i class="fa fa-user"></i> Aktifkan User</a>';

            $data_ok[3] = '<a href="#" onclick="return edit(\''.$d['id'].'\');" class="btn btn-xs btn-success"><i class="fa fa-edit"></i> Edit</a> 
                <a href="#" onclick="return hapus(\''.$d['id'].'\');" class="btn btn-xs btn-danger"><i class="fa fa-remove"></i> Hapus</a> '.$link_aktif_user;

            $data[] = $data_ok;
        }

        $json_data = array(
                    "draw" => $draw,
                    "iTotalRecords" => $j_datanya,
                    "iTotalDisplayRecords" => $d_total_row,
                    "data" => $data
                );
        j($json_data);
        exit;
    }

    public function edit($id) {
        $q = $this->db->query("SELECT *, 'edit' AS mode FROM m_kepsek WHERE id = '$id'")->row_array();

        $d = array();
        $d['status'] = "ok";
        if (empty($q)) {
            $d['data']['id'] = "";
            $d['data']['mode'] = "add";
            $d['data']['nama'] = "";
            $d['data']['id_siswa'] = "";
        } else {
            $d['data'] = $q;
        }

        j($d);
    }

    public function simpan() {
        $p = $this->input->post();

        $d['status'] = "";
        $d['data'] = "";

        if ($p['_mode'] == "add") {
            $this->db->query("INSERT INTO m_kepsek (nama, jk) VALUES ('".$p['nama']."','".$p['jk']."')");

            $d['status'] = "ok";
            $d['data'] = "Data berhasil disimpan";
        } else if ($p['_mode'] == "edit") {
            $this->db->query("UPDATE m_kepsek SET nama = '".$p['nama']."', jk = '".$p['jk']."' WHERE id = '".$p['_id']."'");

            $d['status'] = "ok";
            $d['data'] = "Data berhasil disimpan";
        } else {
            $d['status'] = "gagal";
            $d['data'] = "Kesalahan sistem";
        }

        j($d);
    }

    public function hapus($id) {
        $this->db->query("DELETE FROM m_kepsek WHERE id = '$id'");

        $d['status'] = "ok";
        $d['data'] = "Data berhasil dihapus";
        
        j($d);
    }

    public function aktifkan($id) {

        $detil_data = $this->db->query("SELECT nama FROM m_kepsek WHERE id = '".$id."'")->row_array();

        if (empty($detil_data)) {
            $d['status'] = "gagal";
            $d['data'] = "Terjadi kesalahan sistem..";
        } else {
            $username = strtolower(str_replace(array(".",","," "), array("","",""), $detil_data['nama']));
            $password = sha1(sha1('password'));

            $username = substr($username, 0, 6);

            $cek_username = $this->db->query("SELECT * FROM m_admin WHERE username = '".$username."'");

            $jml_username = $cek_username->num_rows();
            $jika_sudah_ada = $jml_username > 0 ? $username."_".($jml_username++) : $username;
            $username_fix = $jika_sudah_ada;

            $this->db->query("INSERT INTO m_admin (username,password,level,konid,aktif) VALUES ('".$username_fix."', '".$password."', 'kepsek', '$id', 'Y')");

            $d['status'] = "ok";
            $d['data'] = "Username : ".$username_fix." berhasil diaktifkan..! Password default : password";
        }
        
        j($d);
    }

    public function nonaktifkan($id) {

        $detil_data = $this->db->query("SELECT nama FROM m_kepsek WHERE id = '".$id."'")->row_array();

        if (empty($detil_data)) {
            $d['status'] = "gagal";
            $d['data'] = "Terjadi kesalahan sistem..";
        } else {
            $username = strtolower(str_replace(array(".",","," "), array("","",""), $detil_data['nama']));
            $password = sha1(sha1('password'));

            $this->db->query("DELETE FROM m_admin WHERE level = 'kepsek' AND konid = '$id'");

            $d['status'] = "ok";
            $d['data'] = "User dinonaktifkan..";
        }
        
        j($d);
    }

    public function index() {
    	$this->d['p'] = "list";
        $this->d['p_jk'] = array("2"=>"Perempuan","1"=>"Laki-Laki");
        $this->load->view("template_utama", $this->d);
    }

}