-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 12 Agu 2021 pada 06.46
-- Versi server: 10.3.29-MariaDB-cll-lve
-- Versi PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u1345900_siakad`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_admin`
--

CREATE TABLE `m_admin` (
  `id` int(4) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `level` enum('admin','guru','siswa','keuangan','ortu','kepsek') NOT NULL,
  `konid` varchar(10) NOT NULL,
  `aktif` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_admin`
--

INSERT INTO `m_admin` (`id`, `username`, `password`, `level`, `konid`, `aktif`) VALUES
(1, 'admin', 'bd2c38a321c5920f36d7cd9d4', 'admin', '0', 'Y'),
(47, 'agung', 'fefdd621d35d14c299aef2fca', 'guru', '1', 'Y'),
(51, '101', 'db7710e32c8620938e588f754', 'siswa', '338', 'Y'),
(54, '102', 'f6b9bc4f3601afe00a7d98a93', 'siswa', '339', 'Y'),
(55, '103', '69c5fcebaa65b560eaf06c3fb', 'siswa', '340', 'Y'),
(105, 'bayu', 'fefdd621d35d14c299aef2fca', 'guru', '6', 'Y'),
(106, '11200320', '5f299bd861bc6271ab6f130ef', 'siswa', '341', 'Y'),
(107, 'rio', '353e8061f2befecb6818ba0c0', 'keuangan', '8', 'Y'),
(109, 'budi', 'fefdd621d35d14c299aef2fca', 'guru', '2', 'Y'),
(110, 'dewi', 'fefdd621d35d14c299aef2fca', 'guru', '4', 'Y'),
(115, 'haya', '353e8061f2befecb6818ba0c0', 'ortu', '4', 'Y'),
(116, 'bamban', '353e8061f2befecb6818ba0c0', 'ortu', '5', 'Y'),
(118, 'winart', '353e8061f2befecb6818ba0c0', 'kepsek', '1', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_ekstra`
--

CREATE TABLE `m_ekstra` (
  `id` int(2) NOT NULL,
  `nama` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_ekstra`
--

INSERT INTO `m_ekstra` (`id`, `nama`) VALUES
(1, 'Pramuka'),
(6, 'Bulu Tangkis'),
(7, 'Futsal');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_guru`
--

CREATE TABLE `m_guru` (
  `id` int(3) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `nip` varchar(20) DEFAULT NULL,
  `jk` enum('L','P') DEFAULT NULL,
  `is_bk` enum('2','1') DEFAULT NULL,
  `stat_data` enum('A','P','M') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_guru`
--

INSERT INTO `m_guru` (`id`, `nama`, `nip`, `jk`, `is_bk`, `stat_data`) VALUES
(1, 'Agung', '1001', NULL, '2', 'A'),
(2, 'Budi', '1002', NULL, '2', 'A'),
(4, 'Dewi', '1004', NULL, '2', 'A'),
(5, 'Eny', '1005', NULL, '2', 'A'),
(6, 'Bayu', '1006', NULL, '2', 'A');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_kelas`
--

CREATE TABLE `m_kelas` (
  `id` int(3) NOT NULL,
  `tingkat` int(11) DEFAULT NULL,
  `nama` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_kelas`
--

INSERT INTO `m_kelas` (`id`, `tingkat`, `nama`) VALUES
(1, 10, 'X MIPA'),
(2, 10, 'X IPS'),
(3, 11, 'XI MIPA'),
(4, 11, 'XI IPS'),
(5, 12, 'XII MIPA'),
(6, 12, 'XII IPS');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_kepsek`
--

CREATE TABLE `m_kepsek` (
  `id` int(3) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `jk` enum('L','P') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_kepsek`
--

INSERT INTO `m_kepsek` (`id`, `nama`, `jk`) VALUES
(1, 'Winarti Dwi Astuti', 'P');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_keuangan`
--

CREATE TABLE `m_keuangan` (
  `id` int(3) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `jk` enum('L','P') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_keuangan`
--

INSERT INTO `m_keuangan` (`id`, `nama`, `jk`) VALUES
(8, 'Rio', 'L'),
(9, 'Nia', 'P'),
(10, 'Ahmad', 'L');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_mapel`
--

CREATE TABLE `m_mapel` (
  `id` int(3) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `kelompok` enum('A','B','C') NOT NULL,
  `tambahan_sub` enum('NO','PAI','MULOK') NOT NULL,
  `kd_singkat` varchar(5) NOT NULL,
  `is_sikap` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_mapel`
--

INSERT INTO `m_mapel` (`id`, `nama`, `kelompok`, `tambahan_sub`, `kd_singkat`, `is_sikap`) VALUES
(6, 'Bahasa Indonesia', 'A', 'NO', 'B.IND', '0'),
(8, 'Matematika', 'A', 'NO', 'MTK', '0'),
(9, 'Ilmu Pengetahuan Alam', 'A', 'NO', 'IPA', '0'),
(10, 'Ilmu Pengetahuan Sosial', 'A', 'NO', 'IPS', '0'),
(11, 'Bahasa Inggris', 'A', 'NO', 'B.ING', '0'),
(12, 'Seni Budaya', 'B', 'NO', 'SBUD', '0'),
(13, 'Pendidikan Jasmani, Olahr', 'B', 'NO', 'PJKES', '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_ortu_siswa`
--

CREATE TABLE `m_ortu_siswa` (
  `id` int(6) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `id_siswa` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_ortu_siswa`
--

INSERT INTO `m_ortu_siswa` (`id`, `nama`, `jk`, `id_siswa`) VALUES
(4, 'Fajar', 'L', 340),
(5, 'Bambang', 'L', 341);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_pembayaran`
--

CREATE TABLE `m_pembayaran` (
  `id` int(3) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `kd_nama` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_pembayaran`
--

INSERT INTO `m_pembayaran` (`id`, `nama`, `kd_nama`) VALUES
(1, 'Sumbangan Sarana Pendidik', 'SPP'),
(4, 'Bayar Ekskul', 'EKS');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_siswa`
--

CREATE TABLE `m_siswa` (
  `id` int(6) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `nis` varchar(10) NOT NULL DEFAULT '0',
  `nisn` varchar(10) NOT NULL DEFAULT '0',
  `jk` enum('L','P') NOT NULL,
  `tmp_lahir` varchar(25) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `agama` varchar(10) NOT NULL,
  `status` varchar(2) NOT NULL,
  `anakke` int(2) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `notelp` varchar(13) NOT NULL,
  `sek_asal` varchar(25) NOT NULL,
  `sek_asal_alamat` varchar(50) NOT NULL,
  `diterima_kelas` varchar(5) NOT NULL,
  `diterima_tgl` date NOT NULL,
  `diterima_smt` varchar(2) NOT NULL,
  `ijazah_no` varchar(25) NOT NULL,
  `ijazah_thn` varchar(4) NOT NULL,
  `skhun_no` varchar(25) NOT NULL,
  `skhun_thn` varchar(4) NOT NULL,
  `ortu_ayah` varchar(25) NOT NULL,
  `ortu_ibu` varchar(25) NOT NULL,
  `ortu_alamat` varchar(50) NOT NULL,
  `ortu_notelp` varchar(13) NOT NULL,
  `ortu_ayah_pkj` varchar(25) NOT NULL,
  `ortu_ibu_pkj` varchar(25) NOT NULL,
  `wali` varchar(20) NOT NULL,
  `wali_alamat` varchar(50) NOT NULL,
  `notelp_rumah` varchar(13) NOT NULL,
  `wali_pkj` varchar(13) NOT NULL,
  `inputID` int(2) NOT NULL,
  `tgl_input` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tgl_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `stat_data` enum('A','K','M','L') NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `m_siswa`
--

INSERT INTO `m_siswa` (`id`, `nama`, `nis`, `nisn`, `jk`, `tmp_lahir`, `tgl_lahir`, `agama`, `status`, `anakke`, `alamat`, `notelp`, `sek_asal`, `sek_asal_alamat`, `diterima_kelas`, `diterima_tgl`, `diterima_smt`, `ijazah_no`, `ijazah_thn`, `skhun_no`, `skhun_thn`, `ortu_ayah`, `ortu_ibu`, `ortu_alamat`, `ortu_notelp`, `ortu_ayah_pkj`, `ortu_ibu_pkj`, `wali`, `wali_alamat`, `notelp_rumah`, `wali_pkj`, `inputID`, `tgl_input`, `tgl_update`, `stat_data`, `foto`) VALUES
(338, 'Adi', '101234', '2018101', 'L', 'Lampung', '2000-12-31', 'Islam', 'AK', 1, 'Rawa Lele, Jombang', '12345678', 'SMP Suka Maju 2', 'Wonogiri', 'VII', '2021-07-01', 'VI', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2021-08-09 16:59:50', '0000-00-00 00:00:00', 'A', ''),
(339, 'Bety', '102345', '2018102', 'P', 'Yogyakarta', '2000-12-31', 'Islam', 'AK', 1, 'Kampung Rambutan, Jakarta', '', '', '', 'VII', '2021-07-01', 'VI', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '2021-08-09 17:00:07', '0000-00-00 00:00:00', 'A', ''),
(340, 'Candra', '103456', '2018103', 'L', 'Banyumas', '2000-12-31', 'Islam', 'AK', 2, 'Terrace Residence, Bambu Apus', '', 'SMPN 22 Jakarta', '', 'VIII', '2021-07-01', 'VI', '', '', '', '', 'Sugiri', 'Santi', '', '', 'Petani', '', '', '', '', '', 0, '2021-08-10 08:08:11', '0000-00-00 00:00:00', 'A', ''),
(341, 'Bayu Alamsah', '11200320', '11200321', 'L', 'Jakarta', '1998-08-28', 'Islam', 'AK', 1, 'Perigi, Lengkong Karya', '08979226251', 'SMK Plus BLM', 'Perigi', 'VII', '2021-07-12', 'VI', 'SK10293', '2020', '12312321412', '2020', 'Budi', 'Susan', 'Perigi', '089782821', 'Karyawan', 'IRT', '', '', '', '', 0, '2021-07-08 08:37:14', '0000-00-00 00:00:00', 'A', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tahun`
--

CREATE TABLE `tahun` (
  `id` int(3) NOT NULL,
  `tahun` varchar(5) NOT NULL,
  `aktif` enum('Y','N') NOT NULL,
  `nama_kepsek` varchar(25) NOT NULL,
  `nip_kepsek` varchar(25) NOT NULL,
  `tgl_raport` date NOT NULL,
  `tgl_raport_kelas3` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tahun`
--

INSERT INTO `tahun` (`id`, `tahun`, `aktif`, `nama_kepsek`, `nip_kepsek`, `tgl_raport`, `tgl_raport_kelas3`) VALUES
(1, '20181', 'N', 'Drs. Agung', '1001', '2018-12-31', '2018-12-31'),
(2, '20211', 'Y', 'Winarti Dwi Astuti', '12345678', '2021-12-24', '2021-12-24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_guru_mapel`
--

CREATE TABLE `t_guru_mapel` (
  `id` int(6) NOT NULL,
  `tasm` varchar(5) DEFAULT NULL,
  `id_guru` int(3) NOT NULL,
  `id_kelas` int(3) NOT NULL,
  `id_mapel` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_guru_mapel`
--

INSERT INTO `t_guru_mapel` (`id`, `tasm`, `id_guru`, `id_kelas`, `id_mapel`) VALUES
(56, '20211', 1, 1, 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_jadwal`
--

CREATE TABLE `t_jadwal` (
  `id` int(3) NOT NULL,
  `tasm` varchar(5) DEFAULT NULL,
  `id_guru` int(3) NOT NULL,
  `id_kelas` int(3) NOT NULL,
  `id_mapel` int(3) NOT NULL,
  `hari` enum('Senin','Selasa','Rabu','Kamis','Jumat') NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_jadwal`
--

INSERT INTO `t_jadwal` (`id`, `tasm`, `id_guru`, `id_kelas`, `id_mapel`, `hari`, `jam_mulai`, `jam_selesai`) VALUES
(14, '20211', 1, 1, 6, 'Kamis', '10:00:00', '11:00:00'),
(15, '20181', 2, 1, 8, 'Senin', '07:30:00', '08:30:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_kelas_siswa`
--

CREATE TABLE `t_kelas_siswa` (
  `id` int(5) NOT NULL,
  `id_kelas` int(3) NOT NULL,
  `id_siswa` int(5) NOT NULL,
  `ta` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_kelas_siswa`
--

INSERT INTO `t_kelas_siswa` (`id`, `id_kelas`, `id_siswa`, `ta`) VALUES
(30, 1, 339, 2021),
(31, 1, 340, 2021);

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_kkm`
--

CREATE TABLE `t_kkm` (
  `id` int(5) NOT NULL,
  `ta` int(4) NOT NULL,
  `jenis` enum('np','nk') NOT NULL,
  `kelas` int(2) NOT NULL,
  `kkm` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_kumpultugas`
--

CREATE TABLE `t_kumpultugas` (
  `id` int(6) NOT NULL,
  `id_siswa` int(6) NOT NULL,
  `id_tugas` int(3) NOT NULL,
  `jawaban` text NOT NULL,
  `file_tugas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_kumpultugas`
--

INSERT INTO `t_kumpultugas` (`id`, `id_siswa`, `id_tugas`, `jawaban`, `file_tugas`) VALUES
(5, 340, 7, ' Ini Pak jawaban saya', 'Tugas_Pantun.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_mapel_kd`
--

CREATE TABLE `t_mapel_kd` (
  `id` int(6) UNSIGNED NOT NULL,
  `id_guru` int(6) UNSIGNED NOT NULL DEFAULT 0,
  `id_mapel` int(6) NOT NULL,
  `tingkat` int(2) NOT NULL,
  `semester` enum('0','1','2') NOT NULL,
  `no_kd` varchar(5) NOT NULL,
  `jenis` enum('P','K','SSp','SSo') NOT NULL,
  `bobot` int(2) NOT NULL,
  `nama_kd` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_mapel_kd`
--

INSERT INTO `t_mapel_kd` (`id`, `id_guru`, `id_mapel`, `tingkat`, `semester`, `no_kd`, `jenis`, `bobot`, `nama_kd`) VALUES
(1, 0, 0, 0, '0', '', 'SSo', 0, 'jujur'),
(2, 0, 0, 0, '0', '', 'SSo', 0, 'disiplin'),
(3, 0, 0, 0, '0', '', 'SSo', 0, 'tanggung jawab'),
(4, 0, 0, 0, '0', '', 'SSo', 0, 'toleransi'),
(5, 0, 0, 0, '0', '', 'SSo', 0, 'gotong royong'),
(6, 0, 0, 0, '0', '', 'SSo', 0, 'santun'),
(7, 0, 0, 0, '0', '', 'SSo', 0, 'percaya diri'),
(8, 0, 0, 0, '0', '', 'SSp', 0, 'berdoa sebelum dan sesudah melakukan kegiatan		'),
(9, 0, 0, 0, '0', '', 'SSp', 0, 'menjalankan ibadah sesuai dengan agamanya		'),
(10, 0, 0, 0, '0', '', 'SSp', 0, 'memberi salam pada saat awal dan akhir kegiatan		'),
(11, 0, 0, 0, '0', '', 'SSp', 0, 'bersyukur atas nikmat dan karunia Tuhan Yang Maha Esa		'),
(12, 0, 0, 0, '0', '', 'SSp', 0, 'mensyukuri kemampuan manusia dalam mengendalikan diri		'),
(13, 0, 0, 0, '0', '', 'SSp', 0, 'bersyukur ketika berhasil mengerjakan sesuatu		'),
(14, 0, 0, 0, '0', '', 'SSp', 0, 'berserah diri (tawakal) kepada Tuhan setelah berikhtiar atau melakukan usaha		'),
(15, 0, 0, 0, '0', '', 'SSp', 0, 'memelihara hubungan baik dengan sesama umat		'),
(16, 0, 0, 0, '0', '', 'SSp', 0, 'bersyukur sebagai bangsa Indonesia		'),
(17, 0, 0, 0, '0', '', 'SSp', 0, 'menghormati orang lain yang menjalankan ibadah sesuai dengan agamanya		\r\n'),
(18, 16, 2, 7, '1', 'K01', 'P', 0, 'Memahami dalil, dasar dan tujuan akidah Islam'),
(19, 16, 2, 7, '1', 'K01', 'K', 0, 'Menyajikan fakta dan fenomena kebenaran akidah Islam'),
(20, 16, 2, 7, '1', 'K02', 'P', 0, 'Mengidentifikasi sifat-sifat wajib Allah yang nafsiyah, salbiyah, ma\"ani dan ma\"nawiyah'),
(21, 16, 2, 7, '1', 'K02', 'K', 0, 'Menyajikan contoh fenomena kehidupan yang muncul sebagai bukti dari sifat wajib, mustahil, jaiz'),
(22, 16, 2, 7, '1', 'K03', 'P', 0, 'Memahami pengertian contoh dan dampak positif sifat ikhlas, taat, khauf dan taubat'),
(25, 16, 9, 7, '1', 'K01', 'K', 0, 'Ketrampilan 1'),
(26, 16, 9, 7, '1', 'K02', 'K', 0, 'Kompetensi Ketrampilan 2'),
(28, 16, 2, 7, '1', 'K04', 'P', 0, 'Memahami adab shalat dan dzikir'),
(29, 10, 9, 8, '1', 'K01', 'P', 0, 'memahami sistem gerak pada manusia'),
(30, 10, 9, 8, '1', 'K01', 'K', 0, 'membuat tulisan berbagai gangguanpada sistem gerak manusia'),
(33, 11, 8, 9, '1', 'Kd1', 'P', 0, 'Memahami sifat dan operasi aljabar  pada bilangan berpangkat dan bentuk akar'),
(34, 11, 8, 9, '1', 'Kd2', 'P', 0, 'memahami perbandingan bertingkat dan persentase serta mendiskripsikan permasalahan menggunakan tabel'),
(38, 15, 10, 7, '1', 'kd 01', 'P', 0, 'Memahami konsep ruang dan interaksi antar ruang di Indonesia'),
(40, 5, 5, 7, '1', 'k01', 'P', 0, 'memahami sejarah komitmen'),
(41, 15, 10, 7, '1', 'KD02', 'P', 0, 'mengidentifikasi interaksi sosial dalam ruang dan pengaruhnya terhadap kehidupan sosial'),
(42, 15, 10, 7, '1', 'KD01', 'K', 0, 'menjelaskan konsep ruang dan interaksi antara ruang di Indonesia'),
(43, 15, 10, 7, '1', 'KD02', 'K', 0, 'menyajikan hasil indentifikasi tentang interaksin sosial dalam ruang'),
(44, 15, 10, 7, '1', 'K03', 'P', 0, 'memahami konsep interaksi antara  manusia dengan ruang'),
(45, 20, 14, 7, '1', 'KD311', 'P', 0, 'jenis, sifat, karakter, dan teknik pengolahan serat dan tekstil'),
(46, 20, 14, 7, '1', 'KD312', 'P', 0, 'prinsip perancangan, pembuatan, dan penyajian produk kerajinan dari bahan serat dan tekstil'),
(47, 10, 9, 8, '1', 'K02', 'P', 0, 'memahami  gerak lurus dan pengaruh gaya terhadap gerak berdasarkan hukum Newton'),
(48, 10, 9, 8, '1', 'K03', 'P', 0, 'menerapkan konsep usaha dan pesawat sederhana'),
(49, 10, 9, 8, '1', 'K04', 'P', 0, 'menganalisis keterkaitan struktur jaringan tumbuhan danpemanfatannya dalam teknologi'),
(50, 10, 9, 8, '1', 'K05', 'P', 0, 'menganalisis sistem pencernaan pada manusia'),
(52, 20, 14, 7, '1', 'KD321', 'P', 0, 'perkembangan teknologi, keselamatan kerja, sketsa, dan gambar teknik '),
(53, 20, 14, 7, '1', 'KD322', 'P', 0, 'karakteristik, kekuatan bahan, serta peralatan kerja pengolahnya'),
(54, 20, 14, 7, '1', 'KD331', 'P', 0, 'tanaman sayuran yang dapat dikembangkan  sesuai kebutuhan wilayah setempat'),
(55, 20, 14, 7, '1', 'KD332', 'P', 0, 'Memahami tahapan budidaya tanaman sayuran'),
(56, 20, 14, 7, '1', 'KD341', 'P', 0, 'pembuatan, penyajian dan pengemasan bahan pangan buah menjadi makanan dan  minuman segar'),
(57, 20, 14, 7, '1', 'KD342', 'P', 0, 'pembuatan, penyajian dan pengemasan bahan hasil samping dari pengolahan makanan dan minuman buah seg'),
(58, 20, 14, 8, '1', 'KD3.1', 'P', 0, 'memahami pengetahuan tentang jenis, sifat, karakter dan teknik pengolahan bahan lunak  '),
(59, 20, 14, 8, '1', 'KD3.1', 'P', 0, 'memahami pengetahuan tentang prinsip perancangan, pembuatan, dan penyajian produk kerajinan \r\n'),
(60, 20, 14, 8, '1', 'KD3.2', 'P', 0, 'memahamiperkembangan, peralatan, dan media pengantar teknologi informasi dan komunikasi\r\n'),
(61, 20, 14, 8, '1', 'KD3.2', 'P', 0, 'memahami penerapan jenis, karakteristik, dan istilah-istilah teknologi informasi dan komunikasi\r\n'),
(62, 20, 14, 8, '1', 'KD3.3', 'P', 0, 'memahami komoditas ternak kesayangan yang dapat dikembangkan sesuai kebutuhan wilayah setempat\r\n'),
(63, 20, 14, 8, '1', 'KD3.3', 'P', 0, ' memahamikebutuhan dan karakteristik sarana dan peralatan budidaya ternak kesayangan '),
(65, 20, 14, 8, '1', 'KD3.3', 'P', 0, 'memahami tahapan budidaya ternak kesayangan '),
(66, 20, 14, 8, '1', 'KD3.4', 'P', 0, 'menganalisis rancangan pembuatan bahan pangan serealia, kacang-kacangan dan umbi menjadi makanan dan'),
(67, 20, 14, 7, '1', 'KD411', 'K', 0, 'pengolahan serat/tekstil '),
(68, 20, 14, 7, '1', 'KD412', 'K', 0, 'menyajikan produk kerajinan dari bahan serat/tekstil yang kreatif dan inovatif'),
(69, 20, 14, 7, '1', 'KD421', 'K', 0, 'sketsa dan gambar teknik dari suatu rancangan produk'),
(70, 20, 14, 7, '1', 'KD422', 'K', 0, 'produk sederhana menggunakan peralatan kerja sesuai dengan jenis, karakteristik, dan kekuatan bahan'),
(71, 20, 14, 7, '1', 'KD431', 'K', 0, 'komoditas tanaman sayuran yang akan dibudidayakan  sesuai kebutuhan wilayah'),
(72, 20, 14, 7, '1', 'KD432', 'K', 0, 'tahapan budidaya tanaman sayuran'),
(73, 20, 14, 7, '1', 'KD441', 'K', 0, 'Buah segar menjadi makanan dan minuman  sesuai pengetahuan rancangan dan bahan'),
(74, 20, 14, 7, '1', 'KD442', 'K', 0, 'menyaji, dan mengemas bahan hasil samping dari pengolahan makanan dan minuman buah segar  menjadi pr'),
(75, 20, 14, 8, '1', 'KD4.1', 'K', 0, 'memilih jenis bahan dan teknik pengolahan bahan lunak yang sesuai dengan potensi daerah setempat '),
(76, 20, 14, 8, '1', 'KD4.1', 'K', 0, 'perancangan, pembuatan dan penyajian produk kerajinan dari bahan lunak yang kreatif dan inovatif, se'),
(77, 20, 14, 8, '1', 'KD4.2', 'K', 0, 'memanipulasi sistem teknologi informasi dan komunikasi'),
(78, 20, 14, 8, '1', 'KD4.2', 'K', 0, 'membuat produk teknologi informasi dan komunikasi dengan menggunakan bahan-bahan yang tersedia di se'),
(79, 20, 14, 8, '1', 'KD4.3', 'K', 0, 'menentukan komoditas ternak kesayangan  yang dapat dikembangkan sesuai kebutuhan wilayah setempat'),
(80, 20, 14, 8, '1', 'KD4.3', 'K', 0, 'mempersiapkan sarana dan peralatan budidaya ternak kesayangan '),
(82, 20, 14, 8, '1', 'KD4.3', 'K', 0, 'mempraktikkan tahapan budidaya ternak kesayangan'),
(84, 19, 9, 7, '1', 'K01', 'P', 0, 'Menerapkan konsep pengukuran berbagai besaran menggunakan satuan setandar'),
(85, 19, 9, 7, '1', 'K02', 'P', 0, 'Mengklasifikasikan makhluk hidup dan benda berdasarkan karakteristik yang diamati'),
(86, 19, 9, 7, '1', 'K03', 'P', 0, 'Menjelaskan konsep campuran dan zat tunggal (unsur dan senyawa),sifat fisika dan kimia'),
(88, 19, 9, 7, '1', 'K04', 'P', 0, 'Menganalisis konsep suhu, pemuian,kalor,perpindahan kalor,dan penerapan dalam kehidupan'),
(89, 19, 9, 7, '1', 'K05', 'P', 0, 'Menganalisis konsep energi,berbagai sumber energi,dan perubahan bentuk energi dalam kehidupan'),
(91, 19, 9, 7, '1', 'K01', 'K', 0, 'Menyajikan data hasil pengukuran dengan alat ukur'),
(92, 19, 9, 7, '1', 'K02', 'K', 0, 'Menyajikan hasil pengklasifikasian makhluk hidup'),
(93, 19, 9, 7, '1', 'K03', 'K', 0, 'Menyajikan hasil penyelidikan atau karya tentang sifat larutan, perubahan fisika dan kimia'),
(95, 19, 9, 7, '1', 'K04', 'K', 0, 'Melakukan percobaan untuk menyelidiki pengaruh kalor,suhu, dan wujud benda'),
(96, 19, 9, 7, '1', 'K05', 'K', 0, 'Menyajikan hasil percobaan tentang perubahan bentuk energi'),
(98, 10, 9, 8, '1', 'K06', 'P', 0, 'Menjelaskan berbagai zat aditif dalam makanan dan minuman, zat adiktif, serta dampaknya terhadap kes'),
(99, 10, 9, 8, '1', 'K02', 'K', 0, 'menyajikan hasil penyelidikan pengaruh gaya terhadap gerak benda'),
(100, 10, 9, 8, '1', 'K03', 'K', 0, 'mnyajikan hasil penyelidikan tentang manfaat penggunaan pesawat sederhana'),
(101, 10, 9, 8, '1', 'K04', 'K', 0, 'mengkomunikasikan teknologi yang terinspirasi oleh hasil pengamatan struktur tumbuhan'),
(102, 10, 9, 8, '1', 'K05', 'K', 0, 'menyajikan hasil penyelidikan tentang pencernaan mekanis dan kimiawi'),
(103, 10, 9, 8, '1', 'K06', 'K', 0, 'membuat karya tulis tentang dampak penyalahgunaan zat aditif dan zat adiktif bagi kesehatan'),
(107, 1, 15, 9, '1', '2.1', 'P', 0, 'Praktek membaca cerita pendek'),
(108, 1, 15, 9, '1', '2.2', 'P', 0, 'mendiskusikan praktek membaca cerita pendek'),
(109, 1, 15, 9, '1', '2.3', 'P', 0, 'Melagukan tembang Sinom'),
(110, 1, 15, 9, '1', '2.4', 'P', 0, 'Melagukan Tembang Dhandhanggula'),
(111, 1, 15, 9, '1', '3.1', 'P', 0, 'Menanggapi cerita pendek kegiatan di sekolah'),
(112, 1, 15, 9, '1', '3.2 ', 'P', 0, 'Menanggapi naskah cerita pendek kegiatan lingkungan tempat tinggal'),
(113, 1, 15, 9, '1', '4.1', 'P', 0, 'Menulis cerita pendek kegiata  sekolah'),
(114, 1, 15, 9, '1', '4.2', 'P', 0, 'Menulis cerita gambar kegiatan sekolah'),
(115, 1, 15, 9, '1', '4.3', 'P', 0, 'menulis cerita pendek kegiatan lingkungan tempat tinggal'),
(117, 13, 13, 7, '1', 'KD01', 'P', 0, 'Memahami konsep permainan bola besar'),
(118, 13, 13, 7, '1', 'KD02', 'P', 0, 'Memahami konsep permainan bola kecil'),
(119, 13, 13, 7, '1', 'KD03', 'P', 0, 'Memahami konsep nomor atletik'),
(120, 13, 13, 7, '1', 'KD05', 'P', 0, 'Memahami konsep senam lantai'),
(121, 13, 13, 7, '1', 'KD06', 'P', 0, 'Memahami konsep aktivitas ritmik'),
(122, 13, 13, 7, '1', 'KD07', 'P', 0, 'Memahami konsep kebugaran jasmani'),
(125, 13, 13, 7, '1', 'KD01', 'K', 0, 'Mempraktikkan permainan bola besar'),
(126, 13, 13, 7, '1', 'KD02', 'K', 0, 'Mempraktikkan permainan bola kecil'),
(127, 13, 13, 7, '1', 'KD03', 'K', 0, 'Mempraktikkan nomor atletik'),
(128, 13, 13, 7, '1', 'KD05', 'K', 0, 'Mempraktikkan senam lantai'),
(129, 13, 13, 7, '1', 'KD06', 'K', 0, 'Mempraktikkan aktivitas ritmik'),
(130, 13, 13, 7, '1', 'KD07', 'K', 0, 'Mempraktikkan latihan kebugaran jasmani'),
(133, 5, 5, 7, '1', 'k02', 'P', 0, 'memahami semangat pendiri negara dalam perumusan pancasila'),
(134, 5, 5, 7, '1', 'k03', 'P', 0, 'sejarah pengesahan uud negara RI'),
(135, 5, 5, 7, '1', 'k04', 'P', 0, 'memahami keragaman suku agama ras budaya'),
(136, 15, 10, 7, '1', 'K04', 'P', 0, 'memahami kronologi perubahan dan kesinambungan dalam kihidupan bangsa Indonesia'),
(138, 13, 13, 8, '1', 'KD01', 'P', 0, 'Memahami konsep permainan bola besar.'),
(139, 13, 13, 8, '1', 'KD02', 'P', 0, 'Memahami konsep permainan bola kecil.'),
(140, 13, 13, 8, '1', 'KD03', 'P', 0, 'Memahami konsep nomor atletik '),
(141, 13, 13, 8, '1', 'KD05', 'P', 0, 'Memahami konsep senam lantai '),
(142, 13, 13, 8, '1', 'KD06', 'P', 0, 'Memahami konsep aktivitas ritmik '),
(143, 13, 13, 8, '1', 'KD07', 'P', 0, 'Memahami konsep kebugaran jasmani'),
(146, 13, 13, 8, '1', 'KD01', 'K', 0, 'Mempraktikkan permainan bola besar.'),
(147, 13, 13, 8, '1', 'KD02', 'K', 0, 'Mempraktikkan permainan bola kecil '),
(148, 13, 13, 8, '1', 'KD03', 'K', 0, 'Mempraktikkan keterampilan atletik'),
(149, 13, 13, 8, '1', 'KD05', 'K', 0, 'Mempraktikkan senam lantai '),
(150, 13, 13, 8, '1', 'KD06', 'K', 0, 'Mempraktikkan aktivitas ritmik'),
(151, 13, 13, 8, '1', 'KD07', 'K', 0, 'Mempraktikkan latihan kebugaran jasmani'),
(154, 15, 10, 7, '1', 'K03', 'K', 0, 'menjelaskan hasil analisis tentang konsep intruksi antara manusia dengan ruang'),
(155, 15, 10, 7, '1', 'K04', 'K', 0, 'menguraikan kronologi perubahan dan kesinambungan dalam kehidupan bangsa Indonesia'),
(156, 5, 5, 7, '1', '4.1', 'K', 0, 'menyaji hasil telaah sejarah semangat pendiri negara dalam merumuskan dasar negara'),
(157, 5, 5, 7, '1', 'k.2', 'K', 0, 'menyaji hasil telaah tentang pengesahan uud 1945'),
(158, 5, 5, 7, '1', 'k.3', 'K', 0, 'menyajikan isi pembukaan uud ri'),
(159, 5, 5, 7, '1', 'k.4', 'K', 0, 'menyaji hasil pengamatan tentang norma norma yang berlaku dalam masyarakat'),
(160, 9, 8, 7, '1', '3.1  ', 'P', 0, 'Menjelaskan,menguraikan dan mengoprasikan Bilangan'),
(161, 9, 8, 7, '1', '3.2', 'P', 0, 'Menjelaskan dan mengoprasikan Himpunan'),
(162, 9, 8, 7, '1', '3.3', 'P', 0, 'Mampu menyelesaikan operasi bentuk aljabar'),
(163, 9, 8, 7, '1', '3.4', 'P', 0, 'Menjelaskan Persamaan dan pertidak samaan linear satu variabel'),
(164, 16, 2, 7, '1', 'K05', 'P', 0, 'Menganalisis kisah keteladanan Nabi Sulaiman dan umatnya'),
(165, 16, 2, 8, '1', 'K01', 'P', 0, 'memahami hakikat beriman kepada kitab-kitab Allah SWT'),
(166, 16, 2, 8, '1', 'K02', 'P', 0, 'Memahami pengertian ,contoh dan dampak positif sifat tawakal, ikhtiar, sabar,syukur dan qona\"ah'),
(167, 16, 2, 8, '1', 'K03', 'P', 0, 'Memahami pengertian contoh dan dampak negatif sifta ananiah, putus asa, gadab dan tamak'),
(168, 16, 2, 8, '1', 'K04', 'P', 0, 'Memahami Adab kepada orang tua dan guru'),
(169, 16, 2, 8, '1', 'K05', 'P', 0, 'Menganilisis kisah keteladanan Nabi Yunus dan Nabi Ayub'),
(170, 16, 2, 7, '1', 'K03', 'K', 0, 'Menceritakan kisah dari perilaku ikhlas, taat, khauf dan taubat dalam fenomena kehidupan'),
(171, 16, 2, 7, '1', 'K04', 'K', 0, 'Menyimulasikan adab shalat dan dzikir'),
(172, 16, 2, 7, '1', 'K05', 'K', 0, 'Menceritakan kisah keteladanan Nabi Sulaiamn dan umatnya'),
(173, 16, 2, 8, '1', 'K01', 'K', 0, 'Menyajikan data dari berbagai sumber tentang kebenaran kitab-kitab Allah SWT'),
(174, 16, 2, 8, '1', 'K02', 'K', 0, 'Menunjukkan contoh perilaku tawakal, ikhtiar, sabar, syukur dan qana\"ah'),
(175, 16, 2, 8, '1', 'K03', 'K', 0, 'Mensimulasikan akibat buruk dari ananiah, putus asa, gadab, tamak dalam kehidupan sehari-hari'),
(176, 16, 2, 8, '1', 'K04', 'K', 0, 'Mensimulasikan adab kepada orang tua dan guru'),
(177, 16, 2, 8, '1', 'K05', 'K', 0, 'Menceritakan kisah keteladanan Nabi Yunus dan Nabi Ayub'),
(178, 16, 4, 7, '1', 'K01', 'P', 0, 'Memahami pola dakwah nabi Muhammad saw di Makkah'),
(179, 16, 4, 7, '1', 'K02', 'P', 0, 'Menganalisis pola dakwah Nabi Muhammad Saw di Makkah'),
(180, 16, 4, 7, '1', 'K03', 'P', 0, 'Memahami sejarah Nabi Muhhamd Saw dalam membangun masyarakat melalui kegiatan ekonomi dan perdaganga'),
(181, 16, 4, 7, '1', 'K01', 'K', 0, 'Memahami pola dakwah nabi Muhammad saw di Makkah'),
(182, 16, 4, 7, '1', 'K02', 'K', 0, 'Menganalisis pola dakwah Nabi Muhammad Saw di Makkah'),
(183, 16, 4, 7, '1', 'K03', 'K', 0, 'Memahami sejarah Nabi Muhammad dalam membangung masyarakat melalui perekonomian'),
(184, 16, 4, 7, '1', 'K04', 'K', 0, 'Memahami misi nabi Muhammad saw sebagai rahmat bagi alam semesta'),
(185, 16, 4, 7, '1', 'K05', 'K', 0, 'Memahami pola dakwah Nabi Muhammad Saw di Madinah'),
(186, 16, 4, 8, '1', 'K01', 'P', 0, 'Memahami sejarah berdirinya Dinasti Abbasiyah'),
(187, 16, 4, 8, '1', 'K02', 'P', 0, 'Mengidentifikasi tokoh ilmuwan muslim pada masa dinasti Abbasiyah'),
(188, 16, 4, 8, '1', 'K03', 'P', 0, 'Mengidentifikasi para \"ulama penyusun Kutubus Sittah pada masa dinasti Abbasiyah'),
(189, 16, 4, 8, '1', 'K04', 'P', 0, 'Mengidentifikasi perkembangan kebudayaan/peradaban Islam pada masa Dinasti Abbasiyah'),
(190, 16, 4, 8, '1', 'K05', 'P', 0, 'Menyimpulkan kemajuankebudayaan/peradaban Islam yang diraih pada masa Dinasti Abbasiyah'),
(191, 16, 4, 8, '1', 'K01', 'K', 0, 'Menceritakan silsilah kekhalifahan Dinasti Abbasiyah'),
(192, 16, 4, 8, '1', 'K02', 'K', 0, 'Menceritakan biografi dan karya para ilmuwan muslim pada masa dinasti Abbasiyah'),
(193, 16, 4, 8, '1', 'K03', 'K', 0, 'Memaparkan peran ilmuwan muslim pada masa dinasti Abbasiyah'),
(194, 16, 4, 8, '1', 'K04', 'K', 0, 'Menceritakan perkembangan Islam pada masa Dinasti Abbasiyah'),
(195, 9, 8, 7, '1', '4.1', 'K', 0, 'Menyelesaikan masalah yang berkaitan tentang bilangan bulat'),
(196, 9, 8, 7, '1', '4.2', 'K', 0, 'Menyelesaikan masalah yang berkaitan dg masalah himpunan'),
(197, 9, 8, 7, '1', '4.3', 'K', 0, 'Menyelesaikan masalah pada bentuk dan operasi aljabar'),
(198, 9, 8, 7, '1', '4.4', 'K', 0, 'Menyelesaikan masalah yang berkaitan Persamaan dan pertadaksamaan linear satu variabel'),
(199, 15, 5, 8, '1', 'kd1', 'P', 0, 'memahami nilai-nilai Pancasila sebagai dasar negara dan pandangan hidup bangsa'),
(200, 15, 5, 8, '1', 'kd02', 'P', 0, 'memahami fungsi-fungsi lembaga-lembaga negara dalam uud negara republik Indonesia'),
(201, 15, 5, 8, '1', 'kd03', 'P', 0, 'memahami tata urutan peraturan perundangan nasional'),
(202, 15, 5, 8, '1', 'kd04', 'P', 0, 'memahami norma dan kebiasaan antar daerah di Indonesia'),
(203, 15, 5, 8, '1', 'kd4.1', 'K', 0, 'menalar nilai-nilai Pancasila sebagai dasar negara dan pandangan hidup bangsa dalam kehidupan sehari'),
(204, 15, 5, 8, '1', 'kd4.2', 'K', 0, 'menyajikan hasil telaah fungsi lembaga-lembaga negara dalam UUD negara RI Tahun 1945'),
(205, 15, 5, 8, '1', 'kd4.3', 'K', 0, 'menyajikan hasi telaah tata urutanperaturan perundang-undangan'),
(206, 15, 5, 8, '1', 'kd4.4', 'K', 0, 'menalar hasil telaah norma dan kebiasaan antar daerah di Indonesia'),
(207, 15, 5, 8, '1', 'kd4.5', 'K', 0, 'menyajikanbentuk partisipasi kewarganegaran yang mencerminkan komitmen terhadap keutuhan nasional'),
(208, 11, 8, 8, '1', 'KD1', 'P', 0, 'menentukan pola pada barisan bilangan dan barisan konfigurasi obyek'),
(209, 11, 8, 8, '1', 'KD2', 'P', 0, 'Menjelaskan kedudukan titik dalam bidang kartesius'),
(210, 11, 8, 8, '1', 'KD3', 'P', 0, 'mendiskripsikan dan menyatakan relasi dan fungsi dengan menggunakan berbagai representasi'),
(211, 11, 8, 8, '1', 'KD4', 'P', 0, 'menjelaskan gradien, persamaan dan grafik garis lurus'),
(212, 12, 11, 7, '1', '3.1', 'P', 0, 'Teks interaksi transaksional tindakan menyapa, berpamitan, terima kasih dan meminta maaf serta respo'),
(213, 12, 11, 7, '1', '3.2', 'P', 0, 'Teks interaksi transaksional tindakan memberi dan meminta informasi jati diri pendek dan sederhana'),
(214, 12, 11, 7, '1', '3.3', 'P', 0, 'Teks transaksional lisan dan tulis memberi dan meminta nama hari, bulan, waktu dalam hari/angka, tan'),
(215, 12, 11, 7, '1', '3.4', 'P', 0, 'Teks interaksi transaksional memberi dan meminta nama dan jumlah binatang, benda dan bangunan'),
(216, 12, 11, 7, '1', '4.1', 'K', 0, 'Menyusun teks transaksional menyapa, berpamitan, terima kasih dan meminta maaf.'),
(217, 17, 6, 7, '1', 'K31', 'P', 0, 'Mengidentifikasi informasi dan menelaah struktur dan kebahasaan teks deskripsi'),
(218, 12, 11, 7, '1', '4.2', 'K', 0, 'Menyusun teks transaksional memberi dan meminta informasi jati diri pendek dan sederhana'),
(219, 17, 6, 7, '1', 'K32', 'P', 0, 'Mengidentifikasi unsur dan menelaah struktur dan kebahasaan teks fantasi'),
(220, 17, 6, 7, '1', 'K33', 'P', 0, 'Mengidentifikasi teks dan menelaah struktur dan kebahasaan teks prosedur'),
(221, 12, 11, 7, '1', '4.3', 'K', 0, 'Menyusun teks transaksional memberi dan meminta nama hari, bulan, waktu dalam hari/angka, tanggal/ta'),
(222, 17, 6, 7, '1', 'K34', 'P', 0, 'Mengidentifikasi informasi dan menelaah struktur dan kebahasaan teks laporan hasil observasi'),
(223, 12, 11, 7, '1', '4.4', 'K', 0, 'Menyusun teks transaksional memberi dan meminta nama dan jumlah binatang, benda dan bangunan publik'),
(224, 11, 8, 8, '1', 'KD1', 'K', 0, 'menyelesaikan masalah yang berkaitan dengan pola pada barisan bilangan'),
(225, 11, 8, 8, '1', 'KD2', 'K', 0, 'menyelesaikan masalah yag berkaitan dengan titik dalam bidang kartesius'),
(226, 11, 8, 8, '1', 'KD3', 'K', 0, 'Menyelesaikan masalah yang berkaitan dengan relasi dan fungsi'),
(227, 11, 8, 8, '1', 'KD4', 'K', 0, 'menyelesaikan masalah yang berkaitan dengan SPLDV'),
(228, 17, 6, 7, '1', 'K41', 'K', 0, 'Menjelaskan isi dan menyajikan data, gagasan dan kesan teks deskripsi secara lisan dan tulis'),
(229, 17, 6, 7, '1', 'K42', 'K', 0, 'Menceritakan kembali dan menyajikan gagasan kreatif teks fantasi'),
(230, 17, 6, 7, '1', 'K43', 'K', 0, 'Menyimpulkan isi dan menyajikan data teks prosedur'),
(231, 17, 6, 7, '1', 'K44', 'K', 0, 'Menyimpulkan isi dan menyajikan rangkuman teks hasil observasi'),
(232, 1, 16, 7, '1', '1.1', 'P', 0, 'membaca ayat'),
(233, 1, 16, 7, '1', '1.2', 'P', 0, 'Menulis ayat'),
(234, 1, 16, 7, '1', '1.3', 'P', 0, 'Menghafal surat '),
(235, 1, 16, 7, '1', '1.4', 'P', 0, 'Menerjemahkan ayat'),
(256, 3, 12, 7, '1', 'K01', 'P', 0, 'memahami konsep dan prosedur menggambar flora fauna dan alam benda'),
(257, 3, 12, 7, '1', 'K02', 'P', 0, 'memahami konsep dan prosedur menggambar gubahan'),
(258, 3, 12, 7, '1', 'K03', 'P', 0, 'memahami tehnik vokal dalam bernyanyi lagu unisono'),
(259, 3, 12, 7, '1', 'K04', 'P', 0, 'memahami tehnik bermain musik ansambel sederhana'),
(260, 3, 15, 7, '1', 'K01', 'P', 0, 'Memahami isi teks lisan sesuai dengan unggah ungguh jawa							'),
(261, 3, 15, 7, '1', 'K02', 'P', 0, 'Memahami tujuan ,fungsi menceritakan pengalaman'),
(262, 3, 15, 7, '1', 'K03', 'P', 0, 'memahami cangkriman dan parikan'),
(264, 3, 15, 7, '1', 'K01', 'K', 0, 'Menyusun teks lisan sesuai unggah ungguh jawa untuk berbagai kepentingan'),
(265, 3, 15, 7, '1', 'K02', 'K', 0, 'Menyusun teks lisan dan tulis untuk menceritakan pengalaman'),
(269, 3, 15, 8, '1', 'K01', 'P', 0, 'memahami isi teks cerita legenda'),
(270, 3, 15, 8, '1', 'K02', 'P', 0, 'menelaah teks piwulang serat Wulangreh pupuh Gambuh'),
(271, 3, 15, 8, '1', 'K03', 'P', 0, 'menelaah teks berita'),
(272, 3, 15, 8, '1', 'K04', 'P', 0, 'memahami isi teks dialog berisi pesan'),
(273, 3, 15, 8, '1', 'K01', 'K', 0, 'menceritakan kembali cerita legenda dengan dialeg setempat'),
(274, 3, 15, 8, '1', 'K02', 'K', 0, 'menanggapi teks piwulang serat Wulangreh pupuh Gambuh'),
(275, 3, 15, 8, '1', 'K03', 'K', 0, 'menulis berita dan membaca teknik'),
(276, 3, 15, 8, '1', 'K04', 'K', 0, 'menyampaikan pesan secara lisan'),
(277, 3, 15, 8, '1', 'K05', 'K', 0, 'mengalihaksarakan serat Wulangreh pupuh Gambuh satu pada dari huruf latin ke huruf Jawa'),
(278, 17, 11, 8, '1', 'K31', 'P', 0, 'Teks lisan dan tulis meminta perhatian, mengecek pemahaman, menghargai, meminta dan mengungkapkan pe'),
(279, 17, 11, 8, '1', 'K32', 'P', 0, 'Teks lisan dan tulis tentang kemampuan dan kemauan'),
(280, 17, 11, 8, '1', 'K33', 'P', 0, 'Teks lisan dan tulis tentang memberi keharusan, himbauan dan larangan'),
(281, 17, 11, 8, '1', 'K34', 'P', 0, 'Teks lisan dan tulis tentang menyuruh, mengajak, dan meminta ijin'),
(282, 17, 11, 8, '1', 'K35', 'P', 0, 'Teks greeting card'),
(283, 17, 11, 8, '1', 'K36', 'P', 0, 'Teks lisan dan tulis tentang keberadaan orang, benda, dan binatang'),
(284, 17, 11, 8, '1', 'K37', 'P', 0, 'Teks lisan dan tulis tentang Simple Present Tense'),
(285, 17, 11, 8, '1', 'K41', 'K', 0, 'Menyusun teks lisan meminta perhatian, mengecek pemahaman, menghargai, meminta dan mengungkapkan pen'),
(286, 17, 11, 8, '1', 'K42', 'K', 0, 'Menyusun teks lisan dan tulis tentang kemampuan dan kemauan'),
(287, 17, 11, 8, '1', 'K43', 'K', 0, 'Menyusun teks lisan dan tulis keharusan, larangan dan himbauan'),
(288, 17, 11, 8, '1', 'K44', 'K', 0, 'Menyusun teks lisan dan tulis tentang menyuruh, mengajak dan meminta ijin'),
(289, 17, 11, 8, '1', 'K45', 'K', 0, 'Menyusun teks greeting card'),
(290, 17, 11, 8, '1', 'K46', 'K', 0, 'Menyusun teks lisan dan tulis tentang keberadaan orang, benda, dan binatang '),
(291, 17, 11, 8, '1', 'K47', 'K', 0, 'Menyusun teks lisan dan tulis tentang Simple Present Tense'),
(293, 6, 3, 7, '1', 'K01', 'P', 0, 'memahami najis dan tata cara menyucikan'),
(294, 6, 3, 7, '1', 'K02', 'P', 0, 'menganalisis hadas dan menyucikan'),
(295, 6, 3, 7, '1', 'K03', 'P', 0, 'memahami waktu-waktu shalat lima waktu'),
(296, 6, 3, 7, '1', 'K04', 'P', 0, 'memahami ketentuan sujud sahwi'),
(297, 6, 3, 7, '1', 'K05', 'P', 0, 'memahami ketentuan azan dan iqamah'),
(298, 6, 3, 7, '1', 'K06', 'P', 0, 'menganalisis ketentuan shalat berjamaah'),
(299, 6, 3, 7, '1', 'K07', 'P', 0, 'memahami tata cara berzikir dan berdoa setelah shalat'),
(300, 6, 3, 8, '1', 'K01', 'P', 0, 'memahami ketentuan sujud syukur'),
(301, 6, 3, 8, '1', 'K02', 'P', 0, 'memahami ketentuan sujud tilawah'),
(302, 6, 3, 8, '1', 'K03', 'P', 0, 'menganalisis ketentuan ibadah puasa'),
(303, 6, 3, 8, '1', 'K04', 'P', 0, 'menganalisis ketentuan pelaksanaan zakat'),
(304, 7, 7, 7, '1', 'K01', 'P', 0, 'mengidentifikasi bunyi kata, frasa dan kal b Arab yg berkaitan dg at Ta rifu binnafsi wa bil amiliin'),
(305, 7, 7, 7, '1', 'KD2', 'P', 0, 'melafalkan bunyi kata, frasa dan kal b Arab yg berkaitan dg at Ta rifu binnafsi wa bil amiliin'),
(306, 7, 7, 7, '1', 'KD3', 'P', 0, 'menemukan makna kata, frasa dan kal b Arab yg berkaitan dg at Ta rifu binnafsi wa bil amiliin'),
(307, 7, 7, 7, '1', 'KD1', 'K', 0, 'Mendemontrasikan ungkapan sederhana tentang topik at ta rifu binnafsi wabilamiliina fil madrosah,alm'),
(308, 7, 7, 7, '1', 'KD2', 'K', 0, 'Menunjukkan ungkapan sederhana tentang topik at ta rifu binnafsi wabilamiliina fil madrosah, almarof'),
(309, 7, 7, 7, '1', 'KD3', 'K', 0, 'Menyampaikan info lisan tentang topik at ta rifu binnafsi wabilamiliina fil madrosah, almarof'),
(310, 7, 7, 7, '1', 'KD4', 'K', 0, 'Mengungkapkan info scr tertulis sederhana tentang topik at ta rifu binnafsi wabilamiliina fil madros'),
(311, 7, 7, 7, '1', 'KD5', 'K', 0, 'Menyusun teks sederhana tentang topik at ta rifu binnafsi wabilamiliina fil madrosah, almarof'),
(312, 7, 7, 8, '1', 'KD1', 'P', 0, 'Mengidentifikasii bunyi,makna dan gagasan dari kata, frase, kal b Arab  dg topik assa ah, yaumiyatun'),
(313, 7, 7, 8, '1', 'KD2', 'P', 0, 'Melafalkan bunyi,makna dan gagasan dari kata, frase, kal b Arab dg topik assa\'ah,yaumiyatuna fil mad'),
(314, 7, 7, 8, '1', 'KD3', 'P', 0, 'Menemukan makna dan gagasan dari kata, frase dan kal b Arab dg topik assa\'ah, yaumiyatuna fil madros'),
(315, 7, 7, 8, '1', 'KD1', 'K', 0, 'Mendemontrasikan ungkapan info lisan dan tulisan sederhana tentang topik assa\'ah, yaumiyatuna fil ma'),
(316, 7, 7, 8, '1', 'KD2', 'K', 0, 'Menunjukkan ungkapan sederhana tentang topik assa\'ah, yaumiyatuna fil madrosah dan yaumiyatuna fil b'),
(317, 7, 7, 8, '1', 'KD3', 'K', 0, 'Menyampaikan info lisan tentang topik assa\'ah, yaumiyatuna fil baiti dan yaumiyatuna fil baiti.'),
(319, 9, 8, 8, '1', '3.1', 'P', 0, 'Menentukan pola pd barisan bilangan dan barisan konfigurasi obyek'),
(320, 9, 8, 8, '1', '3.2', 'P', 0, 'Menjelaskan kedudukan titik dalam bidang koordinat kartesius'),
(321, 9, 8, 8, '1', '3.3', 'P', 0, 'Mendiskripsikan dan menyatakan relasi dan fungsi dg menggunakan berbagai representasi'),
(322, 6, 1, 8, '1', 'k01', 'K', 0, 'menerapkan hukum bacaan mad iwad, layyin, mad Arid lissukun dalam Al-Wuran surah-surah pendek piliha'),
(323, 6, 1, 8, '1', 'k02', 'K', 0, 'menuliskan isi kandungan QS.Quraisy [106], Al-Insyirah [94] tentang ketentuan rizqi dari Allah'),
(324, 20, 14, 8, '1', 'KD4.4', 'K', 0, 'mengolah, menyaji dan mengemas bahan pangan serealia, kacang- kacangan dan umbi yang ada di wilayah '),
(325, 6, 1, 8, '1', 'K02', 'K', 0, 'mensimulasikan sikap tolong menolong dan peduli terhadap anak yatim sesuai isi QS. Al-Kautsar [108],'),
(326, 9, 8, 8, '1', '4.1', 'K', 0, 'Menyelesaikan masalah yg berkaitan dg pola pd barisan bilangan'),
(327, 9, 8, 8, '1', '4.2', 'K', 0, 'Menyelesaikan masalah yang berkaitan dg kedudukan ttk dalam bidang kartesius'),
(328, 9, 8, 8, '1', '4.3', 'K', 0, 'Menyelesaikan masalah yang berkaitan dg relasi dan fungsi'),
(329, 9, 8, 8, '1', '4.4', 'K', 0, 'Menyelesaikan masalah yang berkaitan dg gradien, persamaan, dan grafik garis lurus'),
(330, 6, 1, 8, '1', 'K01', 'P', 0, 'memahami hukum bacaan mad iwad, layyin, mad Arid lissukun dalam Al-Wuran surah-surah pendek piliha'),
(331, 6, 1, 8, '1', 'K02', 'P', 0, 'memahami isi kandungan QS.Quraisy [106], Al-Insyirah [94] tentang ketentuan rizqi dari Allah'),
(332, 6, 1, 8, '1', 'K03', 'P', 0, 'memahami isi kandungan QS. Al-Kautsar [108], dan QS. Al-Maun [107]'),
(333, 6, 3, 8, '1', 'K01', 'K', 0, 'memperagakan tata cara sujud syukur'),
(334, 6, 3, 8, '1', 'K02', 'K', 0, 'memperagakan tata cara sujud tilawah'),
(335, 6, 3, 8, '1', 'K03', 'K', 0, 'mensimulasikan tata cara melaksanakan puasa'),
(336, 6, 3, 8, '1', 'K04', 'K', 0, 'mendemonstrasikan pelaksanaan zakat'),
(337, 6, 3, 7, '1', 'K01', 'K', 0, 'mendemoinstrasikan tata cara bersuci'),
(338, 6, 3, 7, '1', 'K02', 'K', 0, 'mempraktikkan azan dan iqamah'),
(339, 6, 3, 7, '1', 'K03', 'K', 0, 'mempraktikkan shalat lima waktu'),
(340, 6, 3, 7, '1', 'K04', 'K', 0, 'memperagakan sujud sahwi'),
(341, 6, 3, 7, '1', 'K05', 'K', 0, 'mendemonstrasikan tata cara shalat berjamaah'),
(342, 6, 3, 7, '1', 'K06', 'K', 0, 'mendemonstrasikan zikir setelah shalat'),
(343, 3, 12, 7, '1', 'K01', 'K', 0, 'Menggambar floura fauna dan alam benda'),
(344, 3, 12, 7, '1', 'K02', 'K', 0, 'Menggambar gubahan flora fauna serta geometrik menjadi ragam hias'),
(345, 3, 12, 7, '1', 'K03', 'K', 0, 'Menyanyikan lagu secara unisono'),
(346, 3, 12, 7, '1', 'K04', 'K', 0, 'Memainkan musikansambel sederhana'),
(347, 14, 10, 8, '1', '3.1', 'P', 0, 'menelaah perubahan keruangan dan interaksi antar ruang di Indonesia dan negara - negara ASEAN'),
(348, 14, 10, 8, '1', '3.2', 'P', 0, 'menganalisis pengaruh interaksi sosial dalam ruang yang berbeda - beda'),
(351, 3, 12, 8, '1', 'K01', 'P', 0, 'Memahami konsep dan prosedur menggambar model pada berbagai bahan dan teknik'),
(352, 3, 12, 8, '1', 'K02', 'P', 0, 'Memahami konsep dan prosedur menggabar ilustrasi dg teknik manual dan digital'),
(353, 14, 10, 8, '1', '4.1', 'K', 0, 'menyajikan hasil telaah tentang Perubahan keruangan dan interaksi antar ruang di Indonesia dan ASEAN'),
(354, 14, 10, 8, '1', '4.2', 'K', 0, 'menyajikan hasil analisis tentang pengaruh interaksi sosial dalam ruang yang berbeda'),
(355, 3, 12, 8, '1', 'K03', 'P', 0, 'Memahami yeknik dan gaya lagu daerah secara unisono atau perorangan'),
(356, 3, 12, 8, '1', 'K04', 'P', 0, 'Memahami teknik dan gaya lagu daerah dalam bentuk vokal group'),
(358, 3, 12, 8, '1', 'K01', 'K', 0, 'Menggambar model pada berbagai bahan dan teknik'),
(359, 3, 12, 8, '1', 'K02', 'K', 0, 'Menggambar ilustrasi dengan teknik manual dan digital'),
(360, 3, 12, 8, '1', 'K03', 'K', 0, 'menyanyikan lagu daerah secara unisono atau perorangan'),
(361, 3, 12, 8, '1', 'K04', 'K', 0, 'Menyanyikan lagu daerah bentuk vokal group'),
(371, 7, 1, 7, '1', 'KD1', 'P', 0, 'Memahami kedudukan al-Qur an dan Hadits dalam kehidupan'),
(372, 7, 1, 7, '1', 'KD2', 'P', 0, 'Memahami isi kandungan Q.S al Fatihah, an Naas, al Falaq dan al Ikhlas tentang keesaan Alloh'),
(376, 7, 1, 7, '1', 'KD3', 'P', 0, 'Memahami keterkaitan isi kandungan hadits tentang iman dalam fenomena kehidupan dan akibatnya.'),
(378, 7, 1, 7, '1', 'KD1', 'K', 0, 'Membaca  Q.S al Fatihah, an Naas, al Falaq dan al Ikhlas.'),
(379, 7, 1, 7, '1', 'KD2', 'K', 0, 'Menghafal  Q.S al Fatihah, an Naas, al Falaq dan al Ikhlas secara fasih dan tartil.'),
(380, 7, 1, 7, '1', 'KD3', 'K', 0, 'Menulis hadits tentang iman  dan ibadah yang diterima Alloh.'),
(382, 7, 1, 7, '1', 'KD4', 'K', 0, 'Menerjemahkan makna hadits tentang iman dan ibadah yang diterima Alloh.'),
(386, 19, 9, 7, '2', 'K06', 'P', 0, 'Mengidentifikasi sistem organisasi kehidupan tingkat sel sampai organisme'),
(387, 19, 9, 7, '2', 'K07', 'P', 0, 'Menganalisis interaksi antara makhluk hidup dan lingkungannya'),
(388, 19, 9, 7, '2', 'K08', 'P', 0, 'Menganalisis terjadinya pencemaran lingkungan dan dampaknya'),
(389, 19, 9, 7, '2', 'K09', 'P', 0, 'Menganalisis perubahan iklim dan dampaknya bagi ekosistem'),
(390, 19, 9, 7, '2', 'K10', 'P', 0, 'Menjelaskan lapisan bumi,gunung api,gempa bumi dan tindakan pengurangan resiko'),
(391, 19, 9, 7, '2', 'K11', 'P', 0, 'Menganalisis sistem tata surya'),
(392, 19, 9, 7, '2', 'K06', 'K', 0, 'Membuat model struktur sel tumbuhan/hewan'),
(393, 19, 9, 7, '2', 'K07', 'K', 0, 'Menyajikan hasil pengamatan interaksi makhluk hidup dengan lingkungan'),
(394, 19, 9, 7, '2', 'K08', 'K', 0, 'Membuat tulisan tentang gagasan penyelesaian masalah pencemaran lingkungan'),
(395, 19, 9, 7, '2', 'K09', 'K', 0, 'Membuat tulisan tentang gagasan adaptasi perubahan iklim'),
(396, 19, 9, 7, '2', 'K10', 'K', 0, 'Mengomunikasikan upaya pengurangan resiko dan dampak bencana alam'),
(397, 19, 9, 7, '2', 'K11', 'K', 0, 'Menyajikan karya tentang dampak rotasi dan revolusi bumi dan bulan'),
(399, 10, 9, 8, '2', '3.7', 'P', 0, 'memahami sistem peredaran darah pada manusia,,'),
(400, 10, 9, 8, '2', '3.8', 'P', 0, 'memahami tekanan zat,'),
(401, 10, 9, 8, '2', '3.9', 'P', 0, 'menganalisis sistem pernapasan pada manusia,'),
(402, 10, 9, 8, '2', '3.10', 'P', 0, 'menganalisis sistem ekskresi pada manusia,'),
(403, 10, 9, 8, '2', '3.11', 'P', 0, 'menerapkan konsep getaran, gelombang dan bunyi,'),
(404, 10, 9, 8, '2', '4.7', 'K', 0, 'menyajikan hasil percobaan pengaruh aktivitas pada frekuensi denyut jantung, '),
(405, 10, 9, 8, '2', '4.8', 'K', 0, 'menyajikan data hasil percobaan untuk menyelidiki tekanan zat cair pada kedalaman tertentu, '),
(406, 10, 9, 8, '2', '4.9', 'K', 0, 'menyajikan karya tentang upaya menjaga kesehatan sistem pernapasan, '),
(407, 10, 9, 8, '2', '4.10', 'K', 0, 'membuat karya tentang sistem ekskresi pada manusia, '),
(408, 10, 9, 8, '2', '4.11', 'K', 0, 'menyajikan hasil percobaan tentang getaran, gelombang, dan bunyi, '),
(417, 20, 14, 8, '2', 'KD3.1', 'P', 0, 'Memahami desain kerajinan dari bahan limbah anorganik lunak atau keras '),
(418, 20, 14, 8, '2', 'KD3.1', 'P', 0, 'Mendeskripsikan proses modifikasi jenis bahan limbah anorganik'),
(419, 20, 14, 8, '2', 'KD3.2', 'P', 0, 'Memahami prosedur jenis produk rekayasa yang dibuat berdasarkan rangkaian pengubah besaran listrik'),
(420, 20, 14, 8, '2', 'KD3.2', 'P', 0, 'Mengidentifikasi bahan, material, dan alat bantu yang digunakan untuk membuat produk rekayasa berdas'),
(421, 20, 14, 8, '2', 'KD3.3', 'P', 0, 'Mengidentifikasi desain wadah budidaya ikan konsumsi diwilayah setempat'),
(422, 20, 14, 8, '2', 'KD3.3', 'P', 0, 'Memahami konsep dan prosedur pemeliharaan ikan hias sesuai wilayah    setempat'),
(423, 20, 14, 8, '2', 'KD3.4', 'P', 0, 'Memahami rancangan pembuatan,  penyajian, dan pengemasan olahan bahan pangan'),
(424, 20, 14, 8, '2', 'KD3.4', 'P', 0, 'Memahami manfaat dan proses olahan seralia dan umbi menjadi produk non pangan'),
(425, 20, 14, 8, '2', 'KD4.1', 'K', 0, 'Membuat karya kerajinan dan pengemasan '),
(426, 20, 14, 8, '2', 'KD4.1', 'K', 0, 'Memodifikasi kerajinan dan pengemasan'),
(427, 20, 14, 8, '2', 'KD4.2', 'K', 0, 'Membuat model alat pengubah listrik'),
(428, 20, 14, 8, '2', 'KD4.2', 'K', 0, 'Membuat produk sensor menggunakan teknologi kelistrikan'),
(429, 20, 14, 8, '2', 'KD4.3', 'K', 0, 'Mendesain wadah budidaya ikan hias '),
(430, 20, 14, 8, '2', 'KD4.3', 'K', 0, 'Memelihara ikan hias berdasarkan konsep dan prosedur sesuai wilayah setempat'),
(431, 20, 14, 8, '2', 'KD4.4', 'K', 0, 'Membuat olahan bahan pangan setengah jadi '),
(432, 20, 14, 8, '2', 'KD4.4', 'K', 0, 'Membuat olahan dari hasil samping seralia dan umbi '),
(433, 20, 14, 7, '2', 'KD3.1', 'P', 0, 'Memahami tentang jenis, sifat, karakter, dan Teknik pengolahan kertas dan plastik lembar'),
(434, 20, 14, 7, '2', 'KD3.1', 'P', 0, 'Memahami tentang prinsip perancangan, pembuatan, dan penyajian produk kerajinan'),
(435, 20, 14, 7, '2', 'KD3.2', 'P', 0, 'Memahami jenis-jenis dan fungsi teknologi konstruksi'),
(436, 20, 14, 7, '2', 'KD3.2', 'P', 0, 'Memahami sistem, jenis, serta karakteristik persambungan dan penguatan pada konstruksi'),
(437, 20, 14, 7, '2', 'KD3.3', 'P', 0, 'Memahami komoditas tanaman obat yang dapat dikembangkan'),
(438, 20, 14, 7, '2', 'KD3.3', 'P', 0, 'Memahami tahapan budidaya tanaman obat'),
(439, 20, 14, 7, '2', 'KD3.4', 'P', 0, 'Memahami rancangan pengolahan, penyajian, dan pengemasan bahan pangan sayuran'),
(442, 20, 14, 7, '2', 'KD3.4', 'P', 0, 'Memahami rancangan pengolahan, penyajian, dan pengemasan bahan hasil samping sayuran'),
(443, 20, 14, 7, '2', 'KD4.1', 'K', 0, 'Memilih jenis bahan dan teknik pengolahan kertas dan plastik'),
(444, 20, 14, 7, '2', 'KD4.1', 'K', 0, 'Merancang, membuat, dan menyajikan produk kerajinan dari bahan kertas dan plastik'),
(445, 20, 14, 7, '2', 'KD4.2', 'K', 0, 'Memanipulasi jenis-jenis dan fungsi teknologi konstruksi'),
(446, 20, 14, 7, '2', 'KD4.2', 'K', 0, 'Membuat produk teknologi konstruksi '),
(447, 20, 14, 7, '2', 'KD4.3', 'K', 0, 'Menentukan komoditas tanaman obat yang akan dibudidayakan'),
(448, 20, 14, 7, '2', 'KD4.3', 'K', 0, 'Mempraktikan tahapan budidaya tanaman obat '),
(449, 20, 14, 7, '2', 'KD4.4', 'K', 0, 'Mengolah, menyaji, dan mengemas bahan pangan sayuran'),
(450, 20, 14, 7, '2', 'KD4.4', 'K', 0, 'Mengolah, menyaji, dan mengemas bahan hasil samping sayuran menjadi produk pangan '),
(451, 17, 11, 8, '2', 'K.D.1', 'P', 0, 'Menerapkan fungsi sosial, struktur teks, unsur kebahasaan Present Continous Tense'),
(452, 17, 11, 8, '2', 'K.D. ', 'P', 0, 'Menerapkan fungsi sosial,struktur teks, unsur  kebahasaan Comparison Degree'),
(453, 17, 11, 8, '2', 'K.D. ', 'P', 0, 'Menerapkan fungsi sosial, struktur teks dan unsur kebahasaan Past Tense'),
(454, 17, 11, 8, '2', 'KD. 4', 'P', 0, 'Menerapkan dan membandingkan fungsi sosial, struktur teks, unsur kebahasaan teks recount'),
(455, 17, 11, 8, '2', 'K.D. ', 'P', 0, 'Membandingkan fungsi sosial, struktur teks dan unsur kebahasaan pesan singkat dan pengumuman'),
(456, 17, 11, 8, '2', 'K.D. ', 'P', 0, 'Menafsirkan fungsi sosial, struktur teks, unsur kebahasaan lagu'),
(459, 17, 11, 8, '2', 'K.D.1', 'K', 0, 'Menyusun kalimat Present Continous Tense'),
(462, 17, 11, 8, '2', 'K.D. ', 'K', 0, 'Menyusun kalimat perbandingan'),
(463, 17, 11, 8, '2', 'K.D 3', 'K', 0, 'Menyusun kalimat Past Tense'),
(464, 17, 11, 8, '2', 'K.D 4', 'K', 0, 'Menangkap makna dan menyusun teks recount'),
(465, 17, 11, 8, '2', 'K.D. ', 'K', 0, 'Menangkap makna dan menyusun teks pesan singkat dan pengumuman'),
(466, 17, 11, 8, '2', 'K.D.6', 'K', 0, 'Menangkap makna lagu'),
(470, 17, 6, 7, '2', 'K.D. ', 'P', 0, 'Mengidentifikasi informasi dan menyimpulkan isi puisi rakyat'),
(471, 17, 6, 7, '2', 'K.D.2', 'P', 0, 'Mengidentifikasi informasi dan menceritakan kembali fabel'),
(473, 17, 6, 7, '2', 'K.D. ', 'P', 0, 'Mengidentifikasi informasi dan menyimpulkan isi surat pribadi/dinas'),
(474, 17, 6, 7, '2', 'K.D.4', 'P', 0, 'Menemukan unsur-unsur dan membuat rangkuman isi buku fiksi/nonfiksi'),
(475, 17, 6, 7, '2', 'K.D.1', 'K', 0, 'Menelaah struktur dan mengungkapkan gagasan, pesan puisi rakyat'),
(476, 17, 6, 7, '2', 'K.D. ', 'K', 0, 'Menelaah struktur dan kebahasaan fabel'),
(477, 17, 6, 7, '2', 'K.D. ', 'K', 0, 'Memerankan isi fabel'),
(478, 17, 6, 7, '2', 'K.D. ', 'K', 0, 'Menelaah unsur dan kebahasaan dan menulis surat pribadi/dinas'),
(480, 17, 6, 7, '2', 'K.D. ', 'K', 0, 'Menelaah hubungan unsur dan menyajikan tanggapan isi buku fiksi/nonfiksi'),
(483, 14, 10, 8, '2', '3.1', 'P', 0, 'Memahami aspek keruangan dan konektivitas antar ruang dan waktu dalam lingkup nasional'),
(484, 14, 10, 8, '2', '3.4', 'P', 0, 'Mendiskripsikan bentuk-bentuk dan sifat dinamika interaksi manusia dengan lingkungan '),
(485, 14, 10, 8, '2', '3.3.', 'P', 0, 'Mendeskripsikn fungsi dan peran kelembagaan sosial, buadaya, ekonomi dan politik dalam masyarakat'),
(488, 14, 10, 8, '2', ' 4.3', 'K', 0, 'Menyajikan hasil pengamatan bentuk-bentuk dan sifat dinamika interaksi manusia dengan lingkungan'),
(490, 7, 7, 7, '2', 'KD.1', 'K', 0, 'Mendemonstrasikan ungkapan tentang al\'unwaan, baiti dan min yaumiyyatil usroh.'),
(491, 7, 7, 7, '2', 'KD.1', 'P', 0, 'Mengidentifikasi bunyi tentang Al\'unwaan, baiti dan min yaumiyyatil usroh.'),
(492, 7, 7, 8, '2', 'KD.1', 'K', 0, 'Mendemonstrasikan ungkapan tentang almihnah, allaa\'ibunarriyadhiyuun, almihnatu tibbiyyah dan attada'),
(493, 7, 7, 8, '2', 'KD.1', 'P', 0, 'Mengidentifikasi bunyi tentang almihnah, allaa\'ibunarriyadhiyun, almihnatu tibbiyyah dan attadawi.'),
(494, 12, 11, 7, '2', '3.5', 'P', 0, 'teks lisan dan tulis tentang orang, binatang dan benda lain dari sifatnya,															'),
(495, 12, 11, 7, '2', '3.6', 'P', 0, 'teks lisan dan tulis tentang orang, binatang dan benda lain dari tindakannya,															'),
(496, 12, 11, 7, '2', '3.7', 'P', 0, 'teks deskripsi lisan dan tulis tentang orang, binatang dan benda,															'),
(497, 12, 11, 7, '2', '3.8', 'P', 0, 'lagu remaja,															'),
(498, 12, 11, 7, '2', '4.5', 'K', 0, 'menyusun teks lisan dan tulis tentang orang, binatang dan benda lain dari sifatnya,															'),
(499, 12, 11, 7, '2', '4.6', 'K', 0, 'menyusun teks lisan dan tulis tentang orang, binatang dan benda lain dari tindakannya,														'),
(500, 12, 11, 7, '2', '4.7', 'K', 0, 'menyusun teks deskripsi lisan dan tulis tentang orang, binatang dan benda,															'),
(501, 12, 11, 7, '2', '4.8', 'K', 0, 'menafsirkan makna lagu remaja															'),
(502, 7, 7, 7, '2', 'KD.2', 'P', 0, 'Melafalkan bunyi huruf tentang al\'unwaan, baiti dan min yaumiyyatil usroh.'),
(503, 7, 7, 7, '2', 'KD.3', 'P', 0, 'Menemukan makna ujaran tentang al\'unwaan, baiti dan min yaumiyyatil usroh.'),
(504, 7, 7, 7, '2', 'KD.2', 'K', 0, 'Menunjukkan contoh ungkapan tentang al\'unwaan, baiti dan min yaumiyyatil usroh.'),
(505, 7, 7, 7, '2', 'KD.3', 'K', 0, 'Menyampaikan informasi lisan tentang Al\'unwaan, baiti dan min yaumiyyatil usroh.'),
(506, 7, 7, 7, '2', 'KD.4', 'K', 0, 'Mengungkapkan informasi tertulis tentang al\'unwaan, baiti dan min yaumiyyatil usroh.'),
(507, 7, 7, 7, '2', 'KD.5', 'K', 0, 'Menyusun teks tentang al\'unwaan, baiti dan min yaumiyyatil usroh.'),
(508, 7, 7, 8, '2', 'KD.2', 'P', 0, 'Melafalkan bunyi tentang almihnah, allaa\'ibunarriyadhiyun, almihnatu tibbiyyah dan attadawi.'),
(509, 7, 7, 8, '2', 'KD.3', 'P', 0, 'Menentukan makna tentang almihnah, allaa\'ibunarriyadhiyun, almihnatu tibbiyyah dan attadawi.'),
(511, 7, 7, 8, '2', 'KD.2', 'K', 0, 'Menunjukkan contoh tentang almihnah, allaa\'ibunarriyadhiyuun, almihnatu tibbiyyah dan attadawi.'),
(512, 15, 10, 7, '2', '3.4', 'P', 0, 'Memahami pengertian dinamika  interaksi manusia dengan lingkungan alam,sosial,budaya dan ekonomi'),
(513, 7, 7, 8, '2', 'KD.3', 'K', 0, 'Menyampaikan informasi lisan tentang almihnah, allaa\'ibunarriyadhiyuun, almihnatu tibbiyyah dan atta'),
(514, 7, 7, 8, '2', 'KD.4', 'K', 0, 'Mengungkapkan informasi tulis tentang almihnah, allaa\'ibunarriyadhiyuun, almihnatu tibbiyyah dan att'),
(515, 15, 10, 7, '2', '3.3', 'P', 0, 'Memahami jenis-jenis kelembagaan sosial ,budaya ekonomi dan politik dalam masyarakat'),
(516, 7, 7, 8, '2', 'KD.5', 'K', 0, 'Menyusun teks tentang almihnah, allaa\'ibunarriyadhiyuun, almihnatu tibbiyyah dan attadawi.'),
(517, 9, 8, 7, '2', 'KD3.7', 'P', 0, 'Mendeskripsikan lokasi benda dalam koordinat cartesius'),
(518, 9, 8, 7, '2', 'KD3.8', 'P', 0, 'Menaksir dan mengukur bangun tidak beraturan'),
(519, 9, 8, 7, '2', 'KD3.9', 'P', 0, 'Memahami konsep tranformasi'),
(520, 9, 8, 7, '2', 'KD3.1', 'P', 0, 'Menemukan peluang empirik dari sekelompok data'),
(521, 9, 8, 7, '2', 'KD4.6', 'K', 0, 'Menerapkan prinsip tranformasi'),
(522, 9, 8, 7, '2', 'KD4.7', 'K', 0, 'Menyelesaikan permasalahan yang berkaitan bangun segi empat'),
(523, 9, 8, 7, '2', 'KD4.8', 'K', 0, 'Mengolah dan menyajikan data dalam bentuk tabel'),
(524, 9, 8, 7, '2', 'KD4.9', 'K', 0, 'Melakukan percobaan bentuk empirik dalam bentuk tabel'),
(525, 9, 8, 7, '2', 'KD4.1', 'K', 0, 'Menerapkan konsep dan sifat sifat terkait garis dan sudut'),
(526, 9, 8, 7, '2', 'KD3.1', 'P', 0, 'Memahami berbagai konsep dan prinsip garis dan sudut'),
(527, 3, 12, 7, '2', 'KD 1', 'P', 0, 'Memahami konsep dan prosedur penerapan ragam hias pada bahan tekstil'),
(528, 3, 12, 7, '2', 'KD 2', 'P', 0, 'Memahami konsep dan prosedur penerapan ragam hias pada bahan alam'),
(529, 3, 12, 7, '2', 'KD 3', 'P', 0, 'Memahami konsep dasar permainan alat musik sederhana secara perorangan '),
(530, 3, 12, 7, '2', 'KD 4 ', 'P', 0, 'Memahami konsep dasar ansambel musik'),
(531, 3, 12, 7, '2', 'KD 1', 'K', 0, 'Menerapkan ragam hias pada bahan tekstil'),
(532, 3, 12, 7, '2', 'KD 2', 'K', 0, 'Menerapkan ragam hias pada bahan alam'),
(533, 3, 12, 7, '2', 'KD 3', 'K', 0, 'Memainkan alat musik sederhana secara perorangan'),
(534, 3, 12, 7, '2', 'KD 4', 'K', 0, 'Memainkan ansambel musik sejenis dan campuran'),
(535, 3, 12, 8, '2', 'KD 1', 'P', 0, 'Memahami prosedur menggambar poster dengan berbagai teknik '),
(536, 3, 12, 8, '2', 'KD 2', 'P', 0, 'Memahami prosedur menggambar komik dengan berbagai teknik '),
(537, 3, 12, 8, '2', 'KD 3', 'P', 0, 'Memahami teknik memainkan salah satu alat musik tradisional secara perorangan '),
(538, 3, 12, 8, '2', 'KD 4 ', 'P', 0, 'Memahami teknik memainkan alat-alat musik tradfisional secara kelompok '),
(539, 3, 12, 8, '2', 'KD 1', 'K', 0, 'Menggambar poster dengan berbagai media bahan dan teknik '),
(540, 3, 12, 8, '2', 'KD 2', 'K', 0, 'Menggambar komik dengan berbagai teknik'),
(541, 3, 12, 8, '2', 'KD 3', 'K', 0, 'Memainkan salah satu alat musik tradisional secara perorangan'),
(542, 3, 12, 8, '2', 'KD 4 ', 'K', 0, 'Memainkan alat-alat musik tradisional secara berkelompok'),
(543, 9, 8, 8, '2', '311', 'P', 0, 'Menaksir dan menghitung luas dan volum bangun ruang'),
(544, 9, 8, 8, '2', '312', 'P', 0, 'Memahami konsep perbandingan dan menggunakan tabel, grafik dan persamaan'),
(545, 9, 8, 8, '2', '313', 'P', 0, 'Menemukan peluang empirik dan teoritik dari data'),
(546, 9, 8, 8, '2', '314', 'P', 0, 'Memahami teknik penyajian data dua variabel pada grafik'),
(547, 9, 8, 8, '2', '4.6', 'K', 0, 'Menyelesaikan permasalahan hub sdt pusat,panjang busur dan luas juring'),
(548, 9, 8, 8, '2', '4.7', 'K', 0, 'Mengolah dan menginterpretasikan data dalam bentuk tabel'),
(549, 9, 8, 8, '2', '4.8', 'K', 0, 'Melakukan percobaan untuk peluang empirik dibandingkan dengan peluang teoritik'),
(550, 16, 2, 7, '2', 'KD01', 'P', 0, 'Menguraikan al-Asma al Husna (al-Aziz, Al Ghaffar, al-basit, an-nafi\', Ar rauf, al Barr, Al fattah, '),
(551, 16, 2, 7, '2', 'KD02', 'P', 0, 'Mendeskripsikan tugas dan sifat-sifat malaikat Allah serta makhluk gaib lainnya seperti jin, iblis, '),
(552, 16, 2, 7, '2', 'KD03', 'P', 0, 'Memahami akhlak tercela riya\' dan nifaq'),
(553, 13, 13, 7, '2', 'KD 01', 'P', 0, 'Memahami konsep dasar permainan bola besar'),
(554, 16, 2, 7, '2', 'KD04', 'P', 0, 'Memahami adab membaca Al Qur\'an dan adab berdoa'),
(555, 16, 2, 7, '2', 'KD05', 'P', 0, 'Menganalisis kisah keteladanan Ashabul Kahfi'),
(556, 13, 13, 7, '2', 'KD 02', 'P', 0, 'Memahami konsep dasar permainan bola kecil'),
(557, 16, 2, 7, '2', 'KD01', 'K', 0, 'Menyajikan fakta dan fenomena kebenaran sifat-sifat Allah yang terkandung dalam al-Asma Al- Husna'),
(558, 13, 13, 7, '2', 'KD 03', 'P', 0, 'Memahami konsep dasar atletik'),
(559, 16, 2, 7, '2', 'KD02', 'K', 0, 'Menyajikan kisah-kisah dalam fenomena kehidupan tentang kebenaran adanya malaikat dan makhluk gaib '),
(560, 16, 2, 7, '2', 'KD03', 'K', 0, 'Menyimulasikan contoh perilaku riya\' dan nifaq serta dampaknya dalam kehidupan sehari-hari'),
(561, 16, 2, 7, '2', 'KD04', 'K', 0, 'Menceritakan kisah keteladanan Ashabul Kahfi'),
(562, 13, 13, 7, '2', 'KD 05', 'P', 0, 'Memahami konsep dasar senam lantai'),
(563, 13, 13, 7, '2', 'KD 06', 'P', 0, 'Memahami konsep dasar senam irama'),
(564, 13, 13, 7, '2', 'KD 07', 'P', 0, 'Memahami konsep dasar latihan kebugaran jasmani'),
(567, 13, 13, 8, '2', 'KD 01', 'P', 0, 'Memahami konsep permainan bola besar'),
(568, 13, 13, 8, '2', 'KD 02', 'P', 0, 'Memahami konsep permainan bola kecil'),
(569, 16, 2, 8, '2', 'KD01', 'P', 0, 'Memahami pengertian, dalil dan pentingnya beriman kepada Rasul Allah Swt'),
(570, 13, 13, 8, '2', 'KD 03', 'P', 0, 'Memahami konsep nomor atletik'),
(571, 16, 2, 8, '2', 'KD02', 'P', 0, 'Menguraikan sifat-sifat Rasul Allah Swt'),
(572, 13, 13, 8, '2', 'KD 05', 'P', 0, 'Memahami konsep senam lantai'),
(573, 13, 13, 8, '2', 'KD 06', 'P', 0, 'Memahami konsep aktivitas ritmik'),
(574, 13, 13, 8, '2', 'KD 07', 'P', 0, 'Memahami konsep latihan kebugaran jasmani'),
(577, 16, 2, 8, '2', 'KD03', 'P', 0, 'Memahami pengertian, contoh dan hikmah mukjizat serta kejadian luar biasa lainnya (karamah, ma\'unah '),
(578, 9, 8, 7, '2', 'KD3.1', 'P', 0, 'Memahami konsep dan prinsip garis dan sudut dalam pemecahan masalah'),
(579, 16, 2, 8, '2', 'KD04', 'P', 0, 'Memahami pengertian, contoh dan dampak positifnya sifat husnudzan, tawadhu\', tasamuh dan ta\'awun'),
(580, 16, 2, 8, '2', 'KD05', 'P', 0, 'Memahami pengertian, contoh dan dampak negatifnya sifat hasad, dendam, ghibah, fitnah dan namimah'),
(581, 16, 2, 8, '2', 'KD06', 'P', 0, 'Memahami adab kepada saudara dan teman'),
(582, 16, 2, 8, '2', 'KD07', 'P', 0, 'menganalisis kisah keteladanan sahabat Abu Bakar ra'),
(583, 16, 2, 8, '2', 'KD01', 'K', 0, 'Menyajikan peta konsep pengertian, dalil dan pentingnya beriman kepada Rasul Allah Swt'),
(584, 16, 2, 8, '2', 'KD02', 'K', 0, 'Menyajikan peta konsep sifat-Sifat Rasul Allah Swt'),
(585, 16, 2, 8, '2', 'KD03', 'K', 0, 'Menyajikan kisah-kisah dari berbagai sumber tentang adanya mukjizat dan kejadian luar biasa lainnya'),
(586, 16, 2, 8, '2', 'KD04', 'K', 0, 'Mensimulasikan dampak positif dari akhlak terpuji (husnudzan, tawadhu\', tasamuh dan ta\'awun)'),
(587, 16, 2, 8, '2', 'KD05', 'K', 0, 'Mensimulasikan dampak negatif dari akhlak tercela (hasad, dendam, ghibah, dan namimah)'),
(588, 13, 13, 7, '2', 'KD 01', 'K', 0, 'Mempraktikkan teknik dasar permainan bola besar'),
(589, 7, 1, 7, '2', 'KD.1', 'P', 0, 'Memahami isi kandungan Q.S Al Kafirun dan Al Bayyianah dan hadits tentang toleransi.'),
(590, 16, 2, 8, '2', 'KD06', 'K', 0, 'Mensimulasikan adab kepada saudara dan teman'),
(591, 13, 13, 7, '2', 'KD 02', 'K', 0, 'Mempraktikkan teknik dasar permainan bola kecil'),
(592, 13, 13, 7, '2', 'KD 03', 'K', 0, 'Mempraktikkan teknik dasar salah satu nomor atletik'),
(593, 16, 2, 8, '2', 'KD07', 'K', 0, 'Menceritakan kisah keteladanan sahabat Abu Bakar ra'),
(594, 13, 13, 7, '2', 'KD 05', 'K', 0, 'Mempraktikkan teknik dasar senam lantai'),
(595, 13, 13, 7, '2', 'KD 06', 'K', 0, 'Mempraktikkan teknik dasar aktivitas ritmik'),
(596, 7, 1, 7, '2', 'KD.2', 'P', 0, 'Memahami isi kandungan QS. Al Lahab dan An Nashr.'),
(597, 13, 13, 7, '2', 'KD 07', 'K', 0, 'Mempraktikkan latihan kebugaran jasmani'),
(600, 13, 13, 8, '2', 'KD 01', 'K', 0, 'Mempraktikkan permainan bola besar'),
(601, 7, 1, 7, '2', 'KD.1', 'K', 0, 'Menerapkan hukum bacaan qolqolah dalam QS. Al Bayyinah dan Al Kafirun.');
INSERT INTO `t_mapel_kd` (`id`, `id_guru`, `id_mapel`, `tingkat`, `semester`, `no_kd`, `jenis`, `bobot`, `nama_kd`) VALUES
(602, 13, 13, 8, '2', 'KD 02', 'K', 0, 'Mempraktikkan permainan bola kecil'),
(603, 13, 13, 8, '2', 'KD 03', 'K', 0, 'Mempraktikkan salah satu nomor atletik'),
(605, 7, 1, 7, '2', 'KD.2', 'K', 0, 'Menulis hadits tentang sikap tasamuh.'),
(606, 13, 13, 8, '2', 'KD 05', 'K', 0, 'Mempraktikkan senam lantai'),
(607, 13, 13, 8, '2', 'KD 06', 'K', 0, 'Mempraktikkan aktivitas ritmik'),
(608, 7, 1, 7, '2', 'KD.3.', 'K', 0, 'Menerjemahkan hadits tentang sikap tasamuh.'),
(609, 13, 13, 8, '2', 'KD 07', 'K', 0, 'Mempraktikkan latihan kebugaran jasmani'),
(612, 7, 1, 7, '2', 'KD.4.', 'K', 0, 'Menghafal hadits tentang sikap tasamuh.'),
(613, 15, 10, 7, '2', '4.4', 'K', 0, 'mengobservasi dan menyajikan bentuk-bentuk dinamika interaksi manusia dengan lingkungan alam,sosial,'),
(614, 16, 4, 7, '2', 'KD01', 'P', 0, 'Memahami berbagai prestasi yang dicapai oleh Khulafaurrasyidin'),
(615, 16, 4, 7, '2', 'KD02', 'P', 0, 'Memahami sejarah berdirinya Dinasti Bani Umayyah'),
(616, 16, 4, 7, '2', 'KD03', 'P', 0, 'Memahami perkembangan kebudayaan/peradaban Islam pada masa Dinasti Bani Umayyah'),
(617, 16, 4, 7, '2', 'KD04', 'P', 0, 'Memahami tokoh ilmuwan muslim dan perannya dalam kemajuan kebudayaan/peradaban islam pada masa Dinas'),
(618, 16, 4, 7, '2', 'KD05', 'P', 0, 'Memahami sikap dan gaya kepemimpinan Umar bin Abdul Azis'),
(619, 16, 4, 7, '2', 'KD01', 'K', 0, 'Meniru model kepemimpinan Khulafaurrasyidin'),
(620, 16, 4, 7, '2', 'KD02', 'K', 0, 'Menceritakan kisah ketegasan Abu Bakar as-Siddiq dalam menghadapi kekacauan umat Islam saat wafatnya'),
(621, 16, 4, 7, '2', 'KD03', 'K', 0, 'Menceritakan kisah tentang kehidupan Umar bin Abdul Azis dalam kehidupan sehari-hari'),
(622, 16, 4, 8, '2', 'KD01', 'P', 0, 'Memahami sejarah berdirinya Dinasti Ayyubiyah'),
(623, 16, 4, 8, '2', 'KD02', 'P', 0, 'Mengidentifikasi perkembangan kebudayaan/peradaban Islam pada masa Dinasti Ayyubiyah'),
(624, 16, 4, 8, '2', 'KD03', 'P', 0, 'Memahami semangat juang para penguasa Dinasti Ayyubiyah yang terkenal (Salahuddin al- Ayyubi, Al Adi'),
(625, 16, 4, 8, '2', 'KD04', 'P', 0, 'Mengidentifikasi ilmuwan muslim dinasti Ayyubiyah dan perannya dalam kemajuan kebudayaan/peradaban '),
(626, 16, 4, 8, '2', 'KD01', 'K', 0, 'menceritakan sejarah berdirinya Dinasti Ayyubiyah'),
(627, 16, 4, 8, '2', 'KD02', 'K', 0, 'Membuat peta konsep mengenai hal-hal yang dicapai pada masa Dinasti Ayyubiyah'),
(628, 16, 4, 8, '2', 'KD03', 'K', 0, 'Menceritakan biografi tokoh yang terkenal (salahudin al-Ayyubi, Al Adil dan Al Kamil) pada masa Dina'),
(629, 16, 4, 8, '2', 'KD04', 'K', 0, 'Memaparkan peran ilmuwan dalam memajukan kebudayaaan dan peradaban Islam pada masa Dinasti Ayyubiyah'),
(630, 15, 5, 8, '2', '3.4', 'P', 0, 'menemukan makna dan arti penting kebangkitan nasional dalam perjuangan kemerdekaan'),
(631, 15, 5, 8, '2', '3.5', 'P', 0, 'mengidentifikasi nilai dan semangat sumpah pemuda tahun1928 dalam bingkai Bhinika Tunggal Ika'),
(632, 15, 5, 8, '2', '3.6', 'P', 0, 'menggali pentingnya semangat dan komitmen kebangsaan untuk memperkuat negara kesatuan Republik Indon'),
(633, 15, 5, 8, '2', '4.4', 'K', 0, 'melaksanakan tanggungjawab terkait keberagaman suku,agamaras,dan antar golongan dalam bingkai Bhinne'),
(634, 15, 5, 8, '2', '4.5 ', 'K', 0, 'menunjukan prilaku bertanggungjawab dalam bekerjasama di berbagai bidang kehidupan dimasyarakat'),
(635, 15, 5, 8, '2', '4.6', 'K', 0, 'menunjukan contoh karakteristik daerah tempat tinggalnya dalam kerangka Negara Kesatuan Republik Ind'),
(636, 3, 15, 7, '2', 'KD 1', 'P', 0, 'Memahami geguritan '),
(637, 3, 15, 7, '2', 'KD 2', 'P', 0, 'Memahami lagu dolanan dan tembang macapat kinanti'),
(638, 3, 15, 7, '2', 'KD 3', 'P', 0, 'Memahami teks khusus yang berupa kalimat sederhana beraksara jawa'),
(639, 3, 15, 7, '2', 'KD 1', 'K', 0, 'Menyusun geguritan sederhana'),
(640, 3, 15, 7, '2', 'KD 2', 'K', 0, 'Melagukan lagu dolanan dan tembang macapat kinanti'),
(641, 3, 15, 7, '2', 'KD 3', 'K', 0, 'Membaca dan menulis kalimat sederhana beraksara jawa'),
(645, 6, 3, 7, '2', '3.1', 'P', 0, 'Ketentuan salat Jum\'at'),
(646, 6, 3, 7, '2', '3.2', 'P', 0, 'Ketentuan Khutbah Jum\'at'),
(647, 2, 6, 8, '2', '4.10', 'K', 0, 'Menyajikan informasi dan data dalam bentuk teks eksplanasi proses terjadinya fenomena alam'),
(648, 6, 3, 7, '2', '3.3', 'P', 0, 'Ketentuan Jama\' danQashar'),
(649, 2, 6, 8, '2', '4.11', 'K', 0, 'Menceritakan kembali isi teks ulasan tentang kualitas karya'),
(650, 6, 3, 7, '2', '3.4', 'P', 0, 'Kaifiat salat ketika sakit'),
(651, 2, 6, 8, '2', '4.12', 'K', 0, 'Menyajikan tanggapan tentang kualitas karya'),
(652, 2, 6, 8, '2', '4.13', 'K', 0, 'Menyimpulkan isi saran, ajakan, arahan, pertimbangan tentang hal positif'),
(653, 6, 3, 7, '2', '3.5', 'P', 0, 'Ketentuan salat sunat muakad'),
(655, 2, 6, 8, '2', '4.14', 'K', 0, 'Menyajikan teks persuasi'),
(656, 2, 6, 8, '2', '4.15', 'K', 0, 'Menginterpretasi drama'),
(657, 2, 6, 8, '2', '4.16', 'K', 0, 'Menyajikan drama dalam bentuk pentas/naskah'),
(658, 2, 6, 8, '2', '4.17', 'K', 0, 'Membuat peta konsep/garis alur dari buku fiksi dan non fiksi'),
(659, 6, 3, 7, '2', '3.6', 'P', 0, 'Salat sunat gairu muakad'),
(660, 6, 3, 7, '2', '4.1', 'K', 0, 'Mempraktekan salat Jumat'),
(661, 6, 3, 7, '2', '4.2', 'K', 0, 'Mendemonstrasikan khutbah Jumat'),
(662, 6, 3, 7, '2', '4.3', 'K', 0, 'Mempraktikan salat sunat muakad'),
(663, 6, 3, 7, '2', '4.4', 'K', 0, 'Mempraktikan salat sunat gairu muakad'),
(664, 2, 6, 8, '2', '3.10', 'P', 0, 'Menelaah teks eksplanasi berupa paparan kejadian alam'),
(665, 2, 6, 8, '2', '3.11', 'P', 0, 'Mengidentifikasi informasi pada teks ulasan tentang kualitas karya'),
(666, 2, 6, 8, '2', '3.12', 'P', 0, 'Menelaah struktur dan kebahasaan teks ulasan '),
(667, 2, 6, 8, '2', '3.13', 'P', 0, 'Mengidentifikasi jenis saran, ajakan, arahan, dan pertimbangan tentang berbagai hal positif'),
(668, 2, 6, 8, '2', '3.14', 'P', 0, 'Menelaah struktur dan kebahasaan teks persuasi'),
(669, 2, 6, 8, '2', '3.15', 'P', 0, 'Mengidentifikasi unsur-unsur drama'),
(670, 2, 6, 8, '2', '3.16', 'P', 0, 'Menelaah karakteristik unsur dan kaidah kebahasaan'),
(671, 2, 6, 8, '2', '3.17', 'P', 0, 'Menggali dan menemukan informasi dari buku fiksi dan non fiksi'),
(672, 1, 16, 7, '2', 'KD.1', 'P', 0, 'membaca ayat'),
(673, 1, 16, 7, '2', 'KD.2', 'P', 0, 'menulis ayat'),
(674, 1, 16, 7, '2', 'KD.3', 'P', 0, 'menghafal surat'),
(675, 1, 16, 7, '2', 'KD.4', 'P', 0, 'menerjemahkan surat'),
(678, 1, 16, 7, '2', 'KD3', 'K', 0, 'menghafal'),
(680, 5, 5, 7, '2', '3.5', 'P', 0, 'Memahami keberagaman suku, agama, ras, budaya, gender dalam bingkau Bhinneka Tunggal Ika'),
(681, 5, 5, 7, '2', '3.6', 'P', 0, 'Memahami pengertian dan makna NKRI'),
(682, 5, 5, 7, '2', '3.7', 'P', 0, 'Memahami daerah temoat tinggalnya dalam kerangka NKRI'),
(683, 5, 5, 7, '2', '4.5', 'K', 0, 'Berinterakasi dengan orang lain berdasarkan prinsip Bhenika Tunggal Ika'),
(684, 5, 5, 7, '2', '4.6', 'K', 0, 'Menampilkan perilakui kebersatuan dalam keberagaman'),
(685, 5, 5, 7, '2', '4.7', 'K', 0, 'Menyajikan karakteristik daerah tempat tinggal'),
(686, 6, 3, 8, '2', '3.1', 'P', 0, 'Ketentuan shadaqah,hibah dan hadiah'),
(687, 6, 3, 8, '2', '3.2', 'P', 0, ' Tata cara melaksanakan haji'),
(688, 6, 3, 8, '2', '3.3', 'P', 0, 'Tata cara melaksakan umrah'),
(689, 6, 3, 8, '2', '3.4', 'P', 0, 'Ketentuan makanan halal-haram'),
(690, 6, 3, 8, '2', '3.5', 'P', 0, 'Ketentuan minuman halal-haram'),
(691, 6, 3, 8, '2', '3.5', 'P', 0, 'Ketentuan minuman halal-haram'),
(692, 6, 3, 8, '2', '4.1', 'K', 0, 'Tata cara shadaqah,hibah,dan hadiah'),
(693, 6, 3, 8, '2', '4.2', 'K', 0, 'Tata cara haji dan umrah'),
(694, 6, 3, 8, '2', '4.3', 'K', 0, 'Tata cara mengkonsumsi makanan,minuman halal dan baik'),
(695, 11, 8, 8, '2', '311', 'P', 0, 'Menaksir dan menghitung Luas dan Volume bangun ruang'),
(696, 11, 8, 8, '2', '312', 'P', 0, 'Memahami konsep perbandingan dan menggunakan tabel grafik dan persamaan'),
(697, 11, 8, 8, '2', '313', 'P', 0, 'Menemukan peluang empirik dan teoritikal dari data'),
(698, 11, 8, 8, '2', '314', 'P', 0, 'memahami teknik penyajian data dua variabel pada grafik'),
(699, 11, 8, 8, '2', '46', 'K', 0, 'Menyelesaikan permasalahan hubungan sudut pusat, panjang busur dan luas juring'),
(700, 11, 8, 8, '2', '47', 'K', 0, 'mengolah dan menginterpretasikan data dalam bentuk tabel'),
(701, 11, 8, 8, '2', '48', 'K', 0, 'melakukan percobaan untuk peluang empirik dibandingkan peluang teoritik'),
(702, 3, 15, 8, '2', 'KD 1', 'P', 0, 'Memahami puisi jawa (geguritan)'),
(703, 3, 15, 8, '2', 'KD 2', 'P', 0, 'Memahami tembang macapat pangkur'),
(704, 3, 15, 8, '2', 'KD 3', 'P', 0, 'Memahami teks khusus kalimat sederhana beraksara jawa'),
(705, 3, 15, 8, '2', 'KD 1', 'K', 0, 'Membaca geguritan'),
(706, 3, 15, 8, '2', 'KD 2', 'K', 0, 'Melagukan tembang macapat pangkur'),
(707, 3, 15, 8, '2', 'KD 3', 'K', 0, 'Mebaca,menulis kalimat beraksara jawa'),
(708, 6, 1, 8, '2', '3.1', 'P', 0, 'Ketentuan hukum bacaan lam dan ra\' dalam Al-Qur\'an'),
(709, 6, 1, 8, '2', '3.2', 'P', 0, 'Kandungan QS.al-Humazah dan QS.at-Kasur tentang sifat cinta dunia dan melupakan kebahagiaan hakiki'),
(710, 6, 1, 8, '2', '3.3', 'P', 0, 'Kandungan Hadis tentang perilaku keseimbangan hidup di dunia dan akhirat'),
(711, 6, 1, 8, '2', '4.1', 'K', 0, 'Hukum bacaan lam dan ra\' dalam QS.al-Humazah QS.at-Takasur'),
(712, 6, 1, 8, '2', '4.2', 'K', 0, 'Sikap sesui dengan isi kandungan QS.al-Humazah QS.at-Takasur'),
(713, 6, 1, 8, '2', '4.3', 'K', 0, 'Sikap hidup seimbang antara dunia dan akhirat'),
(714, 2, 6, 8, '2', '3.18', 'P', 0, 'Menelaah unsur buku fiksi dan non fiksi'),
(715, 2, 6, 8, '2', '4.18', 'K', 0, 'Menyajikan tanggapan terhadap buku fiksi dan non fiksi'),
(716, 13, 13, 9, '1', 'KD 01', 'P', 0, 'Memahami konsep permainan bola besar'),
(717, 13, 13, 9, '1', 'KD 02', 'P', 0, 'Memahami konsep permainan bola kecil'),
(718, 13, 13, 9, '1', 'KD 03', 'P', 0, 'Memahami konsep nomor atletik'),
(719, 13, 13, 9, '1', 'KD 05', 'P', 0, 'Memahami konsep senam lantai'),
(720, 13, 13, 9, '1', 'KD 06', 'P', 0, 'Memahami konsep aktivitas ritmik'),
(721, 13, 13, 9, '1', 'KD 07', 'P', 0, 'Memahami konsep kebugaran jasmani'),
(722, 13, 13, 9, '1', 'KD 01', 'K', 0, 'Mempraktikkan permainan bola besar'),
(723, 13, 13, 9, '1', 'KD 02', 'K', 0, 'Mempraktikkan permainan bola kecil'),
(724, 13, 13, 9, '1', 'KD 03', 'K', 0, 'Mempraktikkan nomor atletik'),
(725, 13, 13, 9, '1', 'KD 05', 'K', 0, 'Mempraktikkan senam lantai'),
(726, 13, 13, 9, '1', 'KD 06', 'K', 0, 'Mempraktikkan aktivitas ritmik'),
(727, 13, 13, 9, '1', 'KD 07', 'K', 0, 'Mempraktikkan latihan kebugaran jasmani'),
(728, 8, 9, 9, '1', '3.1', 'P', 0, 'Memahami sistem reproduksi manusia dan gangguan sistem reproduksi serta penerapan pola hidup yang me'),
(729, 8, 9, 9, '1', '3.2', 'P', 0, 'Memahami sistem perkembangbiakan pada tumbuhan dan hewan'),
(730, 5, 10, 7, '1', '3.1', 'P', 0, 'Memahami konsep ruang dan interaksi antar ruang diindonesia serta pengaruh thd kehidupan manusia'),
(731, 5, 10, 7, '1', '3.2', 'P', 0, 'Mengidentifikasi interaksi sosial dalam ruang dan pengaruhnta thd kehidupan Km'),
(732, 5, 5, 8, '1', '3.1', 'P', 0, 'Menelaah pancasila sbg dasar negara dan pandangan hidup bangsa'),
(733, 5, 5, 8, '1', '3.2', 'P', 0, 'Menelaah makna dan fungsi uud ri 1945 serta peraturan perundang undangan lainya dlm sistem hukum nas'),
(734, 5, 5, 8, '1', '3.3', 'P', 0, 'Memahami tata urutan peraturan perundang undangan dalam sistem hukum nasional diindonesia'),
(735, 19, 6, 8, '1', 'K01', 'P', 0, 'Mengidentifikasi dan menelaah struktur dan unsur-unsur berita'),
(736, 5, 10, 7, '1', '4.1', 'K', 0, 'Menjelaskan konsep ruang dan interaksi antar ruang di Indonesia serta pengaruhnya thd kehidupan manu'),
(737, 19, 6, 8, '1', 'K02', 'P', 0, 'Mengidentifikasi informasi dan menelaah pola penyajian dan unsur kebahasaan iklan,slogan,dan poster'),
(738, 19, 6, 8, '1', 'K03', 'P', 0, 'Mengidentifikasi informasi, menelaah struktur dan kebahasaan teks eksposisi'),
(739, 19, 6, 8, '1', 'K04', 'P', 0, 'Mengidentifikasi dan menelaah unsur-unsur pembangun teks puisi'),
(740, 19, 6, 8, '1', 'K05', 'P', 0, 'Mengidentifikasi dan menelaah teks eksplanasi'),
(741, 5, 10, 7, '1', '4.2', 'K', 0, 'Menyajikanhasil identifikasi tentang interaksi sosial dlm ruang dan pengaruhnya thd kehidupan '),
(742, 19, 6, 8, '1', 'K01', 'K', 0, 'Menyimpulkan dan menyajikan data dan informasi dalam bentuk teks berita'),
(743, 19, 6, 8, '1', 'K02', 'K', 0, 'Menyimpulkan dan menyajikan gagasan,pesan, dan ajakan dalam bentuk iklan, slogan dan poster'),
(744, 19, 6, 8, '1', 'K03', 'K', 0, 'Menyimpulkan isi, menyajikan gagasan dan pendapat dalam bentuk teks eksposisi'),
(745, 19, 6, 8, '1', 'K04', 'K', 0, 'Menyimpulkan, menyajikan gagasan, perasaan, dan pendapat dalam bentuk puisi'),
(746, 19, 6, 8, '1', 'K05', 'K', 0, 'Meringkas, menyajikan informasi dalam bentuk teks eksplanasi'),
(747, 8, 9, 9, '1', '3.3', 'P', 0, 'Menerapkan konsep pewarisan sifat dalam pemuliaan dan kelangsungan makhluk hidup'),
(748, 8, 9, 9, '1', '3.4', 'P', 0, 'Memahami konsep listrik statis dan gejalanya dalam kehidupan sehari hari termasuk kelistrikan pada s'),
(749, 0, 9, 9, '1', '3.5', 'P', 0, 'Menerapkan konsep rangkaian listrik, energi dan daya listrik sumber energi listrik serta upaya mengh'),
(750, 0, 9, 9, '1', '3.6', 'P', 0, 'Menerapkan konsep kemagnetan, induksi elektromagnetik dan pemanfaatan medan magnet termasuk pergerak'),
(751, 15, 15, 8, '1', '3.1', 'P', 0, 'Memahami berbagai fungsi teks lisan sesuai dengan unggah -ungguh jawa'),
(752, 15, 15, 8, '1', '3.2', 'P', 0, 'memahami strategi menyimak berita berbahasa jawa'),
(754, 5, 5, 8, '1', '4.1', 'K', 0, 'menyaji hasil telaah nilai nilai pancasila sbg dasar negara dan pandangan hidup'),
(755, 5, 5, 8, '1', '4.2', 'K', 0, 'menyajikan telaah makna kedudukan dan fungsi uud negara ri 45 dalam penerapan kehidupan sehari hari'),
(756, 5, 5, 8, '1', '4.3', 'K', 0, 'mendemonstrasikan pola pengembangan tata urutan perundang undangan di indonesia'),
(757, 14, 5, 9, '1', '3.1', 'P', 0, 'Mensyukuri Perwujudan Pancasila Sebagai Dasar Negara yang merupakan anugerah Tuhan yang Maha Esa'),
(758, 14, 5, 9, '1', '3.2', 'P', 0, 'Menghargai isi alenia dan pokok pikiran yang terkandung dalam Pembukaan Undang - Undang Dasar Negara'),
(759, 14, 5, 9, '1', '3.3', 'P', 0, 'Bersyukur Kepada Tuhan yang Maha Esa atas bentuk dan kedaulatan negara Republik Indonesia'),
(760, 14, 5, 9, '1', '3.4', 'P', 0, 'Menghormati dan Mengapresiasi Prinsip harmoni dalam keberagaman'),
(761, 14, 5, 9, '1', '3.5', 'P', 0, 'Menunjukan perilaku orang beriman dalam mencintai tanah air dalam bentuk Negara Indonesia'),
(762, 14, 5, 9, '1', '4.1', 'K', 0, 'Menunjukan sikap bangga dan bertanggung jawab akan tanah air '),
(763, 14, 5, 9, '1', '4.2', 'K', 0, 'Melaksanakan isi alenia dan pokok pikiran yang terkandung dalam pembukaan Undang - Undang Dasar RI'),
(764, 14, 5, 9, '1', '4.3', 'K', 0, 'Mengutamakan sikap tolerandalam menghadapi masalah akibat keberagaman '),
(765, 14, 5, 9, '1', '4.4', 'K', 0, 'Menunjukan sikap peduli terhadap masalah - masalah yang muncul dalam bidang sosial, budaya, ekonomi,'),
(766, 14, 5, 9, '1', '4.5', 'K', 0, 'Mengutamakan sikap disiplin sebagai warga negara '),
(767, 16, 2, 9, '1', 'K01', 'P', 0, 'Memahami pengertian beriman kepada hari Akhir dalil/ buktinya, serta tanda dan peristiwa yang berhub'),
(771, 16, 2, 9, '1', 'K02', 'P', 0, 'Memahami macam-macam alam gaib yang berhubungan dengan Hari Akhir (\'alam barzakh, yaumul ba\'ts, yaum'),
(772, 16, 2, 9, '1', 'K03', 'P', 0, 'Memahami pengertian, contoh dan dampak berilmu, kerja keras, kreatif, dan produktif dalam fenomena k'),
(773, 16, 2, 9, '1', 'K04', 'P', 0, 'Memahami adab Islami kepada tetangga'),
(774, 16, 2, 9, '1', 'K05', 'P', 0, 'Meganalisis kisah Sahabat Umar bin Khattab ra'),
(775, 16, 2, 9, '1', 'KD01', 'K', 0, 'Menyajikan data dari berbagai sumber tantang fakta dan fenomena hari Akhir dan alam gaib lain yang b'),
(776, 16, 2, 9, '1', 'KD02', 'K', 0, 'Menyajikan contoh perilaku berilmu, kerja keras, kreatif dan produktif'),
(777, 16, 2, 9, '1', 'KD03', 'K', 0, 'menyajikan kisah-kisah dari fenomena kehidupan tentang dampak positif dari berilmu, kerja keras, kre'),
(778, 16, 2, 9, '1', 'KD04', 'K', 0, 'Mensimulasikan adab islami kepada tetangga'),
(779, 16, 2, 9, '1', 'KD05', 'K', 0, 'menceritakan kisah keteladanan sahabat Umar bin Khattab ra'),
(780, 16, 4, 9, '1', 'KD01', 'P', 0, 'Memahami sejarah masuknya Islam di Nusantara melalui perdagangan, sosial dan pengajaran'),
(781, 16, 4, 9, '1', 'KD02', 'P', 0, 'Memahami bukti masuknya Islam di Nusantara abad ke-7, ke-11 dan ke-13.'),
(782, 16, 4, 9, '1', 'KD03', 'P', 0, 'Memahami faktor penyebab mudahnya perkembangan islam di Nusantara'),
(783, 16, 4, 9, '1', 'KD04', 'P', 0, 'Memahami sejarah kerajaan Islam di Jawa, Sumatera, dan Sulawesi'),
(784, 16, 4, 9, '1', 'KD05', 'P', 0, 'Memahami para tokoh beserta perannya dalam perkembangan Islam di Indonesia (Walisongo, Syaikh Abdur '),
(785, 16, 4, 9, '1', 'KD06', 'P', 0, 'Memahami peran para tokoh dalam perkembangan Islam di Indonesia'),
(786, 16, 4, 9, '1', 'KD07', 'P', 0, 'Menerapkan semangat perjuangan walisongo dalam menyebarkan agama Islam di Indonesia'),
(787, 16, 4, 9, '1', 'KD08', 'P', 0, 'Memahami semangat perjuangan Abdur Ra\'uf As singkili, Muhammad Arsyad al- Banjari, Kh. Hasyim Asy\'ar'),
(788, 16, 4, 9, '1', 'KD01', 'K', 0, 'Menceritakan alur perjalanan para pedagang Arab dalam berdakwah di Indonesia'),
(789, 16, 4, 9, '1', 'KD02', 'K', 0, 'Menceritakan perjuangan walisongo dalam menyebarkan agama Islam di Indonesia.'),
(790, 16, 4, 9, '1', 'KD03', 'K', 0, 'Menceritakan biografi Abdur rauf as- singkili, Muhammad Arsyad al-Banjari, KH. Hasyim Asy\'ari dan KH'),
(791, 8, 9, 9, '1', '4.1', 'K', 0, 'Menyajikan hasil penelusuran informasi terkait kesehatan dan upaya pencegahan gangguan pada organ re'),
(792, 8, 9, 9, '1', '4.2', 'K', 0, 'Menyajikan karya hasil perkembangbiakan pada tumbuhan'),
(793, 8, 9, 9, '1', '4.3', 'K', 0, 'Menyajikan hasil penelusuran informasi terkait tentang tanaman dan hewan hasil pemuliaan'),
(794, 8, 9, 9, '1', '4.4', 'K', 0, 'Menyajikan hasil pengamatan tentang gejala listrik statis dalam kehidupan sehari-hari'),
(795, 8, 9, 9, '1', '4.5', 'K', 0, 'Menyajikan hasil rancangan dan pengukuran berbagai rangkaian listrik'),
(796, 20, 6, 7, '1', 'KD3.1', 'P', 0, 'Mengidentifikasi informasi dan menelaah struktur dan kebahasaan teks deskripsi'),
(797, 20, 6, 7, '1', 'KD3.2', 'P', 0, 'Mengidentifikasi informasi dan menelaah struktur dan kebahasaan teks fantasi'),
(798, 20, 6, 7, '1', 'KD3.3', 'P', 0, 'Mengidentifikasi informasi dan menelaah struktur dan kebahasaan teks prosedur'),
(799, 20, 6, 7, '1', 'KD3.4', 'P', 0, 'Mengidentifikasi informasi dan menelaah struktur dan kebahasaan teks observasi'),
(800, 20, 6, 7, '1', 'KD4.1', 'K', 0, 'Menjelaskan isi dan menyajikan data, gagasan dan kesan teks deskripsi secara lisan dan tulis'),
(801, 20, 6, 7, '1', 'KD4.2', 'K', 0, 'Menceritakan kembali dan menyajikan gagasan kreatif teks fantasi'),
(802, 20, 6, 7, '1', 'KD4.3', 'K', 0, 'Menyimpulkan isi dan menyajikan data teks prosedur'),
(803, 20, 6, 7, '1', 'KD4.4', 'K', 0, 'Menyimpulkan isi dan menyajikan rangkuman teks hasil observasi'),
(804, 15, 5, 7, '1', '3.1 ', 'P', 0, 'menganalisis proses perumusan dan penetapan Pancasila sebagai Dasar Negara'),
(805, 15, 5, 7, '1', '3.2', 'P', 0, 'memahami norma-norma yang berlaku dalam kehidupan bermasyarakat untuk mewujudkan keadilan HBD tv'),
(806, 15, 5, 7, '1', '3.3', 'P', 0, 'menganalisis kesejahteraan perumusan da pengesyahan UUD Negara RI tahun 1945'),
(807, 20, 14, 9, '1', 'KD3.1', 'P', 0, 'memahami pengetahuan tentang jenis, sifat, karakter, dan teknik pengolahan bahan kayu,'),
(808, 20, 14, 9, '1', 'KD3.1', 'P', 0, 'menganalisis prinsip perancangan, pembuatan, dan penyajian produk kerajinan dari bahan kayu, bambu, '),
(809, 20, 14, 9, '1', 'KD3.2', 'P', 0, 'menganalisis prinsip kelistrikan dan sistem instalasi listrik rumah tangga\r\n'),
(811, 20, 14, 9, '1', 'KD3.2', 'P', 0, 'menganalisis instalasi listrik rumah tangga\r\n'),
(812, 20, 14, 9, '1', 'KD3.3', 'P', 0, 'memahami komoditas ikan konsumsi yang dapat dikembangkan sesuai kebutuhan wilayah setempat\r\n'),
(813, 20, 14, 9, '1', 'KD3.3', 'P', 0, 'memahami sarana dan peralatan untuk budidaya ikan konsumsi'),
(814, 20, 14, 9, '1', 'KD3.3', 'P', 0, 'memahami tahapan budidaya (pembesaran) ikan konsumsi'),
(815, 20, 14, 9, '1', 'KD3.4', 'P', 0, 'memahami  tentang prinsip perancangan, pembuatan, penyajian, dan pengemasan hasil peternakan'),
(818, 20, 14, 9, '1', 'KD4.1', 'K', 0, 'memilih jenis bahan dan teknik pengolahan bahan kayu dan bambu'),
(819, 20, 14, 9, '1', 'KD4.1', 'K', 0, 'merancang, membuat, dan menyajikan produk kerajinan dari bahan kayu, bambu, dan atau rotan '),
(820, 20, 14, 9, '1', 'KD4.2', 'K', 0, 'membuat desain konstruksi instalasi listrik rumah tangga'),
(821, 20, 14, 9, '1', 'KD4.2', 'K', 0, 'membuat instalasi listrik rumah tangga'),
(822, 20, 14, 9, '1', 'KD4.3', 'K', 0, 'menentukan komoditas ikan konsumsi yang dapat dikembangkan sesuai kebutuhan wilayah setempat'),
(823, 20, 14, 9, '1', 'KD4.3', 'K', 0, 'menyiapkan sarana dan peralatan untuk budidaya ikan konsumsi'),
(824, 20, 14, 9, '1', 'KD4.3', 'K', 0, 'mempraktikkan budidaya (pembesaran) ikan konsumsi'),
(825, 20, 14, 9, '1', 'KD4.4', 'K', 0, 'mengolah bahan pangan hasil peternakan dan perikanan yang ada di wilayah setem'),
(826, 1, 16, 8, '1', '4.3', 'P', 0, 'Menghafal'),
(827, 1, 16, 8, '1', '4.4', 'P', 0, 'Menulis'),
(828, 1, 16, 8, '1', '4.5', 'P', 0, 'Membaca'),
(829, 1, 16, 8, '1', '4.6', 'P', 0, 'Menerjemahkan'),
(830, 1, 16, 8, '1', '4.3', 'K', 0, 'Menghafal'),
(831, 1, 16, 8, '1', '4.4', 'K', 0, 'Membaca'),
(832, 1, 16, 8, '1', '4.5', 'K', 0, 'Menulis'),
(833, 1, 16, 8, '1', '4.6', 'K', 0, 'Menerjemah'),
(837, 1, 15, 9, '1', '4.3', 'P', 0, 'Menghargai dan menghayati ajaran agama yang dianut'),
(838, 1, 15, 9, '1', '4.4', 'P', 0, 'Menghargai dan menghayati perilaku jujur, disiplin, tanggungjawab, peduli dan santun dalam lingkunga'),
(839, 1, 15, 9, '1', '4.5', 'P', 0, 'Memahami pengetahuan (faktual, konseptual dan prosedural) berdasar rasa ingin tau tentang iptek seni'),
(840, 1, 15, 9, '1', '4.6', 'P', 0, 'Mencoba, mengolah dan menyajikan dalam ranah konkret'),
(841, 3, 12, 9, '1', 'K01', 'P', 0, 'Memahami konsep dan prosedur karya seni lukis dengan beragammedia dan teknik'),
(842, 3, 12, 9, '1', 'KD 2', 'P', 0, 'Memahami konsep dan prosedur karya seni patung dengan beragam media dan teknik'),
(843, 3, 12, 9, '1', 'KD 3', 'P', 0, 'Memahami cara mengubah musik modern secara unisono atau perorangan'),
(844, 3, 12, 9, '1', 'KD 4 ', 'P', 0, 'Memahami teknik bernyanyi modern'),
(845, 3, 12, 9, '1', 'KD 1', 'K', 0, 'Membuat karya seni lukis dengan berbagai media teknik'),
(846, 3, 12, 9, '1', 'KD 2', 'K', 0, 'Membuat karya seni patung dengan beragam media dan teknik'),
(847, 3, 12, 9, '1', 'KD 3', 'K', 0, 'Menggubahmusik modern secara unisono'),
(848, 3, 12, 9, '1', 'KD 4 ', 'K', 0, 'Menyanyikan musik modern secara perorangan atau kelompok'),
(849, 15, 10, 9, '1', '3:2', 'P', 0, 'Menelaah perubahan masyarakat Indonesia di zaman kemerdekaan sampai awal reformasi dalam segala aspe'),
(850, 15, 10, 9, '1', '31', 'P', 0, 'Menerapkan aspek keruangan dan konektifitas antar ruangan waktu dalam mewujudkan kesatuan wilayah Nu'),
(853, 8, 9, 9, '1', '3.5', 'P', 0, 'Menerapkan konsep rangkaian listrik, energi dan daya listrik, sumber energi listrik serta menghemat '),
(854, 20, 14, 9, '1', 'KD3.4', 'P', 0, 'menganalisis prinsip perancangan, pembuatan, penyajian, dan pengemasan bahan pangan hasil peternakan'),
(855, 20, 14, 9, '1', 'KD4.4', 'K', 0, 'membuat bahan pangan setengah jadi dari bahan pangan hasil peternakan  dan perikanan  yang ada di wi'),
(856, 15, 10, 9, '1', '4.1', 'K', 0, 'menyajikan hasil pengolahan telaah tentang hasil-hasil kebudayaandanfikiran masyarakat indonesia pad'),
(857, 15, 10, 9, '1', '4.2', 'K', 0, 'merumuskan alternatif tindakan nyata dalam mengatasi,masalah yangkelembagaan sosial,budaya ,ekonomi '),
(858, 20, 14, 8, '1', 'KD3.4', 'P', 0, 'menganalisis rancangan pembuatan, penyajian, dan pengemasan bahan pangan serealia, kacang-kacangan, '),
(859, 15, 5, 7, '1', '4.1', 'K', 0, 'menyajikan hasil analisisnproses perumusan dan penetapan Pancasila sebagai Dasar negara'),
(860, 15, 5, 7, '1', '4.2', 'K', 0, 'mengupayakan perilaku sesuai norma-norma yang berlaku dalam kehidupan bermasyarakat untuk mewujudkan'),
(861, 15, 5, 7, '1', '4.3', 'K', 0, 'menjelaskan proses kesejarahan perumusan dan pengesyaha UUD Negara RI tahun 1945'),
(862, 9, 8, 8, '1', '3.4', 'P', 0, 'Menjelaskan Gradien, Persamaan, dan grafik garis lurus'),
(863, 20, 14, 8, '1', 'KD4.4', 'K', 0, 'mengolah, menyaji dan mengemas bahan pangan serealia, kacang- kacangan dan umbi yang ada di wilayah '),
(864, 9, 8, 8, '1', '3.5', 'P', 0, 'Menjelaskan SPLDV dan penyelesaianya dengan masalah kontektual'),
(865, 9, 8, 8, '1', '4.5', 'K', 0, 'Menyelesaikan masalah yang berkaitan dg SPLDV'),
(867, 7, 7, 9, '1', '(KD1)', 'K', 0, 'Mendemontrasikan ungkapan sederhana tentang topik ro\'sussanatilhijriyatiljadidah, alhaflu bimaulidir'),
(868, 7, 7, 9, '1', '(KD2)', 'K', 0, 'Menunjukkan ungkapan sederhana tentang topik ro\'sussanatilhijriyatiljadidah,alhaflu bimaulidirrosul,'),
(869, 7, 7, 9, '1', '(KD3)', 'K', 0, 'Menyampaikan info lisan tentang topik rosussanatilhijriyatiljadidah, alhaflu bimaulidirrosul, nuzulu'),
(870, 7, 7, 9, '1', '(KD4)', 'K', 0, 'Mengungkapkan info scr tertulis sederhana tentang topik rosussanatilhijriyatiljadidah, alhaflu bimau'),
(871, 7, 7, 9, '1', '(KD5)', 'K', 0, 'Menyusun teks sederhana tentang topik rosussanatilhijriyatildadidah, alhaflu bimaulidirrosul, nuzulu'),
(872, 15, 15, 8, '1', '4.3', 'K', 0, 'menyusun tanggapan siaran berita berbahasa jawa'),
(873, 12, 11, 9, '1', '3.1', 'P', 0, 'Teks lisan dan tulis tentang tindakan menyatakan harapan,doa dan ucapan selamat.'),
(874, 12, 11, 9, '1', '3.2', 'P', 0, 'teks lisan dan tulis tentang memberi dan meminta informasi serta persetujuan dan ketidaksetujuan.'),
(875, 12, 11, 9, '1', '3.3', 'P', 0, 'Teks lisan dan tulis tentang label makanan/minuman dan obat.'),
(876, 12, 11, 9, '1', '3.4', 'P', 0, 'Teks lisan dan tulis prosedur membuat makanan/minuman dan manual.'),
(877, 12, 11, 9, '1', '3.5', 'P', 0, 'Teks lisan dan tulis tentang present continuous tense, past contunuous tense dan future tense.'),
(878, 12, 11, 9, '1', '3.6', 'P', 0, 'Teks lisan dan tulis tentang present perfect tense.'),
(879, 12, 11, 9, '1', '4.1', 'K', 0, 'Menyusun teks lisan dan tulis tentang tindakan menyatakan harapan, doa dan ucapan selamat.'),
(880, 12, 11, 9, '1', '4.2', 'K', 0, 'Menyusun teks lisan dan tulis tentang meminta dan memberi informasi serta persetujuan dan ketidakset'),
(881, 12, 11, 9, '1', '4.3', 'K', 0, 'Menangkap makna teks label makanan/minuman dan obat.'),
(882, 12, 11, 9, '1', '4.4', 'K', 0, 'Menangkap makna teks prosedur resep makanan/minuman dan manual.'),
(883, 12, 11, 9, '1', '4.5', 'K', 0, 'Menyusun teks lisan dan tulis tentang present continuous tense, past continuous tense dan future ten'),
(884, 12, 11, 9, '1', '4.6', 'K', 0, 'Menyusun teks lisan dan tulis tentang present perfect tense.'),
(885, 7, 7, 8, '1', '(KD4)', 'K', 0, 'Mengungkapkan info scr tertulis tentang topik assa\'ah,yaumiyatuna filmadrosah dan yaumiyatuna fil ba'),
(886, 7, 7, 8, '1', '(KD5)', 'K', 0, 'Menyusun teks sederhana tentang assa\'ah,yaumiyatuna fil madrosah dan yaumiyatuna fil baiti'),
(888, 7, 7, 9, '1', '(KD1)', 'P', 0, 'Mengidentifikasi bunyi, kata,frasa dan kal b Arab yang terkait dengan ro\'susanatilhijriyatiljadidah,'),
(889, 11, 8, 9, '1', 'kd3', 'P', 0, 'memahami konsep kesebangunan dan kekongruenan geometri melalui pengamatan'),
(890, 11, 8, 9, '1', 'kd4', 'P', 0, 'menentukan luas selimut dan volume tabung, kerucut dan bola'),
(891, 7, 7, 9, '1', '(KD2)', 'P', 0, 'Melafalkan bunyi,kata,frasa dan kal b Arab tentang ro\'sussanatilhijriyatiljadidah,alhaflu bimaulidir'),
(892, 11, 8, 9, '1', 'kd5', 'P', 0, 'menentukan rata-rata, median dan modus dari berbagai jenis data'),
(893, 7, 7, 9, '1', '(KD3)', 'P', 0, 'Menemukan makna kata,frasa dan kal b Arab tentang ro\'sussanatilhijriyatiljadidah, alhaflu bimaulidir'),
(894, 11, 8, 9, '1', 'kd1', 'K', 0, 'menggunakan konsep perbandingan untuk menyelesaikan masalah nyata mencakup perbandingan bertingkat d'),
(895, 11, 8, 9, '1', 'kd2', 'K', 0, 'mengenal pola bilangan, barisan, deret dan semacam dan menggunakan untuk menyelesaikan masalan nyata'),
(896, 11, 8, 9, '1', 'kd3', 'K', 0, 'menyelesaikan masalah nyata hasil pengamatan yang terkait penerapan kesebangunan dan kekongruenan'),
(897, 11, 8, 9, '1', 'kd04', 'K', 0, 'mengumpulkan, mengolah, menginterprestasi dan menampilkan data hasil pengamatan dalanm bentuk tabel '),
(898, 2, 6, 9, '1', '3.1.2', 'P', 0, 'Mengidentifikasi , menelaah struktur dan kebahasaan teks lanoran'),
(899, 2, 6, 9, '1', '3.3.4', 'P', 0, 'Mengidentifikasi , menelaah struktur dan ciri-'),
(900, 2, 6, 9, '1', '3.5.6', 'P', 0, 'Mengidentifikasi,menelaah struktur dan unsur-unsur pembangun cerpen'),
(901, 2, 6, 9, '1', '3.7.8', 'P', 0, 'Mengidentifikasi,menelaah struktur dan kebahasaan teks tanggapan.'),
(902, 2, 6, 9, '1', '3.9.1', 'P', 0, 'Mengidentifikasi,menelaah pendapat dan argumen dlm teks diskusi'),
(903, 2, 6, 9, '1', '4.1.2', 'K', 0, 'Menyimpulkan,menyajikan tujuan,bahan,alat langkah dan hasil laporan.'),
(904, 11, 8, 8, '1', 'kd5', 'P', 0, 'menjelaskan SPLDV dan menyelesaikannya dengan masalah kontektual'),
(905, 2, 6, 9, '1', '4.3.4', 'K', 0, 'Menyimpulkan,menuangkan gagasan,pikiran arahan dan pesan pidato'),
(906, 2, 6, 9, '1', '4.5.6', 'K', 0, 'Menyimpulkan,mengungkapkan pengalaman ,gagasan dan unsur-unsur pembangun cerpen.'),
(908, 2, 6, 9, '1', '4.7.8', 'K', 0, 'Menyimpulkan,mengungkapkan kritik,tanggapan,sanggahan dan pujian.'),
(909, 2, 6, 9, '1', '4.9.1', 'K', 0, 'Menyimpulkan,menyajikan gagasan/pendapat dan argumen dalam teks diskusi'),
(910, 7, 16, 7, '1', '(KD1)', 'P', 0, 'Menghapal dengan baik QS Annas sampai dengan Al Qodar.'),
(911, 7, 16, 7, '1', '(KD1)', 'K', 0, 'Melafalkan dengan fasih QS Annaas  sampai dengan Al Qodar'),
(912, 7, 16, 7, '1', '(KD2)', 'K', 0, 'Menulis ayat-ayat Al Quran, QS Annaas sampai dengan Al Qodar.'),
(913, 2, 6, 8, '1', '3.1.2', 'P', 0, 'Mengidentifikasi dan menelaah struktur dan unsur-unsur berita'),
(914, 2, 6, 8, '1', '3.3.4', 'P', 0, 'Mengidentifikasi informasi dan menelaah pola penyajian dan unsur kebahasaan iklan, slogan dan poster'),
(915, 2, 6, 8, '1', '3.5.6', 'P', 0, 'Mengidentifikasi Informasi, menelaah stuktur dan kebahasaan teks eskposisi.'),
(916, 2, 6, 8, '1', '3.7.8', 'P', 0, 'Mengidentifikasi dan menelaah unsur-unsur pembangun teks puisi.'),
(917, 2, 6, 8, '1', '3.9.1', 'P', 0, 'Mengidentifikasi dan menelaah teks ekplanasi'),
(918, 2, 6, 8, '1', '4.1.2', 'K', 0, 'Menyimpulkan dan menyajikan data dan informasi dalam bentuk teks berita.'),
(919, 2, 6, 8, '1', '4.3.4', 'K', 0, 'Menyimpulkan dan menyajikan gagasan, pesan, dan ajakan dalam bentuk iklan, slogan dan poster'),
(920, 2, 6, 8, '1', '4.5.6', 'K', 0, 'Menyimpulkan isi, menyajikan gagasan dan pendapat daam bentuk teks ekposisi'),
(921, 2, 6, 8, '1', '4.7.8', 'K', 0, 'Menyimpulkan , menyajikan gagasan, perasaan, dana pendapat dalam bentuk puisi.'),
(922, 2, 6, 8, '1', '4.9.1', 'K', 0, 'Meringkas, menyajikan informasi dalam bentuk teks ekplanasi'),
(928, 6, 1, 9, '1', '3.1', 'P', 0, 'Memahami ketentuan hukum madsilah, madbadal, madtamkin, madfarqi dalam Q.S. Al Qoriah (101), Q.S. Al'),
(929, 6, 1, 9, '1', '3.2', 'P', 0, 'Memahami isi kandungan Q.S. Al Qoriah (101), Q.S. Al Zazalah (99) tentang fenomena alam dalam kehidu'),
(930, 6, 1, 9, '1', '4.1', 'K', 0, 'menerapkan hukum madsilah, madbadal, madtamkin, dan madfarqi dalam Q.S. Al Qoriah (101), Q.S. Al Zaz'),
(931, 6, 1, 9, '1', '3.3', 'P', 0, 'Memahami keterkaitan isi kandungan H.R. Tirmidzi, Ibnu Majah, Ahmad, Al Bazzar tentang perilaku menj'),
(932, 6, 1, 9, '1', '4.2', 'K', 0, 'Mensimulasikan isi kandungan Q.S. Al Qoriah (101), Q.S. Al Zazalah (99) tentang fenomena alam dalam '),
(933, 6, 1, 9, '1', '4.3', 'K', 0, 'Mendemonstrasikan sikap tentang upaya pelestarian alam sesuai H.R. Tirmidzi, H.R Ibnu majah, Ahmad, '),
(934, 6, 1, 7, '1', '3.1', 'P', 0, 'Memahami kedudukan Al Qur\'an dan Hadist sebagai pedoman hidup umat manusia'),
(935, 6, 1, 7, '1', '3.2', 'P', 0, 'Memahami isi kandungan Q.S. Al Fatikah (1), Annas (114), Al Falaq (113) Al Ikhlas (112) tentang ke E'),
(936, 6, 1, 7, '1', '3.3', 'P', 0, 'Memahami keterkaitan isi kandungan Hadist tentang iman riwayat Ali bin Abi Tholib dari Ibnu Majah'),
(937, 6, 1, 7, '1', '4.1', 'K', 0, 'Membaca Q.S. Al Fatikhah, Annas, Al Falaq, Al Ikhlas dengan fasih dan tartil'),
(938, 6, 1, 7, '1', '4.2', 'K', 0, 'Menghafal Q.S. Al Fatikhah, Annas, Al Falaq, Al Ikhlas secara fasih dan tartil'),
(939, 6, 1, 7, '1', '4.3', 'K', 0, 'Menulis hadist tentang iman yang diterima Allah dan menulis hadist tentang ibadah yang diterima Alla'),
(940, 6, 3, 9, '1', '3.1', 'P', 0, 'Memahami ketentuan menyembelih binatang'),
(941, 6, 3, 9, '1', '3.2', 'P', 0, 'Memahami ketentuan Qurban dan Aqikoh'),
(942, 6, 3, 9, '1', '3.3', 'P', 0, 'Memahami ketentuan jual beli dan qirod'),
(943, 6, 3, 9, '1', '3.4', 'P', 0, 'Menganalisis larangan riba'),
(944, 6, 3, 9, '1', '4.1', 'K', 0, 'Mendemonstrasikan tata cara menyembelih binatang'),
(945, 6, 3, 9, '1', '4.2', 'K', 0, 'Menyajikan contoh tata cara pelaksanaan qurban dan aqikah'),
(946, 6, 3, 9, '1', '4.3', 'K', 0, 'Mempraktikan pelaksanaan jual beli dan qirod'),
(947, 6, 3, 9, '1', '4.4', 'K', 0, 'Mensimulasikan tata cara menghindari riba'),
(949, 1, 15, 9, '1', '4.3', 'K', 0, 'Menghargai dan menghayati ajaran agama yang dianut'),
(950, 1, 15, 9, '1', '4.4', 'K', 0, 'Menghargai dan menghayati perilaku jujur, disiplin, tanggungjawab, peduli dan santun dalam lingkunga'),
(951, 1, 15, 9, '1', '4.5', 'K', 0, 'Memahami pengetahuan (faktual, konseptual dan prosedural) berdasar rasa ingin tau tentang iptek seni'),
(952, 1, 15, 9, '1', '4.6', 'K', 0, 'Mencoba, mengolah dan menyajikan dalam ranah konkret'),
(953, 14, 5, 9, '2', '3.4', 'P', 0, 'Menganalisis prinsip persatuan dalam keberagaman suku, agama, ras, dan antargolongan (SARA), sosial,'),
(954, 14, 5, 9, '2', '3.5', 'P', 0, 'Menganalisis prinsip harmoni dalam keberagaman suku, agama, ras, dan antargolongan (SARA) sosial, bu'),
(955, 14, 5, 9, '2', '3.6', 'P', 0, 'Mengkreasikan konsep cinta tanah air/bela negara dalam konteks Negara Kesatuan Republik Indonesia'),
(956, 14, 5, 9, '2', '4.4', 'K', 0, 'Mendemonstrasikan hasil analisis prinsip persatuan dalam keberagaman suku, agama, ras, dan antargolo'),
(957, 14, 5, 9, '2', '4.5', 'K', 0, 'Menyampaikan hasil analisis prinsip harmoni dalam keberagaman suku, agama, ras, dan antargolongan (S'),
(958, 14, 5, 9, '2', '4.6', 'K', 0, 'Mengorganisasikan kegiatan lingkungan yang mencerminkan konsep cinta tanah air dalam konteks kehidup'),
(959, 15, 10, 9, '2', '3.3', 'P', 0, 'Menganalisis ketergantungan\r\nantarruang dilihat dari konsep\r\nekonomi (produksi, distribusi,\r\nkonsums'),
(960, 15, 10, 9, '2', '3.4', 'P', 0, 'Menganalisis kronologi, perubahan\r\ndan kesinambungan ruang (geografis,\r\npolitik, ekonomi, pendidikan'),
(961, 15, 10, 9, '2', '4.3', 'K', 0, 'Menyajikan hasil analisis tentang ketergantungan antarruang dilihat dari konsep ekonomi (produksi, d'),
(962, 15, 10, 9, '2', '4.4', 'K', 0, 'Menyajikan hasil analisis kronologi, perubahan dan kesinambungan ruang (geografis, politik, ekonomi,'),
(963, 13, 13, 9, '2', 'KD 01', 'P', 0, 'Memahami konsep permainan bola besar'),
(964, 13, 13, 9, '2', 'KD 02', 'P', 0, 'Memahami konsep permainan bola kecil'),
(965, 13, 13, 9, '2', 'KD 06', 'P', 0, 'Memahami konsep aktivitas ritmik'),
(966, 13, 13, 9, '2', 'KD 07', 'P', 0, 'Memahami konsep latihan kebugaran jasmani'),
(967, 13, 13, 9, '2', 'KD 01', 'K', 0, 'Mempraktikkan permainan bola besar'),
(968, 13, 13, 9, '2', 'KD 02', 'K', 0, 'Mempraktikkan permainan bola kecil'),
(969, 13, 13, 9, '2', 'KD 06', 'K', 0, 'Mempraktikkan aktivitas ritmik'),
(970, 13, 13, 9, '2', 'KD 07', 'K', 0, 'Mempraktikkan latihan kebugaran jasmani'),
(971, 5, 10, 7, '2', '3.3', 'P', 0, 'Memahami konsep interaksi antara \r\nmanusia dengan ruang sehingga \r\nmenghasilkan berbagai kegiatan \r\n'),
(972, 5, 10, 7, '2', '3.4', 'P', 0, '3.4 Memahami kronologi perubahan, dan \r\nkesinambungan dalam kehidupan \r\nbangsa Indonesia pada aspek '),
(973, 5, 10, 7, '2', '4.3', 'K', 0, 'Menjelaskan hasil analisis tentang  konsep interaksi antara manusia  dengan ruang sehingga menghasil'),
(974, 5, 10, 7, '2', '4.4', 'K', 0, 'Menguraikan kronologi perubahan,  dan kesinambungan dalam  kehidupan bangsa Indonesia pada  aspek po'),
(975, 8, 9, 9, '2', '3.6', 'P', 0, 'Menerapkan konsep kemagnetan, induksi elektromagnetik dan pemanfaatan medan magnet termasuk pergerak'),
(976, 8, 9, 9, '2', '3.7', 'P', 0, 'Menerapkan konsep bioteknologi dan perannya dalam kehidupan manusia'),
(977, 8, 9, 9, '2', '3.8', 'P', 0, 'Menghubungkan konsep partikel materi ( atom,ion,molekul ) struktur zat sederhana dengan sifat bahan'),
(978, 8, 9, 9, '2', '3.9', 'P', 0, 'Menghubungkan sifat fisika dan kimia tanah, organisme dalam tanah dan pentingnya tanah dalam kehidup'),
(979, 8, 9, 9, '2', '3.10', 'P', 0, 'Memahami proses dan produk teknologi ramah lingkungan untuk keberlanjutan kehidupan'),
(980, 8, 9, 9, '2', '4.6', 'K', 0, 'Membuat karya sederhana yang memanfaatkan prinsip elektromagnet'),
(981, 8, 9, 9, '2', '4.7', 'K', 0, 'Membuat salah satu produk bioteknologi konvensional yang ada di lingkungan sekitar'),
(982, 8, 9, 9, '2', '4.8', 'K', 0, 'Menyajikan hasil penyelidikan tentang sifat dan pemanfaatan bahan'),
(983, 8, 9, 9, '2', '4.9', 'K', 0, 'Menyajikan hasil penyelidikan tentang sifat - sifat tanah'),
(984, 8, 9, 9, '2', '4.10', 'K', 0, 'Menyajikan karya tentang proses dan produk teknologi sederhana yang ramah lingkungan'),
(985, 5, 5, 8, '2', '3.4', 'P', 0, 'Menganalisa makna dan arti\r\nKebangkitan nasional 1908 dalam\r\nperjuangan kemerdekaan Republik\r\nIndons'),
(986, 5, 5, 8, '2', '3.5', 'P', 0, 'Memproyeksikan nilai dan semangat\r\nSumpah Pemuda tahun 1928 dalam\r\nbingkai Bhinneka Tunggal Ika'),
(987, 5, 5, 8, '2', '3.6', 'P', 0, 'Menginterpretasikan semangat dan\r\nkomitmen kebangsaan kolektif\r\nuntuk memperkuat Negara Kesatuan\r\nRe'),
(988, 5, 5, 8, '2', '4.4', 'K', 0, 'Menyaji hasil penalaran tentang tokoh kebangkitan nasional dalam perjuangan kemerdekaan Republik Ind'),
(989, 5, 5, 8, '2', '4.5', 'K', 0, 'Mengaitkan hasil proyeksi nilai-nilai dan semangat Sumpah Pemuda Tahun 1928 dalam bingkai Bhineka Tu'),
(990, 5, 5, 8, '2', '4.6', 'K', 0, 'Mengorganisasikan kegiatan lingkungan yang mencerminkan semangat dan komitmen kebangsaan untuk mempe'),
(993, 16, 2, 9, '2', '01', 'P', 0, 'Menunjukkan bukti/dalil kebenaran akan adanya Qadha dan Qadar dan ciri-ciri perilaku orang yang beri'),
(994, 16, 2, 9, '2', '02', 'P', 0, 'Memahami pentingnya akhlak terpuji dalam pergaulan remaja dan dampak negatif pergaulan remaja yang t'),
(995, 16, 2, 9, '2', '03', 'P', 0, 'memahami adab terhadap lingkungan yaitu kepada binatang, tumbuhan, ditempat umum dan dijalan'),
(996, 16, 2, 9, '2', '04', 'P', 0, 'Menganalisis kisah keteladanan sahabat Usman bin Affan dan Ali bin Abi Thalib'),
(997, 16, 2, 9, '2', '01', 'K', 0, 'Menyajikan kisah-kisah dari berbagai sumber dalam fenomena kehidupan tentang Qadha dan Qadar'),
(998, 16, 2, 9, '2', '02', 'K', 0, 'Menyajikan data dari berbagai sumber tentang dampak negatif pergaulan remaja yang salah dalam fenome'),
(999, 16, 2, 9, '2', '03', 'K', 0, 'Mensimulasikan adab terhadap lingkungan, yaitu kepada binatang, tumbuhan, tempat umum dan jalan'),
(1000, 16, 2, 9, '2', '04', 'K', 0, 'Menceritakan kisah keteladanan Usman bin Affan dan Ali bin Abi Thalib'),
(1001, 16, 4, 9, '2', '01', 'P', 0, 'Memahami bentuk tradisi, adat dan seni budaya lokal sebagai bagian dari tradisi islam (Jawa, Sunda, '),
(1002, 16, 4, 9, '2', '02', 'P', 0, 'Menerapkan seni budaya lokal sebagai bagian dari tradisi Islam ( Jawa, Sunda, Melayu, Bugis, Minang '),
(1003, 16, 4, 9, '2', '03', 'P', 0, 'Menerapkan seni budaya lokal sebagai bagian dari tradisi Islam (Jawa, Sunda, Melayu, Bugis, Minang d'),
(1004, 16, 4, 9, '2', '04', 'P', 0, 'Menerapkan seni budaya lokal sebagai bagian dari tradisi Islam (Jawa, Sunda, melayu, Bugis, Minang d'),
(1005, 16, 4, 9, '2', '05', 'P', 0, 'Menerapkan seni budaya lokal sebagai bagian dari tradisi Islam (jawa, Sunda, Melayu, Bugis, Minang d'),
(1006, 16, 4, 9, '2', '06', 'P', 0, 'Menerapkan Seni budaya lokal sebagai bagian dari tradisi Islam (Jawa, Sunda, Melayu, Bugis, Minang d'),
(1007, 16, 4, 9, '2', '01', 'K', 0, 'Menunjukkan contoh tradisi, adat dan seni budaya lokal di Jawa, Sunda, Melayu, Bugis, Minang dan Mad'),
(1008, 16, 4, 9, '2', '02', 'K', 0, 'Menyajikan bentuk tradisi, adat dan seni budaya lokal di Jawa, Sunda, Melayu, Bugis, Minang dan Madu'),
(1009, 16, 4, 9, '2', '03', 'K', 0, 'Menyajikan bentuk tradisi, adat dan seni budaya lokal di Jawa, Sunda, Melayu, Bugis, Minang dan Madu'),
(1010, 16, 4, 9, '2', '04', 'K', 0, 'Menyajikan bentuk tradisi, adat dan seni budaya lokal di Jawa, Sunda, Melayu, Bugis, Minang dan Madu'),
(1011, 16, 4, 9, '2', '05', 'K', 0, 'Menyajikan bentuk tradisi, adat dan seni budaya lokal di Jawa, Sunda, Melayu, Bugis, Minang dan Madu'),
(1012, 16, 4, 9, '2', '06', 'K', 0, 'Menyajikan bentuk tradisi, adat dan seni budaya lokal di Jawa, Sunda, Melayu, Bugis, Minang dan Madu'),
(1013, 0, 14, 9, '2', '1.3.3', 'P', 0, 'memahami pengetahuan tentang\r\njenis, sifat, karakter, dan teknik\r\npengolahan bahan logam, batu, dan\r'),
(1014, 20, 14, 9, '2', '3.3.1', 'P', 0, 'memahami pengetahuan tentang\r\njenis, sifat, karakter, dan teknik\r\npengolahan bahan logam, batu, dan\r'),
(1015, 20, 14, 9, '2', '3.4.1', 'P', 0, 'menganalisis prinsip perancangan,\r\npembuatan, dan penyajian produk\r\nkerajinan dari bahan logam, batu'),
(1016, 20, 14, 9, '2', '3.3.2', 'P', 0, 'menganalisis dasar-dasar sistem\r\nelektronika analog, elektronika\r\ndigital, dan sistem pengendali'),
(1017, 20, 14, 9, '2', '3.4.2', 'P', 0, 'menganalisis penerapan sistem\r\npengendali elektronik'),
(1018, 20, 14, 9, '2', '3.4.3', 'P', 0, 'memahami komoditas ikan hias\r\nyang dapat dikembangkan sesuai\r\nkebutuhan wilayah setempat'),
(1019, 20, 14, 9, '2', '3.5.3', 'P', 0, 'memahami sarana dan peralatan\r\nuntuk budidaya ikan hias'),
(1020, 20, 14, 9, '2', '3.6.3', 'P', 0, 'memahami tahapan budidaya\r\n(pembesaran) ikan hias'),
(1021, 20, 14, 9, '2', '3.3.4', 'P', 0, 'menganalisis prinsip perancangan,\r\npembuatan, penyajian, dan\r\npengemasan bahan pangan setengah\r\njadi'),
(1022, 20, 14, 9, '2', '3.4.4', 'P', 0, 'menganalisis rancangan pembuatan,\r\npenyajian, dan pengemasan bahan\r\nhasil samping dari pengolahan ha'),
(1023, 20, 14, 9, '2', '4.3.1', 'K', 0, 'memilih jenis bahan dan teknik pengolahan bahan logam, batu, dan atau plastik,'),
(1024, 20, 14, 9, '2', '4.4.1', 'K', 0, 'merancang, membuat, dan menyajikan produk kerajinan dari bahan logam, batu, dan atau plastik,'),
(1025, 20, 14, 9, '2', '4.3.2', 'K', 0, 'memanipulasi sistem pengendali'),
(1026, 20, 14, 9, '2', '4.4.2', 'K', 0, 'membuat alat pengendali elektronik'),
(1027, 20, 14, 9, '2', '4.4.3', 'K', 0, 'menentukan komoditas ikan hias,'),
(1028, 20, 14, 9, '2', '4.5.3', 'K', 0, 'mengembangkan sarana dan peralatan untuk budidaya ikan hias'),
(1029, 20, 14, 9, '2', '4.6.3', 'K', 0, 'mempraktikkan budidaya (pembesaran) ikan hias'),
(1030, 20, 14, 9, '2', '4.3.4', 'K', 0, 'membuat bahan pangan setengah jadi dari hasil peternakan dan perikanan '),
(1031, 20, 14, 9, '2', '4.4.4', 'K', 0, 'mengolah bahan hasil samping dari pengolahan hasil peternakan dan perikanan'),
(1032, 7, 7, 9, '2', 'KD 1', 'P', 0, 'Mengidentifikasi bunyi kata,frasa dan kalimat  bahasa Arab yang berkaitan dengan tema Jamaluthobii\'a'),
(1033, 14, 10, 8, '2', '4.4', 'K', 0, 'analisis kronologi, perubahan dan kesinambungan ruang dari masa penjajahan sampai tumbuhnya semangat'),
(1034, 2, 6, 9, '2', '3.9', 'P', 0, 'mengidentifikasi informasi teksdiskusi berupa pemdapat pro kontra dari permasalahan aktual yg dibaca'),
(1035, 2, 6, 9, '2', '3.10', 'P', 0, 'Menelaah pendapat dan argumen\r\nyang mendukung dan yang kontra\r\ndalam teks diskusi berkaitan\r\ndengan '),
(1036, 2, 6, 9, '2', '3.11', 'P', 0, 'Mengidentifikasi isi ungkapan\r\nsimpati, kepedulian, empati, atau\r\nperasaan pribadi dari teks cerita\r'),
(1037, 2, 6, 9, '2', '3.12', 'P', 0, 'Menelaah struktur, kebahasaan,\r\ndan isi teks cerita inspiratif'),
(1038, 2, 6, 9, '2', '3.13', 'P', 0, 'Menggali informasi unsur-unsur\r\nbuku fiksi dan nonfiksi'),
(1039, 2, 6, 9, '2', '3.14', 'P', 0, 'Menelaah hubungan antara unsur-\r\nunsur buku fiksi/nonfiksi yang\r\n\r\ndibaca'),
(1040, 2, 6, 9, '2', '3.15', 'P', 0, 'Menemukan unsur-unsur dari\r\nbuku fiksi dan nonfiksi yang dibaca'),
(1041, 2, 6, 9, '2', '3.16', 'P', 0, 'Menelaah hubungan unsur-unsur\r\ndalam buku fiksi dan nonfiksi'),
(1042, 2, 6, 9, '2', '4.9', 'K', 0, 'Menyimpulkan isi gagasan, pendapat, argumen yang mendukung dan yang kontra serta solusi atas permasa'),
(1043, 2, 6, 9, '2', '4.10', 'K', 0, 'Menyajikan gagasan/pendapat, argumen yang mendukung dan yang kontra serta solusi atas permasalahan a'),
(1044, 2, 6, 9, '2', '4.11', 'K', 0, 'Menyimpulkan isi ungkapan simpati, kepedulian, empati atau perasaan pribadi dalam bentuk cerita insp'),
(1045, 2, 6, 9, '2', '4.12', 'K', 0, 'Mengungkapkan rasa simpati, empati, kepedulian, dan perasaan dalam bentuk cerita inspiratif dengan m'),
(1046, 2, 6, 9, '2', '4.13', 'K', 0, 'Membuat peta konsep/garis alur dari buku fiksi dan nonfiksi yang dibaca'),
(1047, 2, 6, 9, '2', '4.14', 'K', 0, 'Menyajikan tanggapan terhadap buku fiksi dan nonfiksi yang dibaca'),
(1048, 2, 6, 9, '2', '4.15', 'K', 0, 'Membuat peta pikiran/ rangkuman alur tentang isi buku nonfiksi/ buku fiksi yang dibaca'),
(1049, 2, 6, 9, '2', '4.16', 'K', 0, 'Menyajikan tanggapan terhadap isi buku fiksi nonfiksi yang dibaca'),
(1050, 7, 7, 9, '2', 'KD 2', 'P', 0, 'Melafalkan bunyi huruf,kata,frasa dan kalimat bahasa Arab yang berkaitan dengan tema Jamaluthobi\'ah,'),
(1051, 1, 16, 8, '2', '4.1', 'K', 0, 'Menulis'),
(1052, 1, 16, 8, '2', '4.2', 'K', 0, 'menghafal'),
(1053, 1, 16, 8, '2', '4.3', 'K', 0, 'Membaca'),
(1054, 1, 16, 8, '2', '4.4', 'K', 0, 'Menterjemahkan'),
(1055, 12, 11, 9, '2', '3.7', 'P', 0, 'Membandingkan teks lisan dan tulis tentang naratif'),
(1056, 12, 11, 9, '2', '3.8', 'P', 0, 'Teks lisan dan tulis meminta dan memberi informasi dengan menggunakan unsur kebahasaan passive voice'),
(1057, 7, 7, 9, '2', 'KD 3', 'P', 0, 'Menemukan makna atau gagasan dari ujaran kata, frasa dan kal b Arab yang berkaitan dengan Jamaluthob'),
(1058, 1, 16, 8, '2', '4.1', 'P', 0, 'Menulis'),
(1059, 1, 16, 8, '2', '4.2', 'P', 0, 'Membaca'),
(1060, 1, 16, 8, '2', '4.3', 'P', 0, 'Menerjemahkan'),
(1061, 1, 16, 8, '2', '4.4', 'P', 0, 'Menghapal'),
(1062, 12, 11, 9, '2', '3.9', 'P', 0, 'teks information report lisan dan tulis tentang memberi dan meminta informasi terkait mata pelajaran'),
(1063, 12, 11, 9, '2', '3.10', 'P', 0, 'Teks lisan dan tulis tentang iklan produk barang dan jasa'),
(1064, 12, 11, 9, '2', '3.11', 'P', 0, 'Teks lisan dan tulis lirik lagu remaja'),
(1065, 12, 11, 9, '2', '4.7', 'K', 0, 'Menangkap makna teks lisan dan tulis tentang teks naratif'),
(1066, 12, 11, 9, '2', '4.8', 'K', 0, 'Menyusun teks lisan dan tulis meminta dan memberi informasi dengan menggunakan unsur kebahasaan pass'),
(1067, 7, 7, 9, '2', 'KD 1', 'K', 0, 'Mendemontrasikan ungkapan tentang Jamaluthobi\'ah,Kholiqul \'alam dan Hafidzu\'alalbi\'ah '),
(1068, 12, 11, 9, '2', '4.9.1', 'K', 0, 'menangkap makna teks information report lisan dan tulis terkait topik dalam mata pelajaran lain di k'),
(1069, 12, 11, 9, '2', '4.9.2', 'K', 0, 'Menyusun teks lisan dan tulis report terkait topik dalam mata pelajaran lain di kelas IX'),
(1070, 12, 11, 9, '2', '4.10', 'K', 0, 'Menangkap makna teks lisan dan tulis teks iklan produk barang dan jasa'),
(1071, 12, 11, 9, '2', '4.11', 'K', 0, 'Menangkap makna teks lisan dan tulis lagu remaja'),
(1072, 7, 7, 9, '2', 'KD 2', 'K', 0, 'Menunjukkan contoh ungkapan tentang Jamaluthobi\'ah,Kholiqul\'alam dan Hafidzu\'alalbi\'ah.'),
(1073, 7, 7, 9, '2', 'KD3', 'K', 0, 'Menyampaikan info lisan tentang Jamaluthibi\'ah,Kholiqul \'alam dan Hafidzu\'alalbii\'ah.'),
(1074, 7, 7, 9, '2', 'KD4', 'K', 0, 'Mengungkapkan informasi tentang Jamaluthobi\'ah, Kholiqul \'alam dan hafidzu \'alalbii\'ah.'),
(1075, 7, 7, 9, '2', 'kd 5', 'K', 0, 'Menyusun teks sederhana tentang Jamaluthobi\'ah,Kholiqul \'alam dan Hafidzu\'alalbi\'ah.'),
(1076, 15, 15, 8, '2', '3.5', 'P', 0, 'Memahami puisi jawa (geguritan}'),
(1077, 15, 15, 8, '2', '3.6', 'P', 0, 'Memahami tembang Macapat Pangkur'),
(1078, 15, 15, 8, '2', '3.7', 'P', 0, 'Memahami teks khusus yang berupa kalimat sederhana berakasara jawa'),
(1079, 15, 15, 8, '2', '4.5', 'K', 0, 'Membaca geguritan'),
(1080, 15, 15, 8, '2', '4.6', 'K', 0, 'Melagukan tembang Macapat Pangkur'),
(1081, 15, 15, 8, '2', '4.7', 'K', 0, 'Membaca,menulis kalimat beraksara,Jawa'),
(1082, 19, 6, 8, '2', '(3.10', 'P', 0, 'Menelaah teks eksplanasi berupa paparan kejadian alam'),
(1083, 19, 6, 8, '2', '(3.11', 'P', 0, 'Mengidentifikasi informasi pada teks ulasan tentang kualitas karya'),
(1084, 19, 6, 8, '2', '(3.12', 'P', 0, 'Menelaah struktur dan kebahasaan teks ulasan'),
(1085, 19, 6, 8, '2', '(3.13', 'P', 0, 'Mengidentifikasi jenis saran, ajakan,arahan, dan pertimbangan tentang berbagai hal positif'),
(1086, 19, 6, 8, '2', '(3.14', 'P', 0, 'Menelaah struktur dan kebahasaan teks persuasi'),
(1087, 19, 6, 8, '2', '(3.15', 'P', 0, 'Mengidentifikasi unsur-unsur drama'),
(1088, 19, 6, 8, '2', '(3.16', 'P', 0, 'Menelaah karakteristik unsur dan kaidah kebahasaan'),
(1089, 19, 6, 8, '2', '(3.17', 'P', 0, 'Menggali dan menemukan informasi dari buku fiksi dan non fiksi'),
(1090, 19, 6, 8, '2', '(3.18', 'P', 0, 'Menelaah unsur buku fiksi dan non fiksi'),
(1091, 7, 16, 7, '2', 'KD1', 'P', 0, 'Hafal Al Qur\'an dari surat Al \'Alaq sampai Asy Syams'),
(1092, 7, 16, 7, '2', 'kd1', 'K', 0, 'Mampu membaca dengan makhroj dan tajwid yang baik dari QS Al \'Alaq sampai Asy Syams.'),
(1093, 10, 9, 8, '2', '3.12', 'P', 0, 'memahami cahaya dan alat optik.'),
(1094, 19, 6, 8, '2', '4.1', 'K', 0, 'Menyajikan informasi dan data dalam bentuk teks eksplanasi proses terjadinya fenomena alam'),
(1095, 19, 6, 8, '2', '4.11', 'K', 0, 'Menceritakan kembali isi teks ulasan tentang kualitas karya'),
(1096, 19, 6, 8, '2', '4.12', 'K', 0, 'Menyajikan tanggapan tentang kualitas karya');
INSERT INTO `t_mapel_kd` (`id`, `id_guru`, `id_mapel`, `tingkat`, `semester`, `no_kd`, `jenis`, `bobot`, `nama_kd`) VALUES
(1097, 19, 6, 8, '2', '4.13', 'K', 0, 'Menyimpulkan isi saran, ajakan, arahan, pertimbangan tentang hal positif'),
(1098, 19, 6, 8, '2', '4.14', 'K', 0, 'Menyajikan teks persuasi'),
(1099, 19, 6, 8, '2', '4.15', 'K', 0, 'Menginterpretasi drama'),
(1100, 10, 9, 8, '2', '4.12', 'K', 0, 'menyajikan hasil percobaan tentang pembentukan bayangan pada cermin dan lensa.'),
(1101, 19, 6, 8, '2', '4.16', 'K', 0, 'Menyajikan drama dalam bentuk pentas atau naskah'),
(1102, 19, 6, 8, '2', '4.17', 'K', 0, 'Membuat peta konsep atau garis alur dari buku fiksi dan non fiksi'),
(1103, 19, 6, 8, '2', '4.18', 'K', 0, 'Menyajikan tanggapan terhadap buku fiksi dan non fiksi'),
(1104, 1, 15, 9, '2', '4.1', 'P', 0, 'Menghargai dan menghayati ajaran agama yang dianutnya.'),
(1105, 1, 15, 9, '2', '4.2', 'P', 0, 'Menghargai dan menghayati perilaku jujur, disiplin, tanggung jawab, peduli . . . .'),
(1106, 1, 15, 9, '2', '4.3', 'P', 0, 'Memahami dan menerapkan pengetahuan (faktual, konseptual, dan prosedural)'),
(1107, 1, 15, 9, '2', '4.4', 'P', 0, 'Mencoba, mengolah, dan menyaji dalam ranah konkret.'),
(1108, 1, 15, 9, '2', '4.1', 'K', 0, 'Menghargai dan menghayati ajaran agama yang dianutnya.'),
(1109, 1, 15, 9, '2', '4.2', 'K', 0, 'Menghargai dan menghayati perilaku jujur, disiplin, tanggung jawab, peduli . . . .'),
(1110, 1, 15, 9, '2', '4.3', 'K', 0, 'Memahami dan menerapkan pengetahuan (faktual, konseptual, dan prosedural)'),
(1111, 1, 15, 9, '2', '4.4', 'K', 0, 'Mencoba, mengolah, dan menyaji dalam ranah konkret.'),
(1112, 15, 5, 7, '2', '3.4', 'P', 0, 'Mengidentifikasi keberagama suku,Agama,ras dan antar golongan dalam bingkai Byinneka Tunggal Ika'),
(1113, 15, 5, 7, '2', '3.5', 'P', 0, 'Menganalisis bentuk-bentuk kerjasama dealam berbagai bidang kehidupan dalam masyarakat'),
(1114, 15, 5, 7, '2', '3.6', 'P', 0, 'Mengasasosiasikan karakteristik daerah dalam kerangka negara kesatuan Republik Indonesia'),
(1115, 15, 5, 7, '2', '4.4', 'K', 0, 'Mendemontrasikan hasil identifikasi hasil identifikasi suku,Agama,ras dan antar golongan dalam bingk'),
(1116, 15, 5, 7, '2', '4.5 ', 'K', 0, 'Menunjukan bentuk-bentuk kerjasama diberbagai bidang  kehidupan masyarkat'),
(1117, 15, 5, 7, '2', '4.6', 'K', 0, 'Melaksnakan penelitian sederhana untuk mengilustrasika karakteristik daerah tempat tinggalnya sebaga'),
(1118, 3, 12, 9, '2', 'Kd.1 ', 'P', 0, 'Mensintesis secarakonseptual dan operasional tentang seni lukis'),
(1119, 3, 12, 9, '2', 'KD.2', 'P', 0, 'Mensintesis secara konseptual dan operasional tentang seni patung'),
(1120, 3, 12, 9, '2', 'Kd.3', 'P', 0, 'Mensintesis secara konseptual dan operasional tentang seni grafis'),
(1121, 3, 12, 9, '2', 'Kd. 4', 'P', 0, 'Menganalisis prosedur mengubah lagu'),
(1122, 3, 12, 9, '2', 'Kd.1', 'K', 0, 'Membuat Karya Seni Grafis dengan Berbagai Media dan Teknik '),
(1123, 3, 12, 9, '2', 'KD.2', 'K', 0, 'Merancang penyelenggaraan pameran '),
(1124, 3, 12, 9, '2', 'Kd.3', 'K', 0, 'Menyanyikan musik modern sederhana secara perorangan maupun kelompok'),
(1125, 3, 12, 9, '2', 'Kd. 4', 'K', 0, 'Menyanyikan musik ansambel modern '),
(1126, 6, 1, 9, '2', '4,1', 'K', 0, 'Hukum Md Lazm mukhafaf Kalimi,Musqal Kalimi Musaqal Hrfi'),
(1127, 6, 1, 9, '2', '4,2', 'K', 0, 'Memahami isi kandungn HR Bukhari tentng menghargai waktu dan menuntut Ilmu'),
(1128, 6, 1, 9, '2', '4,3', 'K', 0, 'Memanfaatkan waktu dan Menuntut lmu Q.S.al-\'Asr (03),q.s al-\'Alaq (96)'),
(1129, 20, 6, 7, '2', 'KD1', 'P', 0, 'Mengidentifikasi informasi dan menyimpulkan isi puisi rakyat'),
(1130, 20, 6, 7, '2', 'KD2', 'P', 0, 'Mengidentifikasi informasi dan menceritakan kembali fabel'),
(1131, 20, 6, 7, '2', 'KD3', 'P', 0, 'Menceritakan informasi dan menyimpulkan isi surat pribadi'),
(1132, 20, 6, 7, '2', 'KD4', 'P', 0, 'Menemukan unsur-unsur dan membuat rangkuman isi buku fiksi atau non fiksi'),
(1133, 20, 6, 7, '2', 'KD1', 'K', 0, 'Menelaah struktur dan mengungkapkan gagasan pesan puisi rakyat'),
(1134, 20, 6, 7, '2', 'KD2', 'K', 0, 'Menelaah struktur dan kebahasaan fabel'),
(1135, 20, 6, 7, '2', 'KD3', 'K', 0, 'Memerankan isi fabel'),
(1136, 20, 6, 7, '2', 'KD4', 'K', 0, 'menelaah unsur, kebahasaan dan menulis surat pribadi atau dinas'),
(1137, 20, 6, 7, '2', 'KD5', 'K', 0, 'Menelaah hubungan unsur dan menyajikan tanggapan isi buku fiksi atau nonfiksi'),
(1138, 6, 3, 9, '2', '4.1', 'K', 0, 'Mendemontrasikan pelaksanaan pnjam meminjam'),
(1139, 6, 3, 9, '2', '4.2', 'K', 0, 'Mendemontrasikan tata cara pelaksaan utang piutang'),
(1140, 6, 3, 9, '2', '4.3 ', 'K', 0, 'Mensimulasikan tata cara gadai'),
(1141, 6, 3, 9, '2', '4.4', 'K', 0, 'Mensimulasikan tata cara pelaksanaan pemberian upah'),
(1142, 6, 1, 9, '2', '3.1', 'P', 0, 'Hukum Mad Lazim mukhafaf Kalimi,Musaqal Kalmi,Mad Lazim \r\n Musaqal Harfi dan Mad Lazi Mukhafaf Harfi'),
(1143, 6, 1, 9, '2', '3.2', 'P', 0, 'Memahami isi kandungan Q.S.al-Ashr (103) dan Q.S. al-Alaq (96) tentang menghargai waktu dan menuntut'),
(1144, 6, 1, 9, '2', '3.3.1', 'P', 0, 'Memahami isi kandungan H.R Bukhori dari Abdullah bin Umar tentan menghargai waktu dan HR Ibnu majah '),
(1145, 0, 8, 9, '2', '3.3', 'P', 0, 'menganalisis sifat-sifat fungsi kuadrat ditinjau dari koefisien dan determinannya'),
(1146, 0, 8, 9, '2', '3.5', 'P', 0, 'Menentukan orientasi dan lokasi benda dalam koordinat Cartesius'),
(1147, 0, 8, 9, '2', '3.9', 'P', 0, 'Menentukan peluang suatu kejadian sederhana  secara empirik dan teoritik'),
(1148, 0, 8, 9, '2', '3.13', 'P', 0, 'Memahami konsep ruang sampel suatu percobaan serta memilih strategi dan aturan-aturan yang sesuai un'),
(1149, 11, 8, 9, '2', '3.3', 'P', 0, 'menganalisis sifat-sifat fungsi kuadrat ditinjau dari koefisien dan determinannya'),
(1150, 11, 8, 9, '2', '3.5', 'P', 0, 'Menentukan orientasi dan lokasi benda dalam koordinat Cartesius'),
(1151, 11, 8, 9, '2', '3.9', 'P', 0, 'Menentukan peluang suatu kejadian sederhana  secara empirik dan teoritik'),
(1152, 11, 8, 9, '2', '3.13', 'P', 0, 'Memahami konsep ruang sampel suatu percobaan serta memilih strategi dan aturan-aturan yang sesuai un'),
(1153, 11, 8, 9, '2', '4.1', 'K', 0, 'Menyelesaikan permasalahan yang berkaitan persamaan linear dua variabel, SPLDV, dan fungsi kuadrat'),
(1154, 11, 8, 9, '2', '4.7', 'K', 0, 'Menerapkan prinsip-prinsip peluang untuk menyelesaikan masalah nyata'),
(1155, 11, 8, 9, '2', '4.8', 'K', 0, 'Membuat dan menyelesaikan model matematika dari berbagai permasalahan nyata'),
(1156, 6, 1, 7, '2', '3.1', 'P', 0, 'Memahami isi kandungan al-kafirun (109),Q.H al-Bayyinah(98) tentang toleransi'),
(1157, 6, 1, 7, '2', '3.2', 'P', 0, 'Memahami isi kandungan Q.S. al-Lahab (111),Q.S.an-Nashr(110) tentang problemayika dakwah'),
(1158, 6, 1, 7, '2', '4.1', 'K', 0, 'Menulis hadis tentang sikap tasamuh'),
(1159, 6, 1, 7, '2', '4.2', 'K', 0, 'Menerapkan hukum bacaan Qalqah Q.S. al-Bayyinah(98) al-Kafirun (1090'),
(1160, 6, 3, 9, '2', '3.1', 'P', 0, 'Memahami ketentuan pinjam meminjam'),
(1161, 6, 3, 9, '2', '3.2', 'P', 0, 'Memahami ketentuan utang piutang'),
(1162, 6, 3, 9, '2', '3.3.', 'P', 0, 'Memahami ketentuan pengurusan jenazah (Memandikan,Mengkafani,menyalati,menguburkan)'),
(1163, 6, 3, 9, '2', '3.4.', 'P', 0, 'Memahami ketentuan Waris'),
(1164, 1, 8, 7, '1', 'KD 1', 'P', 0, 'Mengetahui angka dan bilangan'),
(1165, 1, 8, 7, '1', 'KD 2', 'P', 0, 'Mengetahui deret geometri'),
(1166, 1, 8, 7, '1', 'KD 1', 'K', 0, 'Terampil'),
(1167, 1, 8, 7, '1', 'KD 2', 'K', 0, 'Pinter'),
(1168, 5, 10, 9, '1', '3.1', 'P', 0, 'Melakukan senam'),
(1169, 5, 10, 9, '1', '3.2', 'P', 0, 'Senam lagi'),
(1170, 1, 1, 9, '1', '12', 'P', 0, 'Das'),
(1171, 1, 6, 7, '1', '1.1', 'P', 0, 'Membaca Insentif'),
(1172, 1, 6, 7, '1', '1.2', 'P', 0, 'Membaca Cepat'),
(1173, 1, 6, 7, '1', '1.1', 'K', 0, 'Membaca');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_materi`
--

CREATE TABLE `t_materi` (
  `id` int(3) NOT NULL,
  `id_guru` int(3) NOT NULL,
  `id_mapel` int(3) NOT NULL,
  `id_kelas` int(3) NOT NULL,
  `judul` varchar(100) CHARACTER SET utf8 NOT NULL,
  `konten` text CHARACTER SET utf8 NOT NULL,
  `nmfile` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_naikkelas`
--

CREATE TABLE `t_naikkelas` (
  `id` int(6) NOT NULL,
  `id_siswa` int(6) NOT NULL,
  `ta` char(5) NOT NULL,
  `naik` enum('Y','N') NOT NULL,
  `catatan_wali` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_naikkelas`
--

INSERT INTO `t_naikkelas` (`id`, `id_siswa`, `ta`, `naik`, `catatan_wali`) VALUES
(1, 338, '20181', 'Y', 'Luar biasa'),
(2, 339, '20181', 'Y', 'Bagus, tingkatkan lagi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_nilai`
--

CREATE TABLE `t_nilai` (
  `id` int(6) NOT NULL,
  `tasm` varchar(5) NOT NULL DEFAULT '0',
  `jenis` enum('h','t','a') NOT NULL,
  `id_guru_mapel` int(6) NOT NULL,
  `id_mapel_kd` int(6) UNSIGNED NOT NULL,
  `id_siswa` int(6) NOT NULL,
  `nilai` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_nilai`
--

INSERT INTO `t_nilai` (`id`, `tasm`, `jenis`, `id_guru_mapel`, `id_mapel_kd`, `id_siswa`, `nilai`) VALUES
(9, '20211', 'h', 56, 1171, 339, 100),
(10, '20211', 'h', 56, 1171, 340, 100),
(11, '20211', 't', 56, 6, 339, 70),
(12, '20211', 't', 56, 6, 340, 60),
(13, '20211', 'a', 56, 6, 339, 80),
(14, '20211', 'a', 56, 6, 340, 80),
(15, '20211', 'h', 56, 1172, 339, 90),
(16, '20211', 'h', 56, 1172, 340, 90);

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_nilai_absensi`
--

CREATE TABLE `t_nilai_absensi` (
  `id` int(6) NOT NULL,
  `tasm` varchar(5) NOT NULL,
  `id_siswa` int(6) NOT NULL,
  `s` int(3) NOT NULL,
  `i` int(3) NOT NULL,
  `a` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_nilai_absensi`
--

INSERT INTO `t_nilai_absensi` (`id`, `tasm`, `id_siswa`, `s`, `i`, `a`) VALUES
(1, '20181', 338, 1, 1, 0),
(2, '20181', 339, 1, 0, 0),
(3, '20211', 339, 1, 1, 1),
(4, '20211', 340, 1, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_nilai_ekstra`
--

CREATE TABLE `t_nilai_ekstra` (
  `id` int(6) NOT NULL,
  `tasm` varchar(5) DEFAULT NULL,
  `id_ekstra` int(3) DEFAULT NULL,
  `id_siswa` int(6) DEFAULT NULL,
  `nilai` char(2) DEFAULT NULL,
  `desk` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_nilai_ekstra`
--

INSERT INTO `t_nilai_ekstra` (`id`, `tasm`, `id_ekstra`, `id_siswa`, `nilai`, `desk`) VALUES
(1, '20181', 1, 338, 'B', 'Cukup memuaskan, aktif mengikuti kegiatan Pramuka'),
(2, '20181', 1, 339, 'A', 'Memuaskan, aktif megikuti kegiatan Pramuka minggua'),
(3, '20211', 1, 339, 'A', 'Memuaskan, aktif megikuti kegiatan Pramuka minggua'),
(4, '20211', 1, 340, 'A', 'Memuaskan, aktif megikuti kegiatan Pramuka minggua');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_nilai_ket`
--

CREATE TABLE `t_nilai_ket` (
  `id` int(6) NOT NULL,
  `tasm` varchar(5) NOT NULL,
  `id_guru_mapel` int(6) NOT NULL,
  `id_mapel_kd` int(6) NOT NULL,
  `id_siswa` int(6) NOT NULL,
  `nilai` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_nilai_ket`
--

INSERT INTO `t_nilai_ket` (`id`, `tasm`, `id_guru_mapel`, `id_mapel_kd`, `id_siswa`, `nilai`) VALUES
(5, '20211', 56, 1173, 339, 100),
(6, '20211', 56, 1173, 340, 90);

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_nilai_sikap_so`
--

CREATE TABLE `t_nilai_sikap_so` (
  `id` int(6) NOT NULL,
  `tasm` varchar(5) DEFAULT NULL,
  `id_guru_mapel` int(6) DEFAULT NULL,
  `id_siswa` int(6) DEFAULT NULL,
  `is_wali` enum('Y','N') DEFAULT NULL,
  `selalu` varchar(50) DEFAULT NULL,
  `mulai_meningkat` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_nilai_sikap_so`
--

INSERT INTO `t_nilai_sikap_so` (`id`, `tasm`, `id_guru_mapel`, `id_siswa`, `is_wali`, `selalu`, `mulai_meningkat`) VALUES
(1, '20181', 1, 338, 'Y', '2,3,4,5,6,7', '1'),
(2, '20181', 1, 339, 'Y', '2,4,5,6,7', '3'),
(3, '20211', 1, 339, 'Y', '1,2,3,4,5,6', '7'),
(4, '20211', 1, 340, 'Y', '1,2,3,4,5,6', '7');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_nilai_sikap_sp`
--

CREATE TABLE `t_nilai_sikap_sp` (
  `id` int(6) NOT NULL,
  `tasm` varchar(5) DEFAULT NULL,
  `id_guru_mapel` int(6) DEFAULT NULL,
  `id_siswa` int(6) DEFAULT NULL,
  `is_wali` enum('Y','N') DEFAULT NULL,
  `selalu` varchar(50) DEFAULT NULL,
  `mulai_meningkat` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_nilai_sikap_sp`
--

INSERT INTO `t_nilai_sikap_sp` (`id`, `tasm`, `id_guru_mapel`, `id_siswa`, `is_wali`, `selalu`, `mulai_meningkat`) VALUES
(3, '20211', 1, 339, 'Y', '17-9', '10'),
(4, '20211', 1, 340, 'Y', '11-13', '16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_pembayaran`
--

CREATE TABLE `t_pembayaran` (
  `id` int(6) NOT NULL,
  `id_siswa` int(3) NOT NULL,
  `id_kelas` int(3) NOT NULL,
  `id_bayar` int(3) NOT NULL,
  `jml_bayar` int(20) NOT NULL,
  `bukti_tf` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_pembayaran`
--

INSERT INTO `t_pembayaran` (`id`, `id_siswa`, `id_kelas`, `id_bayar`, `jml_bayar`, `bukti_tf`) VALUES
(7, 341, 1, 1, 100000, 'Invoice.pdf'),
(9, 338, 1, 4, 100000, 'mtk_terapan.docx'),
(11, 340, 1, 1, 100000, 'Invoice1.pdf');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_prestasi`
--

CREATE TABLE `t_prestasi` (
  `id` int(6) NOT NULL,
  `id_siswa` int(6) NOT NULL,
  `ta` char(5) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_status_pembayaran`
--

CREATE TABLE `t_status_pembayaran` (
  `id` int(3) NOT NULL,
  `id_siswa` int(6) NOT NULL,
  `id_kelas` int(3) NOT NULL,
  `id_bayar` int(3) NOT NULL,
  `jml_bayar` int(20) NOT NULL,
  `keterangan` text NOT NULL,
  `status_byr` enum('Lunas','Belum') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_status_pembayaran`
--

INSERT INTO `t_status_pembayaran` (`id`, `id_siswa`, `id_kelas`, `id_bayar`, `jml_bayar`, `keterangan`, `status_byr`) VALUES
(4, 340, 1, 1, 100000, '1 Bulan', 'Belum'),
(9, 338, 1, 1, 200000, '2 Bulan', 'Belum');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_tugas`
--

CREATE TABLE `t_tugas` (
  `id` int(3) NOT NULL,
  `id_guru` int(3) NOT NULL,
  `id_mapel` int(3) NOT NULL,
  `id_kelas` int(3) NOT NULL,
  `judul` varchar(30) NOT NULL,
  `tugas` text NOT NULL,
  `deadline` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_tugas`
--

INSERT INTO `t_tugas` (`id`, `id_guru`, `id_mapel`, `id_kelas`, `judul`, `tugas`, `deadline`) VALUES
(7, 1, 6, 1, 'Membuat Pantun', 'Buatlah Pantun Nasihat dan Pantun Persahabatan. Kerjakan di buku tulis, foto lalu upload tugasnya sebelum deadline', '2021-08-26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_walikelas`
--

CREATE TABLE `t_walikelas` (
  `id` int(3) NOT NULL,
  `tasm` varchar(5) DEFAULT NULL,
  `id_guru` int(2) DEFAULT NULL,
  `id_kelas` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_walikelas`
--

INSERT INTO `t_walikelas` (`id`, `tasm`, `id_guru`, `id_kelas`) VALUES
(3, '2021', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `m_admin`
--
ALTER TABLE `m_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `m_ekstra`
--
ALTER TABLE `m_ekstra`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `m_guru`
--
ALTER TABLE `m_guru`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `m_kelas`
--
ALTER TABLE `m_kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `m_kepsek`
--
ALTER TABLE `m_kepsek`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `m_keuangan`
--
ALTER TABLE `m_keuangan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `m_mapel`
--
ALTER TABLE `m_mapel`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `m_ortu_siswa`
--
ALTER TABLE `m_ortu_siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_m_ortu_siswa_m_siswa` (`id_siswa`);

--
-- Indeks untuk tabel `m_pembayaran`
--
ALTER TABLE `m_pembayaran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `m_siswa`
--
ALTER TABLE `m_siswa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indeks untuk tabel `tahun`
--
ALTER TABLE `tahun`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t_guru_mapel`
--
ALTER TABLE `t_guru_mapel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_guru` (`id_guru`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_mapel` (`id_mapel`);

--
-- Indeks untuk tabel `t_jadwal`
--
ALTER TABLE `t_jadwal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_t_jadwal_m_guru` (`id_guru`),
  ADD KEY `FK_t_jadwal_m_kelas` (`id_kelas`),
  ADD KEY `FK_t_jadwal_m_mapel` (`id_mapel`);

--
-- Indeks untuk tabel `t_kelas_siswa`
--
ALTER TABLE `t_kelas_siswa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_siswa` (`id_siswa`),
  ADD KEY `FK_t_kelas_siswa_m_kelas` (`id_kelas`);

--
-- Indeks untuk tabel `t_kkm`
--
ALTER TABLE `t_kkm`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t_kumpultugas`
--
ALTER TABLE `t_kumpultugas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_t_kumpultugas_m_siswa` (`id_siswa`),
  ADD KEY `FK_t_kumpultugas_t_tugas` (`id_tugas`);

--
-- Indeks untuk tabel `t_mapel_kd`
--
ALTER TABLE `t_mapel_kd`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_mapel` (`id_mapel`),
  ADD KEY `id_guru` (`id_guru`);

--
-- Indeks untuk tabel `t_materi`
--
ALTER TABLE `t_materi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t_naikkelas`
--
ALTER TABLE `t_naikkelas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t_nilai`
--
ALTER TABLE `t_nilai`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FK_t_nilai_m_siswa` (`id_siswa`),
  ADD KEY `FK_t_nilai_t_mapel_kd` (`id_mapel_kd`),
  ADD KEY `FK_t_nilai_t_guru_mapel` (`id_guru_mapel`);

--
-- Indeks untuk tabel `t_nilai_absensi`
--
ALTER TABLE `t_nilai_absensi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- Indeks untuk tabel `t_nilai_ekstra`
--
ALTER TABLE `t_nilai_ekstra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ekstra` (`id_ekstra`),
  ADD KEY `id_siswa` (`id_siswa`),
  ADD KEY `nilai_2` (`nilai`),
  ADD KEY `nilai_3` (`nilai`);

--
-- Indeks untuk tabel `t_nilai_ket`
--
ALTER TABLE `t_nilai_ket`
  ADD PRIMARY KEY (`tasm`,`id_guru_mapel`,`id_mapel_kd`,`id_siswa`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indeks untuk tabel `t_nilai_sikap_so`
--
ALTER TABLE `t_nilai_sikap_so`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_guru_mapel` (`id_guru_mapel`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- Indeks untuk tabel `t_nilai_sikap_sp`
--
ALTER TABLE `t_nilai_sikap_sp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_guru_mapel` (`id_guru_mapel`),
  ADD KEY `id_siswa` (`id_siswa`);

--
-- Indeks untuk tabel `t_pembayaran`
--
ALTER TABLE `t_pembayaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_valid_pembayaran_m_siswa` (`id_siswa`),
  ADD KEY `FK_valid_pembayaran_m_pembayaran` (`id_bayar`);

--
-- Indeks untuk tabel `t_prestasi`
--
ALTER TABLE `t_prestasi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `t_status_pembayaran`
--
ALTER TABLE `t_status_pembayaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_t_pembayaran_m_siswa` (`id_siswa`),
  ADD KEY `FK_t_pembayaran_m_pembayaran` (`id_bayar`);

--
-- Indeks untuk tabel `t_tugas`
--
ALTER TABLE `t_tugas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_t_tugas_m_guru` (`id_guru`),
  ADD KEY `FK_t_tugas_m_mapel` (`id_mapel`),
  ADD KEY `FK_t_tugas_m_kelas` (`id_kelas`);

--
-- Indeks untuk tabel `t_walikelas`
--
ALTER TABLE `t_walikelas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_guru` (`id_guru`),
  ADD KEY `id_kelas` (`id_kelas`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `m_admin`
--
ALTER TABLE `m_admin`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT untuk tabel `m_ekstra`
--
ALTER TABLE `m_ekstra`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `m_guru`
--
ALTER TABLE `m_guru`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `m_kelas`
--
ALTER TABLE `m_kelas`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `m_kepsek`
--
ALTER TABLE `m_kepsek`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `m_keuangan`
--
ALTER TABLE `m_keuangan`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `m_mapel`
--
ALTER TABLE `m_mapel`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `m_ortu_siswa`
--
ALTER TABLE `m_ortu_siswa`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `m_pembayaran`
--
ALTER TABLE `m_pembayaran`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `m_siswa`
--
ALTER TABLE `m_siswa`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=343;

--
-- AUTO_INCREMENT untuk tabel `tahun`
--
ALTER TABLE `tahun`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `t_guru_mapel`
--
ALTER TABLE `t_guru_mapel`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT untuk tabel `t_jadwal`
--
ALTER TABLE `t_jadwal`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `t_kelas_siswa`
--
ALTER TABLE `t_kelas_siswa`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `t_kkm`
--
ALTER TABLE `t_kkm`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `t_kumpultugas`
--
ALTER TABLE `t_kumpultugas`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `t_mapel_kd`
--
ALTER TABLE `t_mapel_kd`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1174;

--
-- AUTO_INCREMENT untuk tabel `t_materi`
--
ALTER TABLE `t_materi`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT untuk tabel `t_naikkelas`
--
ALTER TABLE `t_naikkelas`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `t_nilai`
--
ALTER TABLE `t_nilai`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `t_nilai_absensi`
--
ALTER TABLE `t_nilai_absensi`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `t_nilai_ekstra`
--
ALTER TABLE `t_nilai_ekstra`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `t_nilai_ket`
--
ALTER TABLE `t_nilai_ket`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `t_nilai_sikap_so`
--
ALTER TABLE `t_nilai_sikap_so`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `t_nilai_sikap_sp`
--
ALTER TABLE `t_nilai_sikap_sp`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `t_pembayaran`
--
ALTER TABLE `t_pembayaran`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `t_prestasi`
--
ALTER TABLE `t_prestasi`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `t_status_pembayaran`
--
ALTER TABLE `t_status_pembayaran`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `t_tugas`
--
ALTER TABLE `t_tugas`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `t_walikelas`
--
ALTER TABLE `t_walikelas`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `m_ortu_siswa`
--
ALTER TABLE `m_ortu_siswa`
  ADD CONSTRAINT `FK_m_ortu_siswa_m_siswa` FOREIGN KEY (`id_siswa`) REFERENCES `m_siswa` (`id`);

--
-- Ketidakleluasaan untuk tabel `t_guru_mapel`
--
ALTER TABLE `t_guru_mapel`
  ADD CONSTRAINT `FK_t_guru_mapel_m_guru` FOREIGN KEY (`id_guru`) REFERENCES `m_guru` (`id`),
  ADD CONSTRAINT `FK_t_guru_mapel_m_kelas` FOREIGN KEY (`id_kelas`) REFERENCES `m_kelas` (`id`),
  ADD CONSTRAINT `FK_t_guru_mapel_m_mapel` FOREIGN KEY (`id_mapel`) REFERENCES `m_mapel` (`id`);

--
-- Ketidakleluasaan untuk tabel `t_jadwal`
--
ALTER TABLE `t_jadwal`
  ADD CONSTRAINT `FK_t_jadwal_m_guru` FOREIGN KEY (`id_guru`) REFERENCES `m_guru` (`id`),
  ADD CONSTRAINT `FK_t_jadwal_m_kelas` FOREIGN KEY (`id_kelas`) REFERENCES `m_kelas` (`id`),
  ADD CONSTRAINT `FK_t_jadwal_m_mapel` FOREIGN KEY (`id_mapel`) REFERENCES `m_mapel` (`id`);

--
-- Ketidakleluasaan untuk tabel `t_kelas_siswa`
--
ALTER TABLE `t_kelas_siswa`
  ADD CONSTRAINT `FK_t_kelas_siswa_m_kelas` FOREIGN KEY (`id_kelas`) REFERENCES `m_kelas` (`id`),
  ADD CONSTRAINT `t_kelas_siswa_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `m_kelas` (`id`),
  ADD CONSTRAINT `t_kelas_siswa_ibfk_2` FOREIGN KEY (`id_siswa`) REFERENCES `m_siswa` (`id`);

--
-- Ketidakleluasaan untuk tabel `t_kumpultugas`
--
ALTER TABLE `t_kumpultugas`
  ADD CONSTRAINT `FK_t_kumpultugas_m_siswa` FOREIGN KEY (`id_siswa`) REFERENCES `m_siswa` (`id`),
  ADD CONSTRAINT `FK_t_kumpultugas_t_tugas` FOREIGN KEY (`id_tugas`) REFERENCES `t_tugas` (`id`);

--
-- Ketidakleluasaan untuk tabel `t_nilai`
--
ALTER TABLE `t_nilai`
  ADD CONSTRAINT `FK_t_nilai_m_siswa` FOREIGN KEY (`id_siswa`) REFERENCES `m_siswa` (`id`),
  ADD CONSTRAINT `FK_t_nilai_t_guru_mapel` FOREIGN KEY (`id_guru_mapel`) REFERENCES `t_guru_mapel` (`id`);

--
-- Ketidakleluasaan untuk tabel `t_nilai_absensi`
--
ALTER TABLE `t_nilai_absensi`
  ADD CONSTRAINT `FK_t_nilai_absensi_m_siswa` FOREIGN KEY (`id_siswa`) REFERENCES `m_siswa` (`id`);

--
-- Ketidakleluasaan untuk tabel `t_nilai_ekstra`
--
ALTER TABLE `t_nilai_ekstra`
  ADD CONSTRAINT `FK_t_nilai_ekstra_m_siswa` FOREIGN KEY (`id_siswa`) REFERENCES `m_siswa` (`id`),
  ADD CONSTRAINT `t_nilai_ekstra_ibfk_1` FOREIGN KEY (`id_ekstra`) REFERENCES `m_ekstra` (`id`);

--
-- Ketidakleluasaan untuk tabel `t_nilai_sikap_so`
--
ALTER TABLE `t_nilai_sikap_so`
  ADD CONSTRAINT `FK_t_nilai_sikap_so_m_guru` FOREIGN KEY (`id_guru_mapel`) REFERENCES `m_guru` (`id`),
  ADD CONSTRAINT `FK_t_nilai_sikap_so_m_siswa` FOREIGN KEY (`id_siswa`) REFERENCES `m_siswa` (`id`);

--
-- Ketidakleluasaan untuk tabel `t_nilai_sikap_sp`
--
ALTER TABLE `t_nilai_sikap_sp`
  ADD CONSTRAINT `FK_t_nilai_sikap_sp_m_siswa` FOREIGN KEY (`id_siswa`) REFERENCES `m_siswa` (`id`);

--
-- Ketidakleluasaan untuk tabel `t_pembayaran`
--
ALTER TABLE `t_pembayaran`
  ADD CONSTRAINT `FK_valid_pembayaran_m_pembayaran` FOREIGN KEY (`id_bayar`) REFERENCES `m_pembayaran` (`id`),
  ADD CONSTRAINT `FK_valid_pembayaran_m_siswa` FOREIGN KEY (`id_siswa`) REFERENCES `m_siswa` (`id`);

--
-- Ketidakleluasaan untuk tabel `t_status_pembayaran`
--
ALTER TABLE `t_status_pembayaran`
  ADD CONSTRAINT `FK_t_pembayaran_m_pembayaran` FOREIGN KEY (`id_bayar`) REFERENCES `m_pembayaran` (`id`),
  ADD CONSTRAINT `FK_t_pembayaran_m_siswa` FOREIGN KEY (`id_siswa`) REFERENCES `m_siswa` (`id`);

--
-- Ketidakleluasaan untuk tabel `t_tugas`
--
ALTER TABLE `t_tugas`
  ADD CONSTRAINT `FK_t_tugas_m_guru` FOREIGN KEY (`id_guru`) REFERENCES `m_guru` (`id`),
  ADD CONSTRAINT `FK_t_tugas_m_kelas` FOREIGN KEY (`id_kelas`) REFERENCES `m_kelas` (`id`),
  ADD CONSTRAINT `FK_t_tugas_m_mapel` FOREIGN KEY (`id_mapel`) REFERENCES `m_mapel` (`id`);

--
-- Ketidakleluasaan untuk tabel `t_walikelas`
--
ALTER TABLE `t_walikelas`
  ADD CONSTRAINT `FK_t_walikelas_m_guru` FOREIGN KEY (`id_guru`) REFERENCES `m_guru` (`id`),
  ADD CONSTRAINT `FK_t_walikelas_m_kelas` FOREIGN KEY (`id_kelas`) REFERENCES `m_kelas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
