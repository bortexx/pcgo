<?php

use core\MVC\Resource as Resource;

class CompraResource extends Resource
{

    public function getAllAction()
    {

    }

    public function postAllAction()
    {

        $unidades = $_POST['unidades'];
        $precio = $_POST['precio'];
        $idPedido = $_POST['idPedido'];
        $idArticulo = $_POST['idArticulo'];
        $idUsuario = $_SESSION["id"];
        $importe = $unidades * $precio;

        try {
            $this->sql = "INSERT INTO linea_pedido(id_pedido,precio,unidades,importe,id_producto)
            VALUES ('$idPedido','$precio','$unidades','$importe','$idArticulo')";
            $this->execSQLInsert();
            http_response_code(200);
        } catch (PDOException $e) {
            http_response_code(500);
            exit();

        }

    }
}
