<%-- 
    Document   : index
    Created on : 29 oct. 2022, 01:41:10
    Author     : Erick
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%
    HttpSession sesion = request.getSession();
    //validacion de la pagina si es administrador
    if (sesion.getAttribute("nivel") == null) {
        response.sendRedirect("login.jsp");
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
        <title>SIS - Menu</title>
        <%@include file="layout/nav/Local.jsp" %>
        <%@include file="layout/nav/CDN.jsp" %>
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
                    <a href="Controlador?accion=Carrito">
                        <img src="${pageContext.servletContext.contextPath}/assets/img/compra.png" alt="">
                        (<label style="color: orange; font-size: 14px">${contador}</label>)</i>
                    </a>
                    <div class="site-header-shown">
                        <div class="dropdown user-menu">
                            <button class="dropdown-toggle" id="dd-user-menu" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="${pageContext.servletContext.contextPath}/assets/img/usuario.png">
                            </button>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dd-user-menu">
                                <a class="dropdown-item"><span class="glyphicon glyphicon-user"> <%= sesion.getAttribute("usuario")%></span></a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/login.jsp?cerrar=true"><span class="font-icon glyphicon glyphicon-log-out"></span>Cerrar Sesion</a>
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
                        <h3 class="font-weight-bold uppercase">Menu De Comida <button type="button" class="agregar btn btn-icon" data-toggle="modal" data-target="#mdlFormulario"><a href="Controlador?accion=home" style="color: black; font-size: 15px"><span class="glyphicon glyphicon-eye-open"></span> Ver</button></a></h3>
                    </header>
                </section>
                <div class="card-block">

                    <div class="tab-content">
                        <c:forEach var="p" items="${productos}">
                            <div class="col-sm-6 col-md-4">
                                <div class="thumbnail">
                                    <img src="ControladorIMG?id=${p.getCodPlatillo()}" alt="img">
                                    <div class="price">$${p.getPrecio()}</div>
                                    <div class="caption">
                                        <h4>${p.getNombrePlatillo()}</h4>
                                        <p>${p.getDescripcionPlatillo()}</p>
                                        <a href="Controlador?accion=AgregarCarrito&id=${p.getCodPlatillo()}" class="btn btn-order" role="button"><span class="glyphicon glyphicon-shopping-cart"></span> Ordenar</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <script src="${pageContext.servletContext.contextPath}/assets/js/app.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
