<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Data_siswa extends CI_Controller {
    function __construct() {
        parent::__construct();
        $this->sespre = $this->config->item('session_name_prefix');

        $this->d['admlevel'] = $this->session->userdata($this->sespre.'level');
        $this->d['url'] = "data_siswa";
        $this->d['idnya'] = "datasiswa";
        $this->d['nama_form'] = "f_datasiswa";
    }

    public function datatable() {
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $draw = $this->input->post('draw');
        $search = $this->input->post('search');

        $d_total_row = $this->db->query("SELECT id FROM m_siswa WHERE nama LIKE '%".$search['value']."%' AND stat_data = 'A'")->num_rows();
    
        $q_datanya = $this->db->query("SELECT a.*,
                                        (SELECT COUNT(id) FROM m_admin WHERE level = 'siswa' AND konid = a.id) AS jml_aktif
                                        FROM m_siswa a
                                        WHERE a.nama LIKE '%".$search['value']."%' AND stat_data = 'A' 
                                        ORDER BY a.nis ASC 
                                        LIMIT ".$start.", ".$length."")->result_array();
        $data = array();
        $no = ($start+1);

        foreach ($q_datanya as $d) {
            $data_ok = array();
            $data_ok[0] = $no++;
            $data_ok[1] = $d['nis'];
            $data_ok[2] = strtoupper($d['nama']);

            $link_aktif_user = $d['jml_aktif'] > 0 ? '' : '<a href="#" onclick="return aktifkan(\''.$d['id'].'\');" class="btn btn-xs btn-info"><i class="fa fa-user"></i> Aktifkan User</a>';

            $data_ok[3] = '<a href="'.base_url().$this->d['url'].'/edit/'.$d['id'].'" class="btn btn-xs btn-success"><i class="fa fa-edit"></i> Edit</a>
                '.$link_aktif_user.'
                <a href="#" onclick="return hapus(\''.$d['id'].'\');" class="btn btn-xs btn-danger"><i class="fa fa-remove"></i> Hapus</a> ';

            $data[] = $data_ok;
        }

        $json_data = array(
                    "draw" => $draw,
                    "iTotalRecords" => $d_total_row,
                    "iTotalDisplayRecords" => $d_total_row,
                    "data" => $data
                );
        j($json_data);
        exit;
    }

    public function edit($id) {
        $q = $this->db->query("SELECT *, 'edit' AS mode FROM m_siswa WHERE id = '$id'")->row_array();
        $this->d['p_jk']  = array(""=>"JK","L"=>"Laki-laki","P"=>"Perempuan");
        $this->d['p_agama']  = array(""=>"Agama","Islam"=>"Islam","Katolik"=>"Katolik","Kristen"=>"Kristen","Hindu"=>"Hindu","Budha"=>"Budha","Konghucu"=>"Konghucu");
        $this->d['p_status_anak']  = array(""=>"Status Anak","AK"=>"Anak Kandung","Anak Tiri"=>"Anak Tiri");
        $this->d['p_diterima_kelas']  = array(""=>"Diterima Kelas","VII"=>"VII","VIII"=>"VIII", "IX"=>"IX");
        
        if (empty($q)) {
            $this->d['data']['id'] = "";
            $this->d['data']['mode'] = "add";
            $this->d['data']['nis'] = "";
            $this->d['data']['nisn'] = "";
            $this->d['data']['nama'] = "";
            $this->d['data']['jk'] = "";
            $this->d['data']['tmp_lahir'] = "";
            $this->d['data']['tgl_lahir'] = "";
            $this->d['data']['agama'] = "";
            $this->d['data']['status'] = "";
            $this->d['data']['anakke'] = "";
            $this->d['data']['alamat'] = "";
            $this->d['data']['notelp'] = "";
            $this->d['data']['sek_asal'] = "";
            $this->d['data']['sek_asal_alamat'] = "";
            $this->d['data']['diterima_kelas'] = "";
            $this->d['data']['diterima_tgl'] = "";
            $this->d['data']['diterima_smt'] = "";
            $this->d['data']['ijazah_no'] = "";
            $this->d['data']['ijazah_thn'] = "";
            $this->d['data']['skhun_no'] = "";
            $this->d['data']['skhun_thn'] = "";
            $this->d['data']['ortu_ayah'] = "";
            $this->d['data']['ortu_ibu'] = "";
            $this->d['data']['ortu_alamat'] = "";
            $this->d['data']['ortu_notelp'] = "";
            $this->d['data']['ortu_ayah_pkj'] = "";
            $this->d['data']['ortu_ibu_pkj'] = "";
            $this->d['data']['wali'] = "";
            $this->d['data']['wali_alamat'] = "";
            $this->d['data']['notelp_rumah'] = "";
            $this->d['data']['wali_pkj'] = "";
            $this->d['data']['stat_data'] = "";
            $this->d['data']['foto'] = "";
        } else {
            $this->d['data'] = $q;
        }


        $this->d['p'] = "form";
        $this->load->view("template_utama", $this->d);
    }

    public function simpan() {
        $p = $this->input->post();

        $data['nis'] = $p['nis'];
        $data['nisn'] = $p['nisn'];
        $data['nama'] = addslashes($p['nama']);
        $data['jk'] = $p['jk'];
        $data['tmp_lahir'] = $p['tmp_lahir'];
        $data['tgl_lahir'] = $p['tgl_lahir'];
        $data['agama'] = $p['agama'];
        $data['status'] = $p['status'];
        $data['anakke'] = $p['anakke'];
        $data['alamat'] = $p['alamat'];
        $data['notelp'] = $p['notelp'];
        $data['sek_asal'] = $p['sek_asal'];
        $data['sek_asal_alamat'] = $p['sek_asal_alamat'];
        $data['diterima_kelas'] = $p['diterima_kelas'];
        $data['diterima_tgl'] = $p['diterima_tgl'];
        $data['diterima_smt'] = $p['diterima_kelas'];
        $data['ijazah_no'] = $p['ijazah_no'];
        $data['ijazah_thn'] = $p['ijazah_thn'];
        $data['skhun_no'] = $p['skhun_no'];
        $data['skhun_no'] = $p['skhun_no'];
        $data['skhun_thn'] = $p['skhun_thn'];
        $data['ortu_ayah'] = $p['ortu_ayah'];
        $data['ortu_ibu'] = $p['ortu_ibu'];
        $data['ortu_alamat'] = $p['ortu_alamat'];
        $data['ortu_notelp'] = $p['ortu_notelp'];
        $data['ortu_ayah_pkj'] = $p['ortu_ayah_pkj'];
        $data['ortu_ibu_pkj'] = $p['ortu_ibu_pkj'];
        $data['wali'] = $p['wali'];
        $data['wali_alamat'] = $p['wali_alamat'];
        $data['notelp_rumah'] = $p['notelp_rumah'];
        $data['wali_pkj'] = $p['wali_pkj'];

        //upload config 
        $config['upload_path']      = './upload/foto_siswa';
        $config['allowed_types']    = 'jpg';
        $config['max_size']         = '2000';
        $config['max_width']        = '1000';
        $config['max_height']       = '1000';

        $this->load->library('upload', $config);

        if ( ! $this->upload->do_upload('userfile')) {
            $this->session->set_flashdata('ue', '<div class="alert alert-danger">'.$this->upload->display_errors().'</div>');
        } else {
            $ud = $this->upload->data();
            $data['foto'] = $ud['file_name'];
        }


        if ($p['_mode'] == "add") {
            $this->db->insert('m_siswa', $data);
        } else if ($p['_mode'] == "edit") {
            $this->db->where('id', $p['_id']);
            $this->db->update('m_siswa', $data);
        } else {
            echo "kesalahan sistem";
            exit;
        }

        redirect($this->d['url']);
    }

    public function hapus($id) {
        $this->db->query("DELETE FROM m_siswa WHERE id = '$id'");
        redirect($this->d['url']);
    }


    public function aktifkan($id) {

        $detil_data = $this->db->query("SELECT nis, nama FROM m_siswa WHERE id = '".$id."'")->row_array();

        if (empty($detil_data)) {
            $d['status'] = "gagal";
            $d['data'] = "Terjadi kesalahan sistem..";
        } else {
            $username = $detil_data['nis'];
            $password = sha1(sha1($username));

            $this->db->query("INSERT INTO m_admin (username,password,level,konid,aktif) VALUES ('".$username."', '".$password."', 'siswa', '$id', 'Y')");

            $d['status'] = "ok";
            $d['data'] = "Username : ".$username." berhasil diaktifkan..! Password default : ".$username."";
        }
        
        j($d);
    }

    public function index() {
        $this->d['p'] = "list";
        $this->load->view("template_utama", $this->d);
    }

}
