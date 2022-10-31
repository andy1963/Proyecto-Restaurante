
package com.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Erick Guerrero
 */

public class Conexion {
    private Connection con;
    
    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }
    
    public void conectar(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/db_sgdcomida", "root", "");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al conectar con la base de datos"+e.getMessage());
        }
    }
    
        public void desconectar(){
        try {
            if (!con.isClosed()) {
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error "+e.getMessage());
        }
    }
}

