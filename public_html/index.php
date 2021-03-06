<!DOCTYPE html>
<html>

<head>
    <title>PCGO</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ"
        crossorigin="anonymous">
    <link rel="shortcut icon" href="images/logo.png" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link href="vendor/font-awesome/css/all.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Aleo|Libre+Baskerville|Libre+Franklin|Oswald|Roboto+Mono" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="css/style.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="js/repository.js" type="text/javascript"></script>
    <script src="js/eliminarElementos.js" type="text/javascript"></script>
    <script src="js/articulo.js" type="text/javascript"></script>
    <script src="js/carrito.js" type="text/javascript"></script>
    <script src="js/IndexController.js" type="text/javascript"></script>
    <script src="js/index.js" type="text/javascript"></script>

</head>


<body class="body">
    <div class="l-landing-page">

        <button class="boton-carrito-flotante" data-toggle='modal' data-target='#modalCarrito' onclick="mostrarCarrito()"><i
                class=" fas fa-shopping-cart"></i></button>

        <header class="l-landing-page__header">
            <nav class="main-menu">
                <ul class="main-menu__items" id="prueba">
                    <li class="main-menu__item" id="hamburguesa">
                        <i class="fas fa-bars menu-side__hamburguesa"></i>
                    </li>
                    <li class="main-menu__logo">
                        <a id="redireccionLogo"><img class="logo" src="images/white.png" /></a>
                    </li>

                    <?php
