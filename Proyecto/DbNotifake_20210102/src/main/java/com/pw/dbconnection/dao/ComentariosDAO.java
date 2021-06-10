/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.dao;

import com.pw.dbconnection.models.Comentarios;
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
public class ComentariosDAO {

    public static int nuevoComentario(Comentarios cometario) {
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            String sql = "CALL `notifakedb`.`Comentario_Usuario_Registrado`(?, ?, ?);";
            CallableStatement statment = con.prepareCall(sql);

            statment.setInt(1, cometario.getIdNoticia());
            statment.setInt(2, cometario.getIdUsuario());
            statment.setString(3, cometario.getTexto());

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

    public static List<Comentarios> comentariosNoticia(int idNews) {
        List<Comentarios> comentarios = new ArrayList<>();
        Connection con = null;

        try {
            con = DbConnection.getConnection();
            String sql = "CALL `notifakedb`.`Obtener_Comentarios`(?);";
            CallableStatement statment = con.prepareCall(sql);
            statment.setInt(1, idNews);

            ResultSet res = statment.executeQuery();
            while (res.next()) {

                int id = res.getInt(1);
                int idNot = res.getInt(2);
                int idUsu = res.getInt(3);
                String Texto = res.getString(4);
                String NombreUs = res.getString(5);
                String Imagen = res.getString(6);
                String Fecha = res.getString(7);
                
                int isRegister1 = res.getInt(8);
                String UsrAnonimo1 = res.getString(9);
                String Calif1 = res.getString(10);
                int isHidden1 = res.getInt(11);
                
                comentarios.add(new Comentarios(id, idNot, idUsu, Texto, NombreUs, Imagen, Fecha, isRegister1, UsrAnonimo1, Calif1, isHidden1) );

            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NoticiaDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return comentarios;
    }
    
            public static int nuevoRespuesta(int idN, int idU, int idC, String text) {
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            String sql = "CALL `notifakedb`.`Respuesta_Usuario_Registrado`(?, ?, ?, ?);";
            CallableStatement statment = con.prepareCall(sql);

            statment.setInt(1, idN);
            statment.setInt(2, idU);
            statment.setInt(3, idC);
            statment.setString(4, text);

            
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

    public static List<Comentarios> respuestasNoticia(int idComent) {
        List<Comentarios> comentarios = new ArrayList<>();
        Connection con = null;

        try {
            con = DbConnection.getConnection();
            String sql = "CALL `notifakedb`.`Obtener_Resp_Noti`(?);";
            CallableStatement statment = con.prepareCall(sql);
            statment.setInt(1, idComent);

            ResultSet res = statment.executeQuery();
            while (res.next()) {
                int id1 = res.getInt(1);
                int idNot = res.getInt(2);
                int idUsu = res.getInt(3);
                int idCom = res.getInt(4);
                String Texto = res.getString(5);
                String NombreUs = res.getString(6);
                String Imagen = res.getString(7);

                comentarios.add(new Comentarios(id1, idNot, idUsu, Texto, NombreUs, Imagen, idCom) );

            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(NoticiaDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return comentarios;
    }
    
        public static int nuevoComentarioAnonimo(Comentarios cometario) {
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            String sql = "CALL `notifakedb`.`Comentario_Anonimo`(?, ?, ?, ?);";
            CallableStatement statment = con.prepareCall(sql);

            int a = cometario.getIdNoticia();
            int b = cometario.getIdUsuario();
            String c = cometario.getTexto();
            String d = cometario.getAnonimo();
            
            statment.setInt(1, cometario.getIdNoticia());
            statment.setInt(2, cometario.getIdUsuario());
            statment.setString(3, cometario.getTexto());
            statment.setString(4, cometario.getAnonimo());
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
        
         public static Comentarios getComentario(int idComentario) {
        Connection con = null;
        try {
            con = DbConnection.getConnection();
            String sql = "CALL `notifakedb`.`OBTENER_COMENTARIO`(?);";
            CallableStatement statment = con.prepareCall(sql);

            statment.setInt(1, idComentario);
            
            
            ResultSet res = statment.executeQuery();
            while (res.next()) {
                int id = res.getInt(1);
                int idNot = res.getInt(2);
                int idUsu = res.getInt(3);
                String Texto = res.getString(4);
                String NombreUs = res.getString(5);
                String Imagen = res.getString(6);
                String Fecha = res.getString(7);
                
                int isRegister1 = res.getInt(8);
                String UsrAnonimo1 = res.getString(9);
                String Calif1 = res.getString(10);
                int isHidden1 = res.getInt(11);
                
                return new Comentarios(id, idNot, idUsu, Texto, NombreUs, Imagen, Fecha, isRegister1, UsrAnonimo1, Calif1, isHidden1);
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
    
}
