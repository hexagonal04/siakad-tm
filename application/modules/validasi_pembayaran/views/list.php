<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="header">
                <h4 class="title">Data Pembayaran</h4>
            </div>
            
            <div class="content">

                <?php echo $this->session->flashdata('k'); ?>
                
                <table class="table table-hover table-striped" id="datatabel" style="width: 100%">
                   
                
                    
                    <thead>
                        <td width="10%">No</td>
                        <td width="15%">Nama Siswa</td>
                        <td width="15%">Kelas</td>
                        <td width="15%">Jenis Pembayaran</td>
                        <td width="15%">Jumlah (Rp)</td>
                        <td width="15%">Bukti Transfer</td>
                        <td width="20%">Aksi</td>
                    </thead>

                </table>


            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    $(document).on("ready", function() {
        pagination("datatabel", base_url+"<?php echo $url; ?>/datatable", []);

        $("#<?php echo $nama_form; ?>").on("submit", function() {

            var data    = $(this).serialize();
    
            $.ajax({
                type: "POST",
                data: data,
                url: base_url+"<?php echo $url; ?>/simpan",
                success: function(r) {
                    if (r.status == "gagal") {
                        noti("danger", r.data);
                    } else {
                        $("#modal_data").modal('hide');
                        noti("success", r.data);
                        pagination("datatabel", base_url+"<?php echo $url; ?>/datatable", []);
                    }
                }
            });

            return false;
        });
    });
    
    function edit(id) {
        if (id == 0) {
            $("#_mode").val('add');
        } else {
            $("#_mode").val('edit');
        }

        $("#modal_data").modal('show');

        $.ajax({
            type: "GET",
            url: base_url+"<?php echo $url; ?>/edit/"+id,
            success: function(data) {
                $("#_id").val(data.data.id);
                $("#tingkat").val(data.data.tingkat);
                $("#nama").val(data.data.nama);
            }
        });
        return false;
    }
    function hapus(id) {
        if (id == 0) {
            noti("danger", "Silakan pilih datanya..!");
        } else {
            if (confirm('Anda yakin...?')) {
                $.ajax({
                    type: "GET",
                    url: base_url+"<?php echo $url; ?>/hapus/"+id,
                    success: function(data) {
                        noti("success", "Berhasil dihapus...!");
                        pagination("datatabel", base_url+"<?php echo $url; ?>/datatable", []);
                    }
                });                
            }
        }

        return false;
    }

</script>