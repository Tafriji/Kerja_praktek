<?php
class transaksi extends ci_controller{
    
        function __construct() {
        parent::__construct();
        $this->load->model(array('model_barang','model_transaksi'));
        check_session();
    }
    
    function index()
    {
        
        $this->load->library('pagination');
        $config['base_url'] = base_url().'index.php/transaksi/index/';
        $config['total_rows'] = $this->model_transaksi->tampiltransaksi()->num_rows();
        $config['per_page'] = 6; 
        $this->pagination->initialize($config); 
        $data['paging']     =$this->pagination->create_links();
        $halaman            =  $this->uri->segment(3);
        $halaman            =$halaman==''?0:$halaman-1;
        $data['record']     =    $this->model_transaksi->tampilkan_data_paging($config,$halaman);
        if($_SESSION['level']==1)
        {
            $this->template->load('template','transaksi/lihat_data',$data);
        }
        else
        {
            redirect('login');
        }
        
     
   
    }

    function offline()
    {
        if($_SESSION['level']==1)
        {
            $this->load->library('pagination');
            $config['base_url'] = base_url().'index.php/transaksi/offline/';
            $config['total_rows'] = $this->model_transaksi->tampiltransaksioffline()->num_rows();
            $config['per_page'] = 6; 
            $this->pagination->initialize($config); 
            $data['paging']     =$this->pagination->create_links();
            $halaman            =  $this->uri->segment(3);
            $halaman            =$halaman==''?0:$halaman-1;
            $data['record']     =    $this->model_transaksi->tampilkan_data_pagingoffline($config,$halaman);
            $this->template->load('template','transaksi/lihat_data_offline',$data);
        }
        else
        {
            redirect('auth/login');
        }
       
    }

    function tampilbynama()
    {
        $data['record']=$this->model_barang->tampil_data_by_name()->result();
        echo json_encode($data['record']);
   
    }
    
    
    function hapusitem()
    {
        $id=  $this->uri->segment(3);
        $this->model_transaksi->hapusitem($id);
        redirect('transaksi');
    }

   
    
    
    function selesai_belanja()
    {
        $tanggal=date('Y-m-d');
        $user=  $this->session->userdata('username');
        $id_op=  $this->db->get_where('operator',array('username'=>$user))->row_array();
        $data=array('operator_id'=>$id_op['operator_id'],'tanggal_transaksi'=>$tanggal);
        $this->model_transaksi->selesai_belanja($data);
        redirect('transaksi');
    }
    
    
    function laporan()
    {
        if($_SESSION['level']==1)
        {
            if(isset($_POST['submit']))
            {
                $tanggal1=  $this->input->post('tanggal1');
                $tanggal2=  $this->input->post('tanggal2');
                $data['record']=  $this->model_transaksi->laporan_periode($tanggal1,$tanggal2);
                $this->template->load('template','transaksi/laporan',$data);
            }
            elseif(isset($_POST['cetak']))
            {
                $tanggal1=  $this->input->post('tanggal1');
                $tanggal2=  $this->input->post('tanggal2');
                $this->bydatepdf($tanggal1,$tanggal2);
            }
            else
            {
                $data['record']=  $this->model_transaksi->laporan_default();
                $this->template->load('template','transaksi/laporan',$data);
            }
        }
        else
        {
            redirect('auth/login');
        }
       
    }

    function laporan_offline()
    {
        if($_SESSION['level']==1)
        {
            if(isset($_POST['submit']))
            {
                $tanggal1=  $this->input->post('tanggal1');
                $tanggal2=  $this->input->post('tanggal2');
                $data['record']=  $this->model_transaksi->laporan_periode_offline($tanggal1,$tanggal2);
                $this->template->load('template','transaksi/laporan_offline',$data);
            }
            elseif(isset($_POST['cetak']))
            {
                $tanggal1=  $this->input->post('tanggal1');
                $tanggal2=  $this->input->post('tanggal2');
                $this->bydatepdfoffline($tanggal1,$tanggal2);
            }
            else
            {
                $data['record']=  $this->model_transaksi->laporan_default_offline();
                $this->template->load('template','transaksi/laporan_offline',$data);
            }
        }
        else
        {
            redirect('auth/login');
        }
      
    }
    
    
    function excel()
    {
        if($_SESSION['level']==1)
        {
        header("Content-type=appalication/vnd.ms-excel");
        header("content-disposition:attachment;filename=laporantransaksi.xls");
        $data['record']=  $this->model_transaksi->laporan_default();
        $this->load->view('transaksi/laporan_excel',$data);
        }
        else
        {
            redirect('auth/login');
        }
        
    }
    
