<?php

class Viewtugas_model extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}
	
	function daftarpeserta()
	{
		return $this->db->get('t_tugas')->result();
	}
}