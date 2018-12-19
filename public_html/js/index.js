$(document).ready(function () {

    $(".menu-side__titulo").click(function (event) {
        if ($(window).width() <= 726) {
            $(event.target).parent(".menu-side").children(".menu-side__items").toggleClass("menu-side__items--visible");
        }
    });

    let ul = document.createElement("ul");
    ul.className = "menu-side__items";



    function cargarCategorias(json) {
        json["data"].map(function (cat) {
            let divRellenar = document.getElementById("menu-side");
            let li = document.createElement("li");
            li.className = "menu-side__item";
            li.innerHTML = cat.Nombre;
            ul.appendChild(li);
            divRellenar.appendChild(ul);
        });
        
    }

    function cargarCarrusel(json) {
        json["data"].map(function (carr) {
            let Divcontenedor = document.getElementById("carousel-inner")
            let divimagen = document.createElement("div");
            divimagen.className = "carousel-item";

            let imagen = document.createElement("img");
            imagen.className = "carousel__image";
            imagen.src = "images/" + carr.imagenes;

            divimagen.appendChild(imagen);
            Divcontenedor.appendChild(divimagen);

            $(".carousel-inner").children().first().addClass("active");

        });

    }
    let repositorio = new Repository();
    repositorio.getModels("categorias",cargarCategorias);
    repositorio.getModels("carrusel", cargarCarrusel);
    //getModels("carrusel.php", cargarCarrusel);
});