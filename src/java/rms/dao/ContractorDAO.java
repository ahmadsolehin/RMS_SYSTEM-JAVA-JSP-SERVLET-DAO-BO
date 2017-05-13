package rms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import rms.model.Contractor;
import rms.model.Notify;
import rms.model.ServerListEstate;
import rms.model.UserBean;
import rms.util.ConnectionUtil;

public class ContractorDAO {

    public static void addContractor(Contractor dataContrator) throws Exception {

        Connection con = ConnectionUtil.getConnection();
        String q = ("insert into contractorinfo (contractorcode,companyname,regno,gstid,bumiputera,ownername,owneric,ownernation,kelas,person,title,position,contact,address,postcode,city,country,state,fax,phone,email,url,bayaran,remark,status) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        PreparedStatement ps = con.prepareStatement(q);
        ps.setString(1, null);
        ps.setString(2, dataContrator.getCompanyName());
        ps.setString(3, dataContrator.getRegNo());
        ps.setString(4, dataContrator.getGstId());
        ps.setString(5, dataContrator.getBumiputera());
        ps.setString(6, dataContrator.getOwnername());
        ps.setString(7, dataContrator.getOwneric());
        ps.setString(8, dataContrator.getOwnernation());
        ps.setString(9, dataContrator.getKelas());
        ps.setString(10, dataContrator.getPerson());
        ps.setString(11, dataContrator.getTitle());
        ps.setString(12, dataContrator.getPosition());
        ps.setString(13, dataContrator.getContact());
        ps.setString(14, dataContrator.getAddress());
        ps.setString(15, dataContrator.getPostcode());
        ps.setString(16, dataContrator.getCity());
        ps.setString(17, dataContrator.getCountry());
        ps.setString(18, dataContrator.getState());
        ps.setString(19, dataContrator.getFax());
        ps.setString(20, dataContrator.getPhone());
        ps.setString(21, dataContrator.getEmail());
        ps.setString(22, dataContrator.getUrl());
        ps.setString(23, dataContrator.getBayaran());
        ps.setString(24, dataContrator.getRemark());
        ps.setString(25, "Pending");
        ps.executeUpdate();
        ConnectionUtil.closeStatement(ps);
        ConnectionUtil.closeConnection(con);
    }

    public static void deleteContractor(int id) throws Exception {

        Connection connect = ConnectionUtil.getConnection();
        String myQuery = "delete from contractorinfo where contractorcode = ? limit 1";
        PreparedStatement ps = connect.prepareStatement(myQuery);
        String ids = String.valueOf(id);
        ps.setString(1, ids);
        ps.executeUpdate();
        
        String delete = "delete from approvedata where contractorcode = ? ";
        PreparedStatement ps2 = connect.prepareStatement(delete);
        ps2.setString(1, ids);
        ps2.executeUpdate();
        
        ConnectionUtil.closeStatement(ps);
        ConnectionUtil.closeStatement(ps2);
        ConnectionUtil.closeConnection(connect);
    }

    public static void updateContractor(Contractor con) throws Exception {

        Connection connect = ConnectionUtil.getConnection();
        String myQuery = "update contractorinfo set contractorcode = '" + Integer.parseInt(con.getContractorCode()) + "', companyname = '" + con.getCompanyName() + "', regno = '" + con.getRegNo() + "',gstid = '" + con.getGstId() + "', bumiputera = '" + con.getBumiputera() + "', ownername = '" + con.getOwnername() + "', owneric = '" + con.getOwneric() + "', ownernation = '" + con.getOwnernation() + "', kelas = '" + con.getKelas() + "', person = '" + con.getPerson() + "', title = '" + con.getTitle() + "',   position = '" + con.getPosition() + "', contact = '" + con.getContact() + "', address = '" + con.getAddress() + "', postcode = '" + con.getPostcode() + "', city = '" + con.getCity() + "', country = '" + con.getCountry() + "', state = '" + con.getState() + "', fax = '" + con.getFax() + "', phone = '" + con.getPhone() + "', email = '" + con.getEmail() + "', url = '" + con.getUrl() + "',bayaran = '" + con.getBayaran() + "',remark = '" + con.getRemark() + "' where contractorcode = '" + con.getContractorCode() + "' ";
        PreparedStatement ps = connect.prepareStatement(myQuery);
        ps.executeUpdate();
        ConnectionUtil.closeStatement(ps);
        ConnectionUtil.closeConnection(connect);
    }

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
        c.setStatus(rs.getString("status"));
        return c;
    }

