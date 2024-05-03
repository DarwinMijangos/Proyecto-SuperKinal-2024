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
import java.util.ArrayList;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import org.darwinmijangos.dao.Conexion;
import org.darwinmijangos.model.Cliente;
import org.darwinmijangos.system.Main;

/**
 * FXML Controller class
 *
 * @author darwi
 */
public class MenuClientesController implements Initializable {
    
    private Main stage;
    
    private static Connection conexion = null;
    private static PreparedStatement statement = null;
    private static ResultSet resultset = null;
    
    @FXML
    TableView tblClientes;
    
    @FXML
    TableColumn colClienteID, colNombre, colApellido, colTelefono, colDireccion, colNit;
    
    @FXML
    Button btnAgregar, btnEditar, btnReportes, btnRegresar;

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL location, ResourceBundle resources) {
        cargarLista();
    }
    
    @FXML
    public void handleButtonAction(ActionEvent event ){
        if(event.getSource() == btnAgregar){
            stage.formClientesView();
        }else if(event.getSource() == btnEditar){
            stage.formClientesView();
        }else if(event.getSource() == btnRegresar){
            stage.menuPrincipalView();
        }
    }
    
    public void cargarLista(){
        tblClientes.setItems(listarClientes());
        colClienteID.setCellValueFactory(new PropertyValueFactory<Cliente, Integer>("clienteID"));
        colNombre.setCellValueFactory(new PropertyValueFactory<Cliente, String> ("nombre"));
        colApellido.setCellValueFactory(new PropertyValueFactory<Cliente, String> ("apellido"));
        colTelefono.setCellValueFactory(new PropertyValueFactory<Cliente, String> ("telefono"));
        colDireccion.setCellValueFactory(new PropertyValueFactory<Cliente, String> ("direccion"));
        colNit.setCellValueFactory(new PropertyValueFactory<Cliente, String> ("nit"));

    }
    
    public ObservableList<Cliente> listarClientes(){
        ArrayList<Cliente> clientes = new ArrayList<>();
        
        try{
            conexion = Conexion.getInstance().obtenerConexion();
            String sql = "call sp_ListarClientes";
            statement = conexion.prepareStatement(sql);
            resultset = statement.executeQuery();
            
            while(resultset.next()){
                int clienteID = resultset.getInt("clienteID");
                String nombre = resultset.getString("nombre");
                String apellido = resultset.getString("apellido");
                String telefono = resultset.getString("telefono");
                String direccion = resultset.getString("direccion");
                String nit = resultset.getString("nit");
                
                clientes.add(new Cliente(clienteID, nombre, apellido, telefono, direccion, nit));
            }
        }catch(SQLException e){
            System.out.println(e.getMessage());
        }finally{
            try{
                if(resultset != null){
                    resultset.close();
                }
                if (statement != null){
                    statement.close();
                }
                if (conexion != null){
                    conexion.close();
                }
            }catch(SQLException e){
                System.out.println(e.getMessage());
            }
        }
        
        return FXCollections.observableList(clientes);
    }
    
    public Main getStage() {
        return stage;
    }

    public void setStage(Main stage) {
        this.stage = stage;
    }
}
