package com.modelo;

import java.io.InputStream;

/**
 *
 * @author Erick
 */
public class Platillo {

    int codPlatillo;
    String nombrePlatillo;
    String descripcionPlatillo;
    double precio;
    InputStream img;
    int categoriaCod;

    public Platillo() {
    }

    public Platillo(int codPlatillo, String nombrePlatillo, String descripcionPlatillo, double precio, InputStream img, int categoriaCod) {
        this.codPlatillo = codPlatillo;
        this.nombrePlatillo = nombrePlatillo;
        this.descripcionPlatillo = descripcionPlatillo;
        this.precio = precio;
        this.img = img;
        this.categoriaCod = categoriaCod;
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

    public InputStream getImg() {
        return img;
    }

    public void setImg(InputStream img) {
        this.img = img;
    }

    public int getCategoriaCod() {
        return categoriaCod;
    }

    public void setCategoriaCod(int categoriaCod) {
        this.categoriaCod = categoriaCod;
    }

}
