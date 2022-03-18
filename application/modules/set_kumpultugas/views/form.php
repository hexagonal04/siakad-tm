<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="header">
                <h4 class="title">Upload Tugas</h4>

            </div>
            <div class="content">

              
                <form method="post" id="<?php echo $nama_form; ?>" name="<?php echo $nama_form; ?>" action="<?php echo base_url().$url; ?>/simpan" enctype="multipart/form-data">

                <div class="row">
                    <div class="col-md-4">
                        <label>Nama Siswa</label>
                        <select name="siswa" id="siswa" class="form-control" required="true">
                                <option value=""></option>
                                <?php 
                                    if (!empty($r_siswa)) {
                                    foreach ($r_siswa as $b) {
                                    echo '<option value="'.$b['id'].'">'.$b['nama'].'</option>';
                                    }
                                    }
                                ?>
                        </select>
                     </div>
                </div>


        <div class="form-group data-siswa">
        <label for="id">ID Tugas</label>
        <select name="id" id="id" class="form-control select2" onchange="show_tugas(this.value)">
        </select>       
        </div>

        <div class="row">
            <div class="col-md-4">
                <label for="guru">Nama Guru</label>
                <div>
                    <input type="text" id="guru" class="form-control" readonly>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
            <label for="mapel">Nama Mapel</label>
                <div>
                    <input type="text" id="mapel" class="form-control" readonly >
                    
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <label for="judul">Judul Tugas</label>
                <div>
                    <input type="text" id="judul" class="form-control" readonly>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <label for="konten">Isi Tugas</label>
                <div>
                    <textarea name="konten" class="form-control" id="konten" rows="3" readonly> </textarea>
                </div>
            </div>
        </div>
                            
        <div class="row">
            <div class="col-md-4">
                <label for="deadline">Deadline</label>
                <div>
                <input type="text" id="deadline" class="form-control" readonly>
                </div>
            </div> 
        </div>   
    
        <br><br>

                <div class="row">
                    <div class="col-md-4">
                        <label>Jawaban</label>
                        <div>
                            <textarea name="jawaban" class="form-control" id="jawaban" rows="9" required> </textarea>       
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="kode" class="control-label">Upload File Tugas</label>
                            <input type="file" name="file_tugas" class="form-control" id="file_tugas" required>
                        </div>
                    </div>
                </div>


                <br>
                <button type="submit" class="btn btn-primary">Simpan</button>
                <a href="<?php echo base_url().$url; ?>" class="btn btn-default">Kembali</a>
                <div class="clearfix"></div>
            
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
      // Format Select2 pada id tugas
     $("#id").select2({
        allowClear: true,
        theme: "bootstrap",
        placeholder: "Pilih ID Tugas",
      });

      show_id(); // Memanggil fungsi untuk menampilkan ID Tugas
    }); 

    // fungsi untuk menampilkan ID Tugas

    function show_id() {
      $.ajax({
        url: "<?php echo base_url('set_kumpultugas/get_id'); ?>",
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

    // fungsi untuk menampilkan data siswa berdasarkan ID Tugas
    function show_tugas(x) {
      $.ajax({
        url: "<?php echo base_url('set_kumpultugas/get_tugas'); ?>",
        type: "GET",
        dataType: "JSON",
        data: {
          id: x
        },
        success: function(x) {
          if (x.status == true) {
            $('#guru').val(x.data.id_guru);
            $('#mapel').val(x.data.id_mapel);
            $('#judul').val(x.data.judul);
            $('#konten').val(x.data.tugas);
            $('#deadline').val(x.data.deadline);
          }
        }
      });
    }
</script>