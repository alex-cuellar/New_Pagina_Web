/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.dao;

import com.pw.dbconnection.models.Noticia;
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
 * @author Sara
 */
public class NoticiaDAO {

    public static int insertNotice(Noticia noticia) {
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            String sql = "CALL `notifakedb`.`new_notice`(?, ?, ?, ?, ?, ?, ?, ?, ?);";
            CallableStatement statment = con.prepareCall(sql);
            statment.setString(1, noticia.getTitulo());
            statment.setString(2, noticia.getDescripCorta());
            statment.setInt(3, noticia.getIdCategoria());
            statment.setString(4, noticia.getParrafo1());
            statment.setString(5, noticia.getImagen1());

            statment.setInt(6, noticia.getIdUsuario());
            statment.setString(7, noticia.getParrafo2());
            statment.setString(8, noticia.getImagen2());
            statment.setString(9, noticia.getImagen3());

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

    public static List<Noticia> getNoticias() {
        List<Noticia> noticias = new ArrayList<>();
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            String sql = "CALL `notifakedb`.`OBTENER_NEW_NOTICE`();";
            CallableStatement statment = con.prepareCall(sql);

            ResultSet res = statment.executeQuery();
            while (res.next()) {
                int id = res.getInt(1);
                String Titulo = res.getString(2);
                String Descripcion = res.getString(3);
                int categoria = res.getInt(4);
                String Parrafo1 = res.getString(5);
                String Imagen1 = res.getString(6);
                String Fecha = res.getString(9);
                int Usuario = res.getInt(10);
                String Parrafo2 = res.getString(11);
                String Imagen2 = res.getString(12);
                String Imagen3 = res.getString(13);
                
                             
                noticias.add(new Noticia(id, Titulo, Descripcion, categoria, Parrafo1, Parrafo2, Imagen1, Imagen2, Imagen3, Fecha, Usuario));
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
        return noticias;
    }
    
    
    public static List<Noticia> getDestacadas() {
        List<Noticia> noticias = new ArrayList<>();
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            String sql = "CALL `notifakedb`.`Destacadas`();";
            CallableStatement statment = con.prepareCall(sql);

            ResultSet res = statment.executeQuery();
            while (res.next()) {
                int id = res.getInt(1);
                String Titulo = res.getString(2);
                String Descripcion = res.getString(3);
                int categoria = res.getInt(4);
                String Parrafo1 = res.getString(5);
                String Imagen1 = res.getString(6);
                String Fecha = res.getString(9);
                int Usuario = res.getInt(10);
                String Parrafo2 = res.getString(11);
                String Imagen2 = res.getString(12);
                String Imagen3 = res.getString(13);
                
                             
                noticias.add(new Noticia(id, Titulo, Descripcion, categoria, Parrafo1, Parrafo2, Imagen1, Imagen2, Imagen3, Fecha, Usuario));
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
        return noticias;
    }
    
    
     public static Noticia getNoticia(int idNoticia) {
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            String sql = "CALL `notifakedb`.`OBTENER_NOTICIA`(?);";
            CallableStatement statment = con.prepareCall(sql);

            statment.setInt(1, idNoticia);
            
            
            ResultSet res = statment.executeQuery();
            while (res.next()) {
                int id = res.getInt(1);
                String Titulo = res.getString(2);
                String Descripcion = res.getString(3);
                int categoria = res.getInt(4);
                String Parrafo1 = res.getString(5);
                String Imagen1 = res.getString(6);
                String Fecha = res.getString(7);
                int Usuario = res.getInt(8);
                String Parrafo2 = res.getString(9);
                String Imagen2 = res.getString(10);
                String Imagen3 = res.getString(11);
                String Autor = res.getString(12);
                int Aceptada = res.getInt(13);
                             
                return new Noticia(id, Titulo, Descripcion, categoria, Parrafo1, Parrafo2, Imagen1, Imagen2, Imagen3, Fecha, Usuario, Autor, Aceptada);
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
    
    public static List<Noticia> getNotCine() {
        List<Noticia> noticias = new ArrayList<>();
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            String sql = "CALL `notifakedb`.`NOTICIA_CINE`();";
            CallableStatement statment = con.prepareCall(sql);

            ResultSet res = statment.executeQuery();
            while (res.next()) {
                int id = res.getInt(1);
                String Titulo = res.getString(2);
                String Descripcion = res.getString(3);
                int categoria = res.getInt(4);
                String Parrafo1 = res.getString(5);
                String Imagen1 = res.getString(6);
                String Fecha = res.getString(9);
                int Usuario = res.getInt(10);
                String Parrafo2 = res.getString(11);
                String Imagen2 = res.getString(12);
                String Imagen3 = res.getString(13);
                
                             
                noticias.add(new Noticia(id, Titulo, Descripcion, categoria, Parrafo1, Parrafo2, Imagen1, Imagen2, Imagen3, Fecha, Usuario));
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
        return noticias;
    }
    
    
     public static List<Noticia> getNotMusica() {
        List<Noticia> noticias = new ArrayList<>();
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            String sql = "CALL `notifakedb`.`NOTICIA_MUSICA`();";
            CallableStatement statment = con.prepareCall(sql);

            ResultSet res = statment.executeQuery();
            while (res.next()) {
                int id = res.getInt(1);
                String Titulo = res.getString(2);
                String Descripcion = res.getString(3);
                int categoria = res.getInt(4);
                String Parrafo1 = res.getString(5);
                String Imagen1 = res.getString(6);
                String Fecha = res.getString(9);
                int Usuario = res.getInt(10);
                String Parrafo2 = res.getString(11);
                String Imagen2 = res.getString(12);
                String Imagen3 = res.getString(13);
                
                             
                noticias.add(new Noticia(id, Titulo, Descripcion, categoria, Parrafo1, Parrafo2, Imagen1, Imagen2, Imagen3, Fecha, Usuario));
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
        return noticias;
    }
    
       
     public static List<Noticia> getNotPolitica() {
        List<Noticia> noticias = new ArrayList<>();
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            String sql = "CALL `notifakedb`.`NOTICIAS_PELICULA`();";
            CallableStatement statment = con.prepareCall(sql);

            ResultSet res = statment.executeQuery();
            while (res.next()) {
                int id = res.getInt(1);
                String Titulo = res.getString(2);
                String Descripcion = res.getString(3);
                int categoria = res.getInt(4);
                String Parrafo1 = res.getString(5);
                String Imagen1 = res.getString(6);
                String Fecha = res.getString(9);
                int Usuario = res.getInt(10);
                String Parrafo2 = res.getString(11);
                String Imagen2 = res.getString(12);
                String Imagen3 = res.getString(13);
                
                             
                noticias.add(new Noticia(id, Titulo, Descripcion, categoria, Parrafo1, Parrafo2, Imagen1, Imagen2, Imagen3, Fecha, Usuario));
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
        return noticias;
    }
    
    
    public static List<Noticia> getMisNoticias(int myID) {
        List<Noticia> noticias = new ArrayList<>();
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            String sql = "CALL `notifakedb`.`MIS_NOTICIAS`(?);";
            CallableStatement statment = con.prepareCall(sql);
            statment.setInt(1, myID);

            ResultSet res = statment.executeQuery();
            while (res.next()) {
                int id = res.getInt(1);
                String Titulo = res.getString(2);
                String Descripcion = res.getString(3);
                int categoria = res.getInt(4);
                String Parrafo1 = res.getString(5);
                String Imagen1 = res.getString(6);
                String Fecha = res.getString(7);
                int Usuario = res.getInt(8);
                String Parrafo2 = res.getString(9);
                String Imagen2 = res.getString(10);
                String Imagen3 = res.getString(11);
                int Aceptado = res.getInt(12);
                String Autor = res.getString(13);
                
                
                noticias.add(new Noticia(id, Titulo, Descripcion, categoria, Parrafo1, Parrafo2, Imagen1, Imagen2, Imagen3, Fecha, Usuario, Autor, Aceptado) );
                
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
        return noticias;
    }
    
     public static List<Noticia> getRevisar() {
        List<Noticia> noticias = new ArrayList<>();
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            String sql = "CALL `notifakedb`.`NOTICIAS_REVISAR`();";
            CallableStatement statment = con.prepareCall(sql);

            ResultSet res = statment.executeQuery();
          
            while (res.next()) {
                int id = res.getInt(1);
                String Titulo = res.getString(2);
                String Descripcion = res.getString(3);
                int categoria = res.getInt(4);
                String Parrafo1 = res.getString(5);
                String Imagen1 = res.getString(6);
                String Fecha = res.getString(7);
                int Usuario = res.getInt(8);
                String Parrafo2 = res.getString(9);
                String Imagen2 = res.getString(10);
                String Imagen3 = res.getString(11);
                int Aceptado = res.getInt(12);
                String Autor = res.getString(13);
                
                
                noticias.add(new Noticia(id, Titulo, Descripcion, categoria, Parrafo1, Parrafo2, Imagen1, Imagen2, Imagen3, Fecha, Usuario, Autor, Aceptado) );
                
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
        return noticias;
    }
    
        public static int AcepNot(int ID) {
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            String sql = "CALL `notifakedb`.`Noticia_Aceptada`(?);";
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
