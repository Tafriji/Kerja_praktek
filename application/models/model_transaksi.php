<?php
class model_transaksi extends ci_model
{
    
    
    function tampiltransaksi()
    {
        $query= "SELECT*FROM Transaksi where jenis_transaksi = 'online'";
        return $this->db->query($query);   
    }
    function tampiltransaksioffline()
    {
        $query= "SELECT*FROM Transaksi where jenis_transaksi = 'offline'";
        return $this->db->query($query);   
    }

    function tampiltransaksibyid()
    {
        $id_user= $_SESSION['userdata']->id_user;
        $query= "SELECT distinct date(b.tanggal) as tgl, b.id_transaksi, b.total_bayar FROM transaksi as b inner join detail as a on a.id_transaksi=b.id_transaksi where a.id_user='".$id_user."'";
        return $this->db->query($query);   
    }

    function tampiltransaksibyidonline()
    {
        $id_member= $_SESSION['userdata']->id_member;
        $query= "SELECT distinct date(b.tanggal) as tgl, b.id_transaksi, b.total_bayar FROM transaksi as b inner join detail_online as a on a.id_transaksi=b.id_transaksi where a.id_member='".$id_member."'";
        return $this->db->query($query);   
    }

    function tampiltransaksibyidonlinepending()
    {
        $id_member= $_SESSION['userdata']->id_member;
        $query= "SELECT distinct date(b.tanggal) as tgl, b.id_transaksi, b.total_bayar FROM transaksi as b inner join detail_online as a on a.id_transaksi=b.id_transaksi where a.id_member='".$id_member."' and b.bukti_transaksi is null";
        return $this->db->query($query);   
    }
    
    function getjumlahpembayaran()
    {
        $id_transaksi = $this->input->post('id_transaksi');
        return $this->db->query('Select total_bayar from transaksi where id_transaksi="'.$id_transaksi.'"');
    }

    function updatebukti()
    {
        $id_transaksi       =   $this->input->post('transaksipending');
        $foto      =  $this->input->post('berkas');
        $data       = array('bukti_transaksi'=>'bukti_transaksi/'.$_FILES['berkas']['name']);
        $this->db->where('id_transaksi',$id_transaksi);
        $this->db->update('transaksi',$data);
    }
    
    function tampilkan_data_paging($config, $halaman)
    {
       return $this->db->query('Select*from transaksi where jenis_transaksi="online" limit '.$halaman * $config['per_page'].','.$config['per_page'].'');
    }

    function tampilkan_data_pagingoffline($config, $halaman)
    {
       return $this->db->query('Select*from transaksi where jenis_transaksi="offline" limit '.$halaman * $config['per_page'].','.$config['per_page'].'');
    }

    
    function totalchart()
    {
        $id_member=$_SESSION['userdata']->id_member;
        $jumlah= $this->db->query("SELECT count(id_detail_online) as total from detail_online where id_member='".$id_member."' and date(tanggal)=date(now()) and status=0");
        $jumlahchart = $jumlah->row();
        if($jumlahchart)
        {
            return $jumlahchart->total;
        }
		else{ return 0;}
    }

    function totalchartpending()
    {
        $jumlah= $this->db->query("SELECT count(id_transaksi) as total from transaksi where status=0 and bukti_transaksi is not null");
        $jumlahchart = $jumlah->row();
        if($jumlahchart)
        {
            return $jumlahchart->total;
        }
		else{ return 0;}
    }

    function accdatapending($id)
    {
        $this->db->query("UPDATE transaksi set status=1 where id_transaksi='".$id."'");
    }

    function datapending()
    {
        return $this->db->query("SELECT*from transaksi where status=0 and bukti_transaksi is not null");
    }

    function chart()
    {
        $query= "SELECT a.id_detail_online, b.nama_barang, a.harga, a.jumlah FROM detail_online as a inner join barang as b on b.id_barang=a.id_barang WHERE a.id_member='".$_SESSION['userdata']->id_member."' and date(tanggal)= date(now()) and status=0";
        return $this->db->query($query);   
    }

    
    function chartoff()
    {
        $query= "SELECT a.id_detail, b.nama_barang, a.harga, a.jumlah FROM detail as a inner join barang as b on b.id_barang=a.id_barang WHERE a.id_user='".$_SESSION['userdata']->id_user."' and date(tanggal)= date(now()) and status=0";
        return $this->db->query($query);   
    }

    function insertdetail($databarangtransaksi)
    {
        $id_brng=$databarangtransaksi['id'];
        $id_member=$_SESSION['userdata']->id_member;
        $jml=$databarangtransaksi['jml'];
        $harga=$databarangtransaksi['hrg'];
        $query = "SELECT max(id_detail_online) as maxKode from detail_online";
        $check = $this->db->query($query);
        $data = $check->row();
		$id_detail = $data->maxKode;
		$noUrut = (int) substr($id_detail,3,3);
		$noUrut++;
		$char = "DTO";
		$newID = $char. sprintf("%03s",$noUrut);
		$querybarang = "SELECT id_barang from detail_online where id_member ='".$id_member."' and id_barang='".$id_brng."' and status=0 and date(tanggal)=date(now())";
        $cekBarang = $this->db->query($querybarang)->row();
        $data= array('id_detail_online'=>$newID,'id_barang'=>$id_brng,'harga'=>$harga,'jumlah'=>$jml,'id_member'=>$id_member,'status'=>0);
		if($cekBarang)
		{
			$this->db->query("UPDATE detail_online set jumlah=jumlah+$jml where id_member = '".$id_member."' and id_barang='".$id_brng."' and status=0 and date(tanggal)=date(now())");  
		}
		else
		{
            $this->db->insert('detail_online',$data);
		}
		
    }

