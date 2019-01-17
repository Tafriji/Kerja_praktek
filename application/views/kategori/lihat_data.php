                <div class="row">
                    <div class="col-md-12">
                    <img style="display: block;margin-left: auto;margin-right: auto; width: 200px;" src="<?php echo base_url()?>assets/img/lintang.png">
                    <h3 align="center" class="page-header">
                           TOKO LINTANG<br>Data Kategori
                        </h3>
                    </div>
                </div> 
                <!-- /. ROW  -->

                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                 <?php echo anchor('kategori/post','Tambah Data',array('class'=>'btn btn-danger btn-sm')) ?>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                        <thead>
                                            <tr>
                                      
                                                <th>Nama Kategori</th>
                                                <th>Aksi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <?php $no=1; foreach ($record->result() as $r) { ?>
                                            <tr class="gradeU">
                                             
                                                <td><?php echo $r->jenis_barang?></td>
                                                <td class="center">
                                                   <?php echo anchor('kategori/edit/'.$r->id_kategori,'Edit','class="btn btn-primary"'); ?>
                                                   <?php echo anchor('kategori/delete/'.$r->id_kategori,'Delete','class="btn btn-danger"'); ?>
                                                </td>
                                            </tr>
                                        <?php  } ?>
                                        </tbody>
                                    </table>
                                   
                                </div>
                                <?php
                                        echo $this->pagination->create_links();
                                    ?>
                            </div>
                        </div>
                        <!-- /. PANEL  -->
                    </div>
                </div>
                <!-- /. ROW  -->
