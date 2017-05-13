/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rms.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rms.dao.UserDAO;
import rms.model.UserBean;
import rms.util.ConnectionUtil;

/**
 *
 * @author sony
 */
@WebServlet(name = "ListingAllUser", urlPatterns = {"/ListingAllUser"})
public class ListingAllUser extends HttpServlet {

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
            throws ServletException, IOException, SQLException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String id = request.getParameter("id");

        try {

            request.setAttribute("list", UserDAO.listAllUser(Integer.parseInt(id)));

        } catch (Exception e) {

        }
        String urlsend = "/ListUser.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(urlsend);
        dispatcher.forward(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ListingAllUser.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ListingAllUser.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private static UserBean getUser(ResultSet rs) throws SQLException {
        UserBean user = new UserBean();
        user.setId(rs.getString("id"));
        user.setEstate(rs.getString("estate"));
        user.setUsername(rs.getString("username"));
        user.setUserStatus(rs.getString("status"));
        user.setFullname(rs.getString("fullname"));
        user.setPosition(rs.getString("position"));
        user.setPassword(rs.getString("password"));
        return user;
    }
}
