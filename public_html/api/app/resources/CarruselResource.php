<?php

use core\MVC\Resource as Resource;

class CarruselResource extends Resource {
    //protected $id = 'Nombre';

    public function getAllAction() {
        $this->sql = 'SELECT * FROM carrusel';
        $this->execSQL();
        $this->setData();
    }

}