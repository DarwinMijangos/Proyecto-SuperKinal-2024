/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.darwinmijangos.controller;

import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import org.darwinmijangos.system.Main;

/**
 * FXML Controller class
 *
 * @author darwi
 */
public class FormClientesController implements Initializable {
    private Main stage;
    
    @FXML
    TextField tfClienteID, tfNombre, tfApellido, tfTelefono, tfDireccion, tfNit;
    @FXML
    Button btnGuardar, btnCancelar;
    
    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL location, ResourceBundle resources) {
        // TODO
    }
    
    @FXMl
    public void handleButtonAction(ActionEvent event){
        if(event.getSource() == btnGuardar){
            
            
        }else if(event.getSource() == btnCancelar){
            stage.menuClientesView();
        }
    }

    public Main getStage() {
        return stage;
    }

    public void setStage(Main stage) {
        this.stage = stage;
    }
    
    
}
