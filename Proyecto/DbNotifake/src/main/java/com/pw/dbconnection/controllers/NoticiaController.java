/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.controllers;

import com.pw.dbconnection.dao.NoticiaDAO;
import com.pw.dbconnection.models.Noticia;
import com.pw.dbconnection.utils.FileUtils;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Sara
 */
@WebServlet(name = "NoticiaController", urlPatterns = {"/NoticiaController"})
@MultipartConfig(maxFileSize = 1000 * 1000 * 5, maxRequestSize = 1000 * 1000 * 25, fileSizeThreshold = 1000 * 1000)
public class NoticiaController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Noticia> noticia = NoticiaDAO.getNoticias();
        List<Noticia> destacadas = NoticiaDAO.getDestacadas();
        // Lo agregamos como atributo al request
        request.setAttribute("noticias", noticia);
        request.setAttribute("destacadas", destacadas);
        // Enviamos el request a index.jsp con la informacion
        request.getRequestDispatcher("principal1.jsp").forward(request, response);
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
        List<Noticia> noticia = NoticiaDAO.getNoticias();
        List<Noticia> destacadas = NoticiaDAO.getDestacadas();
        // Lo agregamos como atributo al request
        request.setAttribute("noticias", noticia);
        request.setAttribute("destacadas", destacadas);
        // Enviamos el request a index.jsp con la informacion
        request.getRequestDispatcher("principal1.jsp").forward(request, response);

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

        String Titulo = request.getParameter("Titulo");
        String Descripcion = request.getParameter("Descripcion");
        String Informacion1 = request.getParameter("Informacion1");
        String Informacion2 = request.getParameter("Informacion2");
        int genero = Integer.parseInt(request.getParameter("Genero"), 10);

        Part file1 = request.getPart("PImage");
        String contentType1 = file1.getContentType();
        String nameImage1 = file1.getName() + System.currentTimeMillis() + FileUtils.GetExtension(contentType1);
        String fullPath1 = path + FileUtils.RUTE_USER_IMAGE + "/" + nameImage1;
        // Copiamos la imagen en la ruta especificada
        file1.write(fullPath1);

        Part file2 = request.getPart("SImage");
        String contentType2 = file2.getContentType();
        String nameImage2 = file2.getName() + System.currentTimeMillis() + FileUtils.GetExtension(contentType2);
        String fullPath2 = path + FileUtils.RUTE_USER_IMAGE + "/" + nameImage2;
        // Copiamos la imagen en la ruta especificada
        file2.write(fullPath2);

        Part file3 = request.getPart("TImage");
        String contentType3 = file3.getContentType();
        String nameImage3 = file3.getName() + System.currentTimeMillis() + FileUtils.GetExtension(contentType3);
        String fullPath3 = path + FileUtils.RUTE_USER_IMAGE + "/" + nameImage3;
        // Copiamos la imagen en la ruta especificada
        file3.write(fullPath3);
        int id = (int) request.getSession().getAttribute("id");
        Noticia noticia = new Noticia(Titulo, Descripcion, genero, Informacion1, Informacion2, FileUtils.RUTE_USER_IMAGE + "/" + nameImage1, FileUtils.RUTE_USER_IMAGE + "/" + nameImage2, FileUtils.RUTE_USER_IMAGE + "/" + nameImage3, "10-12-2020", id);
        NoticiaDAO.insertNotice(noticia);

        response.sendRedirect("CrearNoticia.jsp");
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
