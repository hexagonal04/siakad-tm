<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="<?=base_url('aset/logo.png')?>">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width" />
	<title>Aplikasi SIMS (Sistem Informasi Manajemen Sekolah)</title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    
    <!-- Bootstrap core CSS     -->
    <link href="<?php echo base_url(); ?>aset/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Animation library for notifications   -->
    <link href="<?php echo base_url(); ?>aset/css/animate.min.css" rel="stylesheet"/>
    <!--  Light Bootstrap Table core CSS    -->
    <link href="<?php echo base_url(); ?>aset/css/light-bootstrap-dashboard-unminify.css" rel="stylesheet"/>
    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="<?php echo base_url(); ?>aset/css/demo.css" rel="stylesheet" />
    <!--     Fonts and icons     
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    -->
    <link href="<?php echo base_url(); ?>aset/css/pe-icon-7-stroke.css" rel="stylesheet" />
    
    <!-- PLUGIN -->
    <link rel="stylesheet" href="<?php echo base_url(); ?>aset/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>aset/plugins/fa/css/font-awesome.min.css">

    <link rel="stylesheet" href="<?php echo base_url(); ?>aset/plugins/swal/sweetalert2.min.css">
    


    <!-- Javascript Files -->
    <!--   Core JS Files   -->
    <script src="<?php echo base_url(); ?>aset/js/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="<?php echo base_url(); ?>aset/js/bootstrap.min.js" type="text/javascript"></script>
    <!--  Checkbox, Radio & Switch Plugins -->
    <script src="<?php echo base_url(); ?>aset/js/bootstrap-checkbox-radio-switch.js"></script>
    <!--  Charts Plugin -->
    <script src="<?php echo base_url(); ?>aset/js/chartist.min.js"></script>
    <!--  Notifications Plugin    -->
    <script src="<?php echo base_url(); ?>aset/js/bootstrap-notify.js"></script>
    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
    <script src="<?php echo base_url(); ?>aset/js/light-bootstrap-dashboard.js"></script>
    <!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
    <script src="<?php echo base_url(); ?>aset/js/demo.js"></script>
    <script src="<?php echo base_url(); ?>aset/js/js.cookie.js"></script>
    <!--- PLUGINS -->
    <!-- datatables -->
    <script src="<?php echo base_url(); ?>aset/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="<?php echo base_url(); ?>aset/plugins/datatables/dataTables.bootstrap.min.js"></script>
    <script src="<?php echo base_url(); ?>aset/plugins/pairselect/pair-select.min.js"></script>
    <script src="<?php echo base_url(); ?>aset/plugins/swal/sweetalert2.min.js"></script>
    
    
    <!-- select search -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
    
    
    <script type="text/javascript">
        base_url = "<?php echo base_url(); ?>";   
        
        // $(document).on("ready", function() {
        //     $('.js-example-basic-single').select2();
        // });
        
        function noti(tipe, value) {
            $.notify({
                icon: 'pe-7s-info',
                message: '<strong>Informasi</strong><p>'+value+'</p>'
            },{
                type: tipe,
                timer: 1000
            });
            return true;
        } 
        function getFormData($form){
            var unindexed_array = $form.serializeArray();
            var indexed_array = {};
            $.map(unindexed_array, function(n, i){
                indexed_array[n['name']] = n['value'];
            });
            return indexed_array;
        }
        function pagination(indentifier, url, config) {
            $('#'+indentifier).DataTable({
                "language": {
                    "url": base_url+"<?php echo base_url(); ?>aset/plugins/datatables/Indonesian.json"
                },
                "ordering": false,
                "columnDefs": config,
                "bProcessing": true,
                "serverSide": true,
                "bDestroy" : true,
                "ajax":{
                    url : url, // json datasource
                    type: "post",  // type of method  , by default would be get
                    error: function(){  // error handling code
                        $("#"+indentifier).css("display","none");
                    }
                }
            }); 
        }
        function getFormData($form){
            var unindexed_array = $form.serializeArray();
            var indexed_array = {};
            $.map(unindexed_array, function(n, i){
                indexed_array[n['name']] = n['value'];
            });
            return indexed_array;
        }
    </script>
    <style type="text/css">
        #datatabel {width: 100%}
    </style>
</head>
<body>
    <div class="wrapper">
        <div class="content">
            <div class="container-fluid">
                <?php $this->load->view($p); ?>
            </div>
        </div>
        <footer class="footer">
            <div class="container-fluid">
                
                <p class="copyright pull-right">
                    Waktu proses {elapsed_time} detik. &copy; 2021 <b>SMA Taruna Mandiri</b></a>
                </p>
            </div>
        </footer>
        <div class="modal" id="tampil_gambar">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body" id="gambarnya">
                        <div style="bottom: 0; position: absolute; background: #fff; padding: 0px 20px" id="ucapan"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger pull-right" data-dismiss="modal" onclick="return hilangkan_gambar();">Nggak tertarik, <span id="is_su"></span> dirumah lebih baik..!!</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
    </div> 
</body>
</html>
