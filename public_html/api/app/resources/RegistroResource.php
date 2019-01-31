<?php

use core\MVC\Resource as Resource;

class RegistroResource extends Resource {

    public function getAllAction() {
       
    }

    public function postAllAction() {
        
        $correo = $_POST['correo'];
        $usuario = $_POST['usuario'];
        $contrasenya = $_POST['contrasenya'];
        $nombre = $_POST['nombre'];
        $apellidos = $_POST['apellidos'];
        $codigoPostal = $_POST['codigoPostal'];
        $direccion = $_POST['direccion'];

        
        $this->sql = "SELECT * FROM usuarios WHERE nombreUsuario = '$usuario' ";
        $this->execSQL();
        if ($this->num_rows === 0) {
            if (filter_var($correo, FILTER_VALIDATE_EMAIL)) { 
            $this->sql ="INSERT INTO `usuarios` (nombreUsuario,contrasenya,nombre,apellidos,direccion,codigoPostal,correoElectronico) 
            VALUES ('$usuario', '$contrasenya', '$nombre', '$apellidos', '$direccion', '$codigoPostal', '$correo')";
            $this->execSQL();   

        } else {
            http_response_code(400);
            }
        } else {
            http_response_code(400);
        }


    }
    
    }
