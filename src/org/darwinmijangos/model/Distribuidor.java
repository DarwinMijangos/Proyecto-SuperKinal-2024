/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.darwinmijangos.model;

/**
 *
 * @author informatica
 */
public class Distribuidor {
    private int distribuidorID;
    private String nombre;
    private String direccion;
    private String nit;
    private String telefono;
    private String web;

    public Distribuidor() {
    }

    public Distribuidor(int distribuidorID, String nombre, String direccion, String nit, String telefono, String web) {
        this.distribuidorID = distribuidorID;
        this.nombre = nombre;
        this.direccion = direccion;
        this.nit = nit;
        this.telefono = telefono;
        this.web = web;
    }

    public int getDistribuidorID() {
        return distribuidorID;
    }

    public void setDistribuidorID(int distribuidorID) {
        this.distribuidorID = distribuidorID;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getWeb() {
        return web;
    }

    public void setWeb(String web) {
        this.web = web;
    }
    
    
}
