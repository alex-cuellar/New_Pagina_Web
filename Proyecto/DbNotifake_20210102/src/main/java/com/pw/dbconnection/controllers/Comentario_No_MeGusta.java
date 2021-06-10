/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.controllers;

import com.pw.dbconnection.dao.ComentariosDAO;
import com.pw.dbconnection.dao.FavoritosDAO;
import com.pw.dbconnection.dao.NoticiaDAO;
import com.pw.dbconnection.models.Comentarios;
import com.pw.dbconnection.models.Noticia;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sara
 */
@WebServlet(name = "Comentario_No_MeGusta", urlPatterns = {"/Comentario_No_MeGusta"})
public class Comentario_No_MeGusta extends HttpServlet {

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
            //String idn = request.getParameter("id");
            String idnc = request.getParameter("idc");            
            //int id = Integer.parseInt(idn);
            int idc = Integer.parseInt(idnc);
            //FavoritosDAO.MarcarNMG(id);
            FavoritosDAO.ComentarioMarcarNMG(idc);
            Comentarios coment = ComentariosDAO.getComentario(idc);
            Noticia noticia = NoticiaDAO.getNoticia(coment.getIdNoticia());
            
            
            
            request.setAttribute("Ver", noticia);
             
            List<Comentarios> comentarios = ComentariosDAO.comentariosNoticia(coment.getIdNoticia());
            request.setAttribute("Comentarios", comentarios);
            
                        
            List<Comentarios> respuestas = ComentariosDAO.respuestasNoticia(coment.getIdNoticia());
            request.setAttribute("Respuestas", respuestas);
                        int safe = 1;
            request.setAttribute("gpa", safe);
            request.getRequestDispatcher("notice.jsp").forward(request, response);
        
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
        processRequest(request, response);
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

