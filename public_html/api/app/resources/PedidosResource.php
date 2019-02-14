<?php

use core\MVC\Resource as Resource;

class PedidosResource extends Resource
{

    public function getAllAction()
    {
        $this->sql = 'SELECT * FROM pedido';
        try {
            $this->execSQL();
            $this->setData();
        } catch (PDOException $e) {
            http_response_code(500);
        }

    }

    public function postPedidoAction()
    {
        //try{
        $precio = $_POST['precio'];
        $separarCookie = explode(";", $_COOKIE['DWS']);
        $idUsuario = $separarCookie[0];
        $hoy = getdate();
        $fecha = $hoy["year"] . "-" . $hoy["mon"] . "-" . $hoy["mday"];
        $this->sql = "INSERT INTO pedido(id_usuario,fecha_pedido,total_importe)
            VALUES ('$idUsuario','$fecha','$precio')";
        $this->execSQLInsert();
        echo $this->db->lastInsertId();
    }

    public function getDeleteAction()
    {
        $id = $this->controller->getParam('id');

        $this->sql = 'DELETE from pedido where id = :id';
        $params = array(
            'id' => $id,
        );
        $this->setSQL($params);

    }

}
