package com.modelo;

/**
 *
 * @author Erick
 */
public class Menu {

    private int codPlatillo;
    private String nombrePlatillo;
    private String descripcionPlatillo;
    private double precio;
    private String nombreCategoria;
    private String img;

    public Menu() {
    }

    public Menu(int codPlatillo, String nombrePlatillo, String descripcionPlatillo, double precio, String nombreCategoria, String img) {
        this.codPlatillo = codPlatillo;
        this.nombrePlatillo = nombrePlatillo;
        this.descripcionPlatillo = descripcionPlatillo;
        this.precio = precio;
        this.nombreCategoria = nombreCategoria;
        this.img = img;
    }

    public int getCodPlatillo() {
        return codPlatillo;
    }

    public void setCodPlatillo(int codPlatillo) {
        this.codPlatillo = codPlatillo;
    }

    public String getNombrePlatillo() {
        return nombrePlatillo;
    }

    public void setNombrePlatillo(String nombrePlatillo) {
        this.nombrePlatillo = nombrePlatillo;
    }

    public String getDescripcionPlatillo() {
        return descripcionPlatillo;
    }

    public void setDescripcionPlatillo(String descripcionPlatillo) {
        this.descripcionPlatillo = descripcionPlatillo;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getNombreCategoria() {
        return nombreCategoria;
    }

    public void setNombreCategoria(String nombreCategoria) {
        this.nombreCategoria = nombreCategoria;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
    
}
