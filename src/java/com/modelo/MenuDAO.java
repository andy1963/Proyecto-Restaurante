package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Erick
 */
public class MenuDAO extends Conexion {

    public ArrayList<Menu> mostrarMenus() {
        ArrayList<Menu> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT P.codPlatillo, P.nombrePlatillo, P.descripcionPlatillo, P.precio, P.img, C.nombreCategoria FROM platillos P LEFT JOIN categorias C ON P.categoriaCod = C.codCategoria";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while (rs.next()) {
                Menu m = new Menu();
                m.setCodPlatillo(rs.getInt(1));
                m.setNombrePlatillo(rs.getString(2));
                m.setDescripcionPlatillo(rs.getString(3));
                m.setPrecio(rs.getDouble(4));
                m.setImg(rs.getString(5));
                m.setNombreCategoria(rs.getString(6));

                lista.add(m);
            }
        } catch (SQLException e) {
            System.out.println("Error al mostrar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }

    public int insertarMenu(Menu m) {
        int res = 0;
        try {
            this.conectar();
            String sql = "INSERT INTO platillos (codPlatillo, nombrePlatillo, descripcionPlatillo, precio, categoriaCod, img) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, m.getCodPlatillo());
            pre.setString(2, m.getNombrePlatillo());
            pre.setString(3, m.getDescripcionPlatillo());
            pre.setDouble(4, m.getPrecio());
            pre.setString(5, m.getNombreCategoria());
            pre.setString(6, m.getImg());

            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al insertar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }

    public int modificarMenu(Menu m) {
        int res = 0;
        try {
            this.conectar();
            String sql = "UPDATE platillos SET nombrePlatillo = ?, descripcionPlatillo = ?, precio = ?, categoriaCod = ? WHERE codPlatillo = ?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setString(1, m.getNombrePlatillo());
            pre.setString(2, m.getDescripcionPlatillo());
            pre.setDouble(3, m.getPrecio());
            pre.setString(4, m.getNombreCategoria());
            pre.setInt(5, m.getCodPlatillo());

            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al modificar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }

    public int eliminarMenu(Menu m) {
        int res = 0;
        try {
            this.conectar();
            String sql = "DELETE FROM platillos WHERE codPlatillo = ?";
            PreparedStatement pre = this.getCon().prepareStatement(sql);
            pre.setInt(1, m.getCodPlatillo());

            res = pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return res;
    }

}
