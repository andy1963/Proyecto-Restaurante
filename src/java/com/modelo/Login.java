/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.modelo;

/**
 *
 * @author Abdul
 */
public class Login {

    private int codUsuario;
    private String nombreUsuario;
    private String contraUsuario;
    private int rolCod;

    public Login(int codUsuario, String nombreUsuario, String contraUsuario, int rolCod) {
        this.codUsuario = codUsuario;
        this.nombreUsuario = nombreUsuario;
        this.contraUsuario = contraUsuario;
        this.rolCod = rolCod;
    }

    public Login() {
    }

    public int getCodUsuario() {
        return codUsuario;
    }

    public void setCodUsuario(int codUsuario) {
        this.codUsuario = codUsuario;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getContraUsuario() {
        return contraUsuario;
    }

    public void setContraUsuario(String contraUsuario) {
        this.contraUsuario = contraUsuario;
    }

    public int getRolCod() {
        return rolCod;
    }

    public void setRolCod(int rolCod) {
        this.rolCod = rolCod;
    }
}
