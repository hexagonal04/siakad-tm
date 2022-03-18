<?php

defined('BASEPATH') or exit('No direct script access allowed');
require('./application/libraries/autoload.php');

class Pembayaran_model extends CI_Model
{
  private $table_siswa = "m_siswa";
  //public $faker;

  public function __construct()
  {
    parent::__construct();
    //$this->faker  = Faker\Factory::create();
  }



  public function get_id()
  {
    //$this->dummy_siswa();
    $query  = $this->db->query("SELECT id FROM {$this->table_siswa}");
    return $query;
  }

  public function get_siswa($id)
  {
    $query  = $this->db->query("SELECT * FROM {$this->table_siswa} WHERE id = '{$id}'");
    return $query;
  }
}