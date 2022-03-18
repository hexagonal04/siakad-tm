<!DOCTYPE html>
<html>
<head>
	<title>Cetak Raport</title>
	<style type="text/css">
		body {font-family: arial; font-size: 12pt}
		.table {border-collapse: collapse; border: solid 1px #999; width:100%}
		.table tr td, .table tr th {border:  solid 1px #999; padding: 3px; font-size: 12px}
		.rgt {text-align: right;}
		.ctr {text-align: center;}
		table tr td {vertical-align: top}
	</style>
</head>
<body>
	<center>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<b>LAPORAN</b><br><br>
		HASIL PENCAPAIAN KOMPETENSI PESERTA DIDIK<br>
		<?php echo strtoupper($this->config->item('nama_sekolah')); ?>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<table style="margin-left:10%; width: 70%">
			<tr>
				<td width="20%">Nama Sekolah</td>
				<td width="2%">:</td>
				<td width="50%"><?php echo strtoupper($this->config->item('nama_sekolah')); ?></td>
			</tr>
			<tr>
				<td>NPSN</td>
				<td>:</td>
				<td>20613624</td>
			</tr>
			<tr>
				<td>Alamat</td>
				<td>:</td>
				<td>Jl.Raya Pamulang II NO.3, Kode Pos : 15416, <br>Telepon :(021) 7463-5180 </td>
			</tr>
			<tr>
				<td>Kelurahan</td>
				<td>:</td>
				<td>Benda Baru</td>
			</tr>
			<tr>
				<td>Kecamatan</td>
				<td>:</td>
				<td>Pamulang</td>
			</tr>
			<tr>
				<td>Kabupaten/Kota</td>
				<td>:</td>
				<td>Tangerang Selatan</td>
			</tr>
			<tr>
				<td>Propinsi</td>
				<td>:</td>
				<td>Banten</td>
			</tr>
			<tr>
				<td>Website</td>
				<td>:</td>
				<td>https://www.sekolahtarunamandiri.sch.id/</td>
			</tr>
			<tr>
				<td>Email</td>
				<td>:</td>
				<td>info@sekolahtarunamandiri.sch.id</td>
			</tr>
		</table>



	</center>
	
</body>
</html>