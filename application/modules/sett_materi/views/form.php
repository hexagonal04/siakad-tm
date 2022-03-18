<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="header">
                <h4 class="title">Tambah Materi</h4>

            </div>
            <div class="content">

                <form method="post" id="<?php echo $nama_form; ?>" name="<?php echo $nama_form; ?>" action="<?php echo base_url().$url; ?>/simpan" enctype="multipart/form-data">

                <div class="row">
                    <div class="col-md-4">
                        <label>Pilih Guru</label>
                        <select name="guru" id="guru" class="form-control" required="true">
                            <option value=""></option>
                            <?php 
                            if (!empty($r_guru)) {
                                foreach ($r_guru as $g) {
                                    echo '<option value="'.$g['id'].'">'.$g['nama'].'</option>';
                                }
                            }
                            ?>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <label>Pilih Mapel</label>
                        <select name="mapel" id="mapel" class="form-control" required="true">
                            <option value=""></option>
                            <?php 
                            if (!empty($r_mapel)) {
                                foreach ($r_mapel as $m) {
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
                        <label>Judul</label>
                        <div>
                            <input type="text" name="judul" class="form-control" id="judul" required>        
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <label>Konten</label>
                        <div>
                            <textarea name="konten" class="form-control" id="konten" rows="9" required> </textarea>       
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label for="kode" class="control-label">Upload File</label>
                            <input type="file" name="materi" class="form-control" id="materi">
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


<script type="text/javascript">   

    $(document).on("ready", function() {
        $('#data_semua').pairMaster();

        $('#tambah').click(function(){
            $('#data_semua').addSelected('#data_pilih');
        });

        $('#kurang').click(function(){
            $('#data_pilih').removeSelected('#data_semua'); 
        });
    });

</script>