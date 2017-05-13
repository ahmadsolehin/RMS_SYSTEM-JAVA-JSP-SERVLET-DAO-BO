<%-- 
    Document   : ListUser
    Created on : Jun 24, 2015, 9:12:41 AM
    Author     : sony
--%>

<%@page import="java.util.List"%>
<%@page import="rms.model.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>



        <%

            try {
                List<UserBean> clist = (List<UserBean>) request.getAttribute("list");

                for (UserBean c : clist) {%>
    <option value="<%=c.getId()%>"><%=c.getFullname()%></option>

    <%
            }
        } catch (Exception ex) {
            out.println(ex);
        }

    %>



</body>
</html>
