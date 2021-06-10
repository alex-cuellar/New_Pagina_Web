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
    private int ID;
    private int idNoticia;
    private int idUsuario;
    private int idComent;
    private String texto;
    private String fecha;
    private String Calif;
    private int isRegister;
    private String UsrAnon;
    private int isHidden;
   
    private String nombreUsuario;
     private String imagen;

    public Comentarios() {
    }

    public Comentarios(int idNoticia, int idUsuario, String texto) {
        this.idNoticia = idNoticia;
        this.idUsuario = idUsuario;
        this.texto = texto;
    }

    public Comentarios(int idNoticia1, int idUsuario1, String texto1, String name, int a) {
        this.UsrAnon = name;
        this.idNoticia = idNoticia1;
        this.idUsuario = idUsuario1;
        this.texto = texto1;
    }
        
    public Comentarios(int idNoticia, int idUsuario, String texto, String nombreUsuario) {
        this.idNoticia = idNoticia;
        this.idUsuario = idUsuario;
        this.texto = texto;
        this.nombreUsuario = nombreUsuario;
    }

    public Comentarios(int idCom, int idNoticia, int idUsuario, String texto, String nombreUsuario, String imagen, String Fecha1, int isRegister1, String UsrAnonimo1, String Calif1, int isHidden1) {
        this.ID = idCom;
        this.idComent = 0;
        this.idNoticia = idNoticia;
        this.idUsuario = idUsuario;
        this.texto = texto;
        this.nombreUsuario = nombreUsuario;
        this.imagen = imagen;
        this.fecha = Fecha1;
        
        this.Calif = Calif1;
        this.isRegister = isRegister1;
        this.UsrAnon = UsrAnonimo1;
        this.isHidden = isHidden1;
        
    }

    
        public Comentarios(int ID1, int idNoticia, int idUsuario, String texto, String nombreUsuario, String imagen, int idComent1) {
        //Respuestas
        this.ID = ID1;
        this.idComent = idComent1;
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

    public int getId() {
        return ID;
    }
    public String getFecha() {
        return fecha;
    }
    
    public int getIdComent() {
        return idComent;
    }
    
    public String getTexto() {
        return texto;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }
    
    public String getCalif() {
        return Calif;
    }
    
    public float IgetCalif() {
        return Float.parseFloat(Calif);
    }
    
    public String getAnonimo() {
        return UsrAnon;
    }
    
    public int isReg() {
        return isRegister;
    }
    
    public int isHide() {
        return isHidden;
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
