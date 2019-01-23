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
       // $this->setData();

        $usuarioComprueba =  $this->data[0]['nombreUsuario'];
        $passwordComprueba = $this->data[0]['contrasenya'];

        if ($this->data[0]['nombreUsuario'] === "0") {
            echo "nombre de usuario no válido";
            return "nombre de usuario no válido";
        }

        else if ($password == $passwordComprueba) {
            setcookie("logeado", $this->data[0]['id'] . ";" . $this->data[0]['nombreUsuario'] , time() + (86400 * 7));
            echo "hola";
            return "okey";
        } else {
            echo "password no válido";
        }    
    }

    }
