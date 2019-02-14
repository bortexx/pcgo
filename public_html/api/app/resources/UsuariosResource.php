<?php

use core\MVC\Resource as Resource;

class UsuariosResource extends Resource {
    //protected $id = 'Nombre';
    public function getAllAction() {
        $this->sql = 'SELECT * FROM usuarios';
        $this->execSQL();
        $this->setData();
    }

    public function getUsuarioAction(){
        echo "paco";
        /*
        $user = trim($_POST["user"]);
        $password = $_POST["password"];
        $md5 = md5($password);
        echo $user;
        $this->sql = 'SELECT id, nombreUsuario, contrasenya, COUNT(1) FROM usuarios order by id 
        WHERE nombreUsuario = $user LIMIT 1';
        $this->execSQL();
        $this->setData();

    }
    */
}
public function getDeleteAction(){
    $id = $this->controller->getParam('id');
    $this->sql = 'DELETE from usuarios where id = :id';
    $params = array(
        'id' => $id,
    );
    $this->setSQL($params);
}
}
