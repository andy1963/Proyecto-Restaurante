/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.modelo;
import com.conexion.Conexion;
import com.modelo.Empleado;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Josue Miguel
 */
public class EmpleadoDAO extends Conexion{
    
    public ArrayList<Empleado> mostrarEmpleado() {
        ArrayList<Empleado> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM empleados";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while (rs.next()) {
                Empleado d = new Empleado();
                d.setCodEmpleado(rs.getInt(1));
                d.setNombres(rs.getString(2));
                d.setApellidos(rs.getString(3));
                d.setTelefono(rs.getString(4));
                d.setEmail(rs.getString(5));
                lista.add(d);
            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
    
    
    //parte del formulario usuario
    public ArrayList<Empleado> mostrarEmpleadoFrm() {
        ArrayList<Empleado> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM empleados";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while (rs.next()) {
                Empleado d = new Empleado();
                d.setCodEmpleado(rs.getInt(1));
                
                d.setEmail(rs.getString(5));
                lista.add(d);
            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }

    public int insertarEmpleado(Empleado d) {
        int res = 0;
        try {
            this.conectar();
            String sql = "INSERT INTO empleados(nombres, apellidos, telefono, email) VALUES (?, ?, ?, ?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, d.getNombres());
            pre.setString(2, d.getApellidos());
            pre.setString(3, d.getTelefono());
            pre.setString(4, d.getEmail());
            
            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al insertar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }

    public int modificarCliente(Empleado d) {
        int res = 0;
        try {
            this.conectar();
            String sql = "UPDATE empleados  set nombres=?, apellidos=?, telefono=?, email=? WHERE codEmpleado = ?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, d.getNombres());
            pre.setString(2, d.getApellidos());
            pre.setString(3, d.getTelefono());
            pre.setString(4, d.getEmail());
            pre.setInt(5, d.getCodEmpleado());

            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al modificar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }

    public int eliminarEmpleado(Empleado d) {
        int res = 0;
        try {
            this.conectar();
            String sql = "DELETE FROM empleados WHERE codEmpleado = ?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, d.getCodEmpleado());

            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }
}
