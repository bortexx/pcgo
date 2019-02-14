<?php
           session_start();
            if (isset($_COOKIE["DWS"])) {
                $usuario = explode(";", $_COOKIE["DWS"]);
                $_SESSION["nombreUsuario"] = $usuario[1];
                $_SESSION["id"] = $usuario[0];
                $_SESSION["logged"] = true;   
            } else {
                $_SESSION["logged"] = false;
            }

    error_reporting(E_ALL);
    ini_set('display_errors', 1);

    header("Access-Control-Allow-Origin: * ");
	header("Access-Control-Allow-Headers: * ");
	header("Access-Control-Allow-Methods: POST, PUT, GET, DELETE, OPTIONS");
    try {
        $mysql = new PDO("mysql:dbname=tiendafinal;host=localhost", "root", "");
       // $mysql = new PDO("mysql:dbname=pcgo;host=192.168.59.104:3306", "root", "root");
        $mysql->exec("set names utf8");
        $mysql->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch (PDOException $e) {
       http_response_code(500);
        exit();
    }
    
    $config = require_once "./configs/config.php";
    require_once("./core/AutoLoad.php");

    use \core as core;
    use \core\MVC\Controller as Controller;
    
    $globals = core\Globals::getInstance();

    $globals->set("db", $mysql);

    //Utilizar el método set de $globals para añadir $config ($key será "config")
    $globals->set("config", $config);

    //Crear un nuevo objeto de tipo Controller
    $controller = new Controller();

    //Llamar al método run del objeto creado anteriormente
    $controller->run();


  
