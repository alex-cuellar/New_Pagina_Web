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

                int idNot = res.getInt(1);
                int idUsu = res.getInt(2);
                String Texto = res.getString(3);
                String NombreUs = res.getString(4);
                String Imagen = res.getString(5);

                comentarios.add(new Comentarios(idNot, idUsu, Texto, NombreUs, Imagen) );

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
}
