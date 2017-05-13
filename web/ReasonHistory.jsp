<%-- 
    Document   : ListingEstate
    Created on : May 29, 2015, 3:54:58 PM
    Author     : sony
--%>

<%@page import="rms.model.UserBean"%>
<%@page import="rms.model.ApprovalContractor"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script src="js/jquery-1.11.2.min.js"></script>

        <link rel="stylesheet" type="text/css" href="css/cssForDialogBox/messi.min.css">
        <link rel="stylesheet" type="text/css" href="css/cssForDialogBox/messi.css">

        <script src="js/jsForDialogBox/messi.js"></script>
        <script src="js/jsForDialogBox/messi.min.js"></script>

        <style>

        </style>
    </head>
    <body>

        <%
            UserBean bean = (UserBean) session.getAttribute("currentSessionUser");
            String x = bean.getUserStatus(); //utk tahu status current user nie admin atau member,
            //kalau admin,button approve bru appear

        %>        
        <input type="hidden" id="statusservlet" value="<%= x%>" />

        <script>

            $(document).ready(function () {


            });

        </script>
        <div class="table-responsive">          

            <table class="table">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Position</th>
                        <th>Reason</th>
                        <th>Date</th>
                        <th>Action</th>

                    </tr>
                </thead>
                <tbody>


                    <%         // x = request.getAttribute("theName");
                        //out.println("alert(\"" +kod+ "\")");
                        try {
                            List<ApprovalContractor> clist = (List<ApprovalContractor>) request.getAttribute("listReason");
                            for (ApprovalContractor c : clist) {%>

                    <tr><td> <%=c.getName()%></td><td> <%=c.getPosition()%></td><td> <%=c.getReason_not_approve()%></td><td> <%=c.getDate()%></td>

                        <td>

                            <a  onClick="deleteReject(<%=c.getId()%>);" class="btn btn-default">
                                <img src="image/rubbish.png ">
                            </a>
                        </td>
                    </tr><!-- Darker Table Row -->

                    <%
                            }
                        } catch (Exception ex) {
                            out.println(ex);

                        }

                    %>

                </tbody>
            </table>
        </div>
































        <script>

            $(document).ready(function () {

                $('.ui').click(function () {
                    alert("jr");
                })

            })


            function deleteReject(x) {

                var statususer = $('#statusservlet').val(); //nak tahu samaada admin atau member

                if (statususer == "admin") {


                    new Messi('Are you sure to delete this data ? ',
                            {
                                title: 'Confirmation',
                                modal: true,
                                buttons: [{id: 0,
                                        label: 'Yes',
                                        val: 'Y'
                                    },
                                    {id: 1,
                                        label: 'No',
                                        val: 'N'}],
                                callback: function (val) {

                                    if (val == 'Y') {


                                        $.ajax({url: "deleteRejectHistory?id=" + x,
                                            success: function (result) {
                                                alert(result);
                                            }});
                                    } else {
                                        //return false;
                                    }
                                }//tutup callback function
                            });



                } else if (statususer == "member") {
                    alert("Only approver has permission...");
                }

            }




















        </script>


    </body>
</html>


















