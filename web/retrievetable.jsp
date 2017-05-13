
 <%@page import="rms.util.ConnectionUtil"%>
<%@ page language="java" import="java.sql.*,java.text.*,java.util.*" %>
<%@ page import ="java.lang.*"%>
<%@ page import ="java.*,java.lang.Runtime.*"%>
<%@ page import="java.io.*"%>
<%@ page import ="java.lang.*"%>
<%@ page import="java.util.Date"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.text.*"%>
<%@page import="org.apache.commons.collections.MapUtils"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%

        Connection con = ConnectionUtil.getConnection();

		
        String[] cols   = request.getParameterValues("cols");
        //String[] cols = {"refer", "companyname", "companycode", "date", "quotype" };

  
        String sTable = request.getParameter("table");
        String sIndexColumn = request.getParameter("code");
        String orderby = request.getParameter("order");

        int start = 0;
        int displayCnt = 0;

        String sStart = request.getParameter("iDisplayStart");
        String sDisplayCnt = request.getParameter("iDisplayLength");
		 start = Integer.parseInt(sStart);
        displayCnt = Integer.parseInt(sDisplayCnt);
		
        
		
		String sQuery = "";
		
        //Paging
        String sLimit = "";
        if (displayCnt != -1) {
            sLimit = " LIMIT " + String.valueOf(start) + " , " + String.valueOf(sDisplayCnt);
			if(displayCnt<1){
				sLimit = "";
			}
			
        }

        String sOrder = " "+orderby;
        if (request.getParameter("iSortCol_0") != null) {
            sOrder = " ORDER BY ";
            int sColCnt = Integer.parseInt(request.getParameter("iSortingCols"));
            for (int i = 0; i < sColCnt; i++) {
                int iSortCol = Integer.parseInt(request.getParameter("iSortCol_" + String.valueOf(i)));
                String bSortable = request.getParameter("bSortable_" + String.valueOf(iSortCol));
                if (bSortable.equals("true")) {
                    sOrder += " `" + cols[iSortCol] + "` " + request.getParameter("sSortDir_" + String.valueOf(i));

                    if (i != (sColCnt - 1)) {
                        sOrder += " , ";
                    }
                }
            }
        }

        if (sOrder.equals(" ORDER BY ")) {
            sOrder = "";
        }

        //Global Search
        String sWhere = "";
        if (request.getParameter("sSearch") != null && !request.getParameter("sSearch").equals("")) {
            String sSearch = request.getParameter("sSearch");
            sWhere = " WHERE (";
            for (int i = 0; i < cols.length; i++) {
                sWhere += "`" + cols[i] + "` LIKE '%" + sSearch + "%' ";
                if (i != (cols.length - 1)) {
                    sWhere += " OR ";
                }
            }
            sWhere += ") ";
        }

        /* Individual column filtering */
        for (int i = 0; i < cols.length; i++) {
            String bSearchable = request.getParameter("bSearchable_" + String.valueOf(i));
            String sSearch = request.getParameter("sSearch_" + String.valueOf(i));

            if (bSearchable != null && bSearchable.equals("true") && !sSearch.equals("")) {
                if (sWhere.equals("")) {
                    sWhere = " WHERE ";
                } else {
                    sWhere += " AND ";
                }
                sWhere += "`" + cols[i] + "` LIKE '%" + sSearch + "%'";
            }
        }

       
        // SQL Query
        sQuery = "SELECT SQL_CALC_FOUND_ROWS `" + StringUtils.replace(StringUtils.join(cols, "`, `"), " , ", " ") + "`"
                + " FROM " + sTable;
        sQuery += sWhere;
        sQuery += sOrder;
        sQuery += sLimit;
		
		//out.println("<br> -- sQuery - "+sQuery);
		
        PreparedStatement pstm1 = con.prepareStatement(sQuery);
        ResultSet rs1 = pstm1.executeQuery();

        int iFilteredTotal = 0;
        int iTotal = 0;
        PreparedStatement pstm2 = con.prepareStatement("SELECT FOUND_ROWS()");
        ResultSet rs2 = pstm2.executeQuery();
        if (rs2.next()) {
            iFilteredTotal = rs2.getInt(1);
        }

        pstm2 = con.prepareStatement("SELECT COUNT(`" + sIndexColumn + "`) FROM " + sTable);
        rs2 = pstm2.executeQuery();
        if (rs2.next()) {
            iTotal = rs2.getInt(1);
        }

        JSONObject result = new JSONObject();
        JSONArray array = new JSONArray();

        while (rs1.next()) {
            JSONObject jo = new JSONObject();

            for (int i = 0; i < cols.length; i++) {
                jo.put(cols[i], rs1.getString(cols[i]));
				//out.println(jo);
            }

            array.add(jo);
			//out.println(jo);
            jo = null;
        }

        rs2.close();
        pstm2.close();

        rs1.close();
        pstm1.close();
		
		
		
		result.put("sEcho", request.getParameter("sEcho"));
        result.put("iTotalRecords", iTotal);
        result.put("iTotalDisplayRecords", iFilteredTotal);
        result.put("aaData", array);
		 response.setContentType("application/json");
        response.setHeader("Cache-Control", "no-store");
        out.print(result);
		
%>