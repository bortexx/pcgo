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

   public function getDeleteAction(){
        $id = $this->controller->getParam('id');
        $this->sql = 'DELETE from productos where id = :id';
        $params = array(
            'id' => $id,
        );
        $this->setSQL($params);
    }
    

}