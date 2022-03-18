<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Cetak_leger extends CI_Controller {
    function __construct() {
        parent::__construct();
        $this->sespre = $this->config->item('session_name_prefix');
        $this->d['admlevel'] = $this->session->userdata($this->sespre.'level');
        $this->d['admkonid'] = $this->session->userdata($this->sespre.'konid');
        $this->d['url'] = "cetak_leger";
        $get_tasm = $this->db->query("SELECT tahun FROM tahun WHERE aktif = 'Y'")->row_array();
        $this->d['tasm'] = $get_tasm['tahun'];
        $this->d['ta'] = substr($this->d['tasm'], 0, 4);
        $this->d['sm'] = substr($this->d['tasm'], 4, 1);
        $this->d['wk'] = $this->session->userdata('app_rapot_walikelas');
        $wali = $this->session->userdata($this->sespre."walikelas");
        $this->d['id_kelas'] = $wali['id_walikelas'];
        $this->d['nama_kelas'] = $wali['nama_walikelas'];

        $this->d['dw'] = $this->db->query("select 
                b.nama nmkelas, c.nama nmguru
                from t_walikelas a 
                inner join m_kelas b on a.id_kelas = b.id
                inner join m_guru c on a.id_guru = c.id
                where left(a.tasm,4) = '".$this->d['ta']."' and a.id_kelas = '".$this->d['id_kelas']."'")->row_array();
        
    }
    public function index() {
        $this->d['p'] = "landing";
        $this->load->view("template_utama", $this->d);
    }
    public function cetak() {
        $s_siswa = "select 
            a.id_siswa, b.nama
            from t_kelas_siswa a 
            inner join m_siswa b on a.id_siswa = b.id
            where a.id_kelas = '".$this->d['id_kelas']."' and a.ta = '".$this->d['ta']."'";

        $s_mapel = "select a.id, a.kd_singkat from m_mapel a order by a.id asc";

        $strq_np = "select 
                c.id_mapel, a.id_siswa, a.jenis, avg(a.nilai) nilai
                from t_nilai a 
                inner join t_kelas_siswa b on a.id_siswa = b.id_siswa
                inner join t_guru_mapel c on a.id_guru_mapel = c.id
                where b.id_kelas = '".$this->d['id_kelas']."' 
                and a.tasm = '".$this->d['tasm']."'
                group by c.id_mapel, a.id_siswa, a.jenis";
        $strq_nk = "select 
                 c.id_mapel, a.id_siswa, avg(a.nilai) nilai
                 from t_nilai_ket a 
                 inner join t_kelas_siswa b on a.id_siswa = b.id_siswa
                 inner join t_guru_mapel c on a.id_guru_mapel = c.id
                 where b.id_kelas = '".$this->d['id_kelas']."' 
                 and a.tasm = '".$this->d['tasm']."'
                 group by c.id_mapel, a.id_siswa";

        $queri_np = $this->db->query($strq_np)->result_array();
        $queri_nk = $this->db->query($strq_nk)->result_array();
        $queri_siswa = $this->db->query($s_siswa)->result_array();
        $queri_mapel = $this->db->query($s_mapel)->result_array();

        $data_np = array();
        foreach ($queri_np as $a) {
            $idx1 = $a['id_mapel'];
            $idx2 = $a['id_siswa'];
            $idx3 = $a['jenis'];
            $data_np[$idx1][$idx2][$idx3] = $a['nilai'];
        }

        $data_nk = array();
        foreach ($queri_nk as $a) {
            $idx1 = $a['id_mapel'];
            $idx2 = $a['id_siswa'];
            $data_nk[$idx1][$idx2] = $a['nilai'];
        }

        $html = '<p align="left"><b>LEGER NILAI PENGETAHUAN & KETERAMPILAN</b>
                <br>
                Kelas : '.$this->d['dw']['nmkelas'].', Nama Wali : '.$this->d['dw']['nmguru'].', Tahun Pelajaran '.$this->d['tasm'].'<hr style="border: solid 1px #000; margin-top: -10px"></p>';

        $html .= '<table class="table"><tr><td rowspan="2">Nama</td>';
        foreach ($queri_mapel as $m) {
            $html .= '<td colspan="2">'.$m['kd_singkat'].'</td>';
        }
        $html .= '<td rowspan="2">Jumlah</td>';
        $html .= '<td rowspan="2">Ranking</td></tr>';
        foreach ($queri_mapel as $m) {
            $html .= '<td>P</td><td>K</td>';
        }
        //$html .= '<td>P</td><td>K</td></tr>';

        foreach ($queri_siswa as $s) {
            $html .= '<tr><td>'.$s['nama'].'</td>';
            $jml_np = 0;
            $jml_nk = 0;
            foreach ($queri_mapel as $m) {
                // Nilai Pengetahuan
                $idx1 = $m['id'];
                $idx2 = $s['id_siswa'];
                $np_h = !empty($data_np[$idx1][$idx2]['h']) ? $data_np[$idx1][$idx2]['h'] : 0;
                $np_t = !empty($data_np[$idx1][$idx2]['t']) ? $data_np[$idx1][$idx2]['t'] : 0;
                $np_a = !empty($data_np[$idx1][$idx2]['a']) ? $data_np[$idx1][$idx2]['a'] : 0;
                $p_h = $this->config->item('pnp_h');
                $p_t = $this->config->item('pnp_t');
                $p_a = $this->config->item('pnp_a');
                $jml = $p_h+$p_t+$p_a;

                $p_h = ($p_h / $jml) * 100; 
                $p_t = ($p_t / $jml) * 100; 
                $p_a = ($p_a / $jml) * 100; 
                
                $np = number_format((($np_h * $p_h) + ($np_t * $p_t) + ($np_a * $p_a)) / 100);
                $jml_np = $jml_np + $np;

                // Nilai Ketrampilan
                $nk = !empty($data_nk[$idx1][$idx2]) ? number_format($data_nk[$idx1][$idx2]) : 0;
                $jml_nk = $jml_nk + $nk;

                $html .= '<td class="ctr">'.($np).'</td><td class="ctr">'.($nk).'</td>';
            }
            $html .= '<td class="ctr">'.($jml_np+$jml_nk).'</td><td></td></tr>';
        }

        $html .= '</table>';

        
        $d['html'] = $html;
        $d['teks_tasm'] = "Tahun Ajaran ".$this->d['ta']."/".($this->d['ta']+1).", Semester ".$this->d['sm'];
        //j($d);
        //$this->load->view('cetak', $d);

        $mauke = $this->uri->segment(3);

        if (empty($mauke)) {
            $this->load->view('cetak', $d);
        } else if ($mauke == "print") {
            $this->load->view('cetak', $d);
        } else if ($mauke == "excel") {
            $this->load->view('cetak', $d);
            $filename = "leger_" . date('YmdHis') . ".xls";
            header("Content-Disposition: attachment; filename=\"$filename\"");
            header("Content-Type: application/vnd.ms-excel");
        }
    }
    public function cetak_ekstra() {
        $s_siswa = "select 
            a.id_siswa, b.nama
            from t_kelas_siswa a 
            inner join m_siswa b on a.id_siswa = b.id
            where a.id_kelas = '".$this->d['id_kelas']."' and a.ta = '".$this->d['ta']."'";

        $s_mapel = "select a.id, a.nama from m_ekstra a order by a.id asc";

        $strq_n_ekstra = "select 
                a.id_siswa ids, a.id_ekstra, a.nilai, a.desk
                from t_nilai_ekstra a 
                inner join t_kelas_siswa b on a.id_siswa = b.id_siswa
                where 
                b.id_kelas = '".$this->d['id_kelas']."' 
                and a.tasm = '".$this->d['tasm']."' 
                and b.ta = '".$this->d['ta']."'";
        $strq_n_absen = "select 
                a.id_siswa, a.s, a.i, a.a
                from t_nilai_absensi a 
                inner join t_kelas_siswa b on a.id_siswa = b.id_siswa
                where 
                b.id_kelas = '".$this->d['id_kelas']."' 
                and a.tasm = '".$this->d['tasm']."' 
                and b.ta = '".$this->d['ta']."'";

        $queri_ne = $this->db->query($strq_n_ekstra)->result_array();
        $queri_na = $this->db->query($strq_n_absen)->result_array();
        $queri_siswa = $this->db->query($s_siswa)->result_array();
        $queri_mapel = $this->db->query($s_mapel)->result_array();

        $data_ne = array();
        foreach ($queri_ne as $a) {
            $idx1 = $a['id_ekstra'];
            $idx2 = $a['ids'];
            $data_ne[$idx1][$idx2]['nilai'] = $a['nilai'];
            $data_ne[$idx1][$idx2]['desk'] = $a['desk'];
        } 

        $data_na = array();
        foreach ($queri_na as $a) {
            $idx1 = $a['id_siswa'];
            $data_na[$idx1]['s'] = $a['s'];
            $data_na[$idx1]['i'] = $a['i'];
            $data_na[$idx1]['a'] = $a['a'];
        }

        $html = '<p align="left"><b>LEGER NILAI EKSTRAKURIKULER & ABSENSI</b>
                <br>
                Kelas : '.$this->d['dw']['nmkelas'].', Nama Wali : '.$this->d['dw']['nmguru'].', Tahun Pelajaran '.$this->d['tasm'].'<hr style="border: solid 1px #000; margin-top: -10px"></p>';
        $html .= '<table class="table"><tr><td rowspan="1">Nama Siswa</td>';
        foreach ($queri_mapel as $m) {
        $html .= '<td colspan="2">'.$m['nama'].'</td>';
        }
        $html .= '<td>S</td><td>I</td><td>A</td><tr>';

        foreach ($queri_siswa as $s) {
            $html .= '<tr><td>'.$s['nama'].'</td>';
            $id_siswa = $s['id_siswa'];
            foreach ($queri_mapel as $m) {
                $id_ekstra = $m['id'];
                $nilai = !empty($data_ne[$id_ekstra][$id_siswa]['nilai']) ? $data_ne[$id_ekstra][$id_siswa]['nilai'] : '-';
                $desk = !empty($data_ne[$id_ekstra][$id_siswa]['desk']) ? $data_ne[$id_ekstra][$id_siswa]['desk'] : '-';

                $html .= '
                <td class="ctr">'.$nilai.'</td>
                <td class="ctr">'.$desk.'</td>';
            }

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
        $this->load->view('cetak_ekstra', $this->d);
    }
}