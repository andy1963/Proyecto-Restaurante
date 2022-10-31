/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.controlador;

import com.modelo.Usuario;
import com.modelo.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author CEJMC
 */
@WebServlet(name = "ServletListaUsuario", urlPatterns = {"/ServletListaUsuario"})
public class ServletListaUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            int codUsuario = Integer.parseInt(request.getParameter("txtCodigo"));
            String nombreUsuario = request.getParameter("txtUsuario");
            String contraUsuario = request.getParameter("txtContrasena");
            String rolUsuario = (request.getParameter("txtRol"));
            String empleado = (request.getParameter("txtEmpleado"));
            
            String mensaje = "Error";
            
            int res;
            
            Usuario u = new Usuario(codUsuario, nombreUsuario, contraUsuario, rolUsuario, empleado);
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            
            if (request.getParameter("btnRegistrar") !=null) {
                res = usuarioDAO.insertarUsuario(u);
                if (res !=0) {
                   mensaje = "Usuario agregado";
                }
            }else if(request.getParameter("btnEditar") !=null){
                res = usuarioDAO.modificarUsuario(u);
                if (res !=0) {
                   mensaje = "Usuario  modificado";
                }
            }else if(request.getParameter("btnEliminar") !=null){
                res = usuarioDAO.eliminarUsuario(u);
                if (res !=0) {
                   mensaje = "Usuario  eliminado";
                }
            }
            
            request.setAttribute("message", mensaje);
            request.getRequestDispatcher("/vistas/ListaUsuarios.jsp").forward(request, response);
            
        }catch
        (Exception e) {
            System.out.println("Error"+ e.getMessage());
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
