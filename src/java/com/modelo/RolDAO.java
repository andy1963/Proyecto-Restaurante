/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author CEJMC
 */
public class RolDAO extends Conexion {
    public ArrayList<Rol> mostrarRol() {
        ArrayList<Rol> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM roles";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while (rs.next()) {
                Rol r = new Rol();
                r.setCodRol(rs.getInt(1));
                r.setNombreRol(rs.getString(2));
               
                lista.add(r);
            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
}
