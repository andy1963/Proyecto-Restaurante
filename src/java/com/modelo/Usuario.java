/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.modelo;

/**
 *
 * @author Josue Miguel
 */
public class Usuario {

    private int codUsuario;
    private String nombreUsuario;
    private String contraUsuario;
    private String nombreRol;
    private String nombreEmp;

    public Usuario() {
    }

    public Usuario(int codUsuario, String nombreUsuario, String contraUsuario, String nombreRol, String nombreEmp) {
        this.codUsuario = codUsuario;
        this.nombreUsuario = nombreUsuario;
        this.contraUsuario = contraUsuario;
        this.nombreRol = nombreRol;
        this.nombreEmp = nombreEmp;
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

    public String getNombreRol() {
        return nombreRol;
    }

    public void setNombreRol(String nombreRol) {
        this.nombreRol = nombreRol;
    }

    public String getNombreEmp() {
        return nombreEmp;
    }

    public void setNombreEmp(String nombreEmp) {
        this.nombreEmp = nombreEmp;
    }

}
