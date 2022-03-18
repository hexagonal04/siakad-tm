<?php

defined('BASEPATH') or exit('No direct script access allowed');
require('./application/libraries/autoload.php');

class Pembayaran_model extends CI_Model
{
  private $table_siswa = "m_siswa";

  public function __construct()
  {
    parent::__construct();

  }


  public function get_nis()
  {
    $query  = $this->db->query("SELECT nis FROM {$this->table_siswa}");
    return $query;
  }

  public function get_siswa($nis)
  {
    $query  = $this->db->query("SELECT * FROM {$this->table_siswa} WHERE nis = '{$nis}'");
    return $query;
  }

  public function insert($data,$table)
    {
        $this->db->insert($table,$data);
        return $this->db->insert_id();
    }
}