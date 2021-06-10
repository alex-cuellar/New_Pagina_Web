/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.controllers;

import com.pw.dbconnection.dao.ComentariosDAO;
import com.pw.dbconnection.models.Comentarios;
import com.pw.dbconnection.models.Noticia;
import com.pw.dbconnection.models.UserModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.pw.dbconnection.dao.NoticiaDAO;
import com.pw.dbconnection.dao.UserDAO;
//import com.pw.dbconnection.models.Noticia;
import com.pw.dbconnection.utils.FileUtils;
import java.io.File;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.List;
//import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
//cookie
import javax.servlet.http.Cookie;

/**
 *
 * @author Sara
 */
@WebServlet(name = "EditarPerfilController", urlPatterns = {"/EditarPerfilController"})
@MultipartConfig(maxFileSize = 1000 * 1000 * 5, maxRequestSize = 1000 * 1000 * 25, fileSizeThreshold = 1000 * 1000)
public class EditarPerfilController extends HttpServlet {
    int idA = 0;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idn = request.getParameter("id");
        idA = Integer.parseInt(idn);
        UserModel usuario = UserDAO.getUser(Integer.parseInt(idn, 10));
        usuario.getName();
        request.setAttribute("Ver", usuario);
        
        //List<Noticia> noticia = NoticiaDAO.getNoticias();
        //List<Noticia> destacadas = NoticiaDAO.getDestacadas();
        // Lo agregamos como atributo al request
        //request.setAttribute("noticias", noticia);
        //request.setAttribute("destacadas", destacadas);
        // Enviamos el request a index.jsp con la informacion
        //List<Comentarios> comentarios = ComentariosDAO.comentariosNoticia(Integer.parseInt(idn, 10));
        //request.setAttribute("Comentarios", comentarios);
        request.getRequestDispatcher("EditarPerfil.jsp").forward(request, response);
        
        String name = "Cookie name";
        String value = "Cookie value";
        Cookie cookie = new Cookie(name, value);
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getServletContext().getRealPath("");
        // Obtenemos la Direccion donde deseamos guardarlo
        File fileSaveDir = new File(path + FileUtils.RUTE_USER_IMAGE);
        // Sino existe el directorio la creamos
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }

        
        

        Part file1 = request.getPart("PImage");
        String contentType1 = file1.getContentType();
        String nameImage1 = file1.getName() + System.currentTimeMillis() + FileUtils.GetExtension(contentType1);
        String fullPath1 = path + FileUtils.RUTE_USER_IMAGE + "/" + nameImage1;
        // Copiamos la imagen en la ruta especificada
        file1.write(fullPath1);
        
        
        String Descripcion = request.getParameter("Descripcion");
        String RedSoc = request.getParameter("RedSoc");
        String Contraseña = request.getParameter("Contrasena");
        
        int idn2 = idA;
        
        
        int id = (int) request.getSession().getAttribute("id");
        //UserModel usuario1 = new UserModel(Titulo, Descripcion, genero, Informacion1, Informacion2, FileUtils.RUTE_USER_IMAGE + "/" + nameImage1, FileUtils.RUTE_USER_IMAGE + "/" + nameImage2, FileUtils.RUTE_USER_IMAGE + "/" + nameImage3, "10-12-2020", id);
        //FileUtils.RUTE_USER_IMAGE + "/" + nameImage1
        UserDAO.PerfilEdit(id, Descripcion, Contraseña, RedSoc, FileUtils.RUTE_USER_IMAGE + "/" + nameImage1);
        UserModel login = UserDAO.getUser(id);
        HttpSession session = request.getSession();
            session.setAttribute("id", login.getId());
            session.setAttribute("name", login.getName());
            session.setAttribute("descrip", login.getDescript());
            session.setAttribute("email", login.getEmail());
            session.setAttribute("Soc", login.getRedSoc());
            session.setAttribute("tipo", login.getTipo());
            session.setAttribute("image", login.getUrlImage());
            session.setAttribute("username", login.getUserName());

            response.sendRedirect("NoticiaController");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

