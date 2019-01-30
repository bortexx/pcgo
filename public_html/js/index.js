<<<<<<< HEAD
let carrito = new Carrito(3);
let indexController = new IndexController();
let repository = new Repository();
let eliminarElemento = new EliminarElemento();
let articulo = new Articulo();

$(document).ready(function () {
    indexController.mostrarCategoriasDesplegable();
    repository.getModels("categorias", indexController.mostrarCategorias);
    repository.getModels("productos", indexController.mostrarProductos);
    repository.getModels("carrusel", indexController.mostrarCarrusel);
});
=======
let carrito = new Carrito(3);
let indexController = new IndexController();
let repository = new Repository();
let eliminarElemento = new EliminarElemento();
let articulo = new Articulo();

$(document).ready(function () {

    indexController.mostrarCategoriasDesplegable();
    repository.getModels("categorias", indexController.mostrarCategorias);
    repository.getModels("productos", indexController.mostrarProductos);
    repository.getModels("carrusel", indexController.mostrarCarrusel);

});
>>>>>>> ramses1
