<?php

use core\MVC\Resource as Resource;

class ProductosResource extends Resource {
    //protected $id = 'Nombre';

    public function getAllAction() {
        $this->sql = 'SELECT * FROM productos order by id';
        $this->execSQL();
        $this->setData();
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

}