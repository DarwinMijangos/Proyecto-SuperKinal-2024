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
public class Categoria {
    private int categoriaProductoID;
    private String nombreCategoria;
    private String descripcionCategoria;

    public Categoria() {
    }

    public Categoria(int categoriaProductoID, String nombreCategoria, String descripcionCategoria) {
        this.categoriaProductoID = categoriaProductoID;
        this.nombreCategoria = nombreCategoria;
        this.descripcionCategoria = descripcionCategoria;
    }

    public int getCategoriaProductoID() {
        return categoriaProductoID;
    }

    public void setCategoriaProductoID(int categoriaProductoID) {
        this.categoriaProductoID = categoriaProductoID;
    }

    public String getNombreCategoria() {
        return nombreCategoria;
    }

    public void setNombreCategoria(String nombreCategoria) {
        this.nombreCategoria = nombreCategoria;
    }

    public String getDescripcionCategoria() {
        return descripcionCategoria;
    }

    public void setDescripcionCategoria(String descripcionCategoria) {
        this.descripcionCategoria = descripcionCategoria;
    }
    
    
}
