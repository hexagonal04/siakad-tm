<div class="page-wrapper">
    <div class="col-md-12">
        <div class="card">
            <div class="header">
                <h4 class="title">Login</h4>
            </div>
            <div class="content">
                <div class="alert alert-info">
                    <b>Selamat datang di Aplikasi SIMS Taruna Mandiri</b>
                    <br>Silakan login dengan username dan password yang telah diberikan oleh Admin Sekolah. Jika belum mendapatkan, silakan hubungi Admin Sekolah.
                </div>
                <form id="<?php echo $nama_form; ?>" method="post">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="form-group">
                                <label>Username</label>
                                <input type="text" name="username" id="username" required class="form-control" autofocus="true">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-5">
                            <div class="form-group">
                                <label>Password</label>
                                <input type="password" name="password" id="password" required class="form-control">
                            </div>
                        </div>
                    </div>
                    <button type="submit" id="tbLogin" class="btn btn-info btn-fill pull-left"><i class="fa fa-check-circle"></i> Login</button>
                    <div class="clearfix"></div>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
//console.log("haloooooooooo");

 $("#f_login").submit(function() {
            //console.log("haloo");
            var data    = $(this).serialize();
    
            $.ajax({
                type: "POST",
                data: data,
                url: base_url+"login/do_login",
                beforeSend: function() {
                    $("#username, #password, #tbLogin").attr('disabled', true);
                    $("#tbLogin").html('<i class="fa fa-spinner fa-spin"></i> Mohon Tunggu');
                },
                success: function(r) {
                    $("#username, #password, #tbLogin").attr('disabled', false);
                    if (r.status == "gagal") {
                        alert(r.data);

                    	$("#tbLogin").html('<i class="fa fa-check-circle"></i> Login');
                        $("#password").val('');
                        $("#password").focus();
                    } else {
                        alert(r.data);
                        window.location.assign(base_url+"home");
                    }
                }
            });
            return false;
        });
    // $(document).on("ready", function() {
       
    // });
</script>