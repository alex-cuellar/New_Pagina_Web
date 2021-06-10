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
public class Noticia {

    private int id;
    private String Titulo;
    private String DescripCorta;
    private int idCategoria;
    private String Parrafo1;
    private String Parrafo2;
    private String Imagen1;
    private String Imagen2;
    private String Imagen3;
    private String fecha;
    private int idUsuario;
    public String getTitulo;
    public String Autor;
    public int Aceptada;

    public Noticia() {

    }

    public Noticia(int id, String Titulo, String DescripCorta, int idCategoria, String Parrafo1, String Parrafo2, String Imagen1, String Imagen2, String Imagen3, String fecha, int idUsuario) {
        this.id = id;
        this.Titulo = Titulo;
        this.DescripCorta = DescripCorta;
        this.idCategoria = idCategoria;
        this.Parrafo1 = Parrafo1;
        this.Parrafo2 = Parrafo2;
        this.Imagen1 = Imagen1;
        this.Imagen2 = Imagen2;
        this.Imagen3 = Imagen3;
        this.fecha = fecha;
        this.idUsuario = idUsuario;
    }

    public Noticia(int id, String Titulo, String DescripCorta, int idCategoria, String Parrafo1, String Parrafo2, String Imagen1, String Imagen2, String Imagen3, String fecha, int idUsuario, String Autor) {
        this.id = id;
        this.Titulo = Titulo;
        this.DescripCorta = DescripCorta;
        this.idCategoria = idCategoria;
        this.Parrafo1 = Parrafo1;
        this.Parrafo2 = Parrafo2;
        this.Imagen1 = Imagen1;
        this.Imagen2 = Imagen2;
        this.Imagen3 = Imagen3;
        this.fecha = fecha;
        this.idUsuario = idUsuario;
        this.Autor = Autor;
    }

    public Noticia(String Titulo, String DescripCorta, int idCategoria, String Parrafo1, String Parrafo2, String Imagen1, String Imagen2, String Imagen3, String fecha, int idUsuario) {
        this.Titulo = Titulo;
        this.DescripCorta = DescripCorta;
        this.idCategoria = idCategoria;
        this.Parrafo1 = Parrafo1;
        this.Parrafo2 = Parrafo2;
        this.Imagen1 = Imagen1;
        this.Imagen2 = Imagen2;
        this.Imagen3 = Imagen3;
        this.fecha = fecha;
        this.idUsuario = idUsuario;
    }
    
 
  public Noticia(int id, String Titulo, String DescripCorta, int idCategoria, String Parrafo1, String Parrafo2, String Imagen1, String Imagen2, String Imagen3, String fecha, int idUsuario, String Autor, int Aceptada) {
        this.id = id;
        this.Titulo = Titulo;
        this.DescripCorta = DescripCorta;
        this.idCategoria = idCategoria;
        this.Parrafo1 = Parrafo1;
        this.Parrafo2 = Parrafo2;
        this.Imagen1 = Imagen1;
        this.Imagen2 = Imagen2;
        this.Imagen3 = Imagen3;
        this.fecha = fecha;
        this.idUsuario = idUsuario;
        this.Autor = Autor;
          this.Aceptada = Aceptada;
    }

    public void setAceptada(int Aceptada) {
        this.Aceptada = Aceptada;
    }

    public int getAceptada() {
        return Aceptada;
    }

    public void setGetTitulo(String getTitulo) {
        this.getTitulo = getTitulo;
    }

    public void setAutor(String Autor) {
        this.Autor = Autor;
    }

    public String getGetTitulo() {
        return getTitulo;
    }

    public String getAutor() {
        return Autor;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTitulo(String Titulo) {
        this.Titulo = Titulo;
    }

    public void setDescripCorta(String DescripCorta) {
        this.DescripCorta = DescripCorta;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public void setParrafo1(String Parrafo1) {
        this.Parrafo1 = Parrafo1;
    }

    public void setParrafo2(String Parrafo2) {
        this.Parrafo2 = Parrafo2;
    }

    public void setImagen1(String Imagen1) {
        this.Imagen1 = Imagen1;
    }

    public void setImagen2(String Imagen2) {
        this.Imagen2 = Imagen2;
    }

    public void setImagen3(String Imagen3) {
        this.Imagen3 = Imagen3;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getId() {
        return id;
    }

    public String getTitulo() {
        return Titulo;
    }

    public String getDescripCorta() {
        return DescripCorta;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public String getParrafo1() {
        return Parrafo1;
    }

    public String getParrafo2() {
        return Parrafo2;
    }

    public String getImagen1() {
        return Imagen1;
    }

    public String getImagen2() {
        return Imagen2;
    }

    public String getImagen3() {
        return Imagen3;
    }

    public String getFecha() {
        return fecha;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

}
