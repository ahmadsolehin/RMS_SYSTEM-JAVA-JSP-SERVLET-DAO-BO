/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rms.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ConnectionUtil {

    public static Connection getConnection() throws Exception {

        InitialContext cxt = new InitialContext();
        if (cxt == null) {
            throw new Exception("Uh oh -- no context!");
        }
        DataSource ds;
        ds = (DataSource) cxt.lookup("java:comp/env/jdbc/rms");

        if (ds == null) {
            throw new Exception("Data source not found!");
        }
        return ds.getConnection();

    }

    public static Connection getRemoteConnection() throws Exception {

        InitialContext cxt = new InitialContext();
        if (cxt == null) {
            throw new Exception("Uh oh -- no context!");
        }
        DataSource ds;
        ds = (DataSource) cxt.lookup("java:comp/env/jdbc/temp");

        if (ds == null) {
            throw new Exception("Data source not found!");
        }
        return ds.getConnection();

    }

    public static Connection getServerEstateConnect() throws Exception {

        InitialContext cxt = new InitialContext();
        if (cxt == null) {
            throw new Exception("Uh oh -- no context!");
        }
        DataSource ds;
        ds = (DataSource) cxt.lookup("java:comp/env/jdbc/it_dept");

        if (ds == null) {
            throw new Exception("Data source not found!");
        }
        return ds.getConnection();

    }

    public static Connection getServerEstateConnection(String host, String dbname, String username, String password) throws Exception {
       Connection connection = null;
          try{
          Class.forName("com.mysql.jdbc.Driver");
             System.out.println("okla");
             
             String url = "jdbc:mysql://"+host+"/"+dbname;
        //String url = "jdbc:mysql://".concat(host).concat("/").concat(dbname);   //database specific url

        
              connection = DriverManager.getConnection(url, username, password);


      }catch(Exception e){
          //System.out.println(e);
      }
        
      
        return connection;

    }

    public static void closeConnection(Connection con) throws SQLException {
        if (con != null) {
            con.close();
        }
    }

    public static void closeStatement(PreparedStatement ps) throws SQLException {
        if (ps != null) {
            ps.close();
        }
    }

    public static void closeStatement(Statement ps) throws SQLException {
        if (ps != null) {
            ps.close();
        }
    }

    public static void closeResultSet(ResultSet rs) throws SQLException {
        if (rs != null) {
            rs.close();
        }
    }
    
    
    
    
    
    
    
    
    
    public void testConnection(String host,String user,String pass,String db){
        
          try{
          Class.forName("com.mysql.jdbc.Driver");
             System.out.println("okla");

      }catch(Exception e){
          System.out.println(e);
      }
          
      String url = "jdbc:mysql://"+host+"/"+db;
      Connection con = null;
      
      try{
      con = DriverManager.getConnection(url, user,pass);
      System.out.println("htg");
      }catch(SQLException err){
          System.out.println(""+err.getMessage());
      }
      
    }
}
