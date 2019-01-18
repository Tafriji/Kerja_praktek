<div class="row">
                    <div class="col-md-12" align="center">
                    <img style="display: block;margin-left: auto;margin-right: auto; width: 200px;" src="<?php echo base_url()?>assets/img/lintang.png">

                        <h2 class="page-header">
                           TOKO LINTANG
                        </h2>
                    </div>
</div> 
                <!-- /. ROW  -->

<div id="slideshow">
<?php 
            foreach($terlaris->result_array() as $rr)
                { 
                
        ?> <div>
            <img style="width:100%;height:340px;padding-bottom:10px;" src="<?php echo base_url().$rr['foto']?>">
            </div>
            <?php
            
                }
            ?>
    </div>
        </div>
    </div>

<style>
#slideshow { 
    margin-top:0px;
    background-color:#ff14936b; 
    position: relative; 
    width: 100%; 
    height: 350px; 
    box-shadow: 0 0 20px rgba(0,0,0,0.4); 
}

#slideshow > div { 
    position: absolute; 
    text-align:center;
    top: 10px; 
    bottom: 10px; 
    transform: translate(50%,0%);
    width:50%;
}
</style>
                <div class="panel-body" >
                            <input onchange='caribarangnama()' style="margin-left: -15px;" id='caribarang' name='cari' type='text'> 
                            <button class="btn" onclick='caribarangnama()'>Cari</button>
                </div>
                <div class="row" id="tabelbarangpenjualan">
                    <?php $no=1; foreach ($databarang->result() as $data) { ?>
                        <div class="col-md-3 col-sm-12 col-xs-12">
                            <div class="panel panel-primary text-center no-boder bg-color-green">
                                <div class="panel-body">
                                <h3><?php echo $data->nama_barang ?></h3>
                                <img style="width: 100%;height: 176px;" src="<?php echo base_url().$data->foto?>">
                                <h6>Rp. <?php echo number_format($data->harga_jual,2) ?></h6>
                                 <input hidden name="hrg" value="<?php echo $data->harga_jual?>">
                                 <input hidden id="<?php echo $data->id_barang?>" value="<?php echo $data->stok?>">
                                </div>
                                <div class="panel-footer back-footer-green">
                                 <input name="jml" id="<?php echo $data->id_barang?>J" style="max-width: 35px;text-align: center;" value="1" type="number"  min="1" max="<?php echo $data->stok?>" />
                                 <button  name="transaksi" onclick="belibarang('<?php echo $data->id_barang?>')">BELI</button> 
                                </div>
                            </div>
                        </div>
                    <?php $no++; }
                  
                    ?>

                <!-- /. ROW  -->
                </div>
<div align="center">
<?php
  echo $this->pagination->create_links();
  
?>
</div>

<script >
 function belibarang(id)
 {
    <?php if(isset($_SESSION["userdata"]->id_member)){?>
        getstok(id);
        var jumlah= parseInt($('#'+id+'J').val());
        var stok = parseInt($('#'+id).val());
        if(jumlah>stok)
        {
            alert("STOK BARANG TIDAK MENCUKUPI");
            //alert(stok+" "+jumlah);
        }
        else{
        $.ajax({
        url  :"<?php echo base_url('penjualan/post_penjualan');?>",
        type : 'POST',
        data : {
            jumlah : jumlah, 
            id_barang : id
        },
            success : function(data)
        {
                total();
                getstok(id);
        }
        })
        }  
     <?php } else {?>
     
         window.location="<?php echo base_url().'login'?>";
     <?php } ?>
    
 }

 
 function getstok(id)
 {
    $.ajax({
        url  :"<?php echo base_url('penjualan/stokbarang');?>",
        type : 'POST',
        data : {id:id},
         success : function(data)
         {
            var result = $.parseJSON(data);         
           
                document.getElementById(result[0]['id_barang']).value = result[0]['stok'];
         }
            
    })
}

function caribarangnama()
 {
     var nama = $('#caribarang').val();
    $.ajax({
        url  :"<?php echo base_url('penjualan/penjualan_offline_tampildata_byname');?>",
        type : 'POST',
        data : {
            nama : nama
        },
         success : function(data)
         {
            var result = $.parseJSON(data);
            $("#tabelbarangpenjualan").empty();
            
            for (var i=0; i< result.length ; i++)
            {
                var no = i+1;
                $("#tabelbarangpenjualan").append(
                        "<div class='col-md-3 col-sm-12 col-xs-12'>"+
                            "<div class='panel panel-primary text-center no-boder bg-color-green'>"+
                                "<div class='panel-body'>"+
                                "<h3>"+result[i]['nama_barang']+"</h3>"+
                                "<img style='width: 100%;height: 176px;' src='"+result[i]['foto']+"'>"+
                                "<h6>"+accounting.formatMoney(result[i]['harga_jual'], "Rp ", 2, ".", ",")+"</h6>"+
                                 "<input hidden name='hrg' value='"+result[i]['harga_jual']+"'>"+
                                "</div>"+
                                "<div class='panel-footer back-footer-green'>"+
                                 "<input name='jml' id='"+result[i]['id_barang']+"' style='max-width: 35px;text-align: center;' value='1' type='number'  min='1' max='5' />"+
                                 "<button  name='transaksi' onclick=belibarang('"+result[i]['id_barang']+"')>BELI</button>"+ 
                                "</div>"+
                            "</div>"+
                        "</div>"
                )
            }
            
         }
    })
}


setInterval(function() { 
  $('#slideshow > div:first')
    .fadeOut(2000)
    .next()
    .fadeIn(2000)
    .end()
    .appendTo('#slideshow');
},  3000);

</script>
