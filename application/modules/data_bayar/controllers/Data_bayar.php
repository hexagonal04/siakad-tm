<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Data_bayar extends CI_Controller {
	function __construct() {
        parent::__construct();
        $this->sespre = $this->config->item('session_name_prefix');
        $this->d['admlevel'] = $this->session->userdata($this->sespre.'level');
        $this->d['url'] = "data_bayar";
    }
    public function datatable() {
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $draw = $this->input->post('draw');
        $search = $this->input->post('search');
        $d_total_row = $this->db->query("SELECT id FROM m_pembayaran")->num_rows();
    
        $q_datanya = $this->db->query("SELECT * FROM m_pembayaran WHERE nama LIKE '%".$search['value']."%' ORDER BY id DESC LIMIT ".$start.", ".$length."")->result_array();
        $data = array();
        $no = ($start+1);
        foreach ($q_datanya as $d) {
            $data_ok = array();
            $data_ok[0] = $no++;
            $data_ok[1] = $d['nama'];
            $data_ok[2] = $d['kd_nama'];
            $data_ok[3] = '<a href="#" onclick="return edit(\''.$d['id'].'\');" class="btn btn-xs btn-success"><i class="fa fa-edit"></i> Edit</a> 
                <a href="#" onclick="return hapus(\''.$d['id'].'\');" class="btn btn-xs btn-danger"><i class="fa fa-remove"></i> Hapus</a> ';
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
        $q = $this->db->query("SELECT *, 'edit' AS mode FROM m_pembayaran WHERE id = '$id'")->row_array();
        $d = array();
        $d['status'] = "ok";
        if (empty($q)) {
            $d['data']['id'] = "";
            $d['data']['mode'] = "add";
            $d['data']['nama'] = "";
            $d['data']['kode'] ="";
        } else {
            $d['data'] = $q;
        }
        j($d);
    }
    public function simpan() {
        $p = $this->input->post();
        $d['status'] = "";
        $d['data'] = "";

        $data['nama'] = $p['nama'];
        $data['kd_nama'] = $p['kode'];

        if ($p['_mode'] == "add") {
            $this->db->query("INSERT INTO m_pembayaran (nama, kd_nama) VALUES ('".$p['nama']."','".$p['kode']."')");
            $d['status'] = "ok";
            $d['data'] = "Data berhasil disimpan";
        } else if ($p['_mode'] == "edit") {
            //$this->db->query("UPDATE m_pembayaran SET nama = '".$p['nama']."' WHERE id = '".$p['_id']."'");
            $this->db->where('id', $p['_id']);
            $this->db->update('m_pembayaran', $data);
            $d['status'] = "ok";
            $d['data'] = "Data berhasil disimpan";
        } else {
            $d['status'] = "gagal";
            $d['data'] = "Kesalahan sistem";
        }
        j($d);
    }
    public function hapus($id) {
        $this->db->query("DELETE FROM m_pembayaran WHERE id = '$id'");
        $d['status'] = "ok";
        $d['data'] = "Data berhasil dihapus";
        
        j($d);
    }
    public function index() {
    	$this->d['p'] = "list";
        $this->load->view("template_utama", $this->d);
    }
}