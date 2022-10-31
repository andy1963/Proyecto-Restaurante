<%-- 
    Document   : ListaUsuarios
    Created on : 28 oct. 2022, 10:35:43 p. m.
    Author     : Josue Miguel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.conexion.Conexion" %>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.*" %>
<%@page import="java.io.File" %>


<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Usuarios</title>
        <%@include file="../layout/nav/Local.jsp" %>
        <%@include file="../layout/nav/CDN.jsp" %>
        
    </head>
    <body class="with-side-menu">

        

        <%@include file="../layout/nav/NavBar.jsp" %>
        <div class="mobile-menu-left-overlay"></div>
        <%@include file="../layout/nav/SideBar.jsp" %>
        <div class="page-content">
            <div class="container-fluid">
                <section class="card">
                    <header class="card-header">
                        <h3 class="font-weight-bold uppercase"> Reporte de ventas diarias </h3>
                    </header>
                </section>
                <form class="form" action="reportDiario.jsp" method="POST">
                
                
                <div class="modal-footer">
                    <input type="date" name="txtfecha" id="txtfecha" class="form-control" value="2022-08-09">
                    <br>
                    <button type="submit" class="btn-success" name="btnReporte" id="btnReporte">Generar Reporte</button>       
                                        
                </div>
                </form>
            </div>
        </div>
        <%  
            if (request.getParameter("btnReporte")!= null) {
                    Conexion con = new Conexion();
                    con.conectar();
                    File reportFile = new File(application.getRealPath("reportes/reporteByDiario.jasper"));
                    Map parametros = new HashMap();
                    String date = request.getParameter("txtfecha");
                    parametros.put("FechaN", date);
                    byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parametros, con.getCon());
                    response.setContentType("application/pdf");
                    response.setContentLength(bytes.length);

                    ServletOutputStream output = response.getOutputStream();
                    response.getOutputStream();
                    output.write(bytes, 0, bytes.length);
                    output.flush();
                    output.close();
                    con.desconectar();
                }
        %>
         
    </body >
</html>

