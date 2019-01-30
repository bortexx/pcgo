<?php

use core\MVC\Resource as Resource;

class CategoriasResource extends Resource {
    //protected $id = 'Nombre';

    public function getAllAction() {
        $this->sql = 'SELECT * FROM categorias';
        $this->execSQL();
        $this->setData();
    }

        public function postCategoriasAction(){
            $this->sql = 'INSERT INTO categorias VALUES (valor1, valor2, valor3, .)';
        }
    
/*
    public function getByIdAction() {
        $equipo = $this->controller->getParam('equipo');
        $this->sql = 'SELECT * FROM equipos WHERE Nombre = :nombre';
        $params = array(
            'nombre' => $equipo,
        );
        $this->execSQL($params);
        $this->setData();
    }
*/
}