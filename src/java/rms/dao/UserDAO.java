package rms.dao;

import static java.lang.System.out;
import rms.util.ConnectionUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import rms.model.AccessControl;
import rms.model.ApprovalContractor;
import rms.model.Notify;
import rms.model.UserBean;
import rms.model.User_Access;

public class UserDAO {

    public static boolean login(UserBean bean) throws SQLException, Exception {

        boolean status = false;
        Connection con = ConnectionUtil.getConnection();
        PreparedStatement ps = con.prepareStatement("select * from user where username=? and password=?");
        ps.setString(1, bean.getUsername());
        ps.setString(2, bean.getPassword());

        ResultSet rs = ps.executeQuery();
        status = rs.next();

        ConnectionUtil.closeStatement(ps);
        ConnectionUtil.closeConnection(con);
        return status;
    }

    public static UserBean getUser(UserBean mrbean) throws SQLException, Exception {

        UserBean user = null;
        ResultSet rs = null;
        Connection conet = ConnectionUtil.getConnection();
        PreparedStatement stmt = conet.prepareStatement("select * from user where username = '" + mrbean.getUsername() + "' && password = '" + mrbean.getPassword() + "' ");
        rs = stmt.executeQuery();

        if (rs.next()) {
            user = getUser(rs);
        }

        ConnectionUtil.closeStatement(stmt);
        ConnectionUtil.closeConnection(conet);
        return user;
    }

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

    private static ApprovalContractor getApproval(ResultSet rs) throws SQLException {
        ApprovalContractor apps = new ApprovalContractor();
        apps.setId(rs.getInt("id"));
        apps.setContractorcode(rs.getInt("contractorcode"));
        apps.setContractorname(rs.getString("contractorname"));
        apps.setName(rs.getString("name"));
        apps.setPosition(rs.getString("position"));
        apps.setDate(rs.getTimestamp("datetime"));
        apps.setReason_not_approve(rs.getString("reason_not_approve"));
        return apps;
    }

    public static ApprovalContractor getWhoApproveContractor(int codecontractor) throws SQLException, Exception {

        ApprovalContractor apps = null;
        ResultSet rs = null;
        Connection conet = ConnectionUtil.getConnection();
        PreparedStatement stmt = conet.prepareStatement("select * from approvedata where contractorcode = '" + codecontractor + "' ORDER BY datetime DESC limit 1");

        //max date abg paday
//PreparedStatement stmt = conet.prepareStatement("select * from approvedata where contractorcode  = '"+codecontractor+"' and datetime =  (select max(datetime) from approvedata) limit 1");
//String codes = String.valueOf(code);
        //stmt.setString(1, codes);
        rs = stmt.executeQuery();

        if (rs.next()) {
            apps = getApproval(rs);
        }
        ConnectionUtil.closeStatement(stmt);
        ConnectionUtil.closeConnection(conet);
        return apps;
    }

    public static List<ApprovalContractor> listAllHistoryReject(int id) throws SQLException, Exception {
        List<ApprovalContractor> clist;
        clist = new ArrayList();
        ResultSet rs = null;
        Connection conet = ConnectionUtil.getConnection();
        Statement stmt = conet.createStatement();
        rs = stmt.executeQuery("select * from approvedata where contractorcode = '" + id + "' and reason_not_approve IS NOT NULL");
        while (rs.next()) {
            clist.add(getApproval(rs));
        }
        ConnectionUtil.closeStatement(stmt);
        ConnectionUtil.closeConnection(conet);
        return clist;
    }

    public static List<UserBean> getAllUserList() throws Exception {

        List<UserBean> list;
        list = new ArrayList();
        ResultSet rs = null;
        Connection conet = ConnectionUtil.getConnection();
        PreparedStatement stmt = conet.prepareStatement("select * from user");
        //String codes = String.valueOf(code);
        //stmt.setString(1, codes);
        rs = stmt.executeQuery();

        if (rs.next()) {
            list.add(getUser(rs));
        }
        ConnectionUtil.closeStatement(stmt);
        ConnectionUtil.closeConnection(conet);
        return list;
    }

    public static void deleteRejectHistory(int id) throws Exception {

        Connection connect = ConnectionUtil.getConnection();
        String myQuery = "delete from approvedata where id = ? limit 1";
        PreparedStatement ps = connect.prepareStatement(myQuery);
        ps.setInt(1, id);
        ps.executeUpdate();
        ConnectionUtil.closeStatement(ps);
        ConnectionUtil.closeConnection(connect);
    }

    private static Notify getNotify(ResultSet rs) throws SQLException {
        Notify apple = new Notify();
        apple.setContractorcode(rs.getString("contractorcode"));
        apple.setContractorname(rs.getString("contractorname"));
        apple.setNotify_text(rs.getString("notify_text"));
        apple.setFullName(rs.getString("FullName"));
        apple.setDate(rs.getTimestamp("datetime"));

        return apple;
    }

    public static List<Notify> listAllNotify(int id) throws SQLException, Exception {
        List<Notify> clist;
        clist = new ArrayList();
        ResultSet rs = null;
        Connection conet = ConnectionUtil.getConnection();
        Statement stmt = conet.createStatement();
        rs = stmt.executeQuery("select * from notification where sender_id <> '" + id + "'  ");
        while (rs.next()) {
            clist.add(getNotify(rs));
        }
        return clist;
    }

