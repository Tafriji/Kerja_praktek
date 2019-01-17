                <div class="row">
                    <div class="col-md-12">
                    <img style="display: block;margin-left: auto;margin-right: auto; width: 200px;" src="<?php echo base_url()?>assets/img/lintang.png">
                        <h3 align="center" class="page-header">
                           TOKO LINTANG<br>Data Barang
                        </h3>
                    </div>
                </div> 
                <!-- /. ROW  -->
                <div class="row">                  
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                 <?php echo anchor('barang/post','Tambah Data',array('class'=>'btn btn-danger btn-sm')) ?>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover" id="dataTables-example" >
                                        <thead>
                                            <tr>
                                                <th>Nama Barang</th>
                                                <th>Jenis Barang</th>
                                                <th>Harga Supliyer</th>
                                                <th>Harga Jual</th>
                                                <th style="text-align:center">Stok</th>
                                                <th>Aksi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <?php 
                                        $no = $this->uri->segment('3');
                                        foreach ($record->result() as $r) { ?>
                                            <tr class="gradeU">
                                                <td><?php echo $r->nama_barang ?></td>
                                                <td><?php echo $r->jenis_barang ?></td>
                                                <td>Rp. <?php echo number_format($r->harga,2) ?></td>
                                                <td>Rp. <?php echo number_format($r->harga_jual,2) ?></td>
                                                <td style="text-align:center"><?php echo $r->stok ?></td>
                                                <td class="center">
                                                    <?php echo anchor('barang/edit/'.$r->id_barang,'Edit','class="btn btn-primary"'); ?> 
                                                    <?php echo anchor('barang/delete/'.$r->id_barang,'Delete','class="btn btn-danger"'); ?>
                                                </td>
                                            </tr>
                                        <?php } ?>
                                        </tbody>
                                    </table>
                                    <?php
                                        echo $this->pagination->create_links();
                                    ?>
                                </div>
                                
                            </div>
                        </div>
                        <!-- /. PANEL  -->
                    </div>
                </div>
                <!-- /. ROW  -->


