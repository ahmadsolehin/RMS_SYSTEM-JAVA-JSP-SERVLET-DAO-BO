/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rms.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rms.model.Notify;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import rms.util.ConnectionUtil;

/**
 *
 * @author sony
 */
@WebServlet(name = "checkForNotify", urlPatterns = {"/checkForNotify"})
public class checkForNotify extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        int id = Integer.parseInt(request.getParameter("id"));
        String user = request.getParameter("user");

        Connection con = ConnectionUtil.getConnection();
        Statement statement = con.createStatement();
        String sql = "select * from readNotify where userId = '" + id + "' ";
        ResultSet rs2 = statement.executeQuery(sql);

        //boolean hasResult = rs2.next();
//out.println(hasResult);
        if (rs2 != null && rs2.next()) {

            int i = 0;

            ArrayList<Integer> listen = new ArrayList<Integer>();
            ArrayList<Notify> notify = new ArrayList<Notify>();
            String ayam = "";
            while (rs2.isFirst()) {
                //out.println(rs2.getInt("message_id")+"<br>");
                listen.add(rs2.getInt("message_id"));
            }

            Integer[] result = new Integer[listen.size()];
            result = listen.toArray(result);

            for (int x = 0; x < result.length; x++) {

                if (x == result.length - 1) {
                    ayam += "" + result[x] + " ";

                } else {
                    ayam += "" + result[x] + " ,";

                }
            }

            try {
                out.println("select * from notification where sender_id <> '" + id + "' AND id NOT IN (  "+ayam+" ) ");
                Statement statement2 = con.createStatement();
                ResultSet rs = statement2.executeQuery("select * from notification where sender_id <> '" + id + "' AND id NOT IN (  " + ayam + " ) ");

                while (rs.next()) {
                    Notify noti = new Notify();
                    noti.setNotify_text(rs.getString("notify_text"));
                    noti.setSender_id(rs.getInt("sender_id"));
                    noti.setFullName(rs.getString("FullName"));
                    noti.setStatus(rs.getString("status"));
                    noti.setDate(rs.getTimestamp("datetime"));
                    noti.setContractorcode(rs.getString("contractorcode"));
                    noti.setContractorname(rs.getString("contractorname"));
                    notify.add(noti);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            Gson gson = new Gson();
            JsonElement element = gson.toJsonTree(notify, new TypeToken<List<Notify>>() {
            }.getType());

            response.setContentType("application/json; charset=UTF-8");
            PrintWriter printOut = response.getWriter();

            JsonArray jsonArray = element.getAsJsonArray();
            printOut.println(jsonArray.toString());
            printOut.flush();

        } else {
            //out.println("tgres");
            ArrayList<Notify> notice = new ArrayList<Notify>();

            try {
                Statement statement2 = con.createStatement();
                ResultSet rs = statement2.executeQuery("select * from notification where sender_id <> '" + id + "'  ");

                while (rs.next()) {
                    Notify not = new Notify();
                    not.setNotify_text(rs.getString("notify_text"));
                    not.setSender_id(rs.getInt("sender_id"));
                    not.setFullName(rs.getString("FullName"));
                    not.setStatus(rs.getString("status"));
                    not.setDate(rs.getTimestamp("datetime"));
                    not.setContractorcode(rs.getString("contractorcode"));
                    not.setContractorname(rs.getString("contractorname"));
                    notice.add(not);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            Gson gson = new Gson();
            JsonElement element = gson.toJsonTree(notice, new TypeToken<List<Notify>>() {
            }.getType());

            response.setContentType("application/json; charset=UTF-8");
            PrintWriter printOut = response.getWriter();

            JsonArray jsonArray = element.getAsJsonArray();
            printOut.println(jsonArray.toString());
            printOut.flush();

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(checkForNotify.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(checkForNotify.class.getName()).log(Level.SEVERE, null, ex);
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
    }// </editor-fold>

}