    public static List<Contractor> searchContractorByCodeAndName(String keysearch) throws SQLException, Exception {
        List<Contractor> clist;
        clist = new ArrayList();
        ResultSet rs = null;
        Connection conet = ConnectionUtil.getConnection();
        PreparedStatement stmt = conet.prepareStatement("select * from contractorinfo where contractorcode like concat('%',?,'%') or contractorname like concat('%',?,'%')");
        stmt.setString(1, keysearch);
        stmt.setString(2, keysearch);
        rs = stmt.executeQuery();
        while (rs.next()) {
            clist.add(getContractor(rs));
        }
        return clist;
    }

    public static Contractor getContractor(int code) throws SQLException, Exception {
        Contractor c = null;
        ResultSet rs = null;
        Connection conet = ConnectionUtil.getConnection();
        PreparedStatement stmt = conet.prepareStatement("select * from contractorinfo where contractorcode=?");
        String codes = String.valueOf(code);
        stmt.setString(1, codes);
        rs = stmt.executeQuery();
        if (rs.next()) {
            c = getContractor(rs);
        }

        ConnectionUtil.closeStatement(stmt);
        ConnectionUtil.closeConnection(conet);
        return c;
    }

    public static List<Contractor> listAllContractor() throws SQLException, Exception {
        List<Contractor> clist;
        clist = new ArrayList();
        ResultSet rs = null;
        Connection conet = ConnectionUtil.getConnection();
        Statement stmt = conet.createStatement();
        rs = stmt.executeQuery("select * from contractorinfo");
        while (rs.next()) {
            clist.add(getContractor(rs));
        }
        return clist;
    }

    public static void senddataContractor(int id) throws Exception {

        Connection con = ConnectionUtil.getConnection();
        Connection connect = ConnectionUtil.getRemoteConnection();
        String sql = "select * from contractorinfo where contractorcode = '" + id + "' ";
        ResultSet rs = null;

        Statement stmt = con.createStatement();
        rs = stmt.executeQuery(sql);

        String q = ("insert into contractorinfo (contractorcode,companyname,regno,gstid,bumiputera,ownername,owneric,ownernation,kelas,person,title,position,contact,address,postcode,city,country,state,fax,phone,email,url,bayaran,remark) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ");
        PreparedStatement ps = connect.prepareStatement(q);
        String ids = String.valueOf(id);

        if (rs.next()) {
            ps.setString(1, rs.getString("contractorcode"));
            ps.setString(2, rs.getString("companyname"));
            ps.setString(3, rs.getString("regno"));
            ps.setString(4, rs.getString("gstid"));
            ps.setString(5, rs.getString("bumiputera"));
            ps.setString(6, rs.getString("ownername"));
            ps.setString(7, rs.getString("owneric"));
            ps.setString(8, rs.getString("ownernation"));
            ps.setString(9, rs.getString("kelas"));
            ps.setString(10, rs.getString("person"));
            ps.setString(11, rs.getString("title"));
            ps.setString(12, rs.getString("position"));
            ps.setString(13, rs.getString("contact"));
            ps.setString(14, rs.getString("address"));
            ps.setString(15, rs.getString("postcode"));
            ps.setString(16, rs.getString("city"));
            ps.setString(17, rs.getString("country"));
            ps.setString(18, rs.getString("state"));
            ps.setString(19, rs.getString("fax"));
            ps.setString(20, rs.getString("phone"));
            ps.setString(21, rs.getString("email"));
            ps.setString(22, rs.getString("url"));
            ps.setString(23, rs.getString("bayaran"));
            ps.setString(24, rs.getString("remark"));
        }
        ps.executeUpdate();
        ConnectionUtil.closeStatement(ps);
        ConnectionUtil.closeConnection(connect);
    }

