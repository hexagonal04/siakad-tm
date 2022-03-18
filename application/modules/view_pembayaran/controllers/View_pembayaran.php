<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class View_pembayaran extends CI_Controller 
{

	function __construct() {
        parent::__construct();

        $this->sespre = $this->config->item('session_name_prefix');

        $this->d['admlevel'] = $this->session->userdata($this->sespre.'level');
        $this->d['id_siswa'] = $this->session->userdata($this->sespre.'id_siswa');
        $this->d['url'] = "view_pembayaran";
        $this->d['idnya'] = "viewpembayran";
        $this->d['nama_form'] = "f_viewpembayaran";
    }

    public function datatable() {
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $draw = $this->input->post('draw');
        $search = $this->input->post('search');

        $d_total_row = $this->db->query("SELECT
                                        a.id, b.nama nmsiswa, c.nama nmbayar, jml_bayar jml_byr, keterangan ket, status_byr status_byr
                                        FROM t_status_pembayaran a
                                        INNER JOIN m_siswa b ON a.id_siswa = b.id
                                        INNER JOIN m_pembayaran c ON a.id_bayar = c.id
                                        WHERE a.id_siswa = ".$this->d['id_siswa']."
                                        ORDER BY nmsiswa ASC")->num_rows();

                                       
    
        $q_datanya = $this->db->query("SELECT
                                    a.id, b.nama nmsiswa, c.nama nmbayar, jml_bayar jml_byr, keterangan ket, status_byr status_byr
                                    FROM t_status_pembayaran a
                                    INNER JOIN m_siswa b ON a.id_siswa = b.id
                                    INNER JOIN m_pembayaran c ON a.id_bayar = c.id
                                    WHERE a.id_siswa = ".$this->d['id_siswa']."
                                    ORDER BY nmsiswa ASC LIMIT ".$start.", ".$length."")->result_array();

        $data = array();
        $no = ($start+1);

        foreach ($q_datanya as $d) {
            $data_ok = array();
            $data_ok[0] = $no++;
            $data_ok[1] = $d['nmsiswa'];
            $data_ok[2] = $d['nmbayar'];
            $data_ok[3] = $d['jml_byr'];
            $data_ok[4] = $d['ket'];
            $data_ok[5] = $d['status_byr'];

            //$data_ok[5] = '<a href="'.base_url().$this->d['url'].'/edit/'.$d['id'].'" class="btn btn-xs btn-success"><i class="fa fa-edit"></i> Edit</a>
            //<a href="#" onclick="return hapus(\''.$d['id'].'\');" class="btn btn-xs btn-danger"><i class="fa fa-remove"></i> Hapus</a> ';
            
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
    public function index() {

    $this->d['siswa_id'] = $this->db->query("SELECT * FROM t_status_pembayaran a
                                            WHERE a.id_siswa = ".$this->d['id_siswa']."")->result_array();
    $this->d['p'] = "list";
    $this->load->view("template_utama", $this->d);
    }

}