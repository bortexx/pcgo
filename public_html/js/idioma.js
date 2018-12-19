$(document).ready(function () {
    let repository = new Repository();
    let ul = document.getElementById("menu-side__items");

    var select = document.getElementById('idioma');
    select.addEventListener('change',
        function () {
            var selectedOption = this.options[select.selectedIndex];
            console.log(selectedOption.text);
            if (selectedOption.value == "es") {
                eliminarCategorias();
                repository.getModels("categorias", cargarEspanyol);
            } else {
                eliminarCategorias();
                repository.getModels("categorias", cargarIngles);
            }
        });


    function cargarIngles(json) {
        json["data"].map(function (cat) {
            let ul = document.getElementById("menu-side__items");
            let li = document.createElement("li");
            li.className = "menu-side__item";
            li.innerHTML = cat.Ingles;
            ul.appendChild(li);
        });
        document.getElementById("Registro").innerHTML = "Sign Up";
    }

    function cargarEspanyol(json) {
        json["data"].map(function (cat) {
            let ul = document.getElementById("menu-side__items");
            let li = document.createElement("li");
            li.className = "menu-side__item";
            li.innerHTML = cat.Nombre;
            ul.appendChild(li);
        });
        document.getElementById("Registro").innerHTML = "Registro";

    }

    function eliminarCategorias() {
        var div = document.getElementById('menu-side__items');
        if (div !== null) {
            while (div.hasChildNodes()) {
                div.removeChild(div.lastChild);
            }
        } else {
            alert("No existe la caja previamente creada.");
        }
    }

});