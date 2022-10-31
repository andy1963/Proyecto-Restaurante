package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Erick Guerrero
 */
public class CategoriaDAO extends Conexion {

    public ArrayList<Categoria> mostrarCategorias() {
        ArrayList<Categoria> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM categorias";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while (rs.next()) {
                Categoria c = new Categoria();
                c.setCodCategoria(rs.getInt(1));
                c.setNombreCategoria(rs.getString(2));
                c.setDescripcion(rs.getString(3));
                lista.add(c);
            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }

    public int insertarCategoria(Categoria c) {
        int res = 0;
        try {
            this.conectar();
            String sql = "INSERT INTO categorias (codCategoria, nombreCategoria, descripcion) VALUES (?, ?, ?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, c.getCodCategoria());
            pre.setString(2, c.getNombreCategoria());
            pre.setString(3, c.getDescripcion());

            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al insertar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }

    public int modificarCategoria(Categoria c) {
        int res = 0;
        try {
            this.conectar();
            String sql = "UPDATE categorias  set nombreCategoria = ?, descripcion = ? WHERE codCategoria = ?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, c.getNombreCategoria());
            pre.setString(2, c.getDescripcion());
            pre.setInt(3, c.getCodCategoria());

            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al modificar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }

    public int eliminarCategoria(Categoria c) {
        int res = 0;
        try {
            this.conectar();
            String sql = "DELETE FROM categorias WHERE codCategoria = ?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, c.getCodCategoria());

            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }
}