    function allpdf()
    {
        if($_SESSION['level']==1)
        {
            $this->load->library('cfpdf');
        $pdf=new FPDF('P','cm','A4');
        $pdf->AddPage();

        $pdf->SetFont('Arial','B','C');
        $pdf->SetFontSize(16);
        $pdf->image(base_url().'assets/img/lintang.png',1,0.4,4);
        $pdf->text(9, 2,'TOKO LINTANG',0,1,'C');
        $pdf->text(7, 2.7,'LAPORAN PENJUALAN ONLINE',0,1,'C');
        $pdf->SetFont('Arial','B','C');
        $pdf->SetFontSize(12);
        $pdf->setLineWidth(0.05);
        $pdf->Cell(15);
        $pdf->Cell(4, 2, date('d-M-y'), 1,1,'C');
        $pdf->SetFont('Arial','B','C');
        $pdf->setLineWidth(0.08);
        $pdf->Line(21,3.5,0,3.5);
        $pdf->setLineWidth(0.05);
        $pdf->Ln(2);
        $pdf->SetFontSize(12);
        $pdf->Cell(2);
        $pdf->Cell(1, 1, 'No', 1,0,'C');
        $pdf->Cell(5, 1, 'Tanggal Transaksi', 1,0,'C');
        $pdf->Cell(4, 1, 'Id Pembeli', 1,0,'C');
        $pdf->Cell(5, 1, 'Total Transaksi', 1,1,'C');
        // tampilkan dari database
        $pdf->SetFont('Arial','','L');
        $data=  $this->model_transaksi->laporan_default();
        $no=1;
        $total=0;
        foreach ($data->result() as $r)
        {
            $pdf->Cell(2);
            $pdf->Cell(1, 1, $no, 1,0,'C');
            $pdf->Cell(5, 1, $r->tanggal, 1,0,'C');
            $pdf->Cell(4, 1, $r->id_member, 1,0,'C');
            $pdf->Cell(5, 1,'Rp '.$r->jumlahtotal, 1,1,'R');
            $no++;
            $total=$total+$r->jumlahtotal;
        }
        // end
        $pdf->Cell(2);
        $pdf->Cell(10,1,'Total',1,0,'R');
        $pdf->Cell(5,1,'Rp '.$total,1,0,'R');
        $pdf->Output();
        }
        else
        {
            redirect('auth/login');
        }
        
    }

    function laporanpembelian()
    {
        if($_SESSION['level']==1)
        {
            $this->load->library('cfpdf');
        $pdf=new FPDF('P','cm','A4');
        $pdf->AddPage();

        $pdf->SetFont('Arial','B','C');
        $pdf->SetFontSize(16);
        $pdf->image(base_url().'assets/img/lintang.png',1,0.4,4);
        $pdf->text(8, 2,'TOKO LINTANG',0,1,'C');
        $pdf->text(7, 2.7,'LAPORAN PEMBELIAN',0,1,'C');
        $pdf->SetFont('Arial','B','C');
        $pdf->SetFontSize(12);
        $pdf->setLineWidth(0.05);
        $pdf->Cell(15);
        $pdf->Cell(4, 2, date('d-M-y'), 1,1,'C');
        $pdf->SetFont('Arial','B','C');
        $pdf->setLineWidth(0.08);
        $pdf->Line(21,3.5,0,3.5);
        $pdf->setLineWidth(0.05);
        $pdf->Ln(2);
        $pdf->SetFontSize(12);
     
        $pdf->Cell(1, 1, 'No', 1,0,'C');
        $pdf->Cell(5, 1, 'Tanggal Transaksi', 1,0,'C');
        $pdf->Cell(4, 1, 'Jumlah Beli', 1,0,'C');
        $pdf->Cell(4, 1, 'Nama Barang', 1,0,'C');
        $pdf->Cell(5, 1, 'Total Transaksi', 1,1,'C');
        // tampilkan dari database
        $pdf->SetFont('Arial','','L');
        $data=  $this->model_transaksi->laporan_pembelian();
        $no=1;
        $total=0;
        foreach ($data->result() as $r)
        {
          
            $pdf->Cell(1, 1, $no, 1,0,'C');
            $pdf->Cell(5, 1, $r->tanggal, 1,0,'C');
            $pdf->Cell(4, 1, $r->jumlah, 1,0,'C');
            $pdf->Cell(4, 1, $r->nama_barang, 1,0,'C');
            $pdf->Cell(5, 1,'Rp '.$r->jumlahtotal, 1,1,'R');
            $no++;
            $total=$total+$r->jumlahtotal;
        }
        // end
      
        $pdf->Cell(14,1,'Total',1,0,'R');
        $pdf->Cell(5,1,'Rp '.$total,1,0,'R');
        $pdf->Output();
        }
        else
        {
            redirect('auth/login');
        }
        
    }

