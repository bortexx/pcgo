let arti;

class IndexController {

    comprobarErrorApi(codigo) {
        switch (codigo) {
            case 400:
                alert("Error al dar de alta el usuario. El correo electrónico no es correcto o el usuario está en uso");
                break;
            case 401:
                alert("El usuario o la contraseña no son correctos");
                break;
            case 500:
                alert("Error al conectar a la base de datos");
                break;
        }
    }

    mostrarProductos(json) {
        json.map(function (prod) {
            $("#productos").append("<div draggable='true' ondragstart='drag(event)' class='card' id ='" + prod.id + "'><img class=card__image src=images/" + prod.imagen + "><div class=card__titulo>" + prod.nombreCarta + "</div><div class=card__precio>" + prod.precio + " €</div><p class='info'>" + prod.nombreCompleto + "</p><p class='info'>" + prod.descripcion + "</p><button id='botonProductoAbrirModal' type='button' onclick='reinicioContador()' class='card__boton' data-toggle='modal' data-target='#exampleModal'>Ver Detalles</button> </div>");
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

    mostrarCarrusel(json) {
        json.map(function (carr) {
            $("#carousel-inner").append("<div class='carousel-item'><img class='carousel__image' src=images/" + carr.imagenes + "></div>");
            $(".carousel-inner").children().first().addClass("active");
        });
    }

    mostrarDetallesCompra() {
        $(".card").click(function () {
            arti = art.mostrarArticulo(this);
            $("#modaltitulo").text(arti.nombre);
            $("#modalNombre").text(arti.nombreCompleto);
            $("#modalprecio").text("Precio: " + arti.precio + " €");
            $("#modalDescripcion").text(arti.descripcion);
            $("#modalImage").remove();
            $("#modalimagen").append("<img id='modalImage'class='modal-body__imagen' src=images/" + arti.imagen + "></img>");
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

    $("#redireccionLogo").attr('href', window.location.href);

    $("#form-login").attr('action', window.location.href + "php/compruebaLogin.php");
    console.log(window.location.href);
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
        let articulo = [
            id = arti.id,
            imagen = arti.imagen,
            nombre = arti.nombre,
            precio = arti.precio,
            nombreCompleto = arti.nombreEspanyol,
            descripcion = arti.descripcion
        ]
        let unidades = Number($("#numeroContador").text());
        art.anyadirArticuloAlCarrito(carrito, articulo, unidades);
    });


});

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

function mostrarCarrito() {
    let contador = 0;
    let arrayCarrito = carrito.mostrarArrayArticulos();
    $(".modalBody__articuloCarrito").remove();
    $(".modalBody__articuloCarrito--oscuro").remove();
    console.log(arrayCarrito);
    arrayCarrito.map(function (articulo) {
        contador++;
        if (contador % 2 == 0) {
            $("#bodyModalCarrito").append("<div class='modalBody__articuloCarrito--oscuro'> <img class='imagenCarrito' src=images/" + articulo.articulo[1] + "><span class='item'>" + articulo.articulo[2] + "</span><button class='moda-body__boton-menos item' id='simboloMenos'> <i class='fas fa-minus'></i></button><span id='unidades'class='item'>" + articulo.unidades + "</span><button id='simboloMas' class='moda-body__boton-mas item'> <i class='fas fa-plus'></i></button><span>" + articulo.articulo[3] + "</span></div>");

        } else {
            $("#bodyModalCarrito").append("<div class='modalBody__articuloCarrito'> <img class='imagenCarrito' src=images/" + articulo.articulo[1] + "><span class='item'>" + articulo.articulo[2] + "</span><button class='moda-body__boton-menos item' id='simboloMenos'> <i class='fas fa-minus'></i></button><span id='unidades' class='item'>" + articulo.unidades + "</span><button id='simboloMas' class='moda-body__boton-mas item'> <i class='fas fa-plus'></i></button><span>" + articulo.articulo[3] + "</span></div>");
        }
    });
}

function compraFinalizada() {
    repository.getModels("pedido", indexController.mostrarCategorias);
}

function mensajeCompra(a) {
    if (a == "Compra realizada con exito") {
        alert("Compra realizada con exito.");
    } else {
        alert("Error. La compra no se ha podido realizar.");
    }
}

function botonMasCarrito() {
    $("#simboloMas").click(function () {
        articulo.unidades = articulo.unidades++;
        $("#unidades").text(articulo.unidades);
    });
}

function botonMenosCarrito(unidades) {
    $("#simboloMenos").click(function () {
        articulo.unidades = articulo.unidades--;
        $("#unidades").text(articulo.unidades);
    });
}

function reinicioContador() {
    if (!$("#exampleModal").hasClass("show")) {
        cantidad = 1;
        $('.modal-body__unidades').text(cantidad);
    }
}
let id;

function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.currentTarget.id);
}

function drop(ev) {
    ev.preventDefault();
    var id = ev.dataTransfer.getData("text");

    articuloSeleccionado = document.getElementById(id);
    arti = art.mostrarArticulo(articuloSeleccionado);
    //console.log(articuloDrop);
    //carrito.anyadirArticulo(articuloDrop);

    let articulo = [
        id = arti.id,
        imagen = arti.imagen,
        nombre = arti.nombre,
        precio = arti.precio,
        nombreCompleto = arti.nombreEspanyol,
        descripcion = arti.descripcion
    ]
    let unidades = Number($("#numeroContador").text());
    art.anyadirArticuloAlCarrito(carrito, articulo, unidades);
}