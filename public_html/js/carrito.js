<<<<<<< HEAD
class Carrito{
    constructor(numero){
        this.numero = numero;
        this.articulos = [];
    }
    anyadirArticulo(articulo){
        this.articulos.push(articulo);
    }
}
=======
class Carrito{
    constructor(numero){
        this.numero = numero;
        this.articulos = [];
    }
    anyadirArticulo(articulo){
        if(this.articulos.length == 0){
            this.articulos.push(articulo);
        }else{
            this.articulos.map(function(articulo1){
                console.log(articulo1);
                if(articulo1.id == articulo.id){  
                    let unidadesArticuloNuevo = articulo.unidades;//Esto coje el id del articulo pasado por paramentro al metodo(que es el articulo entrante)
                    articulo1.unidades = articulo1.unidades + unidadesArticuloNuevo;
                }else{
                    this.articulos.push(articulo);
                }
            });
        }  
    }

    mostrarArrayArticulos(){
        return this.articulos;
    }
}
>>>>>>> ramses1
