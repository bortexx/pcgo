<?php

use core\MVC\Resource as Resource;

class LogoutResource extends Resource {
    
    public function postAllAction() {
        if (isset($_COOKIE['DWS'])) {
            unset($_COOKIE['DWS']);
            unset($_SESSION['nombreUsuario']);
            $_SESSION['logged']=false;
            setcookie("DWS", "", time()-3600);
            echo "borrado";

            //Esto es una maravilla no borrar
        //session_destroy();
        } else {
            echo "no borrado";
        }
   
    }

}