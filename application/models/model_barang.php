<?php
class model_barang extends ci_model{
    
    
    function tampil_data()
    {
        $query= "SELECT a.* , b.jenis_barang FROM Barang as a inner join kategori as b on b.id_kategori=a.id_kategori";
        return $this->db->query($query);
    }

    function tampil_datastok($id)
    {
        $query= "SELECT a.* , b.jenis_barang FROM Barang as a inner join kategori as b on b.id_kategori=a.id_kategori where id_barang='".$id."'";
        return $this->db->query($query);
    }

    function tampil_data_by_stok()
    {
        $query= "SELECT a.* , b.jenis_barang FROM Barang as a inner join kategori as b on b.id_kategori=a.id_kategori";
        return $this->db->query($query);
    }

    function tampilkan_data_paging($config, $halaman)
  {
     $query= "SELECT a.* , b.jenis_barang FROM Barang as a inner join kategori as b on b.id_kategori=a.id_kategori LIMIT ".($halaman * $config['per_page']).", ".$config['per_page']." ";
     return $this->db->query($query);
  }

    function tampil_data_by_id($id)
    {
        $query= "SELECT a.* , b.jenis_barang FROM Barang as a inner join kategori as b on b.id_kategori=a.id_kategori where id_barang='".$id."'";
        return $this->db->query($query)->row();
    }

    function tampil_data_by_name()
    {
        $nama =$this->input->post('nama');
        $query= "SELECT a.* , b.jenis_barang FROM Barang as a inner join kategori as b on b.id_kategori=a.id_kategori where nama_barang like '%".$nama."%'";
        return $this->db->query($query);
    }
    
    function post()
    {
        
        $query = "SELECT max(id_barang) as maxKode from barang";
        $check = $this->db->query($query);
        $data = $check->row();
		$id_barang = $data->maxKode;
		$noUrut = (int) substr($id_barang,3,3);
		$noUrut++;
		$char = "BRG";
        $newID = $char. sprintf("%03s",$noUrut);
        
        $id_barang = $newID;
        $nama       =   $this->input->post('nama_barang');
        $kategori   =   $this->input->post('kategori');
        $merk   =   $this->input->post('merk');
        $stok   =   0;
        $harga      =   $this->input->post('harga');
        $hargajual      =   $this->input->post('hargajual');
        $foto =  $this->input->post('berkas');
        $data       = array('nama_barang'=>$nama,
                            'id_kategori'=>$kategori,
                            'id_barang'=> $id_barang,
                            'merk'=> $merk,
                            'stok'=>$stok,
                            'harga_jual'=>$hargajual,
                            'harga'=>$harga,
                            'foto'=>'gambar_barang/'.$_FILES['berkas']['name']);
        $this->db->insert('barang',$data);
    }
    
    function post_stok()
    {
        
            $query = "SELECT max(id_detail_pembelian) as maxKode from detail_pembelian";
            $check = $this->db->query($query);
            $data = $check->row();
            $id_detail_pembelian = $data->maxKode;
            $noUrut = (int) substr($id_detail_pembelian,3,3);
            $noUrut++;
            $char = "dtlpemb";
            $newID = $char. sprintf("%03s",$noUrut);
            
            $id_order = $newID;
            $id_barang       =   $this->input->post('id_barang');
            $jumlah   =   $this->input->post('jumlah');
            $harga   =   $this->input->post('harga');
            $total = $jumlah*$harga;
            $data       = array('id_order'=>$id_order,
                                'jumlah'=>$jumlah,
                                'harga'=> $harga,
                                'total_bayar'=>$total,
                                'id_barang'=>$id_barang);
            $this->db->insert('orderbarang',$data);
           redirect("pembelian");
    }
    
    function get_one($id)
    {
        $param  =   array('barang_id'=>$id);
        return $this->db->get_where('barang',$param);
    }
    
    function edit($data,$id)
    {
        $this->db->where('id_barang',$id);
        $this->db->update('barang',$data);
    }
    
    
    function delete($id)
    {
        $this->db->where('id_barang',$id);
        $this->db->delete('barang');
    }

    function tambah_stok($id,$jml)
    {
        $this->db->where('id_barang',$id);
        $this->db->update('barang','stok');
    }

    function baranglaris()
    {
        $query= "SELECT*FROM barang_laris where month(tanggal)=month(now()) and year(tanggal)=year(now())";
        return $this->db->query($query);
    }
    
}