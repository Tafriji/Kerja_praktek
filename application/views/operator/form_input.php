                <div class="row">
                    <div class="col-md-12">
                        <h2 align="center" class="page-header">
                            TOKO LINTANG<br>Tambah Data Operator
                        </h2>
                    </div>
                </div> 
                <!-- /. ROW  -->

                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                            <?php echo form_open('operator/post'); ?>
                                <div class="form-group">
                                    <label>Nama Lengkap</label>
                                    <input required id="inputnamalengkap" type="text" class="form-control" name="nama" placeholder="nama lengkap">
                                </div>
                                <div class="form-group">
                                    <label>Alamat</label>
                                    <input required id="inputalamat" type="text" class="form-control" name="alamat" placeholder="alamat">
                                </div>
                                <div class="form-group">
                                <label>Bagian</label>
                                    <select id="inputbagian" name="bagian" id="idkaryawan" onchange="settype(this)"  class="form-control">
                                    <option value="Admin">Admin</option>
                                    <option value="Superadmin">Superadmin</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                <label>Jenis Kelamin</label>
                                    <select id="inputjeniskelamin" name="jk" id="Jekel"  class="form-control">
                                    <option value="L">Laki-laki</option>
                                    <option value="P">Perempuan</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Nomer Telp</label>
                                    <input required onkeypress='validate(event)' id="inputnotelp" type="text" class="form-control" name="nomertelp" placeholder="nomer telepon">
                                </div>
                      
                                    <select hidden id="inputlevel" name="level" id="level"  class="form-control">
                                    <option value="0">0</option>
                                    <option value="1">1</option>
                                    </select>
                         

                                <button type="submit" name="submit" class="btn btn-primary btn-sm" >Simpan</button> | 
                                <?php echo anchor('operator','Kembali',array('class'=>'btn btn-danger btn-sm'))?>
                            </form>
                            </div>
                        </div>
                        <!-- /. PANEL  -->
                    </div>
                </div>
                <!-- /. ROW  -->
<script>
function settype(data)
{
    $('#inputlevel').val('1');
}
</script>