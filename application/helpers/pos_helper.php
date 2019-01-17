<?php

function check_session()
{
    if(!isset($_SESSION['userdata']))
    {
        redirect('login');
    }
    else
    {

       if(isset($_SESSION['userdata']->id_member))
       {
         $_SESSION['userdata']->level = 0;
       }else
       if(isset($_SESSION['userdata']->id_user))
       {
        $_SESSION['userdata']->level = 1;
       }else{
           redirect('login');
       }

    }
  

}


?>
