class Carrito{
    
    constructor(numero){
        this.numero = numero;
        this.articulos = [];
    }
    anyadirArticulo(articulo, unidades){
        let distinto = true;
        if(this.articulos.length == 0){
            this.articulos.push({articulo, unidades});
            console.log({articulo, unidades});
        }else{
            for(let i=0; i < this.articulos.length; i++){
                if(this.articulos[i].articulo[0] == articulo[0]){
                    this.articulos[i].unidades = this.articulos[i].unidades + unidades;
                    distinto = false; 
                }
            }
            if(distinto == true){
                this.articulos.push({articulo, unidades});
            }
        } 
    }

    mostrarArrayArticulos(){
        return this.articulos;
    }
}
