<%-- 
    Document   : navBar
    Created on : 23 oct. 2022, 01:56:25
    Author     : Erick
--%>

<nav class="side-menu">
    <ul class="side-menu-list">
        <li>
            <a href="${pageContext.servletContext.contextPath}/vistas/ListaUsuarios.jsp" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="glyphicon glyphicon-user"></span>
                    <span class="menu-collapsed">Gestionar Usuarios</span>
                </div>
            </a>
        </li>

        <li>
            <a href="${pageContext.servletContext.contextPath}/vistas/ListaEmpleados.jsp" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="glyphicon"><img src="${pageContext.servletContext.contextPath}/assets/img/empleado.png"></span>
                    <span class="menu-collapsed">Gestionar Empleados</span>
                </div>
            </a>
        </li>

        <li>
            <a href="${pageContext.servletContext.contextPath}/vistas/ListaClientes.jsp"aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="glyphicon"><img src="${pageContext.servletContext.contextPath}/assets/img/cliente.png"></span>
                    <span class="menu-collapsed">Gestionar Clientes</span>
                </div>
            </a>
        </li>

        <li>
            <a href="#submenu4" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="glyphicon"><img src="${pageContext.servletContext.contextPath}/assets/img/menu.png"></span>
                    <span class="menu-collapsed">Gestionar Menu</span>
                    <span class="icono derecha glyphicon glyphicon-chevron-down">
                </div>
            </a>

            <div id='submenu4' class="collapse sidebar-submenu">
                <a href="${pageContext.servletContext.contextPath}/Controlador?accion=home" class="list-group-item list-group-item-action">
                    <span class="menu-collapsed">Menu De Comida</span>
                </a>
                <a href="${pageContext.servletContext.contextPath}/vistas/ListaMenu.jsp" class="list-group-item list-group-item-action">
                    <span class="menu-collapsed">Lista De Menu</span>
                </a>
                <a href="${pageContext.servletContext.contextPath}/vistas/ListaCategoria.jsp" class="list-group-item list-group-item-action">
                    <span class="menu-collapsed">Lista De Categorias</span>
                </a>
            </div>
        </li>

        <li>
            <a href="#submenu5" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action flex-column align-items-start">
                <div class="d-flex w-100 justify-content-start align-items-center">
                    <span class="glyphicon"><img src="${pageContext.servletContext.contextPath}/assets/img/reporte.png"></span>
                    <span class="menu-collapsed">Gestionar Reportes</span>
                    <span class="icono derecha glyphicon glyphicon-chevron-down">
                </div>
            </a>

            <div id='submenu5' class="collapse sidebar-submenu">
                <a href="${pageContext.servletContext.contextPath}/viewsReport/reportCategoria.jsp" class="list-group-item list-group-item-action">
                    <span class="menu-collapsed">Reporte venta categoria</span>
                </a>
                <a href="${pageContext.servletContext.contextPath}/viewsReport/reportDiario.jsp"  class="list-group-item list-group-item-action">
                    <span class="menu-collapsed">Reporte venta dia</span>
                </a>
                <a href="${pageContext.servletContext.contextPath}/viewsReport/reportMensual.jsp"  class="list-group-item list-group-item-action">
                    <span class="menu-collapsed">Reporte venta mensual</span>
                </a>
            </div>
        </li>
    </ul>
</nav>

