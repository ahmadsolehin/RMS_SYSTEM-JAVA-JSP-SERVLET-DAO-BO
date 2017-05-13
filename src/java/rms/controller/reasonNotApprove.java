/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rms.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rms.dao.ContractorDAO;
import rms.model.Contractor;

/**
 *
 * @author sony
 */
@WebServlet(name = "reasonNotApprove", urlPatterns = {"/reasonNotApprove"})
public class reasonNotApprove extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String id = request.getParameter("id");
        String why = request.getParameter("reason");
        int reject = Integer.parseInt(request.getParameter("sapereject"));
        String conname = request.getParameter("contractorname");

        Contractor dataContrator = new Contractor();
        dataContrator.setContractorCode(id);
        dataContrator.setReasonNotApprove(why);

        try {
            ContractorDAO.reasonNotApprove(dataContrator, reject, conname);
        } catch (Exception ex) {
            Logger.getLogger(reasonNotApprove.class.getName()).log(Level.SEVERE, null, ex);
            out.println(ex);
        }

        String urlsend = "/datatabletest.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(urlsend);
        dispatcher.forward(request, response);
    }

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
        PrintWriter out = response.getWriter();

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
