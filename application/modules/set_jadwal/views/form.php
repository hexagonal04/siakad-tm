<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="header">
                <h4 class="title">Set Jadwal Siswa</h4>

            </div>
            <div class="content">

                <form method="post" id="<?php echo $nama_form; ?>" name="<?php echo $nama_form; ?>" action="<?php echo base_url().$url; ?>/simpan">

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
                        <label>Pilih Hari</label>
                        <div>
                            <?php echo form_dropdown('hari', $p_hari, '', 'class="form-control" id="hari" required'); ?>       
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <label>Jam Mulai</label>
                        <div>
                            <input type="time" name="jmulai" class="form-control" id="jmulai" required>        
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <label>Jam Berakhir</label>
                        <div>
                            <input type="time" name="jakhir" class="form-control" id="jakhir" required>        
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
