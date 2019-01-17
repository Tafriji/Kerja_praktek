<div class="row">
                    <div class="col-md-12">
                    <img style="display: block;margin-left: auto;margin-right: auto; width: 200px;" src="<?php echo base_url()?>assets/img/lintang.png">            
                        <h2 align="center" class="page-header">
                            Chart <br>Pembelian
                        </h2>
                    </div>
                </div> 
                <!-- /. ROW  -->

                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                                <th>No.</th>
                                                <th>Nama Barang</th>
                                                <th>Harga</th>
                                                <th>Jumlah</th>
                                                <th>Total</th>
                                                <th>Aksi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <?php $no=1; $totalsemua=0; foreach ($databelanja->result() as $r) { ?>
                                            <tr class="gradeU">
                                                <td><?php echo $no ?></td>
                                                <td><?php echo $r->nama_barang ?></td>
                                                <td>Rp <?php echo number_format($r->harga,2) ?></td>
                                                <td><?php echo $r->jumlah ?></td>
                                                <td>Rp <?php $total= $r->jumlah*$r->harga; echo number_format($total,2)?></td>
                                                <td class="center">
                                                    <?php echo anchor('penjualan/hapusdetail/'.$r->id_detail_online,'Delete'); ?>
                                                </td>
                                            </tr>
                                        <?php $no++; $totalsemua=$totalsemua+$total; } ?>
                                        </tbody>
                                    </table>
                                    <div class="panel panel-primary" style="width: 30%; margin-left: 100%; transform: translateX(-100%);">
                                    <div class="panel-heading">Total Pembayaran :</div>
                                    <div class="panel-body"> Rp  <?php echo number_format($totalsemua,2)?></div>
                                    <input id="totaltransaksi" hidden name='total'value="<?php echo $totalsemua?>">
                                    </div>
                                </div>
                                <div align="right"><button onclick="batal()" class="btn btn-danger">Batal</button> <button onclick="cekout()" name="update" class="btn btn-success">Cekout</button><div>
                               <div id="pembayaran">
                               
                               </div>
                            </div>
                        </div>
                    </div>
                </div>
<script>
 function cekout()
 {
    var total= parseInt($('#totaltransaksi').val());
    if(total<=0 || total=='NaN'){
        alert("Tidak ada barang yg akan dibeli")
    }
    else
    {
        $.ajax({
        url  :"<?php echo base_url('penjualan/updatepenjualan');?>",
        type : 'POST',
        data : {
            total : total
        },
         success : function(data)
        {
           alert("Terima Kasih Sudah belanja di Toko Lintang");
           window.location="<?php echo base_url().'penjualan'?>";
        }
     })
    }
    
 }

 function batal()
 {
        $.ajax({
        url  :"<?php echo base_url('penjualan/hapusdetailbatal');?>",
        type : 'POST',
         success : function(data)
        {
           alert("Berhasil dibatalkan");
           window.location="<?php echo base_url().'penjualan/chart'?>";
        }
     })
}
 </script>
                <!-- /. ROW  -->