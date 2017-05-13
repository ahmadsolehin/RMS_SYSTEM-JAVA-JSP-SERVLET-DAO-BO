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
import rms.model.AccessControl;
import rms.model.UserBean;
import rms.util.ConnectionUtil;

/**
 *
 * @author sony
 */
@WebServlet(name = "addNewUser", urlPatterns = {"/addNewUser"})
public class addNewUser extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String fullname = request.getParameter("fullname");
        String position = request.getParameter("position");
        String estate = request.getParameter("estate");
        String status = request.getParameter("status");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        UserBean bean = new UserBean();

        bean.setFullname(fullname);
        bean.setPosition(position);
        bean.setEstate(estate);
        bean.setUserStatus(status);
        bean.setUsername(username);
        bean.setPassword(password);

        try {
            Connection con = ConnectionUtil.getConnection();
            List<AccessControl> Access = new ArrayList<AccessControl>();

            UserDAO.addNewUser(bean); //masuk data bru dlm db user
            UserBean mrbean = UserDAO.getUser(bean); //nie utk amek id dan letak dlm access control
            //      UserDAO.insertIntoAccessControl(Integer.parseInt(mrbean.getId()), mrbean.getUserStatus());
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select * from access_type");

            while (rs.next()) {
                AccessControl acc = new AccessControl();
                acc.setAccess_id(rs.getInt("access_id"));
                acc.setName(rs.getString("name"));
                Access.add(acc);
            }

            if ("staff".equals(bean.getUserStatus())) {
                out.println("Data already exist");

                String a = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps = con.prepareStatement(a);
                ps.setInt(1, Integer.parseInt(mrbean.getId()));
                ps.setInt(2, Access.get(0).getAccess_id());
                ps.setString(3, Access.get(0).getName());
                ps.setString(4, "Yes");
                ps.executeUpdate();

                String b = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps2 = con.prepareStatement(b);
                ps2.setInt(1, Integer.parseInt(mrbean.getId()));
                ps2.setInt(2, Access.get(1).getAccess_id());
                ps2.setString(3, Access.get(1).getName());
                ps2.setString(4, "Yes");
                ps2.executeUpdate();
                
                String c = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps3 = con.prepareStatement(c);
                ps3.setInt(1, Integer.parseInt(mrbean.getId()));
                ps3.setInt(2, Access.get(2).getAccess_id());
                ps3.setString(3, Access.get(2).getName());
                ps3.setString(4, "Yes");
                ps3.executeUpdate();
                
                String d = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps4 = con.prepareStatement(d);
                ps4.setInt(1, Integer.parseInt(mrbean.getId()));
                ps4.setInt(2, Access.get(3).getAccess_id());
                ps4.setString(3, Access.get(3).getName());
                ps4.setString(4, "Yes");
                ps4.executeUpdate();
                
                String e = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps5 = con.prepareStatement(e);
                ps5.setInt(1, Integer.parseInt(mrbean.getId()));
                ps5.setInt(2, Access.get(4).getAccess_id());
                ps5.setString(3, Access.get(4).getName());
                ps5.setString(4, "Yes");
                ps5.executeUpdate();
                
                String f = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps6 = con.prepareStatement(f);
                ps6.setInt(1, Integer.parseInt(mrbean.getId()));
                ps6.setInt(2, Access.get(5).getAccess_id());
                ps6.setString(3, Access.get(5).getName());
                ps6.setString(4, "");
                ps6.executeUpdate();
                
                String g = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps7 = con.prepareStatement(g);
                ps7.setInt(1, Integer.parseInt(mrbean.getId()));
                ps7.setInt(2, Access.get(6).getAccess_id());
                ps7.setString(3, Access.get(6).getName());
                ps7.setString(4, "");
                ps7.executeUpdate();
                
                String h = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps8 = con.prepareStatement(h);
                ps8.setInt(1, Integer.parseInt(mrbean.getId()));
                ps8.setInt(2, Access.get(7).getAccess_id());
                ps8.setString(3, Access.get(7).getName());
                ps8.setString(4, "");
                ps8.executeUpdate();
                
                String i = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps9 = con.prepareStatement(i);
                ps9.setInt(1, Integer.parseInt(mrbean.getId()));
                ps9.setInt(2, Access.get(8).getAccess_id());
                ps9.setString(3, Access.get(8).getName());
                ps9.setString(4, "");
                ps9.executeUpdate();
                
                String j = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps10 = con.prepareStatement(j);
                ps10.setInt(1, Integer.parseInt(mrbean.getId()));
                ps10.setInt(2, Access.get(9).getAccess_id());
                ps10.setString(3, Access.get(9).getName());
                ps10.setString(4, "");
                ps10.executeUpdate();
                
                String k = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps11 = con.prepareStatement(k);
                ps11.setInt(1, Integer.parseInt(mrbean.getId()));
                ps11.setInt(2, Access.get(10).getAccess_id());
                ps11.setString(3, Access.get(10).getName());
                ps11.setString(4, "");
                ps11.executeUpdate();
                
                ConnectionUtil.closeStatement(ps);
                ConnectionUtil.closeStatement(ps2);
                ConnectionUtil.closeStatement(ps3);
                ConnectionUtil.closeStatement(ps4);
                ConnectionUtil.closeStatement(ps5);
                ConnectionUtil.closeStatement(ps6);
                ConnectionUtil.closeStatement(ps7);
                ConnectionUtil.closeStatement(ps8);
                ConnectionUtil.closeStatement(ps9);
                ConnectionUtil.closeStatement(ps10);
                ConnectionUtil.closeStatement(ps11);

            }else if ("approver".equals(bean.getUserStatus())) {
                out.println("Data already exist");

                String a = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps = con.prepareStatement(a);
                ps.setInt(1, Integer.parseInt(mrbean.getId()));
                ps.setInt(2, Access.get(0).getAccess_id());
                ps.setString(3, Access.get(0).getName());
                ps.setString(4, "Yes");
                ps.executeUpdate();

                String b = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps2 = con.prepareStatement(b);
                ps2.setInt(1, Integer.parseInt(mrbean.getId()));
                ps2.setInt(2, Access.get(1).getAccess_id());
                ps2.setString(3, Access.get(1).getName());
                ps2.setString(4, "Yes");
                ps2.executeUpdate();
                
                String c = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps3 = con.prepareStatement(c);
                ps3.setInt(1, Integer.parseInt(mrbean.getId()));
                ps3.setInt(2, Access.get(2).getAccess_id());
                ps3.setString(3, Access.get(2).getName());
                ps3.setString(4, "Yes");
                ps3.executeUpdate();
                
                String d = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps4 = con.prepareStatement(d);
                ps4.setInt(1, Integer.parseInt(mrbean.getId()));
                ps4.setInt(2, Access.get(3).getAccess_id());
                ps4.setString(3, Access.get(3).getName());
                ps4.setString(4, "Yes");
                ps4.executeUpdate();
                
                String e = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps5 = con.prepareStatement(e);
                ps5.setInt(1, Integer.parseInt(mrbean.getId()));
                ps5.setInt(2, Access.get(4).getAccess_id());
                ps5.setString(3, Access.get(4).getName());
                ps5.setString(4, "Yes");
                ps5.executeUpdate();
                
                String f = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps6 = con.prepareStatement(f);
                ps6.setInt(1, Integer.parseInt(mrbean.getId()));
                ps6.setInt(2, Access.get(5).getAccess_id());
                ps6.setString(3, Access.get(5).getName());
                ps6.setString(4, "Yes");
                ps6.executeUpdate();
                
                String g = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps7 = con.prepareStatement(g);
                ps7.setInt(1, Integer.parseInt(mrbean.getId()));
                ps7.setInt(2, Access.get(6).getAccess_id());
                ps7.setString(3, Access.get(6).getName());
                ps7.setString(4, "Yes");
                ps7.executeUpdate();
                
                String h = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps8 = con.prepareStatement(h);
                ps8.setInt(1, Integer.parseInt(mrbean.getId()));
                ps8.setInt(2, Access.get(7).getAccess_id());
                ps8.setString(3, Access.get(7).getName());
                ps8.setString(4, "");
                ps8.executeUpdate();
                
                String i = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps9 = con.prepareStatement(i);
                ps9.setInt(1, Integer.parseInt(mrbean.getId()));
                ps9.setInt(2, Access.get(8).getAccess_id());
                ps9.setString(3, Access.get(8).getName());
                ps9.setString(4, "");
                ps9.executeUpdate();
                
                String j = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps10 = con.prepareStatement(j);
                ps10.setInt(1, Integer.parseInt(mrbean.getId()));
                ps10.setInt(2, Access.get(9).getAccess_id());
                ps10.setString(3, Access.get(9).getName());
                ps10.setString(4, "");
                ps10.executeUpdate();
                
                String k = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps11 = con.prepareStatement(k);
                ps11.setInt(1, Integer.parseInt(mrbean.getId()));
                ps11.setInt(2, Access.get(10).getAccess_id());
                ps11.setString(3, Access.get(10).getName());
                ps11.setString(4, "");
                ps11.executeUpdate();
                
                ConnectionUtil.closeStatement(ps);
                ConnectionUtil.closeStatement(ps2);
                ConnectionUtil.closeStatement(ps3);
                ConnectionUtil.closeStatement(ps4);
                ConnectionUtil.closeStatement(ps5);
                ConnectionUtil.closeStatement(ps6);
                ConnectionUtil.closeStatement(ps7);
                ConnectionUtil.closeStatement(ps8);
                ConnectionUtil.closeStatement(ps9);
                ConnectionUtil.closeStatement(ps10);
                ConnectionUtil.closeStatement(ps11);

            }else if ("admin".equals(bean.getUserStatus())) {
                out.println("Data already exist");

                String a = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps = con.prepareStatement(a);
                ps.setInt(1, Integer.parseInt(mrbean.getId()));
                ps.setInt(2, Access.get(0).getAccess_id());
                ps.setString(3, Access.get(0).getName());
                ps.setString(4, "Yes");
                ps.executeUpdate();

                String b = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps2 = con.prepareStatement(b);
                ps2.setInt(1, Integer.parseInt(mrbean.getId()));
                ps2.setInt(2, Access.get(1).getAccess_id());
                ps2.setString(3, Access.get(1).getName());
                ps2.setString(4, "Yes");
                ps2.executeUpdate();
                
                String c = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps3 = con.prepareStatement(c);
                ps3.setInt(1, Integer.parseInt(mrbean.getId()));
                ps3.setInt(2, Access.get(2).getAccess_id());
                ps3.setString(3, Access.get(2).getName());
                ps3.setString(4, "Yes");
                ps3.executeUpdate();
                
                String d = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps4 = con.prepareStatement(d);
                ps4.setInt(1, Integer.parseInt(mrbean.getId()));
                ps4.setInt(2, Access.get(3).getAccess_id());
                ps4.setString(3, Access.get(3).getName());
                ps4.setString(4, "Yes");
                ps4.executeUpdate();
                
                String e = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps5 = con.prepareStatement(e);
                ps5.setInt(1, Integer.parseInt(mrbean.getId()));
                ps5.setInt(2, Access.get(4).getAccess_id());
                ps5.setString(3, Access.get(4).getName());
                ps5.setString(4, "Yes");
                ps5.executeUpdate();
                
                String f = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps6 = con.prepareStatement(f);
                ps6.setInt(1, Integer.parseInt(mrbean.getId()));
                ps6.setInt(2, Access.get(5).getAccess_id());
                ps6.setString(3, Access.get(5).getName());
                ps6.setString(4, "Yes");
                ps6.executeUpdate();
                
                String g = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps7 = con.prepareStatement(g);
                ps7.setInt(1, Integer.parseInt(mrbean.getId()));
                ps7.setInt(2, Access.get(6).getAccess_id());
                ps7.setString(3, Access.get(6).getName());
                ps7.setString(4, "Yes");
                ps7.executeUpdate();
                
                String h = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps8 = con.prepareStatement(h);
                ps8.setInt(1, Integer.parseInt(mrbean.getId()));
                ps8.setInt(2, Access.get(7).getAccess_id());
                ps8.setString(3, Access.get(7).getName());
                ps8.setString(4, "Yes");
                ps8.executeUpdate();
                
                String i = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps9 = con.prepareStatement(i);
                ps9.setInt(1, Integer.parseInt(mrbean.getId()));
                ps9.setInt(2, Access.get(8).getAccess_id());
                ps9.setString(3, Access.get(8).getName());
                ps9.setString(4, "Yes");
                ps9.executeUpdate();
                
                String j = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps10 = con.prepareStatement(j);
                ps10.setInt(1, Integer.parseInt(mrbean.getId()));
                ps10.setInt(2, Access.get(9).getAccess_id());
                ps10.setString(3, Access.get(9).getName());
                ps10.setString(4, "Yes");
                ps10.executeUpdate();
                
                String k = ("insert into access_control(user_id, module_id, module_name, access) values (?, ?, ?, ?)");
                PreparedStatement ps11 = con.prepareStatement(k);
                ps11.setInt(1, Integer.parseInt(mrbean.getId()));
                ps11.setInt(2, Access.get(10).getAccess_id());
                ps11.setString(3, Access.get(10).getName());
                ps11.setString(4, "Yes");
                ps11.executeUpdate();
                
                ConnectionUtil.closeStatement(ps);
                ConnectionUtil.closeStatement(ps2);
                ConnectionUtil.closeStatement(ps3);
                ConnectionUtil.closeStatement(ps4);
                ConnectionUtil.closeStatement(ps5);
                ConnectionUtil.closeStatement(ps6);
                ConnectionUtil.closeStatement(ps7);
                ConnectionUtil.closeStatement(ps8);
                ConnectionUtil.closeStatement(ps9);
                ConnectionUtil.closeStatement(ps10);
                ConnectionUtil.closeStatement(ps11);

            }

            ConnectionUtil.closeStatement(statement);
            ConnectionUtil.closeConnection(con);

            out.println(Access.get(0).getAccess_id());
            out.println(Access.get(0).getName());
            out.println(Access.get(1).getAccess_id());
            out.println(Access.get(1).getName());

        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        
        String urlsend = "/datatableAlluser.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(urlsend);
        dispatcher.forward(request, response);
     
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(addNewUser.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(addNewUser.class.getName()).log(Level.SEVERE, null, ex);
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
