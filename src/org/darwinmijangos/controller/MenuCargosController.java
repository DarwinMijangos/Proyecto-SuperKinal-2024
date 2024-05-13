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
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import org.darwinmijangos.dao.Conexion;
import org.darwinmijangos.dto.CargoDTO;
import org.darwinmijangos.dto.ClienteDTO;
import org.darwinmijangos.model.Cargo;
import org.darwinmijangos.model.Cliente;
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
        //cargarLista();
    }
    
    @FXML
    public void handleButtonAction(ActionEvent event ){
        if(event.getSource() == btnAgregar){
            stage.formCargosView(1);
        }else if(event.getSource() == btnEditar){
            CargoDTO.getCargoDTO().setCargo((Cargo)tblCargos.getSelectionModel().getSelectedItem());
            stage.formClientesView(2);
        }else if(event.getSource() == btnRegresar){
            stage.menuPrincipalView();
        }else if(event.getSource() == btnEliminar){
            int carID = ((Cargo)tblCargos.getSelectionModel().getSelectedItem()).getCargoID();
            eliminarCargo(carID);
            cargarLista();
        }else if(event.getSource() == btnBuscar){
            tblCargos.getItems().clear();
            if(tfCargoID.getText().equals("")){
                cargarLista();
            }else{
                tblCargos.getItems().add(buscarCargo());
                colCargoID.setCellValueFactory(new PropertyValueFactory<Cliente, Integer>("cargoID"));
                colNombre.setCellValueFactory(new PropertyValueFactory<Cliente, String> ("nombre"));
                colDescripcion.setCellValueFactory(new PropertyValueFactory<Cliente, String> ("descripcion"));
            }
        }
    }
    
    public void cargarLista(){
        tblCargos.setItems(listarCargos());
        colCargoID.setCellValueFactory(new PropertyValueFactory<Cliente, Integer>("clienteID"));
        colNombre.setCellValueFactory(new PropertyValueFactory<Cliente, String> ("nombre"));
        colDescripcion.setCellValueFactory(new PropertyValueFactory<Cliente, String> ("descripcion"));
    }
    
    public ObservableList<Cargo> listarCargos(){
        ArrayList<Cargo> cargos = new ArrayList<>();
        
        try{
            conexion = Conexion.getInstance().obtenerConexion();
            String sql = "call sp_ListarCargos";
            statement = conexion.prepareStatement(sql);
            resultset = statement.executeQuery();
            
            while(resultset.next()){
                int cargoID = resultset.getInt("cargoID");
                String nombre = resultset.getString("nombre");
                String descripcion = resultset.getString("descripcion");
                
                cargos.add(new Cargo(cargoID, nombre, descripcion));
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
        
        return FXCollections.observableList(cargos);
    }
    
    public void eliminarCargo(int carID){
        try{
            conexion = Conexion.getInstance().obtenerConexion();
            String sql = "call sp_EliminarCargo(?)";
            statement = conexion.prepareStatement(sql);
            statement.setInt(1, carID);
            statement.execute();
        }catch(SQLException e){
            System.out.println(e.getMessage());
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
            }
        }
    }
    
    public Cargo buscarCargo(){
        Cargo cargo = null;
        try{
            conexion = Conexion.getInstance().obtenerConexion();
            String sql = "call sp_BuscarCliente(?)";
            statement = conexion.prepareStatement(sql);
            statement.setInt(1, Integer.parseInt(tfCargoID.getText()));
            resultset = statement.executeQuery();
            
            if(resultset.next()){
                int cargoID = resultset.getInt("cargoID");
                String nombre = resultset.getString("nombre");
                String descripcion = resultset.getString("descripcion");
                
                cargo = (new Cargo(cargoID, nombre, descripcion));
            }
        }catch(SQLException e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }finally{
            try{
                if(resultset != null){
                    resultset.close();
                }
                if(statement != null){
                    statement.close();
                }
                if(conexion != null){
                    conexion.close();
                }
            }catch(SQLException e){
                System.out.println(e.getMessage());
            }
        }
        
        return cargo;
    }

    public Main getStage() {
        return stage;
    }

    public void setStage(Main stage) {
        this.stage = stage;
    }
    
    
}
