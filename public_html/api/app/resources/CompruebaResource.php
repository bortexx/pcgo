<?php

use core\MVC\Resource as Resource;

<<<<<<< HEAD
class CompruebaResource extends Resource
{

    public function postAllAction()
    {

        $usuario = htmlspecialchars($_POST['usuario']);
        $password = htmlspecialchars($_POST['contrasenya']);

        try {
            $this->sql = "SELECT id, nombreUsuario, contrasenya, admin FROM usuarios
            WHERE nombreUsuario = '$usuario' LIMIT 1";
=======
class CompruebaResource extends Resource {

    public function postAllAction() {
  
        $usuario = htmlspecialchars($_POST['usuario']);
        $password = htmlspecialchars($_POST['contrasenya']);
        try{
            $this->sql = "SELECT id, nombreUsuario, contrasenya FROM usuarios  
            WHERE nombreUsuario = '$usuario' LIMIT 1";        
>>>>>>> origin/alejandro
            $this->execSQL();
        } catch (PDOException $e) {
            http_response_code(500);
            exit();
        }
<<<<<<< HEAD
        $usuario_comprueba = $this->data[0]['nombreUsuario'];
        $password_comprueba = $this->data[0]['contrasenya'];
        $admin = $this->data[0]['admin'];

        if ($this->num_rows === 0) {
            http_response_code(401);
        } else if ($password == $password_comprueba) {
            setcookie("DWS", $this->data[0]['id'] . ";" . $this->data[0]['nombreUsuario'], time() + (86400 * 7));
=======
        $usuario_comprueba =  $this->data[0]['nombreUsuario'];
        $password_comprueba = $this->data[0]['contrasenya'];

        
        if ($this->num_rows === 0) {
            http_response_code(401);
        }
        else if ($password == $password_comprueba) {
            setcookie("DWS", $this->data[0]['id'] . ";" . $this->data[0]['nombreUsuario'], time() + (86400 * 7));  
>>>>>>> origin/alejandro
            header("location: http://localhost/pcgo/api");
        } else {
            http_response_code(401);
        }

<<<<<<< HEAD
=======

        
    
>>>>>>> origin/alejandro
    }

}
