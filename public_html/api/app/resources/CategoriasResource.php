<?php

use core\MVC\Resource as Resource;

class CategoriasResource extends Resource
{
    //protected $id = 'Nombre';

    public function getAllAction()
    {
        $this->sql = 'SELECT * FROM categorias';
        try {
            $this->execSQL();
            $this->setData();
        } catch (PDOException $e) {
            http_response_code(500);
        }

    }

    public function postCategoriasAction()
    {
        parse_str(file_get_contents("php://input"), $datosInsertar);
        $nombre = $datosInsertar['nombre'];

        $this->sql = "SELECT * FROM categorias WHERE nombre = '$nombre' ";
        $this->execSQL();
        if ($this->num_rows === 0) {
            $this->sql = "INSERT INTO `categorias` (nombre)
                  VALUES ('$nombre')";
            $this->execSQLInsert();
        } else {
            http_response_code(400);
        }

    }

    public function putCategoriaAction()
    {
        try {
            parse_str(file_get_contents("php://input"), $datosModificar);
            $id = $datosModificar['id'];
            $nombre = $datosModificar['nombre'];
            $this->sql = "UPDATE categorias SET Nombre = '$nombre' WHERE id = '$id'";
            $this->execSQLInsert();
        } catch (PDOException $e) {
            http_response_code(400);
        }
    }
    public function getDeleteAction()
    {
        $id = $this->controller->getParam('id');
        $this->sql = 'DELETE from categorias where id = :id';
        $params = array(
            'id' => $id,
        );
        $this->setSQL($params);
    }

}
