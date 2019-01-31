<?php

use core\MVC\Resource as Resource;

class RegistroResource extends Resource {

    public function getAllAction() {
       
    }

    public function postAllAction() {
        
        $carrito = $_POST['carrito'];

        try{
            $this->sql ="INSERT INTO `usuarios` (nombreUsuario,contrasenya,nombre,apellidos,direccion,codigoPostal,correoElectronico) 
            VALUES ('$usuario', '$contrasenya', '$nombre', '$apellidos', '$direccion', '$codigoPostal', '$correo')";
            $this->execSQL();   
        } catch (PDOException $e) {
            http_response_code(500);
            exit();
        }


    }
    
    }
