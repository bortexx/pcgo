<?php

use core\MVC\Resource as Resource;

class CompruebaResource extends Resource {
   /* public function getAllAction() {
        $this->sql = 'SELECT * FROM usuarios';
        $this->execSQL();
        $this->setData();
        
    }*/
    
    public function postAllAction() {

        $rawData = file_get_contents("php://input");
        $data = json_decode($rawData);
    
        $usuario = $data->usuario;
        $password = $data->password;

        $this->sql = "SELECT id, nombreUsuario, contrasenya FROM usuarios  
        WHERE nombreUsuario = '$usuario' LIMIT 1";        
        $this->execSQL();

        $usuario_comprueba =  $this->data[0]['nombreUsuario'];
        $password_comprueba = $this->data[0]['contrasenya'];

        if ($this->num_rows === 0) {
            echo "nombre de usuario no válido";
        }

        else if ($password == $password_comprueba) {
            setcookie("DWS", $this->data[0]['id'] . ";" . $this->data[0]['nombreUsuario'] , time() + (86400 * 7));
            echo "Logeado con existo";
        } else {
            echo "password no válido";
        }
        session_start();

        
    if (isset($_COOKIE["DWS"])) {
        //$usuario = explode(";", $_COOKIE["DWS"]);
        //$_SESSION["id"] = $usuario[0];
        //$_SESSION["extensionAvatar"] = $usuario[1];
        $_SESSION["logged"] = true;
    } else {
       // unset($_SESSION["usuario"]);
        //unset($_SESSION["avatar"]);
        $_SESSION["logged"] = false;
    }
    }

  

    }
