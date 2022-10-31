<%-- 
    Document   : listaCategoria
    Created on : 23 oct. 2022, 23:12:54
    Author     : Erick
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.modelo.Categoria" %>
<%@page import="com.modelo.CategoriaDAO" %>
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
        <title>SIS Comida | Categorias</title>
        <%@include file="../layout/nav/Local.jsp" %>
        <%@include file="../layout/nav/CDN.jsp" %>
    </head>
    <body class="with-side-menu">
        <%!
            CategoriaDAO categoriaDAO = new CategoriaDAO();
        %>
        <%@include file="../layout/nav/NavBar.jsp" %>
        <div class="mobile-menu-left-overlay"></div>
        <%@include file="../layout/nav/SideBar.jsp" %>
        <div class="page-content">
            <div class="container-fluid">
                <section class="card">
                    <header class="card-header">
                        <h3 class="font-weight-bold uppercase">Lista De Categorias <button type="button" class="agregar btn btn-success" data-toggle="modal" data-target="#mdlFormulario"><span class="glyphicon glyphicon-plus"></span> Agregar</button></h3>
                    </header>
                </section>
                <div class="card-block">
                    <table class="table table-striped" style="font-size: 13px;"  id='mydataTable'>
                        <thead>
                            <tr>
                                <th scope="col">Codigo</th>
                                <th scope="col" width="200px">Nombre</th>
                                <th scope="col" width="400px">Descripción</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody style="font-size: 13px;">
                            <%
                                ArrayList<Categoria> listaC = categoriaDAO.mostrarCategorias();

                                for (Categoria elem : listaC) {
                            %>
                            <tr>
                                <td class="codigo"><%= elem.getCodCategoria()%></td>
                                <td class="nombre"><%= elem.getNombreCategoria()%></td>
                                <td class="descripcion"><%= elem.getDescripcion()%></td>
                                <td>
                                    <button type="button" class="editar btn btn-primary" id="editar" data-toggle="modal" data-target="#mdlFormulario">
                                        <span class="glyphicon glyphicon-pencil"></span> Modificar
                                    </button>
                                    <button type="button" class="eliminar btn btn-danger" id="eliminar" data-toggle="modal" data-target="#mdlFormulario">
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
                                        Categoría
                                    </div>
                                </div>
                                <form class="form" action="${pageContext.servletContext.contextPath}/ServletListaCategoria" method="POST">
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <input type="number" name="codigo" id="codigo" class="form-control" value="0" readonly hidden>
                                            <label for="name">Nombre de categoria:</label>
                                            <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese nombre" required>
                                            <label for="name">Descripción de categoria:</label>
                                            <input type="text" class="form-control" id="descripcion" name="descripcion" placeholder="Ingrese descripción" required>
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
        <script src="${pageContext.servletContext.contextPath}/assets/js/ListaCategoria.js"></script> 
        <!-- JS local de app -->
        <script src="${pageContext.servletContext.contextPath}/assets/js/app.js"></script>
    </body>
</html>