<div class="row">
                    <div class="col-md-12">
                    <img style="display: block;margin-left: auto;margin-right: auto; width: 200px;" src="<?php echo base_url()?>assets/img/lintang.png">
                    <h3 align="center" class="page-header">
                           TOKO LINTANG<br>Data Member
                        </h3>
                    </div>
                </div> 
                <!-- /. ROW  -->

                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                            <div class="panel-body" >
                            <input onchange='carimember()' style="margin-left: -15px;" id='carimembernama' name='cari' type='text'> 
                            <button class="btn" onclick='carimember()'>Cari</button>
                            </div>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>No.</th>
                                                <th>Nama</th>
                                                <th>Alamat</th>
                                                <th>Nomer Telp</th>
                                                <th>email</th>
                                                <th>Aksi</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tabelmember"> 
                                        <?php $no=1; foreach ($record->result() as $r) { ?>
                                            <tr class="gradeU">
                                                <td><?php echo $no ?></td>
                                                <td><?php echo $r->nama_member ?></td>
                                                <td><?php echo $r->alamat ?></td>
                                                <td><?php echo $r->no_telp ?></td>
                                                <td><?php echo $r->email ?></td>
                                                <td class="center">
                                                <button class="btn btn-danger" name="member" onclick="deletemember('<?php echo $r->id_member?>')">Delete</button>
                                                </td>
                                            </tr>
                                        <?php $no++; } ?>
                                        </tbody>
                                    </table>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /. ROW  -->
<script>
function carimember()
 {
     var nama = $('#carimembernama').val();
    $.ajax({
        url  :"<?php echo base_url('operator/tampil_member_by_name');?>",
        type : 'POST',
        data : {
            nama : nama
        },
         success : function(data)
         {
            var result = $.parseJSON(data);
            $("#tabelmember").empty();
            for (var i=0; i< result.length ; i++)
            {
                var no = i+1;
                $("#tabelmember").append(
                "<tr class='gradeU'>"+
                    "<td>"+no+"</td>"+
                    "<td>"+result[i]['nama_member']+"</td>"+
                    "<td>"+result[i]['alamat']+"</td>"+
                    "<td>"+result[i]['no_telp']+"</td>"+
                    "<td>"+result[i]['email']+"</td>"+
                    "<td class='center'>"+
                    "<button class='btn' name='member' onclick=deletemember('"+result[i]['id_member']+"')>Delete</button>"+ 
                    "</td>"+
                "</tr>"
                )
            }
            
         }
    })
}


function deletemember(id)
 {
    $.ajax({
        url  :"<?php echo base_url('operator/deletemember');?>",
        type : 'POST',
        data : {
            id_member:id
        },
         success : function(data)
         {
            window.location="<?php echo base_url().'operator/tampil_member'?>";
         }
    })
}

</script>