

function llenarFormulario(fila) {
    var codEmpleado = $(fila).find(".codEmpleado").text();
    var nombresEmpleado = $(fila).find(".nombresEmpleado").text();
    var apellidosEmpleado = $(fila).find(".apellidosEmpleado").text();
    var teleEmpleado = $(fila).find(".teleEmpleado").text();
    var emailEmpleado = $(fila).find(".emailEmpleado").text();


    $("#txtCodigo").val(codEmpleado);
    $("#txtNombres").val(nombresEmpleado);
    $("#txtApellidos").val(apellidosEmpleado);
     $("#txtTelefono").val(teleEmpleado);
    $("#txtEmail").val(emailEmpleado);
    
    
}


    $(document).ready(function () {
        $('#mydataTable').DataTable();
        
        $("#mdlFormulario").on("hidden.bs.modal", function(){
        $('form')[0].reset();
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


