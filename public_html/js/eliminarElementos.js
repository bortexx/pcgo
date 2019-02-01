class EliminarElemento {
    eliminarElemento(elemento) {
        var div = document.getElementById(elemento);
        if (div !== null) {
            while (div.hasChildNodes()) {
                div.removeChild(div.lastChild);
            }
        } else {
            console.log("no existe caja");
        }
    };
};