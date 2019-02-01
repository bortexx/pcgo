<?php

use core\MVC\Resource as Resource;

class CompraResource extends Resource {

    public function getAllAction() {

    }

    public function postAllAction() {
        
        $producto = $_POST['articulo'];
        $unidades = $_POST['unidades'];
        $idUsuario = $_SESSION["id"];
    
        $precioTotalArticulo = $unidades * $producto[3];
            
        try{
            $this->sql ="INSERT INTO `detallescompra` (lineaCompra,idUsuario,idProducto,unidades,precio,importe) 
            VALUES (null,$idUsuario,$producto[0],$unidades,$producto[3],$precioTotalArticulo)";
            $this->setSQL();   
            echo "Gracias por la compra";
        } catch (PDOException $e) {
            http_response_code(500);
            exit();
        
    }
}
    }
