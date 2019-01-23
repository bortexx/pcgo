<?php


return array(	
	"get" => array(
		"Categorias" => array(
			"route" => "pcgo/api/categorias",
			"resource" => "categorias",
			"action" => "getAll"
		),
		"Carrusel" => array(
			"route" => "/pcgo/api/carrusel",
			"resource" => "carrusel",
			"action" => "getAll"
		),
		"Productos" => array(
			"route" => "/pcgo/api/productos",
			"resource" => "productos",
			"action" => "getAll"
		),
		"ProductosTipo" => array(
			"route" => "/pcgo/api/productos/:tipo",
			"resource" => "productos",
			"action" => "getByTipo"
		),
		"Usuarios" => array(
			"route" => "/pcgo/api/usuarios",
			"resource" => "usuarios",
			"action" => "getAll"
		),
		"Comprueba" => array(
			"route" => "/pcgo/api/comprueba",
			"resource" => "comprueba",
			"action" => "getAll"
		),
	),

	"post" => array(
		"Categorias" => array(
			"route" => "pcgo/api/categorias",
			"resource" => "categorias",
			"action" => "postCategorias"
		),
		"Carrusel" => array(
			"route" => "/pcgo/api/carrusel",
			"resource" => "carrusel",
			"action" => "postCarrusel"
		),
		"Productos" => array(
			"route" => "/pcgo/api/productos",
			"resource" => "productos",
			"action" => "postProductos"
		),
		"ProductosTipo" => array(
			"route" => "/pcgo/api/productos/:tipo",
			"resource" => "productos",
			"action" => "getByTipo"
		),
		"Usuarios" => array(
			"route" => "/pcgo/api/usuarios",
			"resource" => "usuarios",
			"action" => "postUsuario"
		),

		"Comprueba" => array(
			"route" => "/pcgo/api/comprueba",
			"resource" => "comprueba",
			"action" => "postAll"
		),

	)
);


