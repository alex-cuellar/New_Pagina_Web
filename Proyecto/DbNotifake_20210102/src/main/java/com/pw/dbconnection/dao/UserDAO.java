/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.dao;

import com.pw.dbconnection.models.UserModel;
import com.pw.dbconnection.utils.DbConnection;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author magoc
 */
public class UserDAO {

    // Query de creacion de Tabla
    /**
     * CREATE TABLE `user` ( `idUser` INT NOT NULL AUTO_INCREMENT, `nameUser`
     * VARCHAR(45) NULL, `password` VARCHAR(45) NULL, `urlImage` VARCHAR(255)
     * NULL, PRIMARY KEY (`idUser`));
     *
     */
    /**
     * Inserta un usuario en la base de datos
     *
     * @param user
     * @return
     */
    public static int insertUser(UserModel user) {
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            String sql = "CALL `new_user`(?, ?, ?, ?, ?, ?, ?, ?, ?);";
            CallableStatement statment = con.prepareCall(sql);
            statment.setString(1, user.getName());
            statment.setString(2, user.getDescript());
            statment.setString(3, user.getEmail());
            statment.setString(4, user.getUserName());
            statment.setString(5, user.getPassword());
            statment.setString(6, user.getRedSoc());
            statment.setInt(7, user.getTipo());
            statment.setString(8, user.getUrlImage());
            //status = 1 activo
            statment.setInt(9, 1);
            return statment.executeUpdate();
       
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 0;
    }

    public static List<UserModel> getUsers() {
        List<UserModel> users = new ArrayList<>();
        try {
            Connection con = DbConnection.getConnection();
            CallableStatement statement = con.prepareCall("SELECT * FROM usuario");
            ResultSet resultSet = statement.executeQuery();
            // Si el resultSet tiene resultados lo recorremos
            while (resultSet.next()) {
                // Obtenemos el valor del result set en base al nombre de la
                // columna
                String usr = resultSet.getString("Usr");
                String name = "Name";
                String descript = "descript";
                String email = "email";
                String password = resultSet.getString("Pass");
                String urlImage = resultSet.getString("Descrip");
                String redsoc = "redsocial";
                Integer tipo = 1;
                // Agregamos el usuario a la lista
                users.add(new UserModel(name, descript, email, usr, password, redsoc, tipo, urlImage));
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            return users;
        }
    }
    
     public static UserModel LogIn(UserModel user) {
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            String sql = "CALL `IniciarSesion`(?, ?);";
            CallableStatement statment = con.prepareCall(sql);
            
            statment.setString(1, user.getUserName());
            statment.setString(2, user.getPassword());
            
            ResultSet res = statment.executeQuery();
            
            while(res.next()){
                int id = res.getInt(1);
                String nombre = res.getString(2);
                String usuario = res.getString(3);
                String email = res.getString(4);
                String descripcion = res.getString(5);
                String RedSoc = res.getString(6);
                int tipo = res.getInt(7);
                String imagen = res.getString(8);
                
                return new UserModel(id, nombre, descripcion, email, usuario, imagen, tipo, RedSoc);
            }
           
       
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }
     
             public static UserModel getUser(int idUsr) {
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            String sql = "CALL `notifakedb`.`OBTENER_UserData`(?);";
            CallableStatement statment = con.prepareCall(sql);

            statment.setInt(1, idUsr);
            
            
            ResultSet res = statment.executeQuery();
            while (res.next()) {
                int id = res.getInt(1);
                String Nombre = res.getString(2);
                String Usr = res.getString(3);
                String Descrip = res.getString(4);
                String Email = res.getString(5);
                String RedSoc = res.getString(6);
                int Tipo = res.getInt(7);
                String Imgn = res.getString(8);
                
                             
                return new UserModel(id, Nombre, Descrip, Email, Usr, Imgn, Tipo, RedSoc);
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null){
                try{
                    con.close();
                } catch (SQLException ex){
                    Logger.getLogger(NoticiaDAO.class.getName()).log(Level.SEVERE,null, ex);
                }
            }
        }
        return null;
    }
             
        //Editar Perfil :0
        public static int PerfilEdit(int id, String Descripcion, String Contraseña, String RedSoc, String Imagen) {
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            String sql = "CALL `notifakedb`.`edit_perfil`(?, ?, ?, ?, ?);";
            //
            CallableStatement statment = con.prepareCall(sql);
            statment.setInt(1, id);
            statment.setString(2, Descripcion);
            statment.setString(3, Contraseña);
            statment.setString(4, RedSoc);
            statment.setString(5, Imagen);
            
            //status = 1 activo
            //statment.setInt(9, 1);
            return statment.executeUpdate();
       
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 0;
    }
             
    
}
