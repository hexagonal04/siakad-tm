<?php
class Tugas_model extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}
	
	function detail_tugas()
	{
		return $this->db->get('t_tugas')->result();
	}

    function select_by_id($id)
	{
		$this->db->where('id',$id);
		
		return $this->db->get('t_tugas')->result();
	}
}