<?php

use core\MVC\Resource as Resource;

class CompruebaResource extends Resource
{

    public function postAllAction()
    {

        $usuario = htmlspecialchars($_POST['usuario']);
        $password = htmlspecialchars($_POST['contrasenya']);

        try {
            $this->sql = "SELECT id, nombreUsuario, contrasenya, admin FROM usuarios
            WHERE nombreUsuario = '$usuario' LIMIT 1";
            $this->execSQL();
        } catch (PDOException $e) {
            http_response_code(500);
            exit();
        }
        $usuario_comprueba = $this->data[0]['nombreUsuario'];
        $password_comprueba = $this->data[0]['contrasenya'];
        $admin = $this->data[0]['admin'];

        if ($this->num_rows === 0) {
            http_response_code(401);
        } else if ($password == $password_comprueba) {
            setcookie("DWS", $this->data[0]['id'] . ";" . $this->data[0]['nombreUsuario'], time() + (86400 * 7));
            header("location: http://localhost/pcgo/api");
        } else {
            http_response_code(401);
        }

    }

}
