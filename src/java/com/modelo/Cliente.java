/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.modelo;

/**
 *
 * @author Andy
 */
public class Cliente {
    private int codCliente;
    private String nombresCliente;
    private String apellidosCliente;

    public Cliente() {
    }

    public Cliente(int codCliente, String nombresCliente, String apellidosCliente) {
        this.codCliente = codCliente;
        this.nombresCliente = nombresCliente;
        this.apellidosCliente = apellidosCliente;
    }

    public int getCodCliente() {
        return codCliente;
    }

    public void setCodCliente(int codCliente) {
        this.codCliente = codCliente;
    }

    public String getNombresCliente() {
        return nombresCliente;
    }

    public void setNombresCliente(String nombresCliente) {
        this.nombresCliente = nombresCliente;
    }

    public String getApellidosCliente() {
        return apellidosCliente;
    }

    public void setApellidosCliente(String apellidosCliente) {
        this.apellidosCliente = apellidosCliente;
    }

}
