<?php
<<<<<<< HEAD


=======
>>>>>>> origin/alejandro
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
		"Registro" => array(
			"route" => "/pcgo/api/registro",
			"resource" => "registro",
			"action" => "getAll"
		),
		"Logout" => array(
			"route" => "/pcgo/api/logout",
			"resource" => "logout",
			"action" => "getAll"
<<<<<<< HEAD
		),
	),

	"post" => array(
=======
		),		
	),
	
	"post" => array(
		"Pedidos" => array(
			"route" => "pcgo/api/pedidos",
			"resource" => "pedidos",
			"action" => "postPedido"
		),
		"Comprar" => array(
			"route" => "pcgo/api/comprar",
			"resource" => "compra",
			"action" => "postAll"
		),
>>>>>>> origin/alejandro
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
		"Registro" => array(
			"route" => "/pcgo/api/registro",
			"resource" => "registro",
			"action" => "postAll"
		),
		"Logout" => array(
			"route" => "/pcgo/api/logout",
			"resource" => "logout",
			"action" => "postAll"
		),
<<<<<<< HEAD
		"Comprar" => array(
			"route" => "/pcgo/api/comprar",
			"resource" => "compra",
			"action" => "postAll"
		),
	)
);


=======
		
	),
	"put" => array(
		"Usuarios" => array(
			"route" => "pcgo/api/usuarios",
			"resource" => "usuarios",
			"action" => "putUsuarioById"
		),
		"Categorias" => array(
			"route" => "pcgo/api/categorias",
			"resource" => "categorias",
			"action" => "putCategoria"
		),
		"Productos" => array(
			"route" => "pcgo/api/productos",
			"resource" => "productos",
			"action" => "putProducto"
		)
	)
);

>>>>>>> origin/alejandro
