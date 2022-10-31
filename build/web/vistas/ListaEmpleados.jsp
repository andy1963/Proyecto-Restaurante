<%-- 
    Document   : ListaEmpleados
    Created on : 29 oct. 2022, 1:11:20 a. m.
    Author     : CEJMC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.modelo.Empleado" %>
<%@page import="com.modelo.EmpleadoDAO" %>
<%@page import="java.util.ArrayList" %>
<%@page session="true" %>
<%
    HttpSession sesion = request.getSession();
    //validacion de la pagina si es administrador
    if (sesion.getAttribute("nivel") == null) {
        response.sendRedirect("../login.jsp");
    } else {
        String nivel = sesion.getAttribute("nivel").toString();
        if (!nivel.equals("1")) {
            response.sendRedirect("login.jsp");
        }
    }
%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Clientes</title>
        <%@include file="../layout/nav/Local.jsp" %>
        <%@include file="../layout/nav/CDN.jsp" %>
        <link href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css" rel="stylesheet">
    </head>
    <body class="with-side-menu">

        <%!
            EmpleadoDAO empleadoDAO = new EmpleadoDAO();
        %>

        <%@include file="../layout/nav/NavBar.jsp" %>
        <div class="mobile-menu-left-overlay"></div>
        <%@include file="../layout/nav/SideBar.jsp" %>
        <div class="page-content">
            <div class="container-fluid">
                <section class="card">
                    <header class="card-header">
                        <h3 class="font-weight-bold uppercase">Gestionar Empleados <button type="button" class="agregar btn btn-warning" data-toggle="modal" data-target="#mdlFormulario"><span class="glyphicon glyphicon-plus"></span> Agregar</button></h3>
                    </header>
                </section>
                <div class="card-block">
                    <table class="table table-striped" style="font-size: 13px;"  id='mydataTable'>
                        <thead>
                            <tr>
                                <th scope="col">ID Cliente</th>
                                <th scope="col" width="150px">Nombres</th>
                                <th scope="col" width="150px">Apellidos</th>
                                <th scope="col">Número</th>
                                <th scope="col">Email</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody style="font-size: 13px;">
                            <%
                                ArrayList<Empleado> lista = empleadoDAO.mostrarEmpleado();

                                for (Empleado elem : lista) {
                            %>
                            <tr>
                                <td class="codEmpleado"><%= elem.getCodEmpleado()%></td>
                                <td class="nombresEmpleado"><%= elem.getNombres()%></td>
                                <td class="apellidosEmpleado"><%= elem.getApellidos()%></td>
                                <td class="teleEmpleado"><%= elem.getTelefono()%></td>
                                <td class="emailEmpleado"><%= elem.getEmail()%></td>
                                <td>
                                    <button type="button" class="editar btn btn-primary" id="btnEditar" data-toggle="modal" data-target="#mdlFormulario">
                                        <span class="glyphicon glyphicon-pencil"></span> Modificar
                                    </button>
                                    <button type="button" class="eliminar btn btn-danger" data-toggle="modal" data-target="#mdlFormulario">
                                        <span class="glyphicon glyphicon-remove"></span> Eliminar
                                    </button>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                    <!-- Modal para agregar, modificar y eliminar-->
                    <div class="modal fade" id="mdlFormulario" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: #ff8c44;">
                                    <div class="modal-title uppercase" style="text-align: center; font-size: 20px; color: white; text-shadow: -1px -1px 1px #333, 1px -1px 1px #333, -1px 1px 1px #333, 1px 1px 1px #333;">
                                        Empleado
                                    </div>
                                </div>
                                <form class="form" action="${pageContext.servletContext.contextPath}/ServletListaEmpleado" method="POST">
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <input type="hidden" class="form-control" id="txtCodigo" name="txtCodigo" value="0" readonly="true" required>
                                            <label for="name">Nombres:</label>
                                            <input type="text" class="form-control" id="txtNombres" name="txtNombres" placeholder="Ingrese nombres" required>
                                            <label for="name">Apellidos:</label>
                                            <input type="text" class="form-control" id="txtApellidos" name="txtApellidos" placeholder="Ingrese apellidos" required>
                                            <label for="name">Telefono:</label>
                                            <input type="text" class="form-control" id="txtTelefono" name="txtTelefono" placeholder="Ingrese su numero de telefono" required>
                                            <label for="name">Email:</label>
                                            <input type="text" class="form-control" id="txtEmail" name="txtEmail" placeholder="Ingrese su correo" required>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btnOcultaR btn btn-success" name="btnRegistrar" id="btnRegistrar">Registrar</button>       
                                        <button type="submit" class="btnOcultaE btn btn-primary" name="btnEditar" id="btnEditar">Editar</button>
                                        <button type="submit" class="btnOcultaB btn btn-danger" name="btnEliminar" id="btnEliminar">Borrar</button>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>

        <%
            if (request.getAttribute("message") != null) {
        %> 
        <script>
            $(document).ready(function () {
                Swal.fire({
                    position: 'top-center',
                    icon: 'success',
                    title: '<%= request.getAttribute("message")%>',
                    showConfirmButton: false,
                    timer: 3000
                });
            });
        </script>
        <%
            }
        %>
        <script src="${pageContext.servletContext.contextPath}/assets/js/ListaEmpleado.js"></script> 
    </body >
</html>
