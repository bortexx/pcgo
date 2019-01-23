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
            setcookie("logeado", $this->data[0]['id'] . ";" . $this->data[0]['nombreUsuario'] , time() + (86400 * 7));
            echo "hola";
        } else {
            echo "password no válido";
        }    
    }

    }
