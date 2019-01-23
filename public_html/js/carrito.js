class Carrito{
    constructor(numero){
        this.numero = numero;
        this.articulos = [];
    }
    anyadirArticulo(articulo){
        this.articulos.push(articulo);
    }
}