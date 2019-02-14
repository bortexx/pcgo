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

    compruebaCompra(a) {
        if (a == "Gracias por la compra") {
            alert("Gracias por la compra");
        } else {
            comprobarErrorApi(a);
        }

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
                repository.getModelosTipo("productos", indexController.mostrarProductos, "sobremesas");
                repository.getModelosTipo("productos", indexController.mostrarProductos, "portatiles");
            } else {
                repository.getModelosTipo("productos", indexController.mostrarProductos, tipo);
            }
        });
    }


    cambiarColorCarrito() {
        $("#imagen").empty();
        $("#imagen").append("<img src='images/icons8-add-shopping-cart-32Green.png'/>");


        setTimeout(function () {
            $("#imagen").empty();
            $("#imagen").append("<img src='images/icons8-add-shopping-cart-32.png'/>");
        }, 2500);
    }

}
let cantidad = 1;

$(document).ready(function () {


    $("#btnRegistro").on("click", function () {
        let datos = {
            correo: $("#correoRegistro").val(),
            dni: $("#dni").val(),
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

    $("#form-login").attr('action', window.location.href + "php/compruebaLogin.php");
    $("#simboloMenos").on("click", function () {
        if (cantidad > 1) {
            cantidad--;
            $('.modal-body__unidades').text(cantidad);
        } else {
            cantidad = 1;
            $('.modal-body__unidades').text(cantidad);

        }
    });
    $("#simboloMas").on("click", function () {
        cantidad++;
        $('.modal-body__unidades').text(cantidad);
    });


    $("#botonAnyadirAlCarrito").click(function () {
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


    $("#botonComprar").click(function () {
        let datos = carrito.mostrarArrayArticulos();
        datos.map(function (producto) {
            repository.postModels("comprar", indexController.compruebaCompra, producto);
        });
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
    let precioCompra = 0;
    let contador = 0;
    let arrayCarrito = carrito.mostrarArrayArticulos();
    $(".modalBody__articuloCarrito").remove();
    $(".modalBody__articuloCarrito--oscuro").remove();

    arrayCarrito.map(function (articulo) {
        contador++;
        let precioNumber = Number(articulo.articulo[3]);
        let unidadesNumber = Number(articulo.unidades);
        precioCompra = precioCompra + (precioNumber * unidadesNumber);
        if (contador % 2 == 0) {
<<<<<<< HEAD
            $("#bodyModalCarrito").append("<div id='articuloCarrito" + articulo.articulo[0] + "' class='modalBody__articuloCarrito--oscuro'> <img class='imagenCarrito' src=images/" + articulo.articulo[1] + "><span class='item'>" + articulo.articulo[2] + "</span><button class='modal-carrito-body__boton-menos' id='simboloMenosCarrito" + articulo.articulo[0] + "'> <i class='fas fa-minus'></i></button><span id='unidades" + articulo.articulo[0] + "'class='item'>" + articulo.unidades + "</span><button id='simboloMasCarrito" + articulo.articulo[0] + "' class='modal-carrito-body__boton-mas'> <i class='fas fa-plus'></i></button><span class='modal-carrito__body-precio' id='precioCarrito" + articulo.articulo[0] + "'>Precio: "+articulo.articulo[3]+" €</span><span class='modal-carrito__body-total' id='precioTotalCarrito" + articulo.articulo[0] + "'>Total: "+articulo.articulo[3]*articulo.unidades+" €</span><button class='bttn' id='botonEliminarArticulo" + articulo.articulo[0] + "'>Eliminar</button></div>");

        } else {
            $("#bodyModalCarrito").append("<div id='articuloCarrito" + articulo.articulo[0] + "' class='modalBody__articuloCarrito'> <img class='imagenCarrito' src=images/" + articulo.articulo[1] + "><span class='item'>" + articulo.articulo[2] + "</span><button class='modal-carrito-body__boton-menos' id='simboloMenosCarrito" + articulo.articulo[0] + "'> <i class='fas fa-minus'></i></button><span id='unidades" + articulo.articulo[0] + "' class='item'>" + articulo.unidades + "</span><button id='simboloMasCarrito" + articulo.articulo[0] + "' class='modal-carrito-body__boton-mas'> <i class='fas fa-plus'></i></button><span class='modal-carrito__body-precio' id='precioCarrito" + articulo.articulo[0] + "'>Precio: "+articulo.articulo[3]+" €</span><span class='modal-carrito__body-total' id='precioTotalCarrito" + articulo.articulo[0] + "'>Total: "+articulo.articulo[3]*articulo.unidades+" €</span><button class='bttn' id='botonEliminarArticulo" + articulo.articulo[0] + "'>Eliminar</button></div>");
        }

        $("#simboloMenosCarrito" + articulo.articulo[0]).on('click', function () {
            let todoPrecio = $("#precioCarrito"+articulo.articulo[0]).text();
            let todoPrecio1 = Number(todoPrecio.slice(7, -2));
=======
            $("#bodyModalCarrito").append("<div id='articuloCarrito" + articulo.articulo[0] + "' class='modalBody__articuloCarrito--oscuro'> <img class='imagenCarrito' src=images/" + articulo.articulo[1] + "><span class='item'>" + articulo.articulo[2] + "</span><button class='modal-carrito-body__boton-menos' id='simboloMenosCarrito" + articulo.articulo[0] + "'> <i class='fas fa-minus'></i></button><span id='unidades" + articulo.articulo[0] + "'class='item'>" + articulo.unidades + "</span><button id='simboloMasCarrito" + articulo.articulo[0] + "' class='modal-carrito-body__boton-mas'> <i class='fas fa-plus'></i></button><span class='modal-carrito__body-precio2' id='precioCarrito'> Precio: " + articulo.articulo[3] +  "€ </span><span class='info' id='precioTotalCarrito" + articulo.articulo[0] + "'> Total: " + articulo.articulo[3] * articulo.unidades + "</span><button class='btn btn-default' id='botonEliminarArticulo" + articulo.articulo[0] + "'>Eliminar</button></div>");

        } else {
            $("#bodyModalCarrito").append("<div id='articuloCarrito" + articulo.articulo[0] + "' class='modalBody__articuloCarrito'> <img class='imagenCarrito' src=images/" + articulo.articulo[1] + "><span class='item'>" + articulo.articulo[2] + "</span><button class='modal-carrito-body__boton-menos' id='simboloMenosCarrito" + articulo.articulo[0] + "'> <i class='fas fa-minus'></i></button><span id='unidades" + articulo.articulo[0] + "' class='item'>" + articulo.unidades + "</span><button id='simboloMasCarrito" + articulo.articulo[0] + "' class='modal-carrito-body__boton-mas'> <i class='fas fa-plus'></i></button><span class='modal-carrito__body-precio' id='precioCarrito'> Precio: " + articulo.articulo[3] + " € </span><span class='info' id='precioTotalCarrito" + articulo.articulo[0] + "'> Total: " + articulo.articulo[3] * articulo.unidades + "</span><button class='btn btn-default' id='botonEliminarArticulo" + articulo.articulo[0] + "'>Eliminar</button></div>");
        }

        $("#simboloMenosCarrito" + articulo.articulo[0]).on('click', function () {
>>>>>>> origin/kevin
            if (Number($("#unidades" + articulo.articulo[0]).text()) > 1) {
                let unidades = Number($("#unidades" + articulo.articulo[0]).text());
                unidades = unidades - 1;
                articulo.unidades = unidades;

                $("#unidades" + articulo.articulo[0]).text(unidades);
<<<<<<< HEAD
                let precioNumber = Number(articulo.articulo[3]);
                precioCompra = precioCompra - precioNumber;
                $("#precioCompra").text("Total: " + precioCompra.toFixed(2) + "€");
                restarTotalArticulo(articulo);
            } else {
                $("#unidades" + articulo.articulo[0]).text(1);
                $("#precioTotalCarrito"+articulo.articulo[0]).text("Total: "+todoPrecio1+" €")
=======
                //$("#precioTotalCarrito" + articulo.articulo[0]).text("Total: " + articulo.articulo[3] * Number($("#unidades" + articulo.articulo[0]).text()));
                let precioNumber = Number(articulo.articulo[3]);
                let unidadesNumber = Number(articulo.unidades);
                precioCompra = precioCompra - precioNumber;
                $("#precioCompra").text("Total: " + precioCompra.toFixed(2) + "€");
            } else {
                $("#unidades" + articulo.articulo[0]).text(1);
>>>>>>> origin/kevin
            }
        });

        $("#simboloMasCarrito" + articulo.articulo[0]).on('click', function () {
            let unidades = Number($("#unidades" + articulo.articulo[0]).text());
            unidades = unidades + 1;
            articulo.unidades = unidades;

            $("#unidades" + articulo.articulo[0]).text(unidades);
<<<<<<< HEAD
            precioNumber = Number(articulo.articulo[3]);
            precioCompra = precioCompra + precioNumber;
            $("#precioCompra").text("Total: " + precioCompra.toFixed(2) + "€");
            sumarTotalArticulo(articulo);
=======
            //$("#precioTotalCarrito" + articulo.articulo[0]).text("Total: " + articulo.articulo[3] * Number($("#unidades" + articulo.articulo[0]).text()));
            precioNumber = Number(articulo.articulo[3]);
            precioCompra = precioCompra + precioNumber;
            $("#precioCompra").text("Total: " + precioCompra.toFixed(2) + "€");

>>>>>>> origin/kevin
        });

        $("#botonEliminarArticulo" + articulo.articulo[0]).click(function () {
            $("#articuloCarrito" + articulo.articulo[0]).remove();
            let pos = arrayCarrito.indexOf(articulo);
            arrayCarrito.splice(pos, 1);
            precioNumber = Number(articulo.articulo[3]);
            unidadesNumber = Number(articulo.unidades);
            precioCompra = precioCompra - (precioNumber * unidadesNumber);
            precioCompra.toFixed(2);
            $("#precioCompra").text("Total: " + precioCompra.toFixed(2) + "€");
        });



    });
    $("#precioCompra").text("Total: " + precioCompra.toFixed(2) + "€");
}

<<<<<<< HEAD
function sumarTotalArticulo(articulo) {
    let todoTotal = $("#precioTotalCarrito"+articulo.articulo[0]).text();
    let todoPrecio = $("#precioCarrito"+articulo.articulo[0]).text();
    let todoTotal1 = Number(todoTotal.slice(7, -2));
    let todoPrecio1 = Number(todoPrecio.slice(7, -2));
    let totalArticuloMostrar = todoTotal1 + todoPrecio1;
    $("#precioTotalCarrito"+articulo.articulo[0]).text("Total: "+totalArticuloMostrar+" €")
}

function restarTotalArticulo(articulo) {
    let todoTotal = $("#precioTotalCarrito"+articulo.articulo[0]).text();
    let todoPrecio = $("#precioCarrito"+articulo.articulo[0]).text();
    let todoTotal1 = Number(todoTotal.slice(7, -2));
    let todoPrecio1 = Number(todoPrecio.slice(7, -2));
    let totalArticuloMostrar = todoTotal1 - todoPrecio1;
    $("#precioTotalCarrito"+articulo.articulo[0]).text("Total: "+totalArticuloMostrar+" €")
=======
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
>>>>>>> origin/kevin
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

    let articulo = [
        id = arti.id,
        imagen = arti.imagen,
        nombre = arti.nombre,
        precio = arti.precio,
        nombreCompleto = arti.nombreEspanyol,
        descripcion = arti.descripcion
    ]
    art.anyadirArticuloAlCarrito(carrito, articulo, 1);
}