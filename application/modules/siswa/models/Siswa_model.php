<?php

defined('BASEPATH') or exit('No direct script access allowed');
require('./application/libraries/autoload.php');

class Siswa_model extends CI_Model
{
  private $table_siswa = "siswa";
  //public $faker;

  public function __construct()
  {
    parent::__construct();
    //$this->faker  = Faker\Factory::create();
  }

  /*public function dummy_siswa()
  {
    $this->db->query("TRUNCATE TABLE {$this->table_siswa}");
    for ($i = 1; $i <= 10; $i++) {
      $nisn       = $i . $i + rand(3456, 9999);
      $tgl_lahir  = rand(1989, 2020) . '-' . rand(1, 12) . '-' . rand(1, 31);

      if ($i % 2 == 0) {
        $jenkel = 'Laki-Laki';
      } else {
        $jenkel = 'Perempuan';
      }

      $insert = $this->db->query("INSERT INTO {$this->table_siswa}
                                  SET nisn = {$nisn},
                                    nama_siswa = '{$this->faker->name}',
                                    tempat_lahir = '{$this->faker->state}',
                                    tanggal_lahir = '{$tgl_lahir}',
                                    jenis_kelamin = '{$jenkel}',
                                    alamat = '{$this->faker->address}'");
    }
  }
  */
  public function get_nisn()
  {
    //$this->dummy_siswa();
    $query  = $this->db->query("SELECT
                                  nisn
                                FROM
                                  {$this->table_siswa}");
    return $query;
  }

  public function get_siswa($nisn)
  {
    $query  = $this->db->query("SELECT
                                  *
                                FROM
                                  {$this->table_siswa}
                                WHERE
                                  nisn = '{$nisn}'");
    return $query;
  }
}