class Articulo {
    constructor(id, imagen, nombre, precio, nombreCompleto, descripcion) {
        this.id = id;
        this.imagen = imagen;
        this.nombre = nombre;
        this.precio = precio;
        this.nombreCompleto = nombreCompleto;
        this.descripcion = descripcion;
    }

    anyadirArticuloAlCarrito(carrito, articulo, unidades) {
        carrito.anyadirArticulo(articulo, unidades);
        indexController.cambiarColorCarrito();
    }

    mostrarArticulo(a) {
        let id = a.id;
        let imagen = a.childNodes[0].src;
        let splitImagen = imagen.split("/");
        let imagenCortada = splitImagen[splitImagen.length-1];

        let nombre = a.childNodes[1].innerHTML;

        let precio = a.childNodes[2].innerHTML;

        let nombreCompleto = a.childNodes[3].innerHTML;

        let descripcion = a.childNodes[4].innerHTML;

        let split = precio.split(" ");
        let precioCortado = split[0];

        let producto= {
            id:id,
            imagen:imagenCortada,
            precio:precioCortado,
            nombre:nombre,
            nombreCompleto:nombreCompleto,
            descripcion:descripcion,
        }
        return producto;
    }
}