/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.controllers;

import com.pw.dbconnection.dao.UserDAO;
import com.pw.dbconnection.models.UserModel;
import com.pw.dbconnection.utils.FileUtils;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Este servlet controlara los Usuarios, verifiquen el web.xml
 * este es el primer archivo en llamarse, alli exsite un apartado llamado
 * welcome file list donde pueden colocar que archivo quieren que sea el primero
 * en ser cargado
 * en este momento es este
 * @author magoc
 */
@WebServlet(name = "UsersController", urlPatterns = {"/UsersController"})
@MultipartConfig(maxFileSize = 1000 * 1000 * 5, maxRequestSize = 1000 * 1000 * 25, fileSizeThreshold = 1000 * 1000)
public class UsersController extends HttpServlet {

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
        // Obtenemos los usuarios del DAO
        List<UserModel> users = UserDAO.getUsers();
        // Lo agregamos como atributo al request
        request.setAttribute("users", users);
        // Enviamos el request a index.jsp con la informacion
        request.getRequestDispatcher("registro.jsp").forward(request, response);
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
        String name = request.getParameter("name");
        String email = request.getParameter("email");
         String descript = request.getParameter("descript1");
        // Obtenemos el nombre debe coincidir con el name del input
        String usr = request.getParameter("usr1");
        // Obtenemos el contraseña debe coincidir con el name del input
        String password = request.getParameter("password");
        String redsoc = request.getParameter("redsoc1");
        
        
        String opcion = request.getParameter("op");
        int op = Integer.parseInt(opcion);
        Integer tipo;
        if(op != 0){
            tipo = Integer.parseInt(request.getParameter("tipo1"));
        }
        else{
            tipo = 1;
        }
        
        
        
        String path = request.getServletContext().getRealPath("");
        // Obtenemos la Direccion donde deseamos guardarlo
        File fileSaveDir = new File(path + FileUtils.RUTE_USER_IMAGE);
        // Sino existe el directorio la creamos
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
        // Obtenemos la imagen, debe coincidir con el name del input
        Part file = request.getPart("image");
        String contentType = file.getContentType();
        // Remplazamos el nombre que tiene para que no existan duplicados
        String nameImage = file.getName() + System.currentTimeMillis() + FileUtils.GetExtension(contentType);
        String fullPath = path + FileUtils.RUTE_USER_IMAGE + "/" + nameImage;
        // Copiamos la imagen en la ruta especificada
        file.write(fullPath);
        //Nombre, Descrip, Email, Usr, Pass, RedSoc, Tipo, Imagen
       
        //UserModel user = new UserModel(name, descript, email, usr, password, redsoc, tipo, FileUtils.RUTE_USER_IMAGE + "/" + nameImage);
        UserModel user = new UserModel(name, descript, email, usr, password, FileUtils.RUTE_USER_IMAGE + "/" + nameImage, tipo, redsoc);
        UserDAO.insertUser(user);
        // Retornamos al index
        //response.sendRedirect("index.jsp");
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
    }

}
