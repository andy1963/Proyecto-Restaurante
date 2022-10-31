<%-- 
    Document   : ListaClientes
    Created on : 27 oct. 2022, 11:42:50
    Author     : Andy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.modelo.Cliente" %>
<%@page import="com.modelo.ClienteDAO" %>
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
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>SIS Comida | Lista Clientes</title>
            <%@include file="../layout/nav/Local.jsp" %>
            <%@include file="../layout/nav/CDN.jsp" %>
            <link href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css" rel="stylesheet">
        </head>
        <body class="with-side-menu">

            <%!
                ClienteDAO clienteDAO = new ClienteDAO();
            %>

            <%@include file="../layout/nav/NavBar.jsp" %>
            <div class="mobile-menu-left-overlay"></div>
            <%@include file="../layout/nav/SideBar.jsp" %>
            <div class="page-content">
                <div class="container-fluid">
                    <section class="card">
                        <header class="card-header">
                            <h3 class="font-weight-bold uppercase">Gestionar Clientes <button type="button" class="agregar btn btn-warning" data-toggle="modal" data-target="#mdlFormulario"><span class="glyphicon glyphicon-plus"></span> Agregar</button></h3>
                        </header>
                    </section>
                    <div class="card-block">
                        <table class="table table-striped" style="font-size: 13px;"  id='mydataTable'>
                            <thead>
                                <tr>
                                    <th scope="col" width="100px">ID Cliente</th>
                                    <th scope="col" width="200px">Nombres</th>
                                    <th scope="col" width="200px">Apellidos</th>
                                    <th scope="col">Acciones</th>
                                </tr>
                            </thead>
                            <tbody style="font-size: 13px;">
                                <%
                                    ArrayList<Cliente> listaCliente = clienteDAO.mostrarCliente();

                                    for (Cliente elem : listaCliente) {
                                %>
                                <tr>
                                    <td class="codCliente"><%= elem.getCodCliente()%></td>
                                    <td class="nombresCliente"><%= elem.getNombresCliente()%></td>
                                    <td class="apellidosCliente"><%= elem.getApellidosCliente()%></td>
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
                                            Cliente
                                        </div>
                                    </div>
                                    <form class="form" action="${pageContext.servletContext.contextPath}/ServletListaClientes" method="POST">
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <input type="hidden" class="form-control" id="txtCodigo" name="txtCodigo" value="0" readonly="true" required>
                                                <label for="name">Nombres:</label>
                                                <input type="text" class="form-control" id="txtNombres" name="txtNombres" placeholder="Ingrese nombres" required>
                                                <label for="name">Apellidos:</label>
                                                <input type="text" class="form-control" id="txtApellidos" name="txtApellidos" placeholder="Ingrese apellidos" required>
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
            <script src="${pageContext.servletContext.contextPath}/assets/js/ListaCliente.js"></script> 
            <!-- JS local de app -->
            <script src="${pageContext.servletContext.contextPath}/assets/js/app.js"></script>
        </body >
    </html>
