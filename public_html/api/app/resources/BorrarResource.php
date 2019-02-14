<?php

use core\MVC\Resource as Resource;

class BorrarResource extends Resource {

    public function getAllAction() {
       
    }
    public function deleteAction(){
        $id = $this->controller->getParam('id');
        $this->sql = 'DELETE from productos where id = :id';
        echo $id;
        $params = array(
            'id' => $id,
        );
        $this->execSQL($params);
        $this->setData();
    }

}