/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.modelo;

import com.config.Conexion;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Erick
 */
public class PlatilloDAO extends Conexion {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;

    public Platillo listarId(int id) {
        String sql = "select * from platillos where codPlatillo=" + id;
        Platillo p = new Platillo();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setCodPlatillo(rs.getInt(1));
                p.setNombrePlatillo(rs.getString(2));
                p.setDescripcionPlatillo(rs.getString(3));
                p.setPrecio(rs.getDouble(4));
                p.setImg(rs.getBinaryStream(5));
                p.setCategoriaCod(rs.getInt(6));

            }
        } catch (SQLException e) {
        }
        return p;
    }

    public List listar() {
        List<Platillo> productos = new ArrayList();
        String sql = "select * from platillos";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Platillo p = new Platillo();
                p.setCodPlatillo(rs.getInt(1));
                p.setNombrePlatillo(rs.getString(2));
                p.setDescripcionPlatillo(rs.getString(3));
                p.setPrecio(rs.getDouble(4));
                p.setImg(rs.getBinaryStream(5));
                p.setCategoriaCod(rs.getInt(6));
                productos.add(p);
            }
        } catch (SQLException e) {
        }
        return productos;
    }

    public void listarImg(int id, HttpServletResponse response) {
        String sql = "select * from platillos where codPlatillo=" + id;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        try {
            outputStream = response.getOutputStream();
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                inputStream = rs.getBinaryStream("img");
            }
            bufferedInputStream = new BufferedInputStream(inputStream);
            bufferedOutputStream = new BufferedOutputStream(outputStream);
            int i = 0;
            while ((i = bufferedInputStream.read()) != -1) {
                bufferedOutputStream.write(i);

            }
        } catch (IOException | SQLException e) {
        }
    }
}
