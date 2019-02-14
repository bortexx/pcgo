<?php

use core\MVC\Resource as Resource;

class RegistroResource extends Resource
{

    public function getAllAction()
    {

    }

    public function postAllAction()
    {

        $correo = htmlspecialchars($_POST['correo']);
        $usuario = htmlspecialchars($_POST['usuario']);
        $contrasenya = htmlspecialchars($_POST['contrasenya']);
        $nombre = htmlspecialchars($_POST['nombre']);
        $apellidos = htmlspecialchars($_POST['apellidos']);
        $codigoPostal = htmlspecialchars($_POST['codigoPostal']);
        $direccion = htmlspecialchars($_POST['direccion']);

        $this->sql = "SELECT * FROM usuarios WHERE nombreUsuario = '$usuario' ";
        $this->execSQL();
        if ($this->num_rows === 0) {
            if (filter_var($correo, FILTER_VALIDATE_EMAIL)) {
                $this->sql = "INSERT INTO `usuarios` (nombreUsuario,contrasenya,nombre,apellidos,direccion,codigoPostal,correoElectronico)
            VALUES ('$usuario', '$contrasenya', '$nombre', '$apellidos', '$direccion', '$codigoPostal', '$correo')";
                $this->execSQL();
            } else {
                http_response_code(400);
            }
        } else {
            http_response_code(400);
        }

    }

    public function postAllAction2()
    {

        parse_str(file_get_contents("php://input"), $datosInsertar);
        $nombre = $datosInsertar['nombre'];
        $email = $datosInsertar['correo'];
        $usuario = $datosInsertar['usuario'];

        $this->sql = "SELECT * FROM usuarios WHERE nombreUsuario = '$usuario' ";
        $this->execSQL();
        if ($this->num_rows === 0) {
            if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
                $this->sql = "INSERT INTO `usuarios` (nombreUsuario,nombre,correoElectronico)
                  VALUES ('$usuario', '$nombre',  '$email')";
                $this->execSQLInsert();
            } else {
                http_response_code(400);
            }
        } else {
            http_response_code(400);
        }
    }

}
