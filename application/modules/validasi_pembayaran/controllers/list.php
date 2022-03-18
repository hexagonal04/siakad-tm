<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Validasi_pembayaran extends CI_Controller 
{

	function __construct() {
        parent::__construct();

        $this->sespre = $this->config->item('session_name_prefix');

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
                                        a.id, b.nama nmsiswa, c.nama nmbayar, jml_bayar jml_byr, bukti_tf bukti_tf
                                        FROM t_pembayaran a
                                        INNER JOIN m_siswa b ON a.id_siswa = b.id
                                        INNER JOIN m_pembayaran c ON a.id_bayar = c.id
                                        ORDER BY nmsiswa ASC")->num_rows();

                                       
    
        $q_datanya = $this->db->query("SELECT
                                    a.id, b.nama nmsiswa, c.nama nmbayar, jml_bayar jml_byr, bukti_tf bukti_tf
                                    FROM t_pembayaran a
                                    INNER JOIN m_siswa b ON a.id_siswa = b.id
                                    INNER JOIN m_pembayaran c ON a.id_bayar = c.id
                                    ORDER BY nmsiswa ASC LIMIT ".$start.", ".$length."")->result_array();

        $data = array();
        $no = ($start+1);

        foreach ($q_datanya as $d) {
            $data_ok = array();
            $data_ok[0] = $no++;
            $data_ok[1] = $d['nmsiswa'];
            $data_ok[2] = $d['nmbayar'];
            $data_ok[3] = $d['jml_byr'];
            $data_ok[4] = $d['bukti_tf'];

            $data_ok[5] = '<a href="#" onclick="return hapus(\''.$d['id'].'\');" class="btn btn-xs btn-danger"><i class="fa fa-remove"></i> detail</a> ';
            
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

    
    public function index() {
    	$this->d['p'] = "list";
      $this->load->view("template_utama", $this->d);
    }

}