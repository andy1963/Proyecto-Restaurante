
function llenarFormulario(fila) {
    var codigoCiente = $(fila).find(".codCliente").text();
    var nombresCliente = $(fila).find(".nombresCliente").text();
    var apellidosCliente = $(fila).find(".apellidosCliente").text();

    $("#txtCodigo").val(codigoCiente);
    $("#txtNombres").val(nombresCliente);
    $("#txtApellidos").val(apellidosCliente);
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
