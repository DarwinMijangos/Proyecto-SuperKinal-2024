/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.darwinmijangos.model;

import java.time.LocalDate;

/**
 *
 * @author informatica
 */
public class Compra {
    private int compraID;
    private LocalDate fechaCompra;
    private double totalCompra;

    public Compra() {
    }

    public Compra(int compraID, LocalDate fechaCompra, double totalCompra) {
        this.compraID = compraID;
        this.fechaCompra = fechaCompra;
        this.totalCompra = totalCompra;
    }

    public int getCompraID() {
        return compraID;
    }

    public void setCompraID(int compraID) {
        this.compraID = compraID;
    }

    public LocalDate getFechaCompra() {
        return fechaCompra;
    }

    public void setFechaCompra(LocalDate fechaCompra) {
        this.fechaCompra = fechaCompra;
    }

    public double getTotalCompra() {
        return totalCompra;
    }

    public void setTotalCompra(double totalCompra) {
        this.totalCompra = totalCompra;
    }
    
    
}
