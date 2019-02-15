<?php

use core\MVC\Resource as Resource;

class UsuariosResource extends Resource
{
    //protected $id = 'Nombre';

    public function getAllAction()
    {
        $this->sql = 'SELECT * FROM usuarios';
        $this->execSQL();
        $this->setData();
    }

    public function getUsuarioAction()
    {
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

    public function putUsuarioByIdAction()
    {
        try {
            parse_str(file_get_contents("php://input"), $datosModificar);
            $nombre = $datosModificar['nombre'];
            $email = $datosModificar['email'];
            $usuario = $datosModificar['usuario'];
            $id = $datosModificar['id'];
            $this->sql = "UPDATE usuarios SET nombreUsuario = '$usuario',correoElectronico = '$email', nombre = '$nombre' WHERE id = '$id'";
            $this->execSQLInsert();
        } catch (PDOException $e) {
            http_response_code(400);
        }
    }

    public function getDeleteAction()
    {
        $id = $this->controller->getParam('id');
        $this->sql = 'DELETE from usuarios where id = :id';
        $params = array(
            'id' => $id,
        );
        $this->setSQL($params);
    }
}
