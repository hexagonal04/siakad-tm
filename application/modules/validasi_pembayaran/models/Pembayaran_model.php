<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Pembayaran_model extends CI_Model {
    public function update($data,$where,$table)
    {
        $this->db->where($where);
        $this->db->update($table, $data);
    }
    public function getPengumumanGuru()
    {
        $this->db->where('tampil_pengajar', '1');
        return $this->db->get('el_pengumuman');
    }

    public function getDetailPengumuman($id)
    {
        $this->db->where('id', $id);
        return $this->db->get('el_pengumuman');        
    }
    public function getById($id)
    {
        $this->db->where('id', $id);
        return $this->db->get('valid_pembayaran');
    }
}