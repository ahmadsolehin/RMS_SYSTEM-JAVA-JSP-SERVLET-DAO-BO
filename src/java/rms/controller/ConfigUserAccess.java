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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rms.util.ConnectionUtil;

/**
 *
 * @author sony
 */
@WebServlet(name = "ConfigUserAccess", urlPatterns = {"/ConfigUserAccess"})
public class ConfigUserAccess extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        Connection connect = ConnectionUtil.getConnection();

        String[] idmod = request.getParameterValues("estate");
        String[] name = request.getParameterValues("name");
        int id = Integer.parseInt(request.getParameter("id"));

        String update = "update access_control set access = '' where user_id = '" + id + "' ";
        PreparedStatement ps3 = connect.prepareStatement(update);
        ps3.executeUpdate();

        for (int e = 0; e < name.length; e++) {
            String myQuery = "delete from access_control where user_id = '" + id + "' AND module_id = '" + idmod[e] + "' ";
            PreparedStatement ps = connect.prepareStatement(myQuery);
            int x = ps.executeUpdate();
            out.println(x);
            ConnectionUtil.closeStatement(ps);
        }

        String a = ("insert into access_control (user_id, module_id, module_name, access) values (?, ?, ?, ?) ");
        PreparedStatement ps2 = connect.prepareStatement(a);

        for (int i = 0; i < name.length; i++) {
            out.println(idmod[i] + "-");
            out.println(name[i] + "<br>");

            ps2.setInt(1, id);
            ps2.setString(2, idmod[i]);
            ps2.setString(3, name[i]);
            ps2.setString(4, "Yes");
            ps2.executeUpdate();
        }

        ConnectionUtil.closeStatement(ps2);
        ConnectionUtil.closeStatement(ps3);
        ConnectionUtil.closeConnection(connect);

        
        String urlsend = "/datatableAlluser.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(urlsend);
        dispatcher.forward(request, response);
//        //delete jd
//ps2.executeBatch();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ConfigUserAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ConfigUserAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