    public static List<ServerListEstate> getAllServerEstateList() throws Exception {

        Connection con = ConnectionUtil.getServerEstateConnect();
        Statement stmt = null;
        List<ServerListEstate> Server = new ArrayList<ServerListEstate>();
        try {
            stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from server_list limit 50");

            while (rs.next()) {
                ServerListEstate serverlist = new ServerListEstate();
                serverlist.setDescription(rs.getString("descp"));
                serverlist.setEstatecode(rs.getString("estatecode"));
                serverlist.setStatus(rs.getString("status"));
                Server.add(serverlist);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        ConnectionUtil.closeStatement(stmt);
        ConnectionUtil.closeConnection(con);

        return Server;
    }

    public static void getServerConnect(String estatecode, int code) throws Exception {

        Contractor dataContrator = null;
        Connection con = null;
        Connection conet = null;

        try {
            conet = ConnectionUtil.getConnection(); //utk dptkan data cntractor dlm rms
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        try {
            con = ConnectionUtil.getServerEstateConnect(); //utk dptkan ip,username ,password dr db server_list kak ton
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        ResultSet rs, rs3 = null;
        Statement stmt = null, statement = null;
        List<ServerListEstate> Server = new ArrayList<ServerListEstate>();

        String sql = "select * from contractorinfo where contractorcode = '" + code + "' ";
        try {
            stmt = conet.createStatement();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        try {
            rs3 = stmt.executeQuery(sql);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        try {
            statement = con.createStatement();
            rs = statement.executeQuery("select * from server_list where estatecode = '" + estatecode + "' ");

            while (rs.next()) {
                ServerListEstate serverlist = new ServerListEstate();
                serverlist.setSvrip(rs.getString("svrip"));
                serverlist.setPassword(rs.getString("password"));
                serverlist.setUsername(rs.getString("username"));
                serverlist.setFolderldg(rs.getString("folderldg"));

                Server.add(serverlist);

                if (rs3.next()) {
                    dataContrator = getContractor(rs3);

                    Connection sendto = ConnectionUtil.getServerEstateConnection(serverlist.getSvrip(), serverlist.getFolderldg(), serverlist.getUsername(), serverlist.getPassword());
                   String q = ("insert into contractorinfo (contractorcode,companyname,regno,gstid,bumiputera,ownername,owneric,ownernation,kelas,person,title,position,contact,address,postcode,city,country,state,fax,phone,email,url,bayaran,remark) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ON DUPLICATE KEY UPDATE companyname = '" + dataContrator.getCompanyName() + "', regno = '" + dataContrator.getRegNo() + "', gstid = '" + dataContrator.getGstId() + "', bumiputera = '" + dataContrator.getBumiputera() + "', ownername = '" + dataContrator.getOwnername() + "', owneric = '" + dataContrator.getOwneric() + "', ownernation = '" + dataContrator.getOwnernation() + "', kelas = '" + dataContrator.getKelas() + "', person = '" + dataContrator.getPerson() + "', title = '" + dataContrator.getTitle() + "', position = '" + dataContrator.getPosition() + "', contact = '" + dataContrator.getContact() + "', address = '" + dataContrator.getAddress() + "', postcode = '" + dataContrator.getPostcode() + "', city = '" + dataContrator.getCity() + "', country = '" + dataContrator.getCountry() + "', state = '" + dataContrator.getState() + "', fax = '" + dataContrator.getFax() + "', phone = '" + dataContrator.getPhone() + "', email = '" + dataContrator.getEmail() + "', url = '" + dataContrator.getUrl() + "',bayaran = '" + dataContrator.getBayaran() + "',remark = '" + dataContrator.getRemark() + "'    ");
                    PreparedStatement ps = sendto.prepareStatement(q);
                //   String q = ("insert into contractorinfo (contractorcode,companyname,regno,gstid,bumiputera,ownername,owneric,ownernation,kelas,person,title,position,contact,address,postcode,city,country,state,fax,phone,email,url,bayaran,remark) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ON DUPLICATE KEY UPDATE companyname = '" + dataContrator.getCompanyName() + "', regno = '" + dataContrator.getRegNo() + "', gstid = '" + dataContrator.getGstId() + "', bumiputera = '" + dataContrator.getBumiputera() + "', ownername = '" + dataContrator.getOwnername() + "', owneric = '" + dataContrator.getOwneric() + "', ownernation = '" + dataContrator.getOwnernation() + "', kelas = '" + dataContrator.getKelas() + "', person = '" + dataContrator.getPerson() + "', title = '" + dataContrator.getTitle() + "', position = '" + dataContrator.getPosition() + "', contact = '" + dataContrator.getContact() + "', address = '" + dataContrator.getAddress() + "', postcode = '" + dataContrator.getPostcode() + "', city = '" + dataContrator.getCity() + "', country = '" + dataContrator.getCountry() + "', state = '" + dataContrator.getState() + "', fax = '" + dataContrator.getFax() + "', phone = '" + dataContrator.getPhone() + "', email = '" + dataContrator.getEmail() + "', url = '" + dataContrator.getUrl() + "',bayaran = '" + dataContrator.getBayaran() + "',remark = '" + dataContrator.getRemark() + "'    ");

                    ps.setString(1, dataContrator.getContractorCode());
                    ps.setString(2, dataContrator.getCompanyName());
                    ps.setString(3, dataContrator.getRegNo());
                    ps.setString(4, dataContrator.getGstId());
                    ps.setString(5, dataContrator.getBumiputera());
                    ps.setString(6, dataContrator.getOwnername());
                    ps.setString(7, dataContrator.getOwneric());
                    ps.setString(8, dataContrator.getOwnernation());
                    ps.setString(9, dataContrator.getKelas());
                    ps.setString(10, dataContrator.getPerson());
                    ps.setString(11, dataContrator.getTitle());
                    ps.setString(12, dataContrator.getPosition());
                    ps.setString(13, dataContrator.getContact());
                    ps.setString(14, dataContrator.getAddress());
                    ps.setString(15, dataContrator.getPostcode());
                    ps.setString(16, dataContrator.getCity());
                    ps.setString(17, dataContrator.getCountry());
                    ps.setString(18, dataContrator.getState());
                    ps.setString(19, dataContrator.getFax());
                    ps.setString(20, dataContrator.getPhone());
                    ps.setString(21, dataContrator.getEmail());
                    ps.setString(22, dataContrator.getUrl());
                    ps.setString(23, dataContrator.getBayaran());
                    ps.setString(24, dataContrator.getRemark());
                    ps.executeUpdate();

                    ConnectionUtil.closeStatement(ps);
                    ConnectionUtil.closeConnection(sendto);

                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        ConnectionUtil.closeStatement(stmt);
        ConnectionUtil.closeStatement(statement);
        ConnectionUtil.closeConnection(conet);
        ConnectionUtil.closeConnection(con);
    }

    public static void approveData(int id, int approvalcode, String contractorname) throws Exception {

        PreparedStatement ps, ps2, ps3;

        Connection connect = ConnectionUtil.getConnection();
        String myQuery = "update contractorinfo set status = 'Active' where contractorcode = '" + id + "'  ";
        ps = connect.prepareStatement(myQuery);
        ps.executeUpdate(); // update contractor status dr pending ke active

        ps3 = connect.prepareStatement("select * from user where id = '" + approvalcode + "' ");
        ResultSet rs = ps3.executeQuery();
        UserBean user = new UserBean();
        while (rs.next()) {
            user.setId(rs.getString("id"));
            user.setEstate(rs.getString("estate"));
            user.setUsername(rs.getString("username"));
            user.setUserStatus(rs.getString("status"));
            user.setFullname(rs.getString("fullname"));
            user.setPosition(rs.getString("position"));
        }

        String q = "insert into approvedata (id, contractorcode,contractorname, name, position, reason_not_approve, datetime) values (?, ?, ?, ?, ? , ?, ?)  ";
        //    String sql = ("insert into reason () values ('','de','dede')");
        ps2 = connect.prepareStatement(q);
        ps2.setString(1, null);
        ps2.setInt(2, id);
        ps2.setString(3, contractorname);
        ps2.setString(4, user.getFullname());
        ps2.setString(5, user.getPosition());
        ps2.setString(6, null);
        ps2.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
        ps2.executeUpdate();

        // x sempat nk buat notification mcm fb
//        String notify = "insert into notification (id, notify_text, sender_id, FullName , datetime, status, contractorcode, contractorname) values (?, ?, ?, ?, ?, ?, ?, ? )  ";
//        PreparedStatement note = connect.prepareStatement(notify);
//        note.setString(1, null);
//        note.setString(2, "" + contractorname + " has been approve");
//        note.setInt(3, Integer.parseInt(user.getId()));
//        note.setString(4, user.getFullname());
//        note.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
//        note.setString(6, "not read");
//        note.setInt(7, id);
//        note.setString(8, contractorname);
//        note.executeUpdate();
        ConnectionUtil.closeStatement(ps2);
        ConnectionUtil.closeStatement(ps);
        ConnectionUtil.closeStatement(ps3);
        ConnectionUtil.closeConnection(connect);
    }

    public static void reasonNotApprove(Contractor data, int reject, String contractorname) throws Exception {

        Connection connect = ConnectionUtil.getConnection();
        String myQuery = "update contractorinfo set status = 'Reject' where contractorcode = '" + data.getContractorCode() + "'  ";
        PreparedStatement ps = connect.prepareStatement(myQuery);
        ps.executeUpdate();

        PreparedStatement ps3 = connect.prepareStatement("select * from user where id = '" + reject + "' ");
        ResultSet rs = ps3.executeQuery();
        UserBean user = new UserBean();
        while (rs.next()) {
            user.setId(rs.getString("id"));
            user.setEstate(rs.getString("estate"));
            user.setUsername(rs.getString("username"));
            user.setUserStatus(rs.getString("status"));
            user.setFullname(rs.getString("fullname"));
            user.setPosition(rs.getString("position"));
        }

        String q = "insert into approvedata (id, contractorcode,contractorname, name, position, reason_not_approve,datetime) values (?,?, ?, ?, ? , ?,?)";
        PreparedStatement ps2 = connect.prepareStatement(q);
        ps2.setString(1, null);
        ps2.setString(2, data.getContractorCode());
        ps2.setString(3, contractorname);
        ps2.setString(4, user.getFullname());
        ps2.setString(5, user.getPosition());
        ps2.setString(6, data.getReasonNotApprove());
        ps2.setTimestamp(7, new Timestamp(System.currentTimeMillis()));

        ps2.executeUpdate();

        // x sempat nk buat notification mcm fb
//        String notify = "insert into notification (id, notify_text, sender_id, FullName , datetime, status, contractorcode, contractorname) values (?, ?, ?, ?, ?, ? )  ";
//        PreparedStatement note = connect.prepareStatement(notify);
//        note.setString(1, null);
//        note.setString(2, "" + contractorname + " has been reject");
//        note.setInt(3, Integer.parseInt(user.getId()));
//        note.setString(4, user.getFullname());
//        note.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
//        note.setString(6, "not read");
//        note.setString(7, data.getContractorCode());
//        note.setString(8, contractorname);
//        note.executeUpdate();
        ConnectionUtil.closeStatement(ps);
        ConnectionUtil.closeStatement(ps2);
        ConnectionUtil.closeStatement(ps3);
        ConnectionUtil.closeConnection(connect);

    }

    public static ArrayList<Notify> getNotify(int id, String user, int[] message) throws SQLException, Exception {

        Connection con = ConnectionUtil.getConnection();
        ArrayList<Notify> notify = new ArrayList<Notify>();

        for (int i = 0; i < message.length; i++) {

            try {
                Statement statement = con.createStatement();
                ResultSet rs = statement.executeQuery("select * from notification where sender_id <> '" + id + "' AND id <> '" + message[i] + "' ");

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
            } finally {
                con.close();
            }

        }
        ConnectionUtil.closeConnection(con);

        return notify;

    }

}
