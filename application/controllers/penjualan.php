<?php
class penjualan extends CI_Controller{
    
    function __construct() {
        parent::__construct();
        $this->load->model('model_barang');
        $this->load->model('model_transaksi');
        
    }

    function index(){

       
            $this->load->library('pagination');
            $config['base_url'] = base_url().'penjualan/index/';
            $config['total_rows'] = $this->model_barang->tampil_data()->num_rows();
            $config['per_page'] = 12; 
            $this->pagination->initialize($config); 
            $data['paging']     =$this->pagination->create_links();
            $halaman            =  $this->uri->segment(3);
            $halaman            =$halaman==''?0:$halaman-1;
            $data['databarang']     =    $this->model_barang->tampilkan_data_paging($config,$halaman);
            $data['terlaris']   = $this->model_barang->baranglaris();
            $this->template->load('template1','userinterface/penjualan',$data);
      
        
       
    }

    function stokbarang()
    {  if (check_session())
        {
            $id=$this->input->post('id');
            $data= $this->model_barang->tampil_datastok($id)->result();
            echo json_encode($data);
        }
        
      
    }

    function penjualan_offline(){
        check_session();
        if($_SESSION['level']==1)
        {
            $this->load->library('pagination');
            $config['base_url'] = base_url().'penjualan/penjualan_offline/';
            $config['total_rows'] = $this->model_barang->tampil_data()->num_rows();
            $config['per_page'] = 6; 
            $this->pagination->initialize($config); 
            $data['paging']     =$this->pagination->create_links();
            $halaman            =  $this->uri->segment(3);
            $halaman            =$halaman==''?0:$halaman-1;
            $data['record']     =    $this->model_barang->tampilkan_data_paging($config,$halaman);
        $this->template->load('template','POS/lihat_data',$data);
        }
        else
        {
            redirect('login');
        }
    
    }

    function penjualan_offline_tampildata(){
        $data['record']=$this->model_barang->tampil_data()->result();
        echo json_encode($data['record']);
    }
    function penjualan_offline_tampildata_byname(){
        $data['record']=$this->model_barang->tampil_data_by_name()->result();
        echo json_encode($data['record']);
    }


    function post_penjualan()
    { if(check_session())
        {
            $id= $this->input->post('id_barang');
            $jml= $this->input->post('jumlah');
            if($_SESSION['level']==1)
            {
               
                $data= $this->model_barang->tampil_data_by_id($id);
                $harga= $data->harga_jual; 
                $total= $harga * $jml;
                $datatransaksi = array('id'=>$id,'jml'=>$jml,'hrg'=>$harga,'total'=>$total);
                $jmlchart = $this->model_transaksi->insertdetailadmin($datatransaksi);
               
            }
            else
            {
                    $data= $this->model_barang->tampil_data_by_id($id);
                    $harga= $data->harga_jual;
                    $total= $harga * $jml;
                    $datatransaksi = array('id'=>$id,'jml'=>$jml,'hrg'=>$harga,'total'=>$total);
                    $jmlchart = $this->model_transaksi->insertdetail($datatransaksi);
                    //redirect("penjualan");
            }
        }
        else
        {
            redirect('login');
        }
       
      
    }
    

    function get_totalchart()
    {
        $jmlchart = $this->model_transaksi->totalchart();
        echo $jmlchart;
    }

    function get_trans_pending()
    {
        $jmlchart = $this->model_transaksi->totalchartpending();
        echo $jmlchart;
    }

    function get_data_pending()
    {
        $datapending = $this->model_transaksi->datapending()->result();
        echo json_encode($datapending);
    }

    function accpending()
    {
        $id= $_POST['id_transaksi'];
        $datapending = $this->model_transaksi->accdatapending($id);
    }

    
    function chart()
    {
        if($_SESSION['level']==0)
        {
        $pembelian['databelanja'] = $this->model_transaksi->chart();
        $this->template->load('template1','userinterface/chart_penjualan',$pembelian);
        }
        else
        {
            redirect('login');
        }
    }

    
    function chartpenjualanoff()
    {
        if($_SESSION['level']==1)
        {
            $pembelian['databelanja'] = $this->model_transaksi->chartoff()->result();
            echo json_encode($pembelian['databelanja']);
        }
        else
        {
            $pembelian['databelanja'] = $this->model_transaksi->chart()->result();
            echo json_encode($pembelian['databelanja']);
        }
      
    }

    function hapusdetail($id)
    {
        $this->model_transaksi->hapusdetailonline($id);
        redirect("penjualan/chart");
    }
    function hapusdetailbatal()
    {
        $this->model_transaksi->hapusdetailonlinebatal();
        redirect("penjualan/chart");
    }
    function hapusdetailadmin()
    {
        $id= $this->input->post('id_detail');
        $this->model_transaksi->hapusdetail($id);
       
    }
    function hapusdetailadminbatal()
    {
        $id= $this->input->post('id_detail');
        $this->model_transaksi->hapusdetailbatal();
       
    }

    function updatepenjualan()
    {
        $totalbayar=$this->input->post('total');
        $this->model_transaksi->insertpenjualan($totalbayar);
        redirect("penjualan");
    }


    function updatepenjualanoffline()
    {
        $totalbayar=$this->input->post('total');
        $this->model_transaksi->insertpenjualanoffline($totalbayar);
        redirect("penjualan/penjualan_offline");
    }

   


}