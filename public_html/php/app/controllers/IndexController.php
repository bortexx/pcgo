<?php

class IndexController extends core\MVC\Action {


    public function CategoriasAction() {
        $model = $this->getModel('categorias', 'categorias');
        $data = $model->select('*');
        echo \json_encode($data);
    }
    public function CarruselAction() {
        $model = $this->getModel('carrusel', 'carrusel');
        $data = $model->select('*');
        echo \json_encode($data);
    }
}