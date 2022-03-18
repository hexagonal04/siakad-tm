<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Jadwal extends CI_Controller {
	function __construct() {
        parent::__construct();
        $this->sespre = $this->config->item('session_name_prefix');

        $this->d['admlevel'] = $this->session->userdata($this->sespre.'level');
        $this->d['url'] = "jadwal";
        $this->d['idnya'] = "jadwal";
        $this->d['id_kelas'] = $this->session->userdata($this->sespre.'id_kelas');
        $this->d['nama_form'] = "f_jadwal";

        $get_tasm = $this->db->query("SELECT tahun FROM tahun WHERE aktif = 'Y'")->row_array();
        $this->d['tasm'] = $get_tasm['tahun'];
    }

    public function datatable() {
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $draw = $this->input->post('draw');
        $search = $this->input->post('search');

        $d_total_row = $this->db->query("SELECT
                                        a.id, b.nama nmguru, c.nama nmkelas, d.nama nmmapel, hari hari, jam_mulai jmulai, jam_selesai jakhir
                                        FROM t_jadwal a
                                        INNER JOIN m_guru b ON a.id_guru = b.id
                                        INNER JOIN m_kelas c ON a.id_kelas = c.id
                                        INNER JOIN m_mapel d ON a.id_mapel = d.id
                                        WHERE a.id_kelas = ".$this->d['id_kelas']."
                                        ORDER BY nmguru ASC, nmmapel ASC, nmkelas ASC")->num_rows();

                                       
    
        $q_datanya = $this->db->query("SELECT
                                    a.id, b.nama nmguru, c.nama nmkelas, d.nama nmmapel, hari hari, jam_mulai jmulai, jam_selesai jakhir
                                    FROM t_jadwal a
                                    INNER JOIN m_guru b ON a.id_guru = b.id
                                    INNER JOIN m_kelas c ON a.id_kelas = c.id
                                    INNER JOIN m_mapel d ON a.id_mapel = d.id
                                    WHERE a.id_kelas = ".$this->d['id_kelas']." AND 
                                    (b.nama LIKE '%".$search['value']."%' 
                                    OR c.nama LIKE '%".$search['value']."%'
                                    OR d.nama LIKE '%".$search['value']."%')
                                    ORDER BY nmguru ASC, nmmapel ASC, nmkelas ASC
                                    LIMIT ".$start.", ".$length."")->result_array();
        

        $data = array();
        $no = ($start+1);

        foreach ($q_datanya as $d) {
            $data_ok = array();
            $data_ok[0] = $no++;
            $data_ok[1] = $d['nmguru'];
            $data_ok[2] = $d['nmmapel']." - ".$d['nmkelas'];
            $data_ok[3] = $d['hari'];
            $data_ok[4] = $d['jmulai']." - ".$d['jakhir'];

    

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
        $this->d['siswa_kelas'] = $this->db->query("SELECT * FROM t_jadwal a
                                                    WHERE a.id_kelas = ".$this->d['id_kelas']."")->result_array();
    	$this->d['p'] = "list";
        $this->load->view("template_elearning", $this->d);
    }

}