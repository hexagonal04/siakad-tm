
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="header">
                <h4 class="title">Set Pembayaran</h4>
            </div>

                <div class="content">

                    <form method="post" id="<?php echo $nama_form; ?>" name="<?php echo $nama_form; ?>" action="<?php echo base_url().$url; ?>/simpan" enctype="multipart/form-data">

                    <div class="row">
                            <div class="col-md-4">
                                <label>Pilih Siswa</label>
                                <select name="siswa" id="siswa" class="form-control" required="true">
                                    <option value=""></option>
                                    <?php 
                                    if (!empty($r_siswa)) {
                                    foreach ($r_siswa as $m) {
                                    echo '<option value="'.$m['id'].'">'.$m['nama'].'</option>';
                                     }
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label>Pilih Kelas</label>
                                <select name="kelas" id="kelas" class="form-control" required="true">
                                    <option value=""></option>
                                    <?php 
                                    if (!empty($r_kelas)) {
                                    foreach ($r_kelas as $m) {
                                    echo '<option value="'.$m['id'].'">'.$m['nama'].'</option>';
                                     }
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                            <label>Jenis Pembayaran</label>
                            <select name="bayar" id="bayar" class="form-control" required="true">
                                <option value=""></option>
                                <?php 
                                    if (!empty($r_bayar)) {
                                    foreach ($r_bayar as $b) {
                                    echo '<option value="'.$b['id'].'">'.$b['nama'].'</option>';
                                    }
                                    }
                                ?>
                            </select>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-4">
                                <label>Jumlah Bayar</label>
                                <div>
                                    <input type="text" name="jml_byr" class="form-control" id="jml_byr" required>        
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <label for="keterangan">Keterangan</label>
                                 <div>
                                    <textarea name="keterangan" class="form-control" id="keterangan" rows="3" required></textarea>
                                </div>
                            </div> 
                        </div>  

                        <div class="row">
                            <div class="col-md-4">      
                                <label for="statusbyr">Status Bayar</label>
                                <div">
                                    <?php echo form_dropdown('statusbyr',$p_statusbyr,'','class="form-control" required id="statusbyr"'); ?>
                                </div>
                            </div>
                        </div>
                        <br>
                        <br>    
                        
                        <button type="submit" class="btn btn-primary">Simpan</button>
                        <a href="<?php echo base_url().$url; ?>" class="btn btn-default">Kembali</a>
                        <div class="clearfix"></div>
                        <br><br>
                        
                    </form>
                </div>
        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>

<script>

    $(document).ready(function() {
      // Format Select2 pada id nisn
      $("#id").select2({
        allowClear: true,
        theme: "bootstrap",
        placeholder: "Pilih ID",
      });

      show_id(); // Memanggil fungsi untuk menampilkan ID
    });

    // fungsi untuk menampilkan NIS
    function show_id() {
      $.ajax({
        url: "<?php echo base_url('set_pembayaran/get_id'); ?>",
        type: "GET",
        dataType: "JSON",
        success: function(x) {
          if (x.status == true) {
            $('#id').html('<option value=""></option>');
            $.each(x.data, function(k, v) {
              $('#id').append(`<option value="${v.id}">${v.id}</option>`);
            });
          }
        }
      });
    }

    // fungsi untuk menampilkan data siswa berdasarkan NISN
    function show_siswa(x) {
      $.ajax({
        url: "<?php echo base_url('set_pembayaran/get_siswa'); ?>",
        type: "GET",
        dataType: "JSON",
        data: {
          id: x
        },
        success: function(x) {
          if (x.status == true) {
            $('#nama').val(x.data.nama);
            $('#tmp_lahir').val(x.data.tmp_lahir);
            $('#tgl_lahir').val(x.data.tgl_lahir);
            $('#jk').val(x.data.jk);
            $('#alamat').val(x.data.alamat);
          }
        }
      });
    }
  </script>

  