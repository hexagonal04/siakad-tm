<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class E_Learning extends CI_Controller {
	public function __construct() {
        parent::__construct();
        $this->sespre = $this->config->item('session_name_prefix');
        $this->d['admlevel'] = $this->session->userdata($this->sespre.'level');
        $this->d['admkonid'] = $this->session->userdata($this->sespre.'konid');
        $this->d['admnama'] = $this->session->userdata($this->sespre.'nama');
        $this->d['nama_form'] = "f_elearning";
        $get_tasm = $this->db->query("SELECT tahun FROM tahun WHERE aktif = 'Y'")->row_array();
        $this->d['tasm'] = $get_tasm['tahun'];
        $this->d['ta'] = substr($get_tasm['tahun'],0,4);
        $this->d['url'] = "home";
        cek_aktif();
        $wali_kelas = $this->session->userdata('app_rapot_walikelas');
        $this->d['id_kelas'] = $wali_kelas['id_walikelas'];
    }
    public function index() {

        if ($this->d['admlevel'] != "siswa") {
            $this->d['p'] = "v_home_elearning";
        } else {
            $this->d['p'] = "v_home_elearning";
        }
        $this->load->view("template_elearning", $this->d);
 
    }  
}