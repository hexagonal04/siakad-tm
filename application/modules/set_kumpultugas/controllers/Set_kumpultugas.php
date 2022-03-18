<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Set_kumpultugas extends CI_Controller 
{

    public $result = [
        'status'  => false,
        'data'    => []
        ];

	function __construct() {
        parent::__construct();

        $this->load->model(['kumpultugas_model']);

        $this->sespre = $this->config->item('session_name_prefix');
        $this->d['admlevel'] = $this->session->userdata($this->sespre.'level');
        $this->d['url'] = "set_kumpultugas";
        $this->d['idnya'] = "set_kumpultugas";
        $this->d['nama_form'] = "f_setkumpultugas";
  
    }

    public function datatable() {
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $draw = $this->input->post('draw');
        $search = $this->input->post('search');

        $d_total_row = $this->db->query("SELECT 
                                        a.id, b.judul judul, file_tugas file_tugas
                                        FROM t_kumpultugas a
                                        INNER JOIN t_tugas b ON a.id_tugas = b.id
                                         
                                        ")->num_rows();

                                       
    
        $q_datanya = $this->db->query("SELECT
                                    a.id, b.judul judul, file_tugas file_tugas
                                    FROM t_kumpultugas a
                                    INNER JOIN t_tugas b ON a.id_tugas = b.id
                                    
                                    ")->result_array();
        

        $data = array();
        $no = ($start+1);

        foreach ($q_datanya as $d) {
            $data_ok = array();
            $data_ok[0] = $no++;
            $data_ok[1] = $d['judul'];
            $data_ok[2] = $d['file_tugas'];

            $data_ok[3] = '<a href="#" onclick="return hapus(\''.$d['id'].'\');" class="btn btn-xs btn-danger"><i class="fa fa-remove"></i> Hapus</a> ';

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

    public function get_id()
    {
      if (!$this->input->is_ajax_request()) :
        show_404();
      else :
        $id = $this->kumpultugas_model->get_id();
        if ($id->num_rows() > 0) :
          $this->result['status'] = true;
          foreach ($id->result() as $key => $value) :
            $this->result['data'][$key]['id'] = $value->id;
          endforeach;
        endif;
  
        echo json_encode($this->result);
      endif;
    }

    public function get_tugas()
    {
      if (!$this->input->is_ajax_request()) :
        show_404();
      else :
        $id   = $this->input->get('id');
        $tugas  = $this->kumpultugas_model->get_tugas($id);
        if ($tugas->num_rows() > 0) :
          $this->result['status'] = true;
          $this->result['data']   = $tugas->row_array();
        endif;
  
        echo json_encode($this->result);
      endif;
    }

    public function edit() {
        $q = $this->db->query("SELECT id, nama FROM m_siswa ORDER BY id ASC");
        

        $this->d['r_siswa'] = $q->result_array();
        

        $this->d['p'] = "form";
        $this->load->view("template_elearning", $this->d);
    }

    public function simpan() {

        $id_siswa = $this->input->post('siswa');
        $id_tugas = $this->input->post('id');
        $jawaban = $this->input->post('jawaban');

        $config['upload_path']    = './upload/tugas';
        $config['allowed_types']  = 'pdf|docx|jpg|jpeg|png';
        
        $this->load->library('upload', $config);
       
        if ( $this->upload->do_upload('file_tugas') === false) {
            $this->session->set_flashdata('ue', '<div class="alert alert-danger">'.$this->upload->display_errors().'</div>');
        } else {
            
            $upload = $this->upload->data();
            $data = array(
                'id_siswa' => $id_siswa,
                'id_tugas' => $id_tugas,
                'jawaban' => $jawaban,
                'file_tugas' => $upload['file_name'],
            );
            
            $id = $this->kumpultugas_model->insert($data,'t_kumpultugas'); 
            redirect($this->d['url']);
        }
    }

    public function hapus($id) {
        $this->db->query("DELETE FROM t_kumpultugas WHERE id = '$id'");

        $d['status'] = "ok";
        $d['data'] = "Data berhasil dihapus";
        
        j($d);
    }

    public function index() {
    	$this->d['p'] ="list";
        $this->load->view("template_elearning", $this->d);
    }

}