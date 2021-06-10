/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.models;

/**
 *
 * @author magoc
 */
public class UserModel {
    //Nombre, Descrip, Email, Usr, Pass, RedSoc, Tipo, Imagen, Status1
    private int id;
    private String Name;
    private String Descript;
    private String Email;
    private String userName;
    private String password;
    private String RedSoc;
    private Integer Tipo;
    private String urlImage;

    public UserModel() {
    }
 public UserModel(String userName, String password){
        this.userName = userName;
        this.password = password;
    }
 

    public UserModel(String Name1, String descript, String email, String userName, String password, String urlImage, Integer tipo, String redsoc) {
        this.Name = Name1;
        this.Descript = descript;
        this.Email = email;
        this.userName = userName;
        this.password = password;
        this.urlImage = urlImage;
        this.RedSoc = redsoc;
        this.Tipo = tipo;
        
    }
    
     public UserModel(int id, String Name1, String descript, String email, String userName, String urlImage, Integer tipo, String redsoc) {
        this.Name = Name1;
        this.Descript = descript;
        this.Email = email;
        this.userName = userName;
        this.id = id;
        this.urlImage = urlImage;
        this.RedSoc = redsoc;
        this.Tipo = tipo;
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
 
    public String getName() {
        return Name;
    }

    public void setName(String Name1) {
        this.Name = Name1;
    }
    
    public String getDescript() {
        return Descript;
    }

    public void setDescript(String descript) {
        this.Descript = descript;
    }
    
    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        this.Email = email;
    }
    
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUrlImage() {
        return urlImage;
    }

    public void setUrlImage(String urlImage) {
        this.urlImage = urlImage;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getRedSoc() {
        return RedSoc;
    }

    public void setRedSoc(String redsoc) {
        this.RedSoc = redsoc;
    }
    
    public Integer getTipo() {
        return Tipo;
    }

    public void setTipo(Integer tipo) {
        this.Tipo = tipo;
    }

}
