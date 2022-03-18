<?php
defined('BASEPATH') or exit('No direct script access allowed');

require('./application/libraries/autoload.php');

class Siswa extends CI_Controller
{
  //public $faker;
  public $result = [
    'status'  => false,
    'data'    => []
  ];

  public function __construct()
  {
    parent::__construct();
    //$this->faker  = Faker\Factory::create();
    $this->load->model([
      'siswa_model'
    ]);
  }

  public function index()
  {
    $this->load->view('cari_siswa');
  }

  public function get_nisn()
  {
    if (!$this->input->is_ajax_request()) :
      show_404();
    else :
      $nisn = $this->siswa_model->get_nisn();
      if ($nisn->num_rows() > 0) :
        $this->result['status'] = true;
        foreach ($nisn->result() as $key => $value) :
          $this->result['data'][$key]['nisn'] = $value->nisn;
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
      $nisn   = $this->input->get('nisn');
      $siswa  = $this->siswa_model->get_siswa($nisn);
      if ($siswa->num_rows() > 0) :
        $this->result['status'] = true;
        $this->result['data']   = $siswa->row_array();
      endif;

      echo json_encode($this->result);
    endif;
  }
}