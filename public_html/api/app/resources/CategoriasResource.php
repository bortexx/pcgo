<?php

use core\MVC\Resource as Resource;

class CategoriasResource extends Resource {
    //protected $id = 'Nombre';

    public function getAllAction() {
        $this->sql = 'SELECT * FROM categorias';
        try{
            $this->execSQL();
            $this->setData();
        } catch (PDOException $e) {
            http_response_code(500);
        }
        
    }

        public function putCategoriaAction(){
            try{
                parse_str(file_get_contents("php://input"),$datosModificar);
                $id = $datosModificar['id'];
                $nombre = $datosModificar['nombre'];
                $this->sql ="UPDATE categorias SET Nombre = '$nombre' WHERE id = '$id'";
                $this->execSQLInsert();
            }catch(PDOException $e){
                http_response_code(400);
            }
        }

}

