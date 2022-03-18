<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Validasi_pembayaran extends CI_Controller 
{

	function __construct() {
        parent::__construct();

        $this->sespre = $this->config->item('session_name_prefix');
        $this->load->model('Pembayaran_model');
        $this->d['admlevel'] = $this->session->userdata($this->sespre.'level');
        $this->d['url'] = "validasi_pembayaran";
        $this->d['idnya'] = "validasipembayran";
        $this->d['nama_form'] = "f_validasipembayaran";
    }

    public function datatable() {
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $draw = $this->input->post('draw');
        $search = $this->input->post('search');

        $d_total_row = $this->db->query("SELECT
                                        a.id, b.nama nmsiswa, c.nama nmkelas, d.nama nmbayar, jml_bayar jml_byr, bukti_tf bukti_tf
                                        FROM t_pembayaran a
                                        INNER JOIN m_siswa b ON a.id_siswa = b.id
                                        INNER JOIN m_kelas c ON a.id_kelas = c.id
                                        INNER JOIN m_pembayaran d ON a.id_bayar = d.id
                                        ORDER BY nmsiswa ASC")->num_rows();

                                       
    
        $q_datanya = $this->db->query("SELECT
                                    a.id, b.nama nmsiswa, c.nama nmkelas, d.nama nmbayar, jml_bayar jml_byr, bukti_tf bukti_tf
                                    FROM t_pembayaran a
                                    INNER JOIN m_siswa b ON a.id_siswa = b.id
                                    INNER JOIN m_kelas c ON a.id_kelas = c.id
                                    INNER JOIN m_pembayaran d ON a.id_bayar = d.id
                                    ORDER BY nmsiswa ASC LIMIT ".$start.", ".$length."")->result_array();

        $data = array();
        $no = ($start+1);

        foreach ($q_datanya as $d) {
            
            $data_ok = array();
            $data_ok[0] = $no++;
            $data_ok[1] = $d['nmsiswa'];
            $data_ok[2] = $d['nmkelas'];
            $data_ok[3] = $d['nmbayar'];
            $data_ok[4] = $d['jml_byr'];
            $data_ok[5] = $d['bukti_tf'];
             
            $data_ok[6] = '<a href="'.base_url().$this->d['url'].'/download/'.$d['bukti_tf'].'" class="btn btn-xs btn-success"><i class="fa fa-edit"></i> Detail </a>';
           
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
        $p = $this->db->query("SELECT id, nama FROM m_pembayaran ORDER BY id ASC");
        $q = $this->db->query("SELECT *, 'edit' AS mode FROM t_pembayaran WHERE id = '$id'")->row_array();
        
        $d = array();
        $d['status'] = "ok";
        if (empty($q)) {
            $d['data']['id_siswa'] = "";
            $d['data']['mode'] = "add";
            $d['data']['id_bayar'] = "";
            $d['data']['jml_bayar'] = "";
            $d['data']['keterangan'] = "";
        } else {
            $d['data'] = $q;
        }

        $this->d['r_bayar'] = $p->result_array();
        $this->d['p'] = "form";
        $this->load->view("template_utama", $this->d);
    }

    public function download($nama) {
        $pth    =   file_get_contents(base_url()."upload/".$nama);
        force_download($nama, $pth);
    }
    

    public function index() {
    	$this->d['p'] = "list";
        $this->load->view("template_utama", $this->d);
    }

}