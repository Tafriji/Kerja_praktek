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
                            Laporan Barang Laris :
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
                                                <th>Id Barang</th>
                                                <th>Nama Barang</th>
                                                <th>Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <?php $no=1; $total=0; foreach ($record->result() as $r){ ?>
                                            <tr class="gradeU">
                                                <td align="center"><?php echo $no ?></td>
                                                <td align="center"><?php echo $r->id_barang ?></td>
                                                <td align="center"><?php echo $r->nama_barang ?></td>
                                                <td align="center"><?php echo $r->total ?></td>
                                            </tr>
                                        <?php $no++; $total=$total+$r->total; } ?>
                                            <tr>
                                                <td colspan="3" style="text-align: right; font-size:18px;" ><B>Total</B></td>
                                                <td style=" text-align: center;font-size:18px;"><B><?php echo  $total?></B></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <br><br>
                                    <table style="width: 100%; margin-left: 75%;">
                                        <tbody>
                                            <tr class="gradeU">
                                                <td align="center">Yogyakarta, <?= date('d-M-Y');?></td>
                                            </tr>
                                            <tr class="gradeU">
                                
                                                <td align="center">  Admin</td>
                                            </tr>
                                            <tr class="gradeU">
                            
                                                <td align="center"> <br></td>
                                            </tr>
                                            <tr class="gradeU">
                           
                                                <td align="center">  <?= $_SESSION['userdata']->id_user?></td>
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