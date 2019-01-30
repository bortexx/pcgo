<<<<<<< HEAD
<?php
    define('DS',"/");
    define("ROOT", $_SERVER['DOCUMENT_ROOT']."/pcgo/api");   
    
    return array(
        "site" => array(
            "name" => "pcgo.com",
            "title"  => "PCGO",
            "coreMVC" => ROOT . DS . "core" . DS . "MVC" . DS,
            "configs" => ROOT . DS . "configs" . DS,
            "resources" => ROOT . DS . "app" . DS . "resources" . DS, 
            "style"  => ROOT . DS . "htdocs" . DS . "css" . DS,
            "errorPage" => ROOT . DS . "app" . DS . "views" . DS . "errorPage.php"
        )
=======
<?php
    define('DS',"/");
    define("ROOT", $_SERVER['DOCUMENT_ROOT']."/pcgo/api");   
    
    return array(
        "site" => array(
            "name" => "pcgo.com",
            "title"  => "PCGO",
            "coreMVC" => ROOT . DS . "core" . DS . "MVC" . DS,
            "configs" => ROOT . DS . "configs" . DS,
            "resources" => ROOT . DS . "app" . DS . "resources" . DS, 
            "style"  => ROOT . DS . "htdocs" . DS . "css" . DS,
            "errorPage" => ROOT . DS . "app" . DS . "views" . DS . "errorPage.php"
        )
>>>>>>> ramses1
    );