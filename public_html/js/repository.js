class Repository {
    constructor(prefijo) {
        let pref = "http://172.16.205.89/pcgo/php/";
        if (this.prefijo == undefined) {
            this.prefijo = pref;
        } else {
            this.prefijo = prefijo;
        }
    }

    getModels(nombre, callback) {
        $.ajax({
            url: this.prefijo + nombre,
            type: 'GET',
            dataType: 'json',
            success: function (json) {
                callback(json);
            },
            error: function (jqXHR, status, error) {
                alert('Disculpe, existió un problema');
            },
            complete: function (jqXHR, status) {}
        });
    };
}