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
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rms.dao.ContractorDAO;
import rms.model.Contractor;
import rms.model.ServerListEstate;
import rms.util.ConnectionUtil;

/**
 *
 * @author sony
 */
@WebServlet(name = "NewServlet", urlPatterns = {"/NewServlet"})
public class NewServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        String cssTag = "<link rel='stylesheet' type='text/css' href='css/haha.css'>";
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String estatecode = request.getParameter("estate");
        int code = Integer.parseInt(request.getParameter("code"));

        Connection con = ConnectionUtil.getServerEstateConnect(); //utk dptkan ip,username ,password dr db server_list kak ton

        Statement statement = con.createStatement();
        ResultSet rs = statement.executeQuery("select * from server_list where estatecode = '" + estatecode + "' ");

        while (rs.next()) {
            ServerListEstate serverlist = new ServerListEstate();
            serverlist.setSvrip(rs.getString("svrip"));
            serverlist.setPassword(rs.getString("password"));
            serverlist.setUsername(rs.getString("username"));
            serverlist.setFolderldg(rs.getString("folderldg"));

            Connection sendto = ConnectionUtil.getServerEstateConnection(serverlist.getSvrip(), serverlist.getFolderldg(), serverlist.getUsername(), serverlist.getPassword());

//            try {
//                String myQuery = "delete from contractorinfo where contractorcode = '" + code + "' ";
//                PreparedStatement ps = sendto.prepareStatement(myQuery);
//                ps.executeUpdate();
//            } catch (Exception er) {
//                //out.println(er);
//            }

            if (sendto == null) {
                out.println("no");
            } else {
                out.println("yes");
            }

        }

        try {
            ContractorDAO.getServerConnect(estatecode, code);
        } catch (Exception ex) {
        }

        
        ConnectionUtil.closeStatement(statement);
        ConnectionUtil.closeConnection(con);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(NewServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>\

    private static Contractor getContractor(ResultSet rs) throws SQLException {
        Contractor c = new Contractor();
        c.setContractorCode(rs.getString("contractorcode"));
        c.setCompanyName(rs.getString("companyname"));
        c.setRegNo(rs.getString("regno"));
        c.setGstId(rs.getString("gstid"));
        c.setBumiputera(rs.getString("bumiputera"));
        c.setOwnername(rs.getString("ownername"));
        c.setOwneric(rs.getString("owneric"));
        c.setOwnernation(rs.getString("ownernation"));
        c.setKelas(rs.getString("kelas"));
        c.setPerson(rs.getString("person"));
        c.setTitle(rs.getString("title"));
        c.setPosition(rs.getString("position"));
        c.setContact(rs.getString("contact"));
        c.setAddress(rs.getString("address"));
        c.setPostcode(rs.getString("postcode"));
        c.setCity(rs.getString("city"));
        c.setCountry(rs.getString("country"));
        c.setState(rs.getString("state"));
        c.setFax(rs.getString("fax"));
        c.setPhone(rs.getString("phone"));
        c.setEmail(rs.getString("email"));
        c.setUrl(rs.getString("url"));
        c.setBayaran(rs.getString("bayaran"));
        c.setRemark(rs.getString("remark"));
        return c;
    }

}
