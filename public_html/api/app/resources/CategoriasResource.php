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

    public function postCategoriasAction(){
        parse_str(file_get_contents("php://input"),$datosInsertar);
        $nombre = $datosInsertar['nombre'];
              
              $this->sql = "SELECT * FROM categorias WHERE nombre = '$nombre' ";
              $this->execSQL();
              if ($this->num_rows === 0) {
                    $this->sql = "INSERT INTO `categorias` (nombre) 
                  VALUES ('$nombre')";
                  $this->execSQLInsert();   
              } else {
                  http_response_code(400);
              }
      
      
          }

}