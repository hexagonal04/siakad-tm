<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Set_pembayaran extends CI_Controller 
{
    public $result = [
    'status'  => false,
    'data'    => []
    ];

	function __construct() {
        parent::__construct();

        $this->load->model(['pembayaran_model']);

        $this->sespre = $this->config->item('session_name_prefix');

        $this->d['admlevel'] = $this->session->userdata($this->sespre.'level');
        $this->d['url'] = "set_pembayaran";
        $this->d['idnya'] = "setpembayran";
        $this->d['nama_form'] = "f_setpembayaran";
    }

    public function datatable() {
        $start = $this->input->post('start');
        $length = $this->input->post('length');
        $draw = $this->input->post('draw');
        $search = $this->input->post('search');

        $d_total_row = $this->db->query("SELECT
                                        a.id, b.nama nmsiswa, c.nama nmkelas, d.kd_nama kdbayar, jml_bayar jml_byr, status_byr status_byr
                                        FROM t_status_pembayaran a
                                        INNER JOIN m_siswa b ON a.id_siswa = b.id
                                        INNER JOIN m_kelas c ON a.id_kelas = c.id
                                        INNER JOIN m_pembayaran d ON a.id_bayar = d.id
                                        ORDER BY nmsiswa ASC")->num_rows();

                                       
    
        $q_datanya = $this->db->query("SELECT
                                    a.id, b.nama nmsiswa, c.nama nmkelas, d.kd_nama kdbayar, jml_bayar jml_byr, status_byr status_byr
                                    FROM t_status_pembayaran a
                                    INNER JOIN m_siswa b ON a.id_siswa = b.id
                                    INNER JOIN m_kelas c ON a.id_kelas = c.id
                                    INNER JOIN m_pembayaran d ON a.id_bayar = d.id
                                    ORDER BY nmsiswa ASC LIMIT ".$start.", ".$length."")->result_array();

        $data = array();
        $no = ($start+1);

        foreach ($q_datanya as $d) {
            $data_ok = array();
            $data_ok[0] = $no++;
            $data_ok[1] = $d['nmsiswa'];
            $data_ok[2] = $d['nmkelas'];
            $data_ok[3] = $d['kdbayar'];
            $data_ok[4] = $d['jml_byr'];
            $data_ok[5] = $d['status_byr'];

            $data_ok[6] = '<a href="'.base_url().$this->d['url'].'/edit/'.$d['id'].'" class="btn btn-xs btn-success"><i class="fa fa-edit"></i> Edit</a>
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

    public function cetak_pembayaran() {
      $s_siswa = "select 
          a.id_siswa, b.nama
          from t_status_pembayaran a 
          inner join m_siswa b on a.id_siswa = b.id
           ";

      $s_kelas = "select 
          a.id_kelas, b.nama
          from t_status_pembayaran a 
          inner join m_kelas b on a.id_kelas = b.id
           ";

      $s_mapel = "select a.id, a.nama from m_ekstra a order by a.id asc";
    
      $queri_siswa = $this->db->query($s_siswa)->result_array();
      $queri_kelas = $this->db->query($s_kelas)->result_array();
      $queri_mapel = $this->db->query($s_mapel)->result_array();

      

      $data_kelas = array();
      foreach ($queri_kelas as $a) {
          $idx1 = $a['id_kelas'];
          $data_kelas[$idx1]['id_kelas'] = $a['id_kelas'];
      } 


      $html = '<p align="left"><b>CETAK DATA PEMBAYARAN</b>
              <br>
              </p>';
      $html .= '<table class="table"><tr><td rowspan="1">Nama Siswa</td>';
      $html .= '<td>Kelas</td>';
      $html .= '<td>Jenis Bayar</td><td>Jumlah Bayar</td><td>Status Bayar</td><tr>';

      foreach ($queri_siswa as $s) {
          $html .= '<tr><td>'.$s['nama'].'</td>';
          $kelas = !empty($data_kelas[$id_kelas]['id_kelas']) ? $data_kelas[$id_kelas]['id_kelas'] : '-';
          $html .= '<td class="ctr">'.$kelas.'</td>';
          
          $id_siswa = $s['id_siswa'];
          

          $s = !empty($data_na[$id_siswa]['s']) ? $data_na[$id_siswa]['s'] : '-';
          $i = !empty($data_na[$id_siswa]['i']) ? $data_na[$id_siswa]['i'] : '-';
          $a = !empty($data_na[$id_siswa]['a']) ? $data_na[$id_siswa]['a'] : '-';

          $html .= '
          <td class="ctr">'.$s.'</td>
          <td class="ctr">'.$i.'</td>
          <td class="ctr">'.$a.'</td>
          </tr>';
      }

      $html .= '</table>';

      $this->d['html'] = $html;
      $this->load->view('cetak_pembayaran', $this->d);
    }

    public function edit($id) {
        $this->d['p_statusbyr']  = array(""=>"","Lunas"=>"Lunas","Belum"=>"Belum Lunas");
        $s = $this->db->query("SELECT id, nama FROM m_siswa ORDER BY id ASC");
        $p = $this->db->query("SELECT id, nama FROM m_pembayaran ORDER BY id ASC");
        $k = $this->db->query("SELECT id, nama FROM m_kelas ORDER BY nama ASC");
        
        $q = $this->db->query("SELECT *, 'edit' AS mode FROM t_status_pembayaran WHERE id = '$id'")->row_array();
        
        $d = array();
        $d['status'] = "ok";
        if (empty($q)) {
            $d['data']['id_siswa'] = "";
            $d['data']['id_kelas'] = "";
            $d['data']['mode'] = "add";
            $d['data']['id_bayar'] = "";
            $d['data']['jml_bayar'] = "";
            $d['data']['keterangan'] = "";
            $d['data']['statusbyr'] = "";
            $d['data']['status'] = "";
        } else {
            $d['data'] = $q;
        }

        $this->d['r_siswa'] = $s->result_array();
        $this->d['r_bayar'] = $p->result_array();
        $this->d['r_kelas'] = $k->result_array();
        $this->d['p'] = "form";
        $this->load->view("template_utama", $this->d);
    }



    public function simpan() {

      $p = $this->input->post();
 
      $this->db->query("INSERT INTO t_status_pembayaran (id_siswa, id_kelas, id_bayar, jml_bayar, keterangan, status_byr) VALUES ('".$p['siswa']."','".$p['kelas']."', '".$p['bayar']."', '".$p['jml_byr']."','".$p['keterangan']."','".$p['statusbyr']."')");

      $d['status'] = "ok";
      $d['data'] = "Data berhasil disimpan";
            
      redirect($this->d['url']);
    }

    public function hapus($id) {
        $this->db->query("DELETE FROM t_status_pembayaran WHERE id = '$id'");

        $d['status'] = "ok";
        $d['data'] = "Data berhasil dihapus";
        
        j($d);
    }
  
    public function index() {
    	$this->d['p'] = "list";
      $this->load->view("template_utama", $this->d);
    }

}