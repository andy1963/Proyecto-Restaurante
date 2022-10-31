package com.config;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Erick
 */
public class Conexion {
    Connection con;
    String url = "jdbc:mysql://localhost:3306/db_sgdcomida";
    String user = "root";
    String pass = "";

    public Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {
        }
        return con;
    }
}
