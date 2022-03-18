<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class View_nilaitugas extends CI_Controller 
{

	function __construct() {
        parent::__construct();

        $this->sespre = $this->config->item('session_name_prefix');

        $this->d['admlevel'] = $this->session->userdata($this->sespre.'level');
        $this->d['id_siswa'] = $this->session->userdata($this->sespre.'id');
        $this->d['url'] = "view_nilaitugas";
        $this->d['idnya'] = "viewnilaiugas";
        $this->d['nama_form'] = "f_viewnilaitugas";
    }

    public function datatable() {
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $draw = $this->input->post('draw');
        $search = $this->input->post('search');

        $d_total_row = $this->db->query("SELECT
                                        a.id, b.nama_kd nama_kd, c.nilai nilai
                                        FROM t_nilai a
                                        INNER JOIN t_mapel_kd b ON a.id_mapel_kd = b.id
                                        WHERE a.id_siswa = ".$this->d['id_siswa']."
                                        ")->num_rows();

        $q_datanya = $this->db->query("SELECT
                                    a.id, b.nama_kd nama_kd, c.nilai nilai
                                    FROM t_nilai a
                                    INNER JOIN t_mapel_kd b ON a.id_mapel_kd = b.id
                                    WHERE a.id_siswa = ".$this->d['id_siswa']."
                                    ")->result_array();

        $data = array();
        $no = ($start+1);

        foreach ($q_datanya as $d) {
            $data_ok = array();
            $data_ok[0] = $no++;
            $data_ok[1] = $d['nama_kd'];
            $data_ok[2] = $d['nilai'];            
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

    public function index() 
    {
    $this->d['siswa_id'] = $this->db->query("SELECT * FROM t_nilai a WHERE a.id_siswa = ".$this->d['id_siswa']."")->result_array();
    $this->d['p'] = "list";
    $this->load->view("template_utama", $this->d);
    }
}