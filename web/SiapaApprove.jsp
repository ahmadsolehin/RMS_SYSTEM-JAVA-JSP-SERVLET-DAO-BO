<%-- 
    Document   : SiapaApprove
    Created on : May 28, 2015, 4:03:30 PM
    Author     : sony
--%>

<%@page import="rms.model.ApprovalContractor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            String stat = request.getParameter("status");
            ApprovalContractor con = (ApprovalContractor) request.getAttribute("siapa");

        %>
        <input type="hidden" id="ambikstatus" value="<%=stat%>" />



        <script>
            $(document).ready(function ()
            {
                var statususer = $('#ambikstatus').val();

                if (statususer == 'Active') {
                    var a = '<br><p>Approve By : <%=con.getName()%> </p><p>Position : <%=con.getPosition()%> </p><p>Date : <%=con.getDate()%> </p>';
                    $('#superman').append(a);
                } else if (statususer == 'Reject') {
                    var a = '<br><p>Reject By : <%=con.getName()%> </p> <p>Reason : <%=con.getReason_not_approve()%> </p> <p>Position : <%=con.getPosition()%> </p><p>Date : <%=con.getDate()%> </p>';
                    $('#superman').append(a);
                } else if (statususer == 'Pending') {
                    $('#superman').empty();
                }

            });
        </script>



        <div id="superman">
        </div>

    </body>
</html>