    function laris()
    {
        if($_SESSION['level']==1)
        {
            $this->load->library('cfpdf');
        $pdf=new FPDF('P','cm','A4');
        $pdf->AddPage();

        $pdf->SetFont('Arial','B','C');
        $pdf->SetFontSize(16);
        $pdf->image(base_url().'assets/img/lintang.png',1,0.4,4);
        $pdf->text(9, 2,'TOKO LINTANG',0,1,'C');
        $pdf->text(7, 2.7,'LAPORAN BARANG LARIS',0,1,'C');
        $pdf->SetFont('Arial','B','C');
        $pdf->SetFontSize(12);
        $pdf->setLineWidth(0.05);
        $pdf->Cell(15);
        $pdf->Cell(4, 2, date('d-M-y'), 1,1,'C');
        $pdf->SetFont('Arial','B','C');
        $pdf->setLineWidth(0.08);
        $pdf->Line(21,3.5,0,3.5);
        $pdf->setLineWidth(0.05);
        $pdf->Ln(2);
        $pdf->SetFontSize(12);
        $pdf->Cell(2);
        $pdf->Cell(1, 1, 'No', 1,0,'C');
        $pdf->Cell(5, 1, 'ID BARANG', 1,0,'C');
        $pdf->Cell(4, 1, 'NAMA BARANG', 1,0,'C');
        $pdf->Cell(5, 1, 'TOTAL PENJUALAN', 1,1,'C');
        // tampilkan dari database
        $pdf->SetFont('Arial','','L');
        $data=  $this->model_transaksi->laporan_laris();
        $no=1;
        $total=0;
        foreach ($data->result() as $r)
        {
            $pdf->Cell(2);
            $pdf->Cell(1, 1, $no, 1,0,'C');
            $pdf->Cell(5, 1, $r->id_barang, 1,0,'C');
            $pdf->Cell(4, 1, $r->nama_barang, 1,0,'C');
            $pdf->Cell(5, 1, $r->total, 1,1,'R');
            $no++;
          
        }
        // end
      
        $pdf->Output();
        }
        else
        {
            redirect('auth/login');
        }
        
    }


    

    function laporanbarang()
    {
        if($_SESSION['level']==1)
        {
            $this->load->library('cfpdf');
            $pdf=new FPDF('P','cm','A4');
            $pdf->AddPage();
    
            $pdf->SetFont('Arial','B','C');
            $pdf->SetFontSize(16);
            $pdf->image(base_url().'assets/img/lintang.png',1,0.4,4);
            $pdf->text(8, 2,'TOKO LINTANG',0,1,'C');
            $pdf->text(7.4, 2.7,'LAPORAN BARANG',0,1,'C');
            $pdf->SetFont('Arial','B','C');
            $pdf->SetFontSize(12);
            $pdf->setLineWidth(0.05);
            $pdf->Cell(15);
            $pdf->Cell(4, 2, date('d-M-y'), 1,1,'C');
            $pdf->SetFont('Arial','B','C');
            $pdf->setLineWidth(0.08);
            $pdf->Line(21,3.5,0,3.5);
            $pdf->setLineWidth(0.05);
            $pdf->Ln(2);
            $pdf->SetFontSize(12);
            $pdf->Cell(2.3);
            $pdf->Cell(1, 1, 'No', 1,0,'C');
            $pdf->Cell(3, 1, 'Nama Barang', 1,0,'C');
            $pdf->Cell(3, 1, 'Jenis Barang', 1,0,'C');
            $pdf->Cell(4, 1, 'Harga', 1,0,'C');
            $pdf->Cell(3, 1, 'Stok', 1,1,'C');
    
            // tampilkan dari database
            $pdf->SetFont('Arial','','L');
            $data=  $this->model_barang->tampil_data();
            $no=1;
            $total=0;
            foreach ($data->result() as $r)
            {
                $pdf->Cell(2.3);
                $pdf->Cell(1, 1, $no, 1,0,'C');
                $pdf->Cell(3, 1, $r->nama_barang, 1,0,'C');
                $pdf->Cell(3, 1, $r->jenis_barang, 1,0,'C');
                $pdf->Cell(4, 1,'Rp '.$r->harga, 1,0,'R');
                $pdf->Cell(3, 1, $r->stok, 1,1,'C');
                $no++;
            }
            // end
           
            $pdf->Output();
        }
        else
        {
            redirect('auth/login');
        }
       
    }

