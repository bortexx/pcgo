<?php

use core\MVC\Resource as Resource;

class PedidosResource extends Resource {

   /* public function getPedidoByIdAction(){
        $separarCookie = explode(";",$_COOKIE['DWS']);
        $idUsuario = $separarCookie[0];

        //$this->sql = "SELECT TOP 1 FROM pedido WHERE id_usuario = :id order BY id DESC";
        $this->sql = "SELECT MAX(id) FROM pedido WHERE id_usuario = :id";
        $params = array(
            'id' => $idUsuario,
        );
        $this->execSQL($params);
        $this->setData();
      
    }*/

   public function postPedidoAction() {
        //try{
            $precio = $_POST['precio'];
            $separarCookie = explode(";",$_COOKIE['DWS']);
            $idUsuario = $separarCookie[0];
            $hoy = getdate();
            $fecha = $hoy["year"] . "-" . $hoy["mon"] . "-" . $hoy["mday"];
            $this->sql ="INSERT INTO pedido(id_usuario,fecha_pedido,total_importe) 
            VALUES ('$idUsuario','$fecha','$precio')";
            $this->execSQLInsert();
            echo $this->db->lastInsertId();
    }
        

    }
