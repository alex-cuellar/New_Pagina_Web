/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.models;

/**
 *
 * @author Sara
 */
public class Comentarios {
    private int idNoticia;
    private int idUsuario;
    private String texto;
   
    private String nombreUsuario;
     private String imagen;

    public Comentarios() {
    }

    public Comentarios(int idNoticia, int idUsuario, String texto) {
        this.idNoticia = idNoticia;
        this.idUsuario = idUsuario;
        this.texto = texto;
    }

    public Comentarios(int idNoticia, int idUsuario, String texto, String nombreUsuario) {
        this.idNoticia = idNoticia;
        this.idUsuario = idUsuario;
        this.texto = texto;
        this.nombreUsuario = nombreUsuario;
    }

    public Comentarios(int idNoticia, int idUsuario, String texto, String nombreUsuario, String imagen) {
        this.idNoticia = idNoticia;
        this.idUsuario = idUsuario;
        this.texto = texto;
        this.nombreUsuario = nombreUsuario;
        this.imagen = imagen;
    }

    public String getImagen() {
        return imagen;
    }

    public int getIdNoticia() {
        return idNoticia;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public String getTexto() {
        return texto;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public void setIdNoticia(int idNoticia) {
        this.idNoticia = idNoticia;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }
    
    
    
    
    
    
}
