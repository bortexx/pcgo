class Repository {
    constructor(prefijo) {
        let pref = window.location.href + "api/";
        console.log(pref);
        if (this.prefijo == undefined) {
            this.prefijo = pref;
        } else {
            this.prefijo = prefijo;
        }
    }

    getModels(nombre, callback) {
        if (this.data == undefined) {
            this.data == "";
        }
        $.ajax({
            url: this.prefijo + nombre,
            type: 'GET',
            dataType: 'json',
            success: function (json) {
                callback(json);
            },
            error: function (jqXHR, status, error) {
                indexController.comprobarErrorApi(jqXHR.status);
            },
            complete: function (jqXHR, status) {}
        });
    };

    getModelosTipo(nombre, callback, tipo) {
        $.ajax({
            url: this.prefijo + nombre + "/" + tipo,
            type: 'GET',
            dataType: 'json',
            success: function (json) {
                callback(json);
            },
            error: function (jqXHR, status, error) {
                indexController.comprobarErrorApi(jqXHR.status);
            },
            complete: function (jqXHR, status) {}
        });
    }

    postModels(nombre, callback, data) {
        $.ajax({
            url: this.prefijo + nombre,
            type: 'POST',
            data: data,
            dataType: "text",
            success: function (a) {
                callback(a);
            },

            error: function (jqXHR, status, error) {
                indexController.comprobarErrorApi(jqXHR.status);
            },
            complete: function (jqXHR, status) {}
        });
    }


};