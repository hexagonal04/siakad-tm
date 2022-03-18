<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sett_materi extends CI_Controller {
	function __construct() {
        parent::__construct();
        $this->load->model(['setmateri_model']);
        $this->sespre = $this->config->item('session_name_prefix');
        $this->d['admlevel'] = $this->session->userdata($this->sespre.'level');
        $this->d['url'] = "sett_materi";
        $this->d['idnya'] = "sett_materi";
        $this->d['nama_form'] = "f_settmateri";
  
    }

    public function datatable() {
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $draw = $this->input->post('draw');
        $search = $this->input->post('search');

        $d_total_row = $this->db->query("SELECT a.id, b.nama nmmapel, judul judul, nmfile nmfile
                                         FROM t_materi a
                                         INNER JOIN m_mapel b ON a.id_mapel = b.id
                                       
                                         ORDER BY nmmapel ASC")->num_rows();

                                       
    
        $q_datanya = $this->db->query("SELECT
                                    a.id, b.nama nmmapel, judul judul, nmfile nmfile
                                    FROM t_materi a
                                    INNER JOIN m_mapel b ON a.id_mapel = b.id
                                    
                                    ORDER BY nmmapel ASC LIMIT ".$start.", ".$length."")->result_array();
        

        $data = array();
        $no = ($start+1);

        foreach ($q_datanya as $d) {
            $data_ok = array();
            $data_ok[0] = $no++;
            $data_ok[1] = $d['nmmapel'];
            $data_ok[2] = $d['judul'];
            $data_ok[3] = $d['nmfile'];

            $data_ok[4] = '<a href="#" onclick="return hapus(\''.$d['id'].'\');" class="btn btn-xs btn-danger"><i class="fa fa-remove"></i> Hapus</a> ';

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

    public function edit() {
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

        $guru = $this->input->post('guru');
        $mapel = $this->input->post('kelas');
        $kelas = $this->input->post('mapel');
        $judul = $this->input->post('judul');
        $konten = $this->input->post('konten');

        $config['upload_path']    = './upload/materi';
        $config['allowed_types']  = 'pdf|docx';
        
        $this->load->library('upload', $config);
        
        if ( $this->upload->do_upload('materi') === false) {
            $this->session->set_flashdata('ue', '<div class="alert alert-danger">'.$this->upload->display_errors().'</div>');
        } else {
           
            $upload = $this->upload->data();
            $data = array(
                'id_guru' => $guru,
                'id_mapel' => $mapel,
                'id_kelas' => $kelas,
                'judul' => $judul,
                'konten' => $konten,
                'nmfile' => $upload['file_name'],
            );

            $id = $this->setmateri_model->insert($data,'t_materi');
            redirect($this->d['url']);
        }
    }

    public function hapus($id) {
        $this->db->query("DELETE FROM t_materi WHERE id = '$id'");

        $d['status'] = "ok";
        $d['data'] = "Data berhasil dihapus";
        
        j($d);
    }

    public function index() {
    	$this->d['p'] ="list";
        $this->load->view("template_elearning", $this->d);
    }

}