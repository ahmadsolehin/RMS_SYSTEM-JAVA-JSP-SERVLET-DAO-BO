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
import rms.dao.ContractorDAO;
import rms.util.ConnectionUtil;

/**
 *
 * @author sony
 */
@WebServlet(name = "approveData", urlPatterns = {"/approveData"})
public class approveData extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        int code = Integer.parseInt(request.getParameter("id"));
        int approvalcode = Integer.parseInt(request.getParameter("approval"));
        String contractorname = request.getParameter("contractorname");

        //buat query delete jika ade data approve 
        Connection connect = ConnectionUtil.getConnection();
        String delete = "delete from approvedata where contractorcode = '" + code + "' and reason_not_approve IS NULL ";
        PreparedStatement deleteExist = connect.prepareStatement(delete);
        deleteExist.executeUpdate();

        ConnectionUtil.closeStatement(deleteExist);
        ConnectionUtil.closeConnection(connect);

        try {
            ContractorDAO.approveData(code, approvalcode, contractorname);
        } catch (Exception e) {
            System.out.println(e);
        }

        String urlsend = "/datatabletest.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(urlsend);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(approveData.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(approveData.class.getName()).log(Level.SEVERE, null, ex);
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
