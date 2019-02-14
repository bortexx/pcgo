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
            $this->sql = 'INSERT INTO categorias VALUES (valor1, valor2, valor3, .)';
        }
    
        public function getDeleteAction(){
            $id = $this->controller->getParam('id');
            $this->sql = 'DELETE from categorias where id = :id';
            $params = array(
                'id' => $id,
            );
            $this->setSQL($params);
        }
}