    function allpdfoff()
    {
        if($_SESSION['level']==1)
        {
            $this->load->library('cfpdf');
            $pdf=new FPDF('P','cm','A4');
            $pdf->AddPage();
    
            $pdf->SetFont('Arial','B','C');
            $pdf->SetFontSize(16);
            $pdf->image(base_url().'assets/img/lintang.png',1,0.4,4);
            $pdf->text(9, 2,'TOKO LINTANG',0,1,'C');
            $pdf->text(7, 2.7,'LAPORAN PENJUALAN OFLINE',0,1,'C');
            $pdf->SetFont('Arial','B','C');
            $pdf->SetFontSize(12);
            $pdf->setLineWidth(0.05);
            $pdf->Cell(15);
            $pdf->Cell(4, 2, date('d-M-y'), 1,1,'C');
            $pdf->SetFont('Arial','B','C');
            $pdf->setLineWidth(0.08);
            $pdf->Line(21,3.5,0,3.5);
            $pdf->setLineWidth(0.05);
            $pdf->Ln(2);
            $pdf->SetFontSize(12);
            $pdf->Cell(2);
            $pdf->Cell(1, 1, 'No', 1,0,'C');
            $pdf->Cell(5, 1, 'Tanggal Transaksi', 1,0,'C');
            $pdf->Cell(4, 1, 'Id Operator', 1,0,'C');
            $pdf->Cell(5, 1, 'Total Transaksi', 1,1,'C');
            // tampilkan dari database
            $pdf->SetFont('Arial','','L');
            $data=  $this->model_transaksi->laporan_default_offline();
            $no=1;
            $total=0;
            foreach ($data->result() as $r)
            {
                $pdf->Cell(2);
                $pdf->Cell(1, 1, $no, 1,0,'C');
                $pdf->Cell(5, 1, $r->tanggal, 1,0,'C');
                $pdf->Cell(4, 1, $r->id_user, 1,0,'C');
                $pdf->Cell(5, 1,'Rp '.$r->jumlahtotal, 1,1,'R');
                $no++;
                $total=$total+$r->jumlahtotal;
            }
            // end
            $pdf->Cell(2);
            $pdf->Cell(10,1,'Total',1,0,'R');
            $pdf->Cell(5,1,'Rp '.$total,1,0,'R');
            $pdf->Output();
        }
        else
        {
            redirect('auth/login');
        }
       
    }

    function getdetailtransaksi()
    {
        if($_SESSION['level']==1)
        {
            $datadetail=$this->model_transaksi->tampilkan_detail_transaksi();
            echo Json_encode($datadetail);
        }
        else
        {
            redirect('auth/login');
        }
      
    }

    function getdetailtransaksi_offline()
    {
        if($_SESSION['level']==1)
        {
            $datadetail=$this->model_transaksi->tampilkan_detail_transaksi_offline();
            echo Json_encode($datadetail);
        }
        else
        {
            redirect('auth/login');
        }
      
    }

    function get_data_transaksi_by_id()
    {
        $datatransaksi['record']=$this->model_transaksi->tampiltransaksibyidonline();
        $this->template->load('template1','userinterface/riwayatpembelian',$datatransaksi);
    }

