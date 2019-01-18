<?php
class Barang extends CI_Controller{
    
    function __construct() {
        parent::__construct();
        $this->load->helper(array('form', 'url'));
        $this->load->model('model_barang');
        check_session();

    }


    function index()
    {     
        
        if($_SESSION['level']==1)
        {
        $this->load->library('pagination');
        $config['base_url'] = base_url().'index.php/barang/index/';
        $config['total_rows'] = $this->model_barang->tampil_data()->num_rows();
        $config['per_page'] = 6; 
        $this->pagination->initialize($config); 
        $data['paging']     =$this->pagination->create_links();
        $halaman            =  $this->uri->segment(3);
        $halaman            =$halaman==''?0:$halaman-1;
        $data['record']     =    $this->model_barang->tampilkan_data_paging($config,$halaman);
        $this->template->load('template','barang/lihat_data',$data);
        }
        else
        {
            redirect('auth/login');
        }
      
    }
    
    function tambah_barang()
    {
        $this->template->load('template','barang/form_input');
    }


    function post()
    {
        if(isset($_POST['submit'])){
            // proses barang
            $this->model_barang->post();
            $this->aksi_upload();
            
        }
        else{
            $this->load->model('model_kategori');
            $data['kategori']=  $this->model_kategori->tampilkan_data()->result();
            //$this->load->view('barang/form_input',$data);
            $this->template->load('template','barang/form_input',$data);
        }
    }

    
    
    
    function edit()
    {
       if(isset($_POST['submit'])){
            // proses barang
            $id         =   $this->input->post('id');
            $nama       =   $this->input->post('nama_barang');
            $kategori   =   $this->input->post('kategori');
            $harga      =   $this->input->post('harga');
            $data       = array('nama_barang'=>$nama,
                                'id_kategori'=>$kategori,
                                'harga_jual'=>$harga);
            $this->model_barang->edit($data,$id);
            redirect('barang');
        }
        else{
            $id=  $this->uri->segment(3);
            $this->load->model('model_kategori');
            $data['kategori']   =  $this->model_kategori->tampilkan_data()->result();
            $data['record']     =  $this->model_barang->tampil_data_by_id($id);
            //$this->load->view('barang/form_edit',$data);
            $this->template->load('template','barang/form_edit',$data);
        }
    }
    
    
    function delete()
    {
        $id=  $this->uri->segment(3);
        $this->model_barang->delete($id);
        redirect('barang');
    }

    public function aksi_upload(){
		$config['upload_path']          = './gambar_barang/';
		$config['allowed_types']        = '*';
		//$config['max_size']             = 100;
		//$config['max_width']            = 1024;
		//$config['max_height']           = 768;
 
		$this->load->library('upload', $config);
 
		if ( ! $this->upload->do_upload('berkas')){
			$error = array('error' => $this->upload->display_errors());
			echo json_encode($error);
		}else{
            $data = array('upload_data' => $this->upload->data());
            redirect('barang');
        }
    }
}