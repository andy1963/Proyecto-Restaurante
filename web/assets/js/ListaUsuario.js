
function llenarFormulario(fila) {
    var codUsuario = $(fila).find(".codUsuario").text();
    var nombreUsuario = $(fila).find(".nombreUsuario").text();
    var contraUsuario = $(fila).find(".contraUsuario").text();
    var rolUsuario = $(fila).find(".rolUsuario").text();
    var empleado = $(fila).find(".empleado").text();


    $("#txtCodigo").val(codUsuario);
    $("#txtUsuario").val(nombreUsuario);
    $("#txtContrasena").val(contraUsuario);
    $("#txtEmpleado option[selected]").removeAttr('selected');
    $("#txtEmpleado option:contains(" + empleado + ")").attr('selected', true);
    $("#txtRol option[selected]").removeAttr('selected');
    $("#txtRol option:contains(" + rolUsuario + ")").attr('selected', true);

}


$(document).ready(function () {
    $('#mydataTable').DataTable();

    $("#mdlFormulario").on("hidden.bs.modal", function () {
        $('form')[0].reset();
        $("#txtRol option[selected]").removeAttr('selected');
        $("#txtEmpleado option[selected]").removeAttr('selected');
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
});
