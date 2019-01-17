<html>
<head>
<meta charset="utf-8">
<title>Daftar Member Toko Lintang</title>
<link href="<?php echo base_url().'assets/css/' ?>logincss.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="<?php echo base_url()?>assets/js/jquery-3.2.1.min.js"></script>
<link href="<?php echo base_url(); ?>/template/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfonts-->
<link href='http://fonts.googleapis.com/css?family=Oxygen:400,300,700|Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>
<!--//webfonts-->
</head>
<body style="background-color: none;">
<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
       <h1>TOKO LINTANG</h1>
    </div>

    <!-- Login Form -->

      <input type="text" id="nama_member" class="fadeIn second" name="nama_member" placeholder="Nama Lengkap">
      <input type="text" id="alamat" class="fadeIn second" name="alamat" placeholder="Alamat">
      <input type="text" id="no_telp" class="fadeIn third" name="no_telp" placeholder="Nomor Telepon" >
      <select align="center" id="jenis_kelamin" name="jenis_kelamin" class="form-control" style="margin-top: 6px; width: 85%;margin-left: 33px;" >
                                    <option value="L">Laki-laki</option>
                                    <option value="P">Perempuan</option>
      </select>
      <input type="email" id="email" class="form-control" name="email" placeholder="Email" style="margin-top: 10px;margin-bottom: 6px;width: 85%;margin-left: 34px;
" >
      <input type="password" id="password" class="fadeIn second" name="password" placeholder="PASSWORD" style="
    background-color: rgb(246, 246, 246);
    color: rgb(13, 13, 13);
    text-align: center;
    display: inline-block;
    font-size: 16px;
    width: 85%;
    padding: 15px 32px;
    text-decoration: none;
    margin: 5px;
    border-width: 2px;
    border-style: solid;
    border-color: rgb(246, 246, 246);
    border-image: initial;
    transition: all 0.5s ease-in-out 0s;
    border-radius: 5px;
">
      <input type="text" id="pertanyaan" class="fadeIn second" name="pertanyaan" placeholder="PERTANYAAN">
      <input type="text" id="jawaban" class="fadeIn third" name="jawaban" placeholder="JAWABAN" >
      <button class="btn btn-primary" style="margin-top: 20px; margin-bottom: 20px; width: 200px;" class="fadeIn fourth" name="daftar" value="DAFTAR" onclick="daftar()" >DAFTAR</button>
  </div>
</div>



				
	 
</body>
</html>
<script>

 function daftar()
 {
   var nama_member = $('#nama_member').val();
   var alamat = $('#alamat').val();
   var no_telp = $('#no_telp').val();
   var jenis_kelamin = $('#jenis_kelamin').val();
   var email = $('#email').val();
   var password = $('#password').val();
   var pertanyaan = $('#pertanyaan').val();
   var jawaban = $('#jawaban').val();
   var regex = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
    if (!regex.test(email))
    {
       alert('Format email salah')
    }
    else
    {
      $.ajax({
        url  :"<?php echo base_url('auth/registeruser');?>",
        type : 'POST',
        data : {
          daftar : 'yes',
          nama_member : nama_member,
          alamat : alamat,
          no_telp : no_telp, 
          jenis_kelamin : jenis_kelamin, 
          email :email,
          password :password,
          pertanyaan :pertanyaan,
          jawaban :jawaban 
        },
         success : function(dd)
        {
          if (dd==1)
          {
            alert("Email sudah ada");
          }
          else
          {
            window.location= "<?php echo base_url('auth/loginuser');?>";
          }
           
        }
     })
    }
     
 }
</script>