/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Erick
 */
public class LoginDAO extends Conexion {

    public int iniciarSesion(String usuario, String password) {
        int nivel = 0;
        try {
            this.conectar();
            String sql = "SELECT rolCod FROM usuarios WHERE nombreUsuario=? AND  contraUsuario=?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, usuario);
            pre.setString(2, password);
            ResultSet rs;

            rs = pre.executeQuery();
            while (rs.next()) {
                nivel = rs.getInt(1);
            }

        } catch (SQLException e) {
            System.out.println("Error al extraer sesion" + e.getMessage());
        } finally {
            this.desconectar();
        }
        return nivel;
    }

}