    public static void addNewUser(UserBean bean) throws Exception {

        Connection con = ConnectionUtil.getConnection();

        PreparedStatement st = con.prepareStatement("select * from user where username=?");
        st.setString(1, bean.getUsername());

        ResultSet r1 = st.executeQuery();
        if (r1.next()) {
            out.println("exist");
        } else {

            String q = ("insert into user (id, username, password, estate, status, fullname, position) values (?, ?, ?, ?, ?, ?, ?)");
            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, null);
            ps.setString(2, bean.getUsername());
            ps.setString(3, bean.getPassword());
            ps.setString(4, bean.getEstate());
            ps.setString(5, bean.getUserStatus());
            ps.setString(6, bean.getFullname());
            ps.setString(7, bean.getPosition());

            ps.executeUpdate();
            ConnectionUtil.closeStatement(ps);
            ConnectionUtil.closeStatement(st);
            ConnectionUtil.closeConnection(con);
        }
    }
    
    public static void updateUser(UserBean bean) throws Exception {

        Connection connect = ConnectionUtil.getConnection();
        String myQuery = "update user set fullname = '" + bean.getFullname() + "', position = '" + bean.getPosition() + "', estate = '" + bean.getEstate() + "',status = '" + bean.getUserStatus() + "', username = '" + bean.getUsername() + "', password = '" + bean.getPassword() + "'  where id = '" + bean.getId() + "' ";
        PreparedStatement ps = connect.prepareStatement(myQuery);
        ps.executeUpdate();
        ConnectionUtil.closeStatement(ps);
        ConnectionUtil.closeConnection(connect);
    }

    public static void deleteUser(int id) throws Exception {

        Connection connect = ConnectionUtil.getConnection();
        String myQuery = "delete from user where id = ? limit 1";
        PreparedStatement ps = connect.prepareStatement(myQuery);
        String ids = String.valueOf(id);
        ps.setString(1, ids);
        ps.executeUpdate();

        //untuk delete data dlm access_control
        String deleteAccess = "delete from access_control where user_id = ?";
        PreparedStatement access = connect.prepareStatement(deleteAccess);
        String userid = String.valueOf(id);
        access.setString(1, userid);
        access.executeUpdate();
       
        ConnectionUtil.closeStatement(ps);
        ConnectionUtil.closeStatement(access);
        ConnectionUtil.closeConnection(connect);
    }

    public static UserBean getUserByid(int code) throws SQLException, Exception {
        UserBean c = null;
        ResultSet rs = null;
        Connection conet = ConnectionUtil.getConnection();
        PreparedStatement stmt = conet.prepareStatement("select * from user where id=?");
        String codes = String.valueOf(code);
        stmt.setString(1, codes);
        rs = stmt.executeQuery();
        if (rs.next()) {
            c = getUser(rs);
        }

        ConnectionUtil.closeStatement(stmt);
        ConnectionUtil.closeConnection(conet);
        return c;
    }

    public static List<UserBean> listAllUser(int id) throws SQLException, Exception {
        List<UserBean> clist;
        clist = new ArrayList();
        ResultSet rs = null;
        Connection conet = ConnectionUtil.getConnection();
        Statement stmt = conet.createStatement();
        rs = stmt.executeQuery("select * from user where id <> '" + id + "'  ");
        while (rs.next()) {
            clist.add(getUser(rs));
        }
        return clist;
    }

    public static List<User_Access> getUserAccess(int code) throws Exception {

        Connection con = ConnectionUtil.getConnection();
        List<User_Access> UserAccess = new ArrayList<User_Access>();
        try {
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select * from access_control where user_id=" + code + " ORDER BY module_id ASC");

            while (rs.next()) {
                User_Access anggur = new User_Access();
                anggur.setUser_id(rs.getInt("user_id"));
                anggur.setModule_id(rs.getInt("module_id"));
                anggur.setModule_name(rs.getString("module_name"));
                anggur.setAccess(rs.getString("access"));
                UserAccess.add(anggur);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // ConnectionUtil.closeStatement(statement);
        ConnectionUtil.closeConnection(con);

        return UserAccess;
    }

    private static User_Access getUser_Access(ResultSet rs) throws SQLException {
        User_Access anggur = new User_Access();
        anggur.setUser_id(rs.getInt("user_id"));
        anggur.setModule_id(rs.getInt("module_id"));
        anggur.setModule_name(rs.getString("module_name"));
        anggur.setAccess(rs.getString("access"));
        return anggur;
    }

    public static List<AccessControl> getAllAccessType() throws Exception {

        Connection con = ConnectionUtil.getConnection();
        List<AccessControl> UserAccess = new ArrayList<AccessControl>();
        Statement statement = con.createStatement();
        try {
            ResultSet rs = statement.executeQuery("select * from access_type");

            while (rs.next()) {
                AccessControl user = new AccessControl();
                user.setAccess_id(rs.getInt("access_id"));
                user.setName(rs.getString("name"));
                UserAccess.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        ConnectionUtil.closeStatement(statement);
        ConnectionUtil.closeConnection(con);

        return UserAccess;
    }

    public static List<User_Access> getUserAccessType() throws Exception {

        Connection con = ConnectionUtil.getConnection();
        List<User_Access> UserAccess = new ArrayList<User_Access>();
        Statement statement = con.createStatement();

        try {
            ResultSet rs = statement.executeQuery("select * from access_type");

            while (rs.next()) {

                UserAccess.add(getUser_Access(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {

            ConnectionUtil.closeStatement(statement);
            ConnectionUtil.closeConnection(con);
        }

        return UserAccess;
    }

}
