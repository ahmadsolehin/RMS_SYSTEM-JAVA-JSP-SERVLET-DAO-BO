/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rms.controller;

import rms.dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import rms.model.UserBean;

@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("</head>");

        try {

            UserBean user = new UserBean();
            user.setUsername(request.getParameter("un"));
            user.setPassword(request.getParameter("pw"));

            UserBean mrbean = UserDAO.getUser(user);
            //System.out.println(""+user.getUsername()); 
            //out.println(""+user.getUsername());            

            boolean status = UserDAO.login(user);
            out.println(status);
            if (status) {

                out.println("You r successfully logged in");

                HttpSession session = request.getSession(true);
                session.setAttribute("currentSessionUser", mrbean);

                session.setAttribute("AccessRight", UserDAO.getUserAccess(Integer.parseInt(mrbean.getId())));
                //    response.sendRedirect("mainmenu.jsp"); //logged-in page    
                //        session.setAttribute("currentSessionUser", mrbean);

                String urlsend = "/mainmenu.jsp";
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(urlsend);
                dispatcher.forward(request, response);

            } else {
                out.print("Sorry, email or password error");
                // response.sendRedirect("index.jsp"); //logged-in page    

            }
        } catch (Throwable theException) {
            out.println(theException);
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
    }
}
