<?php

use core\MVC\Resource as Resource;

class ProductosResource extends Resource {
    //protected $id = 'Nombre';

    public function getAllAction() {
        $this->sql = 'SELECT * FROM productos order by id';
        try{
            $this->execSQL();
            $this->setData();
        } catch (PDOException $e) {
            http_response_code(500);
        }
       
    }

    public function postProductosAction() {


        parse_str(file_get_contents("php://input"),$datosInsertar);
  $nombre = $datosInsertar['nombre'];
  $categorias = $datosInsertar['categorias'];
  $precio = $datosInsertar['precio'];
        
        $this->sql = "SELECT * FROM productos WHERE nombreCarta = '$nombre' ";
        $this->execSQL();
        if ($this->num_rows === 0) {
            $this->sql ="INSERT INTO `productos` (nombreCarta,Tipo,precio) 
            VALUES ('$nombre', '$categorias',  '$precio')";
            $this->execSQLInsert();  
        } else {
            http_response_code(400);
        }


  
    }

}