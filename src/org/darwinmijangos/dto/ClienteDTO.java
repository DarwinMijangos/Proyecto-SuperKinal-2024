/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.darwinmijangos.dto;

import org.darwinmijangos.model.Cliente;

/**
 *
 * @author darwin
 */
public class ClienteDTO {
    private static ClienteDTO instance;
    private Cliente cliente;
    
    private ClienteDTO(){
        
    }
    
    public static ClienteDTO getClienteDTO(){
        if(instance == null){
            instance = new ClienteDTO();
        }
        return instance;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
}
