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

    public function getByTipoAction() {
        $tipo = $this->controller->getParam('tipo');
        $this->sql = 'SELECT * FROM productos WHERE tipo = :tipo order by id';
        $params = array(
            'tipo' => $tipo,
        );
        $this->execSQL($params);
        $this->setData();
    }

    public function putProductoAction(){
        try{
            parse_str(file_get_contents("php://input"),$datosModificar);
            $id = $datosModificar['id'];
            $nombre = $datosModificar['nombre'];
            $categoria = $datosModificar['categoria'];
            $precio = $datosModificar['precio'];
            $this->sql ="UPDATE productos SET nombreCarta = '$nombre',Tipo = '$categoria', precio = '$precio' WHERE id = '$id'";
            $this->execSQLInsert();
        }catch(PDOException $e){
            http_response_code(400);
        }
    }
    
}