/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pw.dbconnection.controllers;

import com.pw.dbconnection.dao.UserDAO;
import com.pw.dbconnection.models.UserModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sara
 */
@WebServlet(name = "LogIn", urlPatterns = {"/LogIn"})
public class LogIn extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtenemos los usuarios del DAO
        List<UserModel> users = UserDAO.getUsers();
        // Lo agregamos como atributo al request
        request.setAttribute("users", users);
        // Enviamos el request a index.jsp con la informacion
        request.getRequestDispatcher("IS.jsp").forward(request, response);
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
        String usr = request.getParameter("Nikname");
        String password = request.getParameter("Password");
        UserModel user = new UserModel(usr, password);
        UserModel login = UserDAO.LogIn(user);
        if (login != null) {
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
