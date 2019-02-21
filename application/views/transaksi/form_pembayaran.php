<div class="row">
                    <div class="col-md-12">
                        <h2 class="page-header">
                            TOKO LINTANG <br>Pembayaran (BCA 2500445648/Khusnul Khotimah)
                            <br>Contact/WhatsApp (0815-4875-5044)
                        </h2>
                    </div>
                </div> 
                <!-- /. ROW  -->

                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                            <?php echo form_open_multipart('transaksi/updatebuktipembayaran'); ?>
                                <div class="form-group">
                                    <label>Transaksi Pending</label>
                                    <select id="transaksipending" name="transaksipending" class="form-control" onchange="pilihtransaksi()">
                                     <option value="0">Pilih Transaksi</option>
                                        <?php foreach ($data as $k) {
                                            echo "<option value='$k->id_transaksi'>$k->id_transaksi</option>";
                                        } ?>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Jumlah Pembayaran</label>
                                    <input id="jmlbayar" class="form-control" name="bayar" placeholder="jumlah bayar" required readonly>
                                </div>
                                <div class="form-group">
                                    <label>Upload Foto</label>
                                    <input required id="inputfoto" accept="image/x-png,image/gif,image/jpeg" type="file" class="form-control" name="berkas" placeholder="upload">
                                </div>
                                <button type="submit" id="btnsimpanbarang" name="submit" class="btn btn-primary btn-sm" >Simpan</button> | 
                                <?php echo anchor('penjualan','Kembali',array('class'=>'btn btn-danger btn-sm'))?>
                           </form>
                            </div>
                        </div>
                        <!-- /. PANEL  -->
                    </div>
                </div>
                <!-- /. ROW  -->

<script>
function pilihtransaksi() {
    var id_transaksi=$('#transaksipending').val();
    $.ajax({
        url  :"<?php echo base_url('transaksi/getjumlahpembayaran');?>",
        type : 'POST',
        data :{id_transaksi : id_transaksi},
        success : function(dd)
        {
            var data= $.parseJSON(dd);
            if(dd !=0)
            {
                console.log(data);
                document.getElementById('jmlbayar').value=data['total_bayar'] ; 
            }
            else
            {
                document.getElementById('jmlbayar').value="" ; 
            }
           
        }
    })
}
</script>