    function insertdetailadmin($databarangtransaksi)
    {
        $id_brng=$databarangtransaksi['id'];
        $id_user=$_SESSION['userdata']->id_user;
        $jml=$databarangtransaksi['jml'];
        $harga=$databarangtransaksi['hrg'];
        $query = "SELECT max(id_detail) as maxKode from detail";
        $check = $this->db->query($query);
        $data = $check->row();
		$id_detail = $data->maxKode;
		$noUrut = (int) substr($id_detail,3,3);
		$noUrut++;
		$char = "DTL";
		$newID = $char. sprintf("%03s",$noUrut);
		$querybarang = "SELECT id_barang from detail where id_user ='".$id_user."' and id_barang='".$id_brng."' and status=0 and date(tanggal)=date(now())";
        $cekBarang = $this->db->query($querybarang)->row();
        $data= array('id_detail'=>$newID,'id_barang'=>$id_brng,'harga'=>$harga,'jumlah'=>$jml,'id_user'=>$id_user,'status'=>0);
		if($cekBarang)
		{
			$this->db->query("UPDATE detail set jumlah=jumlah+$jml where id_user = '".$id_user."' and id_barang='".$id_brng."' and status=0 and date(tanggal)=date(now())");  
		}
		else
		{
            $this->db->insert('detail',$data);
		}
		
    }

    

    

    function insertpenjualan($totalbayar)
    {
        
        $query = "SELECT max(id_transaksi) as maxKode from transaksi";
        $check = $this->db->query($query);
        $data = $check->row();
        $id_transaksi = $data->maxKode;
        echo $id_transaksi;
		$noUrut = (int) substr($id_transaksi,3,3);
        $noUrut++;
        echo $noUrut;
		$char = "TRS";
		$newID = $char. sprintf("%03s",$noUrut);
       $this->db->query("INSERT into transaksi(id_transaksi,total_bayar,jenis_transaksi,status) values('".$newID."','".$totalbayar."','online',0)");
       $this->db->query("UPDATE detail_online set status=1 , id_transaksi='".$newID."' where status=0 and id_member='".$_SESSION['userdata']->id_member."' and date(tanggal)=date(now())");  
        	
		
    }

    function insertpenjualanoffline($totalbayar)
    {
        
        $query = "SELECT max(id_transaksi) as maxKode from transaksi";
        $check = $this->db->query($query);
        $data = $check->row();
        $id_transaksi = $data->maxKode;
        echo $id_transaksi;
		$noUrut = (int) substr($id_transaksi,3,3);
        $noUrut++;
        echo $noUrut;
		$char = "TRS";
		$newID = $char. sprintf("%03s",$noUrut);
       $this->db->query("INSERT into transaksi(id_transaksi,total_bayar,jenis_transaksi,status) values('".$newID."','".$totalbayar."','offline',1)");
       $this->db->query("UPDATE detail set status=1 , id_transaksi='".$newID."' where status=0 and id_user='".$_SESSION['userdata']->id_user."' and date(tanggal)=date(now())");  
        	
		
    }

    
    function tampilkan_detail_transaksi()
    {
        $id_transaksi = $this->input->post('id_transaksi');
        $query  ="SELECT b.nama_barang, a.jumlah, a.tanggal, a.harga From detail_online as a inner join barang as b on b.id_barang=a.id_barang where a.id_transaksi='$id_transaksi'";
        $data = $this->db->query($query);
        return $data->result();
    }
    function tampilkan_detail_transaksi_offline()
    {
        $id_transaksi = $this->input->post('id_transaksi');
        $query  ="SELECT b.nama_barang, a.jumlah, a.tanggal, a.harga From detail as a inner join barang as b on b.id_barang=a.id_barang where a.id_transaksi='$id_transaksi'";
        $data = $this->db->query($query);
        return $data->result();
    }
    
    
    function hapusdetail($id)
    {
        $this->db->where('id_detail',$id);
        $this->db->delete('detail');
    }
    function hapusdetailbatal()
    {
        $this->db->where('id_transaksi',null);
        $this->db->where('id_user',$_SESSION['userdata']->id_user);
        $this->db->delete('detail');
    }
    function hapusdetailonline($id)
    {
        $this->db->where('id_detail_online',$id);
        $this->db->delete('detail_online');
    }
    function hapusdetailonlinebatal($id)
    {
        $this->db->where('id_transaksi',null);
        $this->db->where('id_member',$_SESSION['userdata']->id_member);
        $this->db->delete('detail_online');
    }
    
    
    function laporan_default_offline()
    {
        $query="SELECT* from laporan_penjualan_offline";
        return $this->db->query($query);
    }
    function laporan_default()
    {
        $query="SELECT* from laporan_penjualan";
        return $this->db->query($query);
    }
    function laporan_pembelian()
    {
        $query="SELECT* from laporan_pembelian";
        return $this->db->query($query);
    }

    function laporan_laris()
    {
        $query="select id_barang, nama_barang, sum(total) as total from (select*from laris as a UNION select * from laris2 as b) as c GROUP by id_barang ORDER by total desc";
        return $this->db->query($query);
    }

    
    function laporan_periode($tanggal1,$tanggal2)
    {
        $query="SELECT*from laporan_penjualan where date(tanggal) between '$tanggal1' and '$tanggal2'";
        return $this->db->query($query);
    }
    function laporan_periode_offline($tanggal1,$tanggal2)
    {
        $query="SELECT*from laporan_penjualan_offline where date(tanggal) between '$tanggal1' and '$tanggal2'";
        return $this->db->query($query);
    }
}