<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="header">
                <h4 class="title">Detail Tugas</h4>
            </div>

                <div class="content">
                
                <div class="row">
                    <div class="col-md-4">
                        <label>Nama Guru</label>
                        <div>
                            <input type="text" name="guru" class="form-control" id="guru" readonly>        
                        </div>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-4">
                        <label>Nama Mapel</label>
                        <div>
                            <input type="text" name="mapel" class="form-control" id="mapel" readonly>        
                        </div>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-4">
                        <label>Judul</label>
                        <div>
                            <input type="text" name="judul" class="form-control" id="judul" readonly>        
                        </div>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-4">
                        <label>Isi Tugas</label>
                        <div>
                        <textarea name="konten" class="form-control" id="konten" rows="9" readonly> </textarea>        
                        </div>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-4">
                        <label>Deadline</label>
                        <div>
                            <input type="text" name="deadline" class="form-control" id="deadline" readonly>        
                        </div>
                    </div>
                </div>
                <br> 
                <a href="<?php echo base_url().$url; ?>" class="btn btn-default">Kembali</a>
                
                </div>
        </div>
    </div>
</div>