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
public class Cargo {
    private int cargoID;
    private String nombre;
    private String descripcion;

    public Cargo() {
    }

    public Cargo(int cargoID, String nombre, String descripcion) {
        this.cargoID = cargoID;
        this.nombre = nombre;
        this.descripcion = descripcion;
    }

    public int getCargoID() {
        return cargoID;
    }

    public void setCargoID(int cargoID) {
        this.cargoID = cargoID;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    @Override
    public String toString() {
        return "Cargo{" + "cargoID=" + cargoID + ", nombre=" + nombre + ", descripcion=" + descripcion + '}';
    }
    
    
}
