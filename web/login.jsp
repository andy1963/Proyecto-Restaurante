<%-- 
    Document   : login
    Created on : 28 oct. 2022, 22:46:43
    Author     : Abdul
--%>

<%@page  import="com.sun.jdi.request.ThreadStartRequest"%>
<%@page  import="com.modelo.Usuario"%>
<%@page  import="java.util.ArrayList"%>
<%@page  session="true"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIS Comida | Login</title>
        <%@include file="layout/nav/Local.jsp" %>
        <%@include file="layout/nav/CDN.jsp" %>
    </head>
    <body>
        <div class="back">

            <div class="div-center">
                <div class="content container">
                    <h2 ><span class="fa fa-cutlery"></span> Login</h2>
                    <hr />
                    <form action="${pageContext.servletContext.contextPath}/ServletLogin" method="POST">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Nombre de Usuario</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" name="txtUsuario" placeholder="Usuario">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Contraseña</label>
                            <input type="password" class="form-control" id="exampleInputPassword1" name="txtContra" placeholder="Contraseña">
                        </div>
                        <div class="col-12">
                            <button type="submit" class="btn btn-default btn-block bg-faded" name="btnLogin" style="background-color:#ff793f; border: none; padding: 10px;">Iniciar Sesion</button>
                        </div>
                    </form>
                </div>
            </div>

            <%
                HttpSession sesion = request.getSession();
                int nivel = 0;

                if (request.getAttribute("nivel") != null) {
                    nivel = (Integer) request.getAttribute("nivel");
                    if (nivel == 1) {
                        sesion.setAttribute("usuario", request.getAttribute("usuario"));
                        sesion.setAttribute("nivel", nivel);
                        response.sendRedirect("index.jsp");
                    }
                }

                if (request.getParameter("cerrar") != null) {
                    session.invalidate();
                }

            %>

    </body>
</html>
