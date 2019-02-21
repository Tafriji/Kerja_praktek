<?php
    include APPPATH.'views/report/laporan.php';

    // $subtotalpayment=0;
    // $totalfinepayment=0;
    // $totalratepayment=0;
    // $total=0;
?>          
            <div>
                <div align="center" >
                    <img style="display: block;margin-left: auto;margin-right: auto;width: 100px;" src="<?php echo base_url()?>assets/img/lintang.png">
                    <div>
                        <h2 align="center">
                            TOKO LINTANG <br>
                            Laporan Online : 
                            <small><?=  date('d-m-y') ?></small>
                        </h2>
                       
                    </div>
                </div>
            </div> 
                <!-- /. ROW  -->
                <div>
                    <div>
                        <div>
                            <div>
                                <div>
                                    <table border=1>
                                        <thead>
                                            <tr>
                                                <th>No.</th>
                                                <th>Tanggal Transaksi</th>
                                                <th>Id Pembeli</th>
                                                <th>Total Transaksi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <?php $no=1; $total=0; foreach ($record->result() as $r){ ?>
                                            <tr class="gradeU">
                                                <td align="center"><?php echo $no ?></td>
                                                <td align="center"><?php echo $r->tanggal ?></td>
                                                <td align="center"><?php echo $r->id_member ?></td>
                                                <td align="left">Rp <?php echo number_format($r->jumlahtotal,2) ?></td>
                                            </tr>
                                        <?php $no++; $total=$total+$r->jumlahtotal; } ?>
                                            <tr>
                                                <td colspan="3" style="text-align: right; font-size:18px;" ><B>Total</B></td>
                                                <td style="font-size:18px;"><B>Rp <?php echo  number_format($total,2);?></B></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /. TABLE  -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /. ROW  -->