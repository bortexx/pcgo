class IndexController {

    mostrarProductos(json) {
        json.map(function (prod) {
            $("#productos").append("<div class='card' id = " + prod.id + "><img class=card__image src=images/" + prod.imagen + "><div class=card__titulo>" + prod.nombreCarta + "</div><div class=card__precio>" + prod.precio + " €</div><p class='info'>" + prod.nombreCompleto + "</p><p class='info'>" + prod.descripcion + "</p><button id='botonProductoAbrirModal' type='button' onclick='reinicioContador()' class='card__boton' data-toggle='modal' data-target='#exampleModal'>Ver Detalles</button> </div>");
        });
        indexController.mostrarDetallesCompra();
    }



    compruebaLogin(a) {
        if (a == "password no valido") {
            alert("password no valido");
        } else if (a == "nombre de usuario no valido") {
            alert("nombre de usuario no valido");
        } else {
            location.reload(true);
        }
    }

    compruebaRegistro(a) {
        if (a == "Correo electronico no valido") {
            alert("Dirección de correo electronico no valida");
        } else if (a == "El usuario ya existe") {
            alert("El usuario ya existe");
        } else {
            alert("Bienvenido :)");
            location.reload(true);
        }
    }

    compruebaLogout() {
         location.reload(true);
    }

    mostrarCategorias(json) {
        $("#menu-side").append("<ul class='menu-side__items' id='menu-side__items'>");
        json.map(function (cat) {
            $(".menu-side__items").append("<li id=" + cat.Nombre + " class='menu-side__item'>" + cat.Nombre + "</li>");
        });
        indexController.mostrarProductosFromCategorias();
    }

    mostrarCarrito(carrito) {
        $("#imagen").click(function () {
            eliminarElemento.eliminarElemento("productos");
            carrito.articulos.map(function (n) {
                $("#productos").append("<div class='card' id = " + n.id + "><img class=card__image src=images/" + n.imagen + "><div class=card__titulo>" + n.nombre + "</div><div class=card__precio>" + n.precio + " €</div></div>");
            });
        });
    }

    mostrarCarrusel(json) {
        json.map(function (carr) {
            $("#carousel-inner").append("<div class='carousel-item'><img class='carousel__image' src=images/" + carr.imagenes + "></div>");
            $(".carousel-inner").children().first().addClass("active");
        });
    }

    mostrarDetallesCompra() {
        $(".card").click(function () {
            let art = articulo.mostrarArticulo(this);
            console.log(art);
            $("#modaltitulo").text(art.nombre);
            $("#modalNombre").text(art.nombreCompleto);
            $("#modalprecio").text("Precio: " + art.precio + " €");
            $("#modalDescripcion").text(art.descripcion);
            $("#modalImage").remove();
            $("#modalimagen").append("<img id='modalImage'class='modal-body__imagen' src=images/" + art.imagen + "></img>");
            articulo.id = art.id;
            articulo.nombre = art.nombre;
            articulo.imagen = art.imagen;
            articulo.precio = art.precio;
            articulo.nombreCompleto = art.nombreEspanyol;
            articulo.descripcion = art.descripcion;
        });
    }
    mostrarCategoriasDesplegable() {
        $("#hamburguesa").click(function () {
            if (!$("#menu-side__items").hasClass("menu-side__items--visible") && !$("#menu-side__items").hasClass("menu-side__items--invisible")) {
                $("#menu-side__items").addClass("menu-side__items--visible");
            } else if ($("#menu-side__items").hasClass("menu-side__items--visible") && !$("#menu-side__items").hasClass("menu-side__items--invisible")) {
                $("#menu-side__items").removeClass("menu-side__items--visible");
                $("#menu-side__items").addClass("menu-side__items--invisible");
            } else {
                $("#menu-side__items").removeClass("menu-side__items--invisible");
                $("#menu-side__items").addClass("menu-side__items--visible");
            }
        });
    }

    mostrarProductosFromCategorias() {
        $(".menu-side__item").on("click", function () {
            eliminarElemento.eliminarElemento("productos");
            let tipo = this.id.toLowerCase();
            console.log(tipo);
            if (tipo == "ordenadores") {
                repository.getModelosTipo("productos", indexController.mostrarProductos, "sobremesa");
                repository.getModelosTipo("productos", indexController.mostrarProductos, "portatil");
            } else {
                repository.getModelosTipo("productos", indexController.mostrarProductos, tipo);
            }
        });
    }

}
let cantidad = 1;

$(document).ready(function () {

    $("#btnSubmit").on("click", function () {
        let datos = {
            correo: $("#correoRegistro").val(),
            nombre: $("#nombreRegistro").val(),
            apellidos: $("#apellidosRegistro").val(),
            direccion: $("#direccionRegistro").val(),
            codigoPostal: $("#codigoPostalRegistro").val(),
            usuario: $("#usuarioRegistro").val(),
            contrasenya: $("#contrasenyaRegistro").val(),
        }
        repository.postModels('registro', indexController.compruebaRegistro, datos);
    });

    $("#redireccionLogo").attr('href', window.location.href);

    $("#simboloMenos").on("click", function () {
        if (cantidad > 1) {
            cantidad--;
            $('.modal-body__unidades').text(cantidad);
            console.log(cantidad);
        } else {
            cantidad = 1;
            $('.modal-body__unidades').text(cantidad);

        }
    });
    $("#simboloMas").on("click", function () {
        cantidad++;
        $('.modal-body__unidades').text(cantidad);

        console.log(cantidad);
    });


    $("#botoncomprar").click(function () {
        articulo.anyadirArticuloAlCarrito(carrito);
    });


});

function reinicioContador() {
    if (!$("#exampleModal").hasClass("show")) {
        cantidad = 1;
        $('.modal-body__unidades').text(cantidad);
    }
}

function login() {
    event.preventDefault();
    let datos = {
        usuario: $('#usuarioLogin').val(),
        contrasenya: $('#contrasenyaLogin').val()
    }
    repository.postModels('comprueba', indexController.compruebaLogin, datos);
}

function logout() {
    repository.postModels('logout', indexController.compruebaLogout);
}