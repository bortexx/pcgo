<?php

use core\MVC\Resource as Resource;

class CompruebaResource extends Resource {

    public function postAllAction() {
        $usuario = $_POST['usuario'];
        $password = $_POST['contrasenya'];

        $this->sql = "SELECT id, nombreUsuario, contrasenya FROM usuarios  
        WHERE nombreUsuario = '$usuario' LIMIT 1";        
        $this->execSQL();

        $usuario_comprueba =  $this->data[0]['nombreUsuario'];
        $password_comprueba = $this->data[0]['contrasenya'];

        if ($this->num_rows === 0) {
            echo "nombre de usuario no valido";
        }

        else if ($password == $password_comprueba) {

            setcookie("DWS", $this->data[0]['id'] . ";" . $this->data[0]['nombreUsuario'] , time() + (86400 * 7));  
            header("location: http://localhost/pcgo/api");
        } else {
            echo "password no valido";
        }

    }

}
