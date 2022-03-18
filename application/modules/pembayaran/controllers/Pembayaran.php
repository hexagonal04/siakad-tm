<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pembayaran extends CI_Controller 
{
    public $result = [
        'status'  => false,
        'data'    => []
        ];

	public function __construct() {
        parent::__construct();

        $this->load->model(['pembayaran_model']);

        $this->sespre = $this->config->item('session_name_prefix');
        $this->d['admlevel'] = $this->session->userdata($this->sespre.'level');
        
        $this->d['url'] = "pembayaran";
        $this->d['idnya'] = "pembayaran";
        $this->d['nama_form'] = "f_pembayaran";
        
    }
    public function index() {
    	$s = $this->db->query("SELECT id, nama FROM m_siswa ORDER BY id ASC");
      $p = $this->db->query("SELECT id, nama FROM m_pembayaran ORDER BY id ASC");
      $k = $this->db->query("SELECT id, nama FROM m_kelas ORDER BY nama ASC");
      
       
        
        $d = array();
        $d['status'] = "ok";
        if (empty($q)) {
            $d['data']['id_siswa'] = "";
            $d['data']['id_kelas'] = "";
            $d['data']['mode'] = "add";
            $d['data']['id_bayar'] = "";
            $d['data']['jml_bayar'] = "";
            $d['data']['keterangan'] = "";
        } else {
            $d['data'] = $q;
        }

        $this->d['r_siswa'] = $s->result_array();
        $this->d['r_bayar'] = $p->result_array();
        $this->d['r_kelas'] = $k->result_array();
        $this->d['p'] = "form";
        $this->d['p'] = "v_pembayaran";
        $this->load->view("template_utama", $this->d);
    }

    public function get_nis()
    {
      if (!$this->input->is_ajax_request()) :
        show_404();
      else :
        $nis = $this->pembayaran_model->get_nis();
        if ($nis->num_rows() > 0) :
          $this->result['status'] = true;
          foreach ($nis->result() as $key => $value) :
            $this->result['data'][$key]['nis'] = $value->nis;
          endforeach;
        endif;
  
        echo json_encode($this->result);
      endif;
    }

    public function get_siswa()
    {
      if (!$this->input->is_ajax_request()) :
        show_404();
      else :
        $nis   = $this->input->get('nis');
        $siswa  = $this->pembayaran_model->get_siswa($nis);
        if ($siswa->num_rows() > 0) :
          $this->result['status'] = true;
          $this->result['data']   = $siswa->row_array();
        endif;
  
        echo json_encode($this->result);
      endif;
    }

    public function simpan() {

        $id_siswa = $this->input->post('siswa');
        $id_kelas = $this->input->post('kelas');
        $id_bayar = $this->input->post('bayar');
        $jml_byr = $this->input->post('jml_byr');

        $config['upload_path']    = './upload/bukti_tf';
        $config['allowed_types']  = 'pdf|docx|jpg|jpeg|png';
        
        $this->load->library('upload', $config);
        //$this->upload->do_upload('bukti_tf');
       
        
        if ( $this->upload->do_upload('bukti_tf') === false) {
            $this->session->set_flashdata('ue', '<div class="alert alert-danger">'.$this->upload->display_errors().'</div>');
        } else {
            
            $upload = $this->upload->data();
            $data = array(
                'id_siswa' => $id_siswa,
                'id_kelas' => $id_kelas,
                'id_bayar' => $id_bayar,
                'jml_bayar' => $jml_byr,
                'bukti_tf' => $upload['file_name'],
            );
            
            $id = $this->pembayaran_model->insert($data,'t_pembayaran');
            redirect('home');
        }
    }
}