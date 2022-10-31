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
 * @author Josue Miguel
 */
public class UsuarioDAO extends Conexion {
    public ArrayList<Usuario> mostrarUsuario() {
        ArrayList<Usuario> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT U.codUsuario, U.nombreUsuario, U.contraUsuario, E.nombres, R.nombreRol FROM usuarios U INNER JOIN empleados E ON U.empleadoCod =E.codEmpleado INNER JOIN roles R ON U.rolCod=R.codRol";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setCodUsuario(rs.getInt(1));
                u.setNombreUsuario(rs.getString(2));
                u.setContraUsuario(rs.getString(3));
                u.setNombreRol(rs.getString(4));
                u.setNombreEmp(rs.getString(5));
                lista.add(u);
            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }

    public int insertarUsuario(Usuario u) {
        int res = 0;
        try {
            this.conectar();
            String sql = "INSERT INTO usuarios(codUsuario, nombreUsuario, contraUsuario, rolCod, empleadoCod ) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, u.getCodUsuario());
            pre.setString(2, u.getNombreUsuario());
            pre.setString(3, u.getContraUsuario());
            pre.setString(4, u.getNombreRol());
            pre.setString(5, u.getNombreEmp());

            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al insertar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }

    public int modificarUsuario(Usuario u) {
        int res = 0;
        try {
            this.conectar();
            String sql = "UPDATE usuarios  set nombreUsuario = ?, contraUsuario = ?, rolCod = ?, empleadoCod = ?  WHERE codUsuario = ?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, u.getNombreUsuario());
            pre.setString(2, u.getContraUsuario());
            pre.setString(3, u.getNombreRol());
            pre.setString(4, u.getNombreEmp());
            pre.setInt(5, u.getCodUsuario());

            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al modificar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }

    public int eliminarUsuario(Usuario u) {
        int res = 0;
        try {
            this.conectar();
            String sql = "DELETE FROM usuarios WHERE codUsuario = ?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, u.getCodUsuario());

            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }
}
