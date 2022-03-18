<?php

defined('BASEPATH') or exit('No direct script access allowed');
require('./application/libraries/autoload.php');

class Viewmateri_model extends CI_Model
{
  
  public function __construct()
  {
    parent::__construct();

  }

  public function insert($data,$table)
    {
        $this->db->insert($table,$data);
        return $this->db->insert_id();
    }
}