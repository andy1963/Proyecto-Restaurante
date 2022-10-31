<%-- 
    Document   : header
    Created on : 23 oct. 2022, 03:01:45
    Author     : Erick
--%>

<header class="site-header">
    <div class="container-fluid">

        <a href="../Controlador?accion=home" class="site-logo">
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

