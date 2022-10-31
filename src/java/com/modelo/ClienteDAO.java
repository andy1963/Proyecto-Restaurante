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
 * @author Andy
 */
public class ClienteDAO extends Conexion {

    public ArrayList<Cliente> mostrarCliente() {
        ArrayList<Cliente> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM clientes";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while (rs.next()) {
                Cliente c = new Cliente();
                c.setCodCliente(rs.getInt(1));
                c.setNombresCliente(rs.getString(2));
                c.setApellidosCliente(rs.getString(3));
                lista.add(c);
            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }

    public int insertarCliente(Cliente c) {
        int res = 0;
        try {
            this.conectar();
            String sql = "INSERT INTO clientes(nombres, apellidos, codCliente) VALUES (?, ?, ?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, c.getNombresCliente());
            pre.setString(2, c.getApellidosCliente());
            pre.setInt(3, c.getCodCliente());

            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al insertar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }

    public int modificarCliente(Cliente c) {
        int res = 0;
        try {
            this.conectar();
            String sql = "UPDATE clientes  set nombres = ?, apellidos = ? WHERE codCliente = ?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, c.getNombresCliente());
            pre.setString(2, c.getApellidosCliente());
            pre.setInt(3, c.getCodCliente());

            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al modificar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }

    public int eliminarCliente(Cliente c) {
        int res = 0;
        try {
            this.conectar();
            String sql = "DELETE FROM clientes WHERE codCliente = ?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, c.getCodCliente());

            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }
}
