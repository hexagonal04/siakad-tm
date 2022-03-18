<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class View_tugas extends CI_Controller {
	function __construct() {
        parent::__construct();
        $this->sespre = $this->config->item('session_name_prefix');

        $this->d['admlevel'] = $this->session->userdata($this->sespre.'level');
        $this->d['url'] = "view_tugas";
        $this->d['idnya'] = "view_tugas";
        $this->d['nama_form'] = "f_viewtugas";
        $this->load->model('tugas_model');
    }

    public function datatable() {
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $draw = $this->input->post('draw');
        $search = $this->input->post('search');

        $d_total_row = $this->db->query("SELECT a.id, b.nama nmmapel, c.nama nmkelas, judul judul, deadline deadline
                                         FROM t_tugas a
                                         INNER JOIN m_mapel b ON a.id_mapel = b.id
                                         INNER JOIN m_kelas c ON a.id_kelas = c.id
                                         ORDER BY nmmapel ASC, nmkelas ASC")->num_rows();

                                       
    
        $q_datanya = $this->db->query("SELECT
                                    a.id, b.nama nmmapel, c.nama nmkelas, judul judul, deadline deadline
                                    FROM t_tugas a
                                    INNER JOIN m_mapel b ON a.id_mapel = b.id
                                    INNER JOIN m_kelas c ON a.id_kelas = c.id
                                    ORDER BY nmmapel ASC, nmkelas ASC LIMIT ".$start.", ".$length."")->result_array();
        

        $data = array();
        $no = ($start+1);

        foreach ($q_datanya as $d) {
            $data_ok = array();
            $data_ok[0] = $no++;
            $data_ok[1] = $d['nmmapel'];
            $data_ok[2] = $d['nmkelas'];
            $data_ok[3] = $d['judul'];
            $data_ok[4] = $d['deadline'];

            $data_ok[5] = 
            '<a href="'.base_url().$this->d['url'].'/detail_tugas/'.$d['id'].'" class="btn btn-xs btn-success"><i class="fa fa-edit"></i> Detail </a>';

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
        $q = $this->db->query("SELECT id, nama FROM m_guru ORDER BY id ASC");
        $r = $this->db->query("SELECT id, nama FROM m_mapel ORDER BY id ASC");
        $s = $this->db->query("SELECT id, nama FROM m_kelas ORDER BY nama ASC");

        $this->d['r_guru'] = $q->result_array();
        $this->d['r_mapel'] = $r->result_array();
        $this->d['r_kelas'] = $s->result_array();

        $this->d['p'] = "form";
        $this->load->view("template_elearning", $this->d);
    }

    public function simpan() {

        $p = $this->input->post();
        
        $this->db->query("INSERT INTO t_tugas (id_guru, id_mapel, id_kelas, judul, tugas, deadline) VALUES ('".$p['guru']."', '".$p['mapel']."', '".$p['kelas']."','".$p['judul']."','".$p['tugas']."','".$p['deadline']."')");
    
        redirect($this->d['url']);
    }

    public function hapus($id) {
        $this->db->query("DELETE FROM t_tugas WHERE id = '$id'");

        $d['status'] = "ok";
        $d['data'] = "Data berhasil dihapus";
        
        j($d);
    }

    public function detail_tugas($id) {

    	$this->d['p'] ="detail_tugas";
        $data['detail'] = $this->tugas_model->select_by_id($id);
        $this->load->view("template_elearning", $this->d
    );
        

    }
    public function index() {
    	$this->d['p'] ="list";
        $this->load->view("template_elearning", $this->d);
    }

}