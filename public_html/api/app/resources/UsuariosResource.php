<?php

use core\MVC\Resource as Resource;

class UsuariosResource extends Resource {
    public function getAllAction() {
        $this->sql = 'SELECT * FROM usuarios';
        $this->execSQL();
        $this->setData();
    }

    public function getUsuarioAction(){
       
    }

     public function putUsuarioByIdAction(){
       
            try{
                parse_str(file_get_contents("php://input"),$datosModificar);
                $nombre = $datosModificar['nombre'];
                $email = $datosModificar['email'];
                $usuario = $datosModificar['usuario'];
                $id = $datosModificar['id'];
                $this->sql ="UPDATE usuarios SET nombreUsuario = '$usuario',correoElectronico = '$email', nombre = '$nombre' WHERE id = '$id'";
                $this->execSQLInsert();
            }catch(PDOException $e){
                http_response_code(400);
            }
	}
}
