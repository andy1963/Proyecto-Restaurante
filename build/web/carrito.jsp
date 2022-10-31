<%-- 
    Document   : carrito
    Created on : 29 oct. 2022, 01:47:07
    Author     : Erick
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="layout/nav/Local.jsp" %>
        <%@include file="layout/nav/CDN.jsp" %>
        <style>@media print{.noshow{display:none}}</style>
    </head>
    <header class="site-header">
        <div class="container-fluid">
            <a href="Controlador?accion=home" class="site-logo">
                <img class="hidden-md-down" src="${pageContext.servletContext.contextPath}/assets/img/icon_menu.png" alt="">
                <img class="hidden-lg-up" src="${pageContext.servletContext.contextPath}/assets/img/icon_menu.png" alt="">
            </a>

            <button id="show-hide-sidebar-toggle" class="show-hide-sidebar">
                <span>menu |||</span>
            </button>

            <button class="hamburger hamburger--htla">
                <span>menu |||</span>
            </button>
            <div class="site-header-content">
                <div class="site-header-content-in">
                    <a href="Controlador?accion=home">
                        <img class="hidden-md-down" src="${pageContext.servletContext.contextPath}/assets/img/compra.png" alt="">
                        (<label style="color: orange; font-size: 14px">${contador}</label>)</i>Realizar otra orden</a>
                    <div class="site-header-shown">
                        <div class="dropdown user-menu">
                            <button class="dropdown-toggle" id="dd-user-menu" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="${pageContext.servletContext.contextPath}/assets/img/usuario.png">
                            </button>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dd-user-menu">
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/login.jsp?cerrar=true"><span class="font-icon glyphicon glyphicon-log-out"></span>Cerrar Sesion</a>
                                <div class="dropdown-divider"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <body class="with-side-menu">
        <div class="mobile-menu-left-overlay"></div>
        <%@include file="layout/nav/SideBar.jsp" %>
        <div class="page-content">
            <div class="container-fluid">
                <section class="card">
                    <header class="card-header">
                        <h3 class="font-weight-bold uppercase">Factura Orden</h3>
                    </header>
                </section>
                <div class="card-block">
                    <table class="table table-striped" style="font-size: 13px;">
                        <thead>
                            <tr>
                                <th scope="col">CODIGO</th>
                                <th scope="col">NOMBRE</th>
                                <th scope="col">DESCRIPCION</th>
                                <th scope="col">IMG</th>
                                <th scope="col">PRECIO</th>
                                <th scope="col" width="70">CANT</th>
                                <th scope="col">$ SUBTOTAL</th>
                                <th scope="col" class="noshow">ACCIONES</th>
                            </tr>
                        </thead>
                        <tbody style="font-size: 13px;">
                            <c:forEach var="car" items="${carrito}">
                                <tr>
                                    <td>${car.getItem()}</td>
                                    <td>${car.getNombres()}</td>
                                    <td> ${car.getDescripcion()}</td>
                                    <td><img src="ControladorIMG?id=${car.getIdProducto()}" width="100px"></td>
                                    <td>${car.getPrecioCompra()}</td>
                                    <td>
                                        <input type="hidden" id="idpro" value="${car.getIdProducto()}">
                                        <input type="number" id="Cantidad" value="${car.getCantidad()}" class="form-control text-center" min="1">
                                    </td>
                                    <td>$${car.getSubTotal()}</td>
                                    <td class="noshow">
                                        <input type="hidden" id="idp" value="${car.getIdProducto()}">
                                        <button type="button" id="btnDelete" class="btn btn-danger" data-toggle="modal" data-target="#mdlFormulario">
                                            <span class="glyphicon glyphicon-remove"></span> Eliminar
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <form class="form">
                        <div class="modal-body">
                            <div class="form-group">
                                <label>SubTotal:</label>
                                <input type="text" value="$${totalPagar}" readonly="" class="form-control">
                                <label>Total Pagar:</label>
                                <input type="text" value="$${totalPagar}" readonly="" class="form-control">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <a href="Controlador?accion=GenerarCompra" onclick="print()" class="noshow btn btn-success btn-block">Generar Factura</a>
                        </div>
                    </form>
                            
                </div>
            </div>
        </div>     

        <script src="${pageContext.servletContext.contextPath}/assets/js/app.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha512-5WvZa4N7Jq3TVNCp4rjcBMlc6pT3lZ7gVxjtI6IkKW+uItSa+rFgtFljvZnCxQGj8SUX5DHraKE6Mn/4smK1Cg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="assets/js/funciones.js" type="text/javascript"></script>
    </body>
</html>
