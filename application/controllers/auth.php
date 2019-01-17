<?php
class auth extends CI_Controller{
    
    function __construct() {
        parent::__construct();
        $this->load->model('model_operator');
        $this->load->model('model_user');

    }
    
    function login()
    {
        if(isset($_POST['submit'])){
            
            // proses login disini
            $username   =   $this->input->post('username');
            $password   =   $this->input->post('password');
            $hasil=  $this->model_operator->login($username,$password);
            if(isset($hasil))
            {
                // update last login
                $this->session->set_userdata('userdata',$hasil);
                $this->session->set_userdata('level',1);
                    //echo json_encode($_SESSION['userdata']->level);
                    redirect('penjualan/penjualan_offline');
            }
            else{
                $this->load->view('form_login');
            }
        }
        else{
            //$this->load->view('form_login2');
            $this->session->set_userdata('level',1);
            $this->load->view('form_login');
        }
    }

    function loginuser()
    {
        if(isset($_POST['submit'])){
            
            // proses login disini
            $email   =   $this->input->post('email');
            $password   =   $this->input->post('password');
            $hasil=  $this->model_operator->loginuser($email,$password);
            if(isset($hasil))
            {
                // update last login
                $this->session->set_userdata('userdata',$hasil);
                $this->session->set_userdata('level',0);
                    //echo "sad";
                    redirect('penjualan');
            }
            else{
                $this->load->view('form_loginuser');
            }
        }
        else{
            //$this->load->view('form_login2');
            $this->session->set_userdata('level',0);
            $this->load->view('form_loginuser');
        }
    }
    
    
    function logout()
    {
        if(isset($_SESSION['level']))
        {
            if($_SESSION['level']==1)
            {
                $this->session->sess_destroy();
                $this->session->set_userdata('level',1);
                $this->load->view('form_login');
            }
            else
            {
                $this->session->sess_destroy();
                $this->session->set_userdata('level',0);
                $this->load->view('form_loginuser');
            }
          
        }
        else
        {
                $this->session->sess_destroy();
                $this->session->set_userdata('level',0);
                $this->load->view('form_loginuser');
        }
        
    }

    function register()
    {
       
     
            // proses login disini
            $iduser   =   $this->input->post('username');
            $password   =   $this->input->post('password');
            $idkarywan  =   $this->input->post('karyawan');
            $pertanyaan =   $this->input->post('pertanyaan');
            $jawaban    =   $this->input->post('jawaban');
            $password = $iduser.$password;
            $datauser = array('id_user'=>$iduser,'id_karyawan'=>$idkarywan,'password'=>md5($password),'pertanyaannya'=>$pertanyaan,'jawabannya'=>$jawaban);
            $hasil=  $this->model_user->register($datauser); 
            //echo json_encode($hasil);
            if($hasil==0)
            {
                redirect('admin');
                
            }
            else{
                echo 1;
                
            } 
      
    }
    function registeruser()
    {
        if(isset($_POST['daftar'])){
     
            // proses login disini
            $nama_member = $_POST['nama_member'];
            $alamat = $_POST['alamat'];
            $no_telp = $_POST['no_telp']; 
            $jenis_kelamin = $_POST['jenis_kelamin'];
            $email=$_POST['email'];
            $password =$_POST['password'];
            $pertanyaan =$_POST['pertanyaan'];
            $jawaban =$_POST['jawaban'];
            $query = "SELECT max(id_member) as maxKode from member";
            $check = $this->db->query($query);
            $data = $check->row();
            $id_member = $data->maxKode;
            $noUrut = (int) substr($id_member,3,3);
            $noUrut++;
            $char = "MBR";
            $newID = $char. sprintf("%03s",$noUrut);
            $password = $email.$password;
            $datauser = array(  'id_member'=>$newID,
                                'nama_member' =>$nama_member,
                                'alamat' =>$alamat,
                                'no_telp' =>  $no_telp,
                                'jenis_kelamin' => $jenis_kelamin,
                                'email'=> $email,
                                'password' => md5($password),
                                'pertanyaan' => $pertanyaan,
                                'jawaban' => $jawaban
                            );
            $hasil=  $this->model_user->registermember($datauser); 
            if($hasil==1)
            {
                echo 1;
            }
            else{
                echo 0;
            } 
        }
        else{
            echo 'salah';
            //$this->load->view('form_login2');
            //chek_session_login();
            //$this->load->view('form_login');
        }
    }

    function lupapasswordadmin()
    {
        $id_user=$this->input->post('id_user');
        $hasil = $this->model_operator->getUser($id_user)->row();
        echo json_encode($hasil);
    }

    function resetadmin()
    {
        $i=$this->input->post('id_user');
        $p=$this->input->post('pertanyaannya');
        $j=$this->input->post('jawabannya');
        $hasil = $this->model_operator->getUserCek($i,$p,$j)->num_rows();
        echo $hasil;

    }

    function resetpassadmin()
    {
        $i=$this->input->post('id_user');
        $p=$this->input->post('passbaru');

        $this->model_operator->resetpasswordbaru($i,$p);
        echo 1;

    }


    function daftar()
    {
        $this->load->view('form_daftar');
    }

    function lupapassword()
    {
        $this->load->view('userinterface/form_lupapassword');
    }
    function lupapasswordadminview()
    {
        $this->load->view('form_adminlupapassword');
    }

    function daftaruser()
    {
        $this->load->view('userinterface/form_daftaruser');
    }

    function selectidkaryawan()
    {
        echo json_encode($this->model_user->getKaryawan());
    }
}