session_start();
if (isset($_SESSION['nombreUsuario'])) {
    ?>
                    <div class="menu-usuario menu-usuario--derecha">
                        <div class="menu-usuario__nombre">
                            <li class="main-menu__item">
                                <a><span id="" class="main-menu__login">
                                        <?php echo ucfirst($_SESSION['nombreUsuario']); ?></span></a>
                                <a><i class="fas fa-user main-menu__icon-login"></i></a>
                            </li>
                        </div>
                        <div class="menu-usuario__desplegable">
                            <div class="menu-usuario__item">
                                <a><span id="" class="main-usuario__texto">Preferencias</span></a>
                            </div>
                            <div class="menu-usuario__item">
                                <a><span id="" class="main-usuario__texto">Mi tienda</span></a>
                            </div>
                            <div class="menu-usuario__item menu-usuario__item--invisible">
                                <a><span id="" class="main-usuario__texto">Logout</span></a>
                            </div>
                        </div>
                    </div>

                    <li class="main-menu__item main-menu__item--seleccionado">
                        <a onclick="logout()"><span id="logout" class="main-menu__login"><i class="fas fa-sign-out-alt"></i></span></a>
                        <a onclick="logout()"><i class="fas fa-sign-out-alt main-menu__icon-register"></i></a>

                    </li>
                    <?php
} else {
    ?>

                    <li class="main-menu__item main-menu__item--derecha main-menu__item--seleccionado">
                        <a><span class="main-menu__login" data-toggle='modal' data-target='#loginModal'>Login</span></a>
                        <a><i class="fas fa-user main-menu__icon-login " data-toggle='modal' data-target='#loginModal'></i></a>
                    </li>
                    <li class="main-menu__item main-menu__item--seleccionado">
                        <a><span class="main-menu__register" data-toggle='modal' data-target='#registrarseModal'>Registro</span></a>
                        <a><i class="fas fa-lock main-menu__icon-register" data-toggle='modal' data-target='#registrarseModal'></i></a>
                    </li>

                    <?php
}
?>

                    <li class="main-menu__item main-menu__item--invisible" ondrop="drop(event)" ondragover="allowDrop(event)">
                        <a id="imagen" data-toggle='modal' data-target='#modalCarrito' onclick="mostrarCarrito()"><img
                                src="images/icons8-add-shopping-cart-32.png" /></a>
                    </li>
                </ul>
            </nav>
        </header>

        <div class="l-landing-page__carousel">

            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner" id="carousel-inner">

                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">next</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
            </div>
        </div>

        <aside class="l-landing-page__aside" id="l-landing-page__aside">
            <div class="menu-side" id="menu-side">
                <div id="Categorias" class="menu-side__titulo">Categorias</div>
            </div>
        </aside>

        <div class="l-landing-page__container" id="l-landing-page__container">
            <div id="productos" class="productos">
            </div>
        </div>


        <footer class="l-landing-page__footer">

            <div class="footer">
                <div class="footer__izquierda">
                    <a href="http://localhost/pcgo/"><img class="logo" src="images/white.png" /></a>

                    <div class="footer__links">
                        <a href="#">Home</a>

                        <a id="about" data-toggle='modal' data-target='#modalAbout'>About</a>

                        <a href="#">Faq</a>

                        <a href="#">Contact</a>
                    </div>
                </div>

                <div class="footer__centro">
                    <div class="footer__item-centro">
                        <i class="fa fa-map-marker"></i>
                        Av. Imaginaria. Valencia, España
                    </div>

                    <div class="footer__item-centro">
                        <i class="fa fa-phone"></i>
                        123456789
                    </div>

                    <div class="footer__item-centro">
                        <i class="fa fa-envelope"></i>
                        <a href="mailto:pcgo@gmail.com">pcgo@gmail.com</a>
                    </div>
                </div>

                <div class="footer__derecha">
                    <span>Redes Sociales</span>
                    <div class="footer__iconos">
                        <a href="#"><i class="fab fa-facebook"></i><span>Facebook</span></a>
                        <a href="#"><i class="fab fa-twitter"></i><span>Twitter</span></a>
                        <a href="#"><i class="fab fa-instagram"></i><span>Instagram</span></a>

                    </div>
                </div>
                <div class="footer__copyright">
                    PCGO &copy; 2018-2019
                </div>
            </div>
        </footer>
    </div>
        <!-- Modal -->

        <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                <div class="loginmodal-container">
                    <h1>Login</h1><br>
                    <form id="form-login" method="post"  >
                        <input id="usuarioLogin" type="text" name="usuario" placeholder="Usuario">
                        <input id="contrasenyaLogin" type="password" name="contrasenya" placeholder="Contraseña">
                        <button class='loginmodal-container__boton' onclick="login()">Enviar</button>
                    </form>
                </div>
            </div>
        </div>
        </div>

        <div class="modal fade" id="registrarseModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
            aria-hidden="true" style="display: none;">
            <div class="modal-dialog">
            <div class="modal-content">
                <div class="loginmodal-container">
                    <h1>Registrate</h1><br>
                    <form name="registro" method="post" onsubmit="return false">
                        <input id="correoRegistro" type="text" name="correo" placeholder="Correo Electrónico">
                        <input id="dni" type="text" name="dni" placeholder="DNI">
                        <input id="nombreRegistro" type="text" name="nombre" placeholder="Nombre">
                        <input id="apellidosRegistro" type="text" name="apellidos" placeholder="Apellidos">
                        <input id="direccionRegistro" type="text" name="direccion" placeholder="Dirección">
                        <input id="codigoPostalRegistro" type="text" name="codigoPostal" placeholder="Código Postal">
                        <input id="usuarioRegistro" type="text" name="usuario" placeholder="Usuario">
                        <input id="contrasenyaRegistro" type="password" name="contraseña" placeholder="Contraseña">
                        <input type="submit" id="btnRegistro" value="Registrarme!"/>
                    </form>

                    <div class="login-help">
                    </div>
                </div>
            </div>
            </div>

        </div>
   <!-- Modal Carito-->
   <div id="modalCarrito" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content modal-content--tamaño">
            <div class="modal-header modal-headerCarrito">
                <h5 class='modal-header-carrito__titulo'>Carrito GO</h5>
                <button type="button" class="close modal-header-carrito__close" data-dismiss="modal">&times;</button>
            </div>
            <div id="bodyModalCarrito" class="modal-body">

            </div>
            <div class="modal-footer">
                <p class="modal-footer__precio" id='precioCompra'></p>
                <button id="botonComprar" type="button" class="modal-footer__boton-comprar" data-dismiss="modal">Comprar</button>
            </div>
            </div>

        </div>
    </div>
        <!-- Modal -->

        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header modal-headerProducto">
                        <h5 class="modal-header__titulo modal-title" id="modaltitulo"></h5>
                        <button id="cerrarModal" type="button" class="close modal-header-producto__close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body-a" id="modalbody">
                        <div id="modalimagen">

                        </div>
                        <div class="modal-derecha">

                            <div class="modal-body__nombre" id="modalNombre">

                            </div>
                            <div class="modal-body__precio" id="modalprecio">

                            </div>

                            <div class="modal-body__contador" id="contadorUnidades">
                                <button class="moda-body__boton-menos" id="simboloMenos"> <i class="fas fa-minus"></i></button>
                                <span id='numeroContador' class="modal-body__unidades">1</span>
                                <button id="simboloMas" class="moda-body__boton-mas"> <i class="fas fa-plus"></i></button>

                            </div>

                        </div>

                    </div>
                    <div class="modal-body-b" id="modalbodyb">
                        <div class="modal-body__descripcion" id="modalDescripcion">

                        </div>
                    </div>
                    <div class="modal-footer1">
                        <button type="button" id="botonAnyadirAlCarrito" class="modal__botonPrimario">Añadir al carrito</button>
                    </div>
                </div>
            </div>
        </div>


  <!-- Modal Carito-->
  <div id="modalAbout" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content modal-content--tamaño">
            <div class="modal-header modal-headerCarrito">
                <h5 class='modal-header-carrito__titulo'>About us</h5>
                <button type="button" class="close modal-header-carrito__close" data-dismiss="modal">&times;</button>
            </div>
            <div id="bodyModalCarrito" class="modal-body">
                <div class="about-us">
                    <img class="about-us__image" src="images/aboutus.jpg"/>
                    <span class="about-us__text-tittle">-Who we are?-</span>
                    <span class="about-us__text-content">We are PCGO, an electronics store, funded in 2018.</span>
                    <span class="about-us__text-tittle">-History-</span>
                    <span class="about-us__text-content">The idea came from a group of friends in which we wanted the customer to come first so we decided to create PCGO.</span>
                    <span class="about-us__text-tittle">-What we offer?-</span>
                    <span class="about-us__text-content">We sell the best products at the best price like laptops, computers and smartphones among other things.</span>
                    <span class="about-us__text-content">We also offer the best technical support and the best features which makes our customers always happy.</span>
                </div>
            </div>
            </div>

        </div>
    </div>


</body>

</html>