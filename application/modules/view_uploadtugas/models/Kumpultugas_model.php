<?php

defined('BASEPATH') or exit('No direct script access allowed');
require('./application/libraries/autoload.php');

class Kumpultugas_model extends CI_Model
{
  private $table_tugas = "t_tugas";

  public function __construct()
  {
    parent::__construct();

  }


  public function get_id()
  {
    $query  = $this->db->query("SELECT id FROM {$this->table_tugas}");
    return $query;
  }

  public function get_tugas($id)
  {
    $query  = $this->db->query("SELECT * FROM {$this->table_tugas} WHERE id = '{$id}'");
    return $query;
  }

  public function insert($data,$table)
    {
        $this->db->insert($table,$data);
        return $this->db->insert_id();
    }
}