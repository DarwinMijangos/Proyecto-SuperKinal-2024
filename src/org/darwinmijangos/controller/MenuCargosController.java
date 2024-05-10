/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.darwinmijangos.controller;

import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import org.darwinmijangos.system.Main;

/**
 * FXML Controller class
 *
 * @author informatica
 */
public class MenuCargosController implements Initializable {
    private Main stage;
    
    private static ResultSet resultset = null;
    private static Connection conexion = null;
    private static PreparedStatement statement = null;
    
    @FXML
    TableView tblCargos;
    
    @FXML
    Button btnAgregar, btnEditar, btnEliminar, btnReportes, btnRegresar, btnBuscar;
    
    @FXML
    TextField tfCargoID;
    
    @FXML
    TableColumn colCargoID, colNombre, colDescripcion;
    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL location, ResourceBundle resources) {
        
    }
    
    @FXML
    public void handleButtonAction(ActionEvent event){
        
    }

    public Main getStage() {
        return stage;
    }

    public void setStage(Main stage) {
        this.stage = stage;
    }
    
    
}
