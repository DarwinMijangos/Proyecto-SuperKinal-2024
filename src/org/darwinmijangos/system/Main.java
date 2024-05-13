/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.darwinmijangos.system;

import java.io.IOException;
import java.io.InputStream;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.stage.Stage;
import javafx.fxml.Initializable;
import javafx.fxml.JavaFXBuilderFactory;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import org.darwinmijangos.controller.FormCargosController;
import org.darwinmijangos.controller.FormClientesController;
import org.darwinmijangos.controller.MenuCargosController;
import org.darwinmijangos.controller.MenuCategoriasController;
import org.darwinmijangos.controller.MenuClientesController;
import org.darwinmijangos.controller.MenuComprasController;
import org.darwinmijangos.controller.MenuDistribuidoresController;
import org.darwinmijangos.controller.MenuPrincipalController;
 
/**
 *
 * @author darwi
 */
public class Main extends Application {
    
    private Stage stage;
    private Scene scene;
    private final String URLVIEW = "/org/darwinmijangos/view/";
    
    @Override
    public void start(Stage stage) throws Exception {
        this.stage = stage;
        stage.setTitle("Super Kinal");
        stage.show();
        menuPrincipalView();
    }
    
    public Initializable switchScene(String fxmlName, int width, int height) throws Exception{
        Initializable resultado = null;
        FXMLLoader loader = new FXMLLoader();
        
        InputStream file = Main.class.getResourceAsStream(URLVIEW + fxmlName);
        loader.setBuilderFactory(new JavaFXBuilderFactory());
        loader.setLocation(Main.class.getResource(URLVIEW + fxmlName));
        
        scene = new Scene((AnchorPane)loader.load(file), width, height);
        stage.setScene(scene);
        stage.sizeToScene();

        resultado = (Initializable)loader.getController();
        return resultado;
        
    }
    
    public void menuPrincipalView(){
        try{
            MenuPrincipalController menuPrincipalView = (MenuPrincipalController)switchScene("MenuPrincipalView.fxml", 750, 570);
            menuPrincipalView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void menuClientesView(){
        try{
            MenuClientesController menuClientesView = (MenuClientesController)switchScene("MenuClientesView.fxml", 1150, 690);
            menuClientesView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void formClientesView(int op){
        try{
            FormClientesController formClientesView = (FormClientesController)switchScene("FormClientesView.fxml", 500, 700);
            formClientesView.setOp(op);
            formClientesView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void menuCargosView(){
        try{
            MenuCargosController menuCargosView = (MenuCargosController)switchScene("MenuCargosView.fxml", 1000, 600);
            menuCargosView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void formCargosView(int op){
        try{
            FormCargosController formCargosView = (FormCargosController)switchScene("FormCargosView.fxml", 400, 600);
            formCargosView.setOp(op);
            formCargosView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void menuDistribuidoresView(){
        try{
            MenuDistribuidoresController menuDistribuidoresView = (MenuDistribuidoresController)switchScene("MenuDistribuidoresView.fxml", 1000, 600);
            menuDistribuidoresView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void menuCategoriasView(){
        try{
            MenuCategoriasController menuCategoriasView = (MenuCategoriasController)switchScene("MenuCategoriasView.fxml", 1000, 600);
            menuCategoriasView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    
    public void menuComprasView(){
        try{
            MenuComprasController menuComprasView = (MenuComprasController)switchScene("MenuComprasView.fxml", 1000, 600);
            menuComprasView.setStage(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        launch(args);
    }
    
}
