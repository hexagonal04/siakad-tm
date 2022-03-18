<!doctype html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
  <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://select2.github.io/select2-bootstrap-theme/css/select2-bootstrap.css">

  <title>Form Otomatis</title>
  <style>
    .data-siswa {
      display: none;
    }
  </style>
</head>

<body>
  <div class="container">
    <div class="row mt-3">
      <div class="col-md-8">
        <form id="form-siswa">
          <div class="form-group">
            <label for="nisn">NISN</label>
            <select name="nisn" id="nisn" class="form-control select2" onchange="show_siswa(this.value)">
            </select>
          </div>
          <div class="form-group data-siswa">
            <label for="nama_siswa">Nama Siswa</label>
            <input type="text" id="nama_siswa" class="form-control" readonly>
          </div>
          <div class="form-group data-siswa">
            <label for="tempat_lahir">Tempat Lahir</label>
            <input type="text" id="tempat_lahir" class="form-control" readonly>
          </div>
          <div class="form-group data-siswa">
            <label for="tanggal_lahir">Tanggal Lahir</label>
            <input type="text" id="tanggal_lahir" class="form-control" readonly>
          </div>
          <div class="form-group data-siswa">
            <label for="jenis_kelamin">Jenis Kelamin</label>
            <input type="text" id="jenis_kelamin" class="form-control" readonly>
          </div>
          <div class="form-group data-siswa">
            <label for="alamat">Alamat</label>
            <input type="text" id="alamat" class="form-control" readonly>
          </div>
        </form>
      </div>
    </div>
  </div>

  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
  <script>
    $(document).ready(function() {
      // Format Select2 pada id nisn
      $("#nisn").select2({
        allowClear: true,
        theme: "bootstrap",
        placeholder: "Cari NISN",
      });

      show_nisn(); // Memanggil fungsi untuk menampilkan NISN
    });

    // fungsi untuk menampilkan NISN
    function show_nisn() {
      $.ajax({
        url: "<?php echo base_url('siswa/get_nisn'); ?>",
        type: "GET",
        dataType: "JSON",
        success: function(x) {
          if (x.status == true) {
            $('#nisn').html('<option value=""></option>');
            $.each(x.data, function(k, v) {
              $('#nisn').append(`<option value="${v.nisn}">${v.nisn}</option>`);
            });
          }
        }
      });
    }

    // fungsi untuk menampilkan data siswa berdasarkan NISN
    function show_siswa(x) {
      $.ajax({
        url: "<?php echo base_url('siswa/get_siswa'); ?>",
        type: "GET",
        dataType: "JSON",
        data: {
          nisn: x
        },
        success: function(x) {
          if (x.status == true) {
            $('.data-siswa').show()
            $('#nama_siswa').val(x.data.nama_siswa);
            $('#tempat_lahir').val(x.data.tempat_lahir);
            $('#tanggal_lahir').val(x.data.tanggal_lahir);
            $('#jenis_kelamin').val(x.data.jenis_kelamin);
            $('#alamat').val(x.data.alamat);
          }
        }
      });
    }
  </script>
</body>

</html>