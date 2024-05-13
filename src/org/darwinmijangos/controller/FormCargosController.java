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
import java.sql.SQLException;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import org.darwinmijangos.dao.Conexion;
import org.darwinmijangos.dto.CargoDTO;
import org.darwinmijangos.dto.ClienteDTO;
import org.darwinmijangos.model.Cargo;
import org.darwinmijangos.system.Main;

/**
 * FXML Controller class
 *
 * @author informatica
 */
public class FormCargosController implements Initializable {
    private Main stage;
    private int op;
    
    private static Connection conexion = null;
    private static PreparedStatement statement = null;
    private static ResultSet resultset = null;
    
    @FXML
    TextField tfCargoID, tfNombre, tfDescripcion;
    
    @FXML
    Button btnGuardar, btnCancelar;
    
    /**
     * Initializes the controller class.
     */
    
    @Override
    public void initialize(URL location, ResourceBundle resources) {
        if(CargoDTO.getCargoDTO().getCargo() != null){
            
        }
    }
    
    public void handleButtonAction(ActionEvent event){
        if(event.getSource() == btnCancelar){
            stage.menuCargosView();
            CargoDTO.getCargoDTO().setCargo(null);
        }else if(event.getSource() == btnGuardar){
            if(op == 1){
                agregarCargo();
                stage.menuClientesView();
            }else if(op == 2){
                editarCargo();
                ClienteDTO.getClienteDTO().setCliente(null);
                stage.menuClientesView();
            }
            stage.menuClientesView();
        }
    }
    
    public void cargarDatos(Cargo cargo){
        tfCargoID.setText(Integer.toString(cargo.getCargoID()));
        tfNombre.setText(cargo.getNombre());
        tfDescripcion.setText(cargo.getDescripcion());
    }
    
    public void agregarCargo(){
        try{
            conexion = Conexion.getInstance().obtenerConexion();
            String sql = "call sp_AgregarCargos(?,?)";
            statement = conexion.prepareStatement(sql);
            statement.setString(1, tfNombre.getText());
            statement.setString(2, tfDescripcion.getText());
            statement.execute();
        }catch(SQLException e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }finally{
            try{
                if(statement != null){
                    statement.close();
                }
                if(conexion != null){
                    conexion.close();
                }
            }catch(SQLException e){
                System.out.println(e.getMessage());
                e.printStackTrace();
            }
        }
    }
    
    public void editarCargo(){
        try{
            conexion = Conexion.getInstance().obtenerConexion();
            String sql = "call sp_EditarCargo(?,?,?)";
            statement = conexion.prepareStatement(sql);
            statement.setInt(1, Integer.parseInt(tfCargoID.getText()));
        }catch(SQLException e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }finally{
            try{
                if(statement != null){
                    statement.close();
                }
                if(conexion != null){
                    conexion.close();
                }
            }catch(SQLException e){
                System.out.println(e.getMessage());
                e.printStackTrace();
            }
        }
    }

    public Main getStage() {
        return stage;
    }

    public void setStage(Main stage) {
        this.stage = stage;
    }
    
    public int getOp() {
        return op;
    }

    public void setOp(int op) {
        this.op = op;
    }
    
    
}
