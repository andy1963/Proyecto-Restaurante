function llenarFormulario(fila) {
    var codigo = $(fila).find(".codigo").text();
    var nombre = $(fila).find(".nombre").text();
    var descripcion = $(fila).find(".descripcion").text();
    var precio = $(fila).find(".precio").text();
    var categoria = $(fila).find(".categoria").text();

    $("#codigo").val(codigo);
    $("#nombre").val(nombre);
    $("#descripcion").val(descripcion);
    $("#precio").val(precio);
    $("#sCategoria option[selected]").removeAttr('selected');
    $("#sCategoria option:contains(" + categoria + ")").attr('selected', true);
}

$("#mdlFormulario").on("hidden.bs.modal", function () {
    $('form')[0].reset();
    $("#sCategoria option[selected]").removeAttr('selected');
});

$(document).on('click', '.agregar', function () {
    $('.btnOcultaE').attr('disabled', 'disabled');
    $('.btnOcultaB').attr('disabled', 'disabled');
    $('.btnOcultaR').removeAttr('disabled');
});

$(document).on('click', '.editar', function () {
    llenarFormulario($(this).closest('tr'));
    $('.btnOcultaR').attr('disabled', 'disabled');
    $('.btnOcultaB').attr('disabled', 'disabled');
    $('.btnOcultaE').removeAttr('disabled');
});

$(document).on('click', '.eliminar', function () {
    llenarFormulario($(this).closest('tr'));
    $('.btnOcultaR').attr('disabled', 'disabled');
    $('.btnOcultaE').attr('disabled', 'disabled');
    $('.btnOcultaB').removeAttr('disabled');
});

$(document).ready(function () {

    $(document).ready(function () {
        $('#mydataTable').DataTable();
    });
});