    function bydatepdf($tanggal1,$tanggal2)
    {
        $this->load->library('cfpdf');
        $pdf=new FPDF('P','cm','A4');
        $pdf->AddPage();

        $pdf->SetFont('Arial','B','C');
        $pdf->SetFontSize(16);
        $pdf->image(base_url().'assets/img/lintang.png',1,0.4,4);
        $pdf->text(9, 2,'TOKO LINTANG',0,1,'C');
        $pdf->text(7, 2.7,'LAPORAN PENJUALAN ONLINE',0,1,'C');
        $pdf->SetFont('Arial','B','C');
        $pdf->SetFontSize(12);
        $pdf->setLineWidth(0.05);
        $pdf->Cell(15);
        $pdf->Cell(4, 2, date('d-M-y'), 1,1,'C');
        $pdf->SetFont('Arial','B','C');
        $pdf->setLineWidth(0.08);
        $pdf->Line(21,3.5,0,3.5);
        $pdf->setLineWidth(0.05);
        $pdf->Ln(2);
        $pdf->SetFontSize(12);
        $pdf->Cell(2);
        $pdf->Cell(1, 1, 'No', 1,0,'C');
        $pdf->Cell(5, 1, 'Tanggal Transaksi', 1,0,'C');
        $pdf->Cell(4, 1, 'Id Pembeli', 1,0,'C');
        $pdf->Cell(5, 1, 'Total Transaksi', 1,1,'C');
        // tampilkan dari database
        $pdf->SetFont('Arial','','L');
        $no=1;
        $data=$this->model_transaksi->laporan_periode($tanggal1,$tanggal2);
        $total=0;
        foreach ($data->result() as $r)
        {
            $pdf->Cell(2);
            $pdf->Cell(1, 1, $no, 1,0,'C');
            $pdf->Cell(5, 1, $r->tanggal, 1,0,'C');
            $pdf->Cell(4, 1, $r->id_member, 1,0,'C');
            $pdf->Cell(5, 1, $r->total_bayar, 1,1,'C');
            $no++;
            $total=$total+$r->total_bayar;
        }
        // end
        $pdf->Cell(2);
        $pdf->Cell(10,1,'Total',1,0,'R');
        $pdf->Cell(5,1,$total,1,0,'C');
        $pdf->Output();
    }

    function bydatepdfoffline($tanggal1,$tanggal2)
    {
        $this->load->library('cfpdf');
        $pdf=new FPDF('P','cm','A4');
        $pdf->AddPage();

        $pdf->SetFont('Arial','B','C');
        $pdf->SetFontSize(16);
        $pdf->image(base_url().'assets/img/lintang.png',1,0.4,4);
        $pdf->text(9, 2,'TOKO LINTANG',0,1,'C');
        $pdf->text(7, 2.7,'LAPORAN PENJUALAN OFLINE',0,1,'C');
        $pdf->SetFont('Arial','B','C');
        $pdf->SetFontSize(12);
        $pdf->setLineWidth(0.05);
        $pdf->Cell(15);
        $pdf->Cell(4, 2, date('d-M-y'), 1,1,'C');
        $pdf->SetFont('Arial','B','C');
        $pdf->setLineWidth(0.08);
        $pdf->Line(21,3.5,0,3.5);
        $pdf->setLineWidth(0.05);
        $pdf->Ln(2);
        $pdf->SetFontSize(12);
        $pdf->Cell(2);
        $pdf->Cell(1, 1, 'No', 1,0,'C');
        $pdf->Cell(5, 1, 'Tanggal Transaksi', 1,0,'C');
        $pdf->Cell(4, 1, 'Id Operator', 1,0,'C');
        $pdf->Cell(5, 1, 'Total Transaksi', 1,1,'C');
        // tampilkan dari database
        $pdf->SetFont('Arial','','L');
        $no=1;
        $data=$this->model_transaksi->laporan_periode_offline($tanggal1,$tanggal2);
        $total=0;
        foreach ($data->result() as $r)
        {
            $pdf->Cell(2);
            $pdf->Cell(1, 1, $no, 1,0,'C');
            $pdf->Cell(5, 1, $r->tanggal, 1,0,'C');
            $pdf->Cell(4, 1, $r->id_user, 1,0,'C');
            $pdf->Cell(5, 1, $r->total_bayar, 1,1,'C');
            $no++;
            $total=$total+$r->total_bayar;
        }
        // end
        $pdf->Cell(2);
        $pdf->Cell(10,1,'Total',1,0,'R');
        $pdf->Cell(5,1,$total,1,0,'C');
        $pdf->Output();
    }

    function pembayaran()
    {
        
            $hasil['data'] = $this->model_transaksi->tampiltransaksibyidonlinepending()->result();
            $this->template->load('template1','transaksi/form_pembayaran',$hasil);
      
    }

    function getjumlahpembayaran()
    {
        $hasil = $this->model_transaksi->getjumlahpembayaran()->result();
        echo json_encode($hasil[0]);
    }

    function updatebuktipembayaran()
    {
        $this->model_transaksi->updatebukti();
        $this->aksi_upload_bukti();
    }


    public function aksi_upload_bukti(){
		$config['upload_path']          = './bukti_transaksi/';
		$config['allowed_types']        = '*';
 
		$this->load->library('upload', $config);
 
		if ( ! $this->upload->do_upload('berkas')){
			$error = array('error' => $this->upload->display_errors());
			echo json_encode($error);
		}else{
            $data = array('upload_data' => $this->upload->data());
            redirect('penjualan');
        }
    }
}