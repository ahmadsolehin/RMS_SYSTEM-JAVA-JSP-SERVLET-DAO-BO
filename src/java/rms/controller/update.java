/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rms.controller;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rms.bo.ContractorBO;
import rms.model.Contractor;

/**
 *
 * @author sony
 */
@WebServlet(name = "update", urlPatterns = {"/update"})
public class update extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
       
//        

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
        
        
        
        String code = request.getParameter("contractorcode");
        String name = request.getParameter("companyname");
        String regno = request.getParameter("regno");
        String gstid = request.getParameter("gstid");
        String bumiputera = request.getParameter("bumiputera");
        String ownername = request.getParameter("ownername");
        String owneric = request.getParameter("owneric");
        String ownernation = request.getParameter("ownernation");
        String kelas = request.getParameter("kelas");
        String person = request.getParameter("person");
        String title = request.getParameter("title");
        String position = request.getParameter("position");
        String contact = request.getParameter("contact");
        String address = request.getParameter("address");
        String postcode = request.getParameter("postcode");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String country = request.getParameter("country");
        String fax = request.getParameter("fax");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String url = request.getParameter("url");
        String bayaran = request.getParameter("bayaran");
        String remark = request.getParameter("remark");
        
        
        Contractor dataContrator = new Contractor();
        
        
        dataContrator.setContractorCode(code);
        dataContrator.setCompanyName(name);
        dataContrator.setRegNo(regno);
        dataContrator.setGstId(gstid);
        dataContrator.setBumiputera(bumiputera);
        dataContrator.setOwnername(ownername);
        dataContrator.setOwneric(owneric);
        dataContrator.setOwnernation(ownernation);
        dataContrator.setKelas(kelas);
        dataContrator.setPerson(person);
        dataContrator.setTitle(title);
        dataContrator.setPosition(position);
        dataContrator.setContact(contact);
        dataContrator.setAddress(address);
        dataContrator.setPostcode(postcode);
        dataContrator.setCity(city);
        dataContrator.setCountry(country);
        dataContrator.setState(state);
        dataContrator.setFax(fax);
        dataContrator.setPhone(phone);
        dataContrator.setEmail(email);
        dataContrator.setUrl(url);
        dataContrator.setBayaran(bayaran);
        dataContrator.setRemark(remark);
        
        try {
            ContractorBO.updateContractor(dataContrator);
            
        
        } catch (Exception ex) {
            Logger.getLogger(update.class.getName()).log(Level.SEVERE, null, ex);
                        out.println(ex);

        }
        
        String urlsend = "/datatabletest.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(urlsend);
        dispatcher.forward(request,response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
