/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rms.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rms.dao.UserDAO;

/**
 *
 * @author sony
 */
@WebServlet(name = "editUserBean", urlPatterns = {"/editUserBean"})
public class editUserBean extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
          try {
            String id = request.getParameter("id");
            int ids = Integer.parseInt(id);

            request.setAttribute("bean", UserDAO.getUserByid(ids));

            String urlsend = "/EditUserBean.jsp";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(urlsend);
            dispatcher.forward(request, response);

        } catch (Exception ex) {
            out.println(ex);
        }
        

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
