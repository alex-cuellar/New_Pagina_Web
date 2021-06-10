/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.dao;

import com.pw.dbconnection.utils.DbConnection;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sara
 */
public class FavoritosDAO {
    
    public static int MarcarFav(int ID, int IDUS) {
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            String sql = "CALL `notifakedb`.`Noticia_Favorita`(?, ?);";
            CallableStatement statment = con.prepareCall(sql);
            
            statment.setInt(1, ID);
            statment.setInt(2, IDUS);
            

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
    
    
    public static int MarcarMG(int ID) {
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            String sql = "CALL `notifakedb`.`MeGusta`(?);";
            CallableStatement statment = con.prepareCall(sql);
            
            statment.setInt(1, ID);
            

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
    
    
        public static int MarcarNMG(int ID) {
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            String sql = "CALL `notifakedb`.`NoMeGusta`(?);";
            CallableStatement statment = con.prepareCall(sql);
            
            statment.setInt(1, ID);
            

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
        
        
        
         public static int ComentarioMarcarMG(int ID) {
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            String sql = "CALL `notifakedb`.`ComentarioMeGusta`(?);";
            CallableStatement statment = con.prepareCall(sql);
            
            statment.setInt(1, ID);
            

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
    
    
        public static int ComentarioMarcarNMG(int ID) {
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            String sql = "CALL `notifakedb`.`ComentarioNoMeGusta`(?);";
            CallableStatement statment = con.prepareCall(sql);
            
            statment.setInt(1, ID);
            

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

