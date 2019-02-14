<?php

use core\MVC\Resource as Resource;

class RegistroResource extends Resource {

    public function getAllAction() {
       
    }

    public function postAllAction() {
        

  parse_str(file_get_contents("php://input"),$datosInsertar);
  $nombre = $datosInsertar['nombre'];
  $email = $datosInsertar['correo'];
  $usuario = $datosInsertar['usuario'];
        
        $this->sql = "SELECT * FROM usuarios WHERE nombreUsuario = '$usuario' ";
        $this->execSQL();
        if ($this->num_rows === 0) {
            if (filter_var($email, FILTER_VALIDATE_EMAIL)) {   
            $this->sql ="INSERT INTO `usuarios` (nombreUsuario,nombre,correoElectronico) 
            VALUES ('$usuario', '$nombre',  '$email')";
            $this->execSQLInsert();   
        } else {
            http_response_code(400);
            }
        } else {
            http_response_code(400);
        }


    }
    
    }
