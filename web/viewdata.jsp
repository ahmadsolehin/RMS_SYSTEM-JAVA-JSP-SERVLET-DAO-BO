<%-- 
    Document   : viewdata
    Created on : Mar 27, 2015, 8:35:21 AM
    Author     : sony
--%>

<%@page import="rms.model.User_Access"%>
<%@page import="java.util.List"%>
<%@page import="rms.bo.ContractorBO"%>
<%@page import="rms.dao.UserDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="rms.util.ConnectionUtil"%>
<%@page import="rms.model.UserBean"%>
<%@page import="rms.model.Contractor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>


        <%

            List<User_Access> access = (List<User_Access>) session.getAttribute("AccessRight");

        %>

        <!-- sweet alert -->
        <link rel="stylesheet" type="text/css" href="css/sweet-alert.css">
        <script src="js/sweet-alert.min.js"></script> 


        <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>


        <script src="js/jquery-1.11.2.min.js"></script>

        <script src="js/jquery.js"></script>
        <script src="js/dataTable.js"></script>
        <script src="js/bootstrap_dataTable.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


        <style></style>

        <%            UserBean beanKacang = (UserBean) session.getAttribute("currentSessionUser");
            String statususerBean = beanKacang.getUserStatus(); //utk tahu status current user nie admin atau member,

        %>
    <input type="hidden" id="statususerBean" value="<%=statususerBean%>" />



    <%
        int id = Integer.parseInt(request.getParameter("id"));
    %>
    <input type="hidden" id="codeuser" value="<%=id%>" />




    <script>
        $(document).ready(function () {

            var abc = $('#codeuser').val();
            var statususerBean = $('#statususerBean').val();


            var columntoView = ["id", "name", "position", "datetime", "reason_not_approve"];
            var columnName = ["id", "Name", "Position", "Reason", "Date"];
            var colsTosend = 'cols=';
            for (var m = 0; m < columntoView.length; ++m) {//put value from database to variable jget

                if (m == columntoView.length - 1) {
                    colsTosend += columntoView[m];
                } else {
                    colsTosend += columntoView[m] + '&cols=';
                }
            }
//alert('dsad');  
             var oTable = $('#example').dataTable({
                     "bAutoWidth": true,
                'sDom': '"top"i',
                     "sPaginationType": "full_numbers",
                     "bProcessing": true,
                     "bServerSide": true,
                "sScrollY": "320px",
                    "sAjaxSource": "retrievetableHistoryReject.jsp?table=approvedata&userid=" + abc + "&code=id&" + colsTosend + "&order=",
                "aoColumns": [
                    {"sTitle": columnName[0], "mData": "id", "sWidth": "3%", "bSearchable": false},
                    {"sTitle": columnName[1], "mData": columntoView[1], "bSearchable": false, "sWidth": "15%"},
                    {"sTitle": columnName[2], "mData": columntoView[2], "bSearchable": false, "sWidth": "15%"},
                    {"sTitle": columnName[3], "mData": columntoView[3], "bSearchable": false, "sWidth": "15%"},
                    {"sTitle": columnName[4], "mData": columntoView[4], "bSearchable": false, "sWidth": "15%"},
                    {"sTitle": "Action", "mData": null, "bSortable": false, "bSearchable": false, "sWidth": "15%"}
                ],
                "aoColumnDefs": [{
                        "aTargets": [5],
                        "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {

                            if (statususerBean == "admin" || statususerBean == "approver") {
                                var ayam = $('<button type="button" class="btn btn-default" data-backdrop="false" data-toggle="modal" data-target="#modalDelete">Delete</button>');
                            } else {
                                var ayam = $('<button type="button" class="btn btn-default" data-backdrop="false" data-toggle="modal" data-target="#modalCannot">Delete</button>');
                            }

                            ayam.on('click', function () {

                                $('#itik').unbind('click').click(function () {
                                    // alert("n");
                                    $.ajax({
                                        // type: 'POST',
                                        url: "deleteRejectHistory?id=" + oData.id,
                                        success: function () {
                                            //alert("Data has deleted");
                                        }});
                                })
                            });

                            $(nTd).empty();
                            $(nTd).attr("id", 'btntest');
                            $(nTd).prepend(ayam);
                        }

                    }]
            });
        })
    </script>


</head>
<body>

    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                    </div><!-- /.box-header -->
                    <div class="box-body">



                        <div class="container">


                            <%
                                UserBean bean = (UserBean) session.getAttribute("currentSessionUser");
                                String x = bean.getUserStatus(); //utk tahu status current user nie admin atau staff,approver,
                                //kalau admin,approver,button approve bru appear

                            %>        
                            <input type="hidden" id="statusservlet" value="<%= x%>" />




                            <fieldset>

                                <legend>Contractor Information - All details</legend>


                                <%

                                    Contractor con = (Contractor) request.getAttribute("contractor");

                                %>

                                <ol>

                                    <br>

                                    <table class="table table-striped">

                                        <tbody>

                                            <tr>
                                                <th>Contractor code </th>
                                                <td class="col-md-8"><%=con.getContractorCode()%> </td>
                                            </tr>

                                            <tr>
                                                <th>Company name</th>
                                                <td><%=con.getCompanyName()%> </td>
                                            </tr>

                                            <tr>
                                                <th>Co. Registration No</th>
                                                <td><%=con.getRegNo()%> </td>
                                            </tr>

                                            <tr>
                                                <th>GST ID </th>
                                                <td><%=con.getGstId()%> </td>
                                            </tr>

                                            <tr>
                                                <th>Bumiputera</th>
                                                <td><%=con.getBumiputera()%> </td>
                                            </tr>

                                            <tr>
                                                <th>Owner name</th>
                                                <td><%=con.getOwnername()%> </td>
                                            </tr>

                                            <tr>
                                                <th>Owner ic</th>
                                                <td><%=con.getOwneric()%> </td>
                                            </tr>

                                            <tr>
                                                <th>Owner nationality</th>
                                                <td><%=con.getOwnernation()%> </td>
                                            </tr>

                                            <tr>
                                                <th>Class</th>
                                                <td><%=con.getKelas()%> </td>
                                            </tr>

                                            <tr>
                                                <th>Contact person</th>
                                                <td><%=con.getPerson()%> </td>
                                            </tr>

                                            <tr>
                                                <th>Contact title</th>
                                                <td><%=con.getTitle()%> </td>
                                            </tr>

                                            <tr>
                                                <th>Contact position</th>
                                                <td><%=con.getPosition()%> </td>
                                            </tr>

                                            <tr>
                                                <th>Contact HP no</th>
                                                <td><%=con.getContact()%> </td>
                                            </tr>

                                            <tr>
                                                <th>Address</th>
                                                <td><%=con.getAddress()%> </td>
                                            </tr>

                                            <tr>
                                                <th>Postcode</th>
                                                <td><%=con.getPostcode()%> </td>
                                            </tr>

                                            <tr>
                                                <th>City</th>
                                                <td><%=con.getCity()%> </td>
                                            </tr>

                                            <tr>
                                                <th>State</th>
                                                <td><%=con.getState()%> </td>
                                            </tr>

                                            <tr>
                                                <th>Country</th>
                                                <td><%=con.getCountry()%> </td>
                                            </tr>

                                            <tr>
                                                <th>Telephone</th>
                                                <td><%=con.getPhone()%> </td>
                                            </tr>

                                            <tr>
                                                <th>Fax</th>
                                                <td><%=con.getFax()%> </td>
                                            </tr>

                                            <tr>
                                                <th>Email</th>
                                                <td><%=con.getEmail()%> </td>
                                            </tr>

                                            <tr>
                                                <th>Url</th>
                                                <td><%=con.getUrl()%> </td>
                                            </tr>

                                            <tr>
                                                <th>Payment Term (Days)</th>
                                                <td><%=con.getBayaran()%> </td>
                                            </tr>

                                            <tr>
                                                <th>Remarks</th>
                                                <td><%=con.getBayaran()%> </td>
                                            </tr>

                                            <tr>
                                                <th>Status</th>
                                                <td><%=con.getStatus()%> </td>
                                            </tr>


                                        </tbody>
                                    </table>

                                    <br>

                                    <div id="kotakhitam">
                                    </div>




                                    <%
                                        String ambikcontractorname = con.getOwnername();
                                    %>

                                    <input type="hidden" id="ambikcontractorname" value="<%=ambikcontractorname%>" />


                                    <%
                                        String abc = con.getStatus();
                                    %>

                                    <input type="hidden" id="lulusketidak" value="<%=abc%>" />

                                    <script>
                                        $(document).ready(function () {

                                            var abc = $('#lulusketidak').val();
                                            if (abc == "Active") {
                                                //  alert('bhhbf');

                                                $.ajax({
                                                    url: "WhoApproveOrUnapprove?id=" +<%=con.getContractorCode()%> + "&status=" + abc,
                                                    success: function (result) {
                                                        $('#kotakhitam').empty().html(result);
                                                    }});
                                            } else if (abc == "Reject") {
                                                $.ajax({
                                                    url: "WhoApproveOrUnapprove?id=" +<%=con.getContractorCode()%> + "&status=" + abc,
                                                    success: function (result) {
                                                        $('#kotakhitam').empty().html(result);
                                                    }});
                                            } else if (abc == "Pending") {
                                            }
                                        })
                                    </script>




                                    <div class="form-group">        
                                        <div class="col-sm-offset-2 col-sm-10">  


                                            <!-- Button trigger modal -->
                                            <div id="butterscotch">
                                            </div>

                                        </div>
                                    </div>

                                </ol>



                            </fieldset>





                            <script>


                                function my() {
                                    //      alert(",j");
                                    $.ajax({url: "datatabletest.jsp",
                                        success: function (result) {
                                            $('#haha').empty().html(result).fadeIn('slow');
                                        }});
                                }
                            </script>

                            <!-- Modal utk back -->
                            <div class="modal fade" id="modalBack" tabindex="-1" role="dialog" 
                                 aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <button type="button" class="close" 
                                                    data-dismiss="modal">
                                                <span aria-hidden="true">&times;</span>
                                                <span class="sr-only">Close</span>
                                            </button>
                                            <h4 class="modal-title" id="myModalLabel">
                                                Confirmation
                                            </h4>
                                        </div>
                                        <!-- Modal Body -->
                                        <div class="modal-body">
                                            <form class="form-horizontal" role="form">
                                                <div class="modal-body">
                                                    <p>Back to previous page?</p>
                                                </div>
                                            </form>
                                        </div>
                                        <!-- Modal Foter -->
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default"
                                                    data-dismiss="modal">
                                                Close
                                            </button>
                                            <button type="button" id="btnback" class="btn btn-primary"data-dismiss="modal">
                                                Yes
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>







                            <!-- Modal -->
                            <div class="modal fade" id="approveContractor" tabindex="-1" role="dialog" 
                                 aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <button type="button" class="close" 
                                                    data-dismiss="modal">
                                                <span aria-hidden="true">&times;</span>
                                                <span class="sr-only">Close</span>
                                            </button>
                                            <h4 class="modal-title" id="myModalLabel">
                                                Confirmation
                                            </h4>
                                        </div>

                                        <!-- Modal Body -->
                                        <div class="modal-body">         
                                            <form class="form-horizontal" role="form">      
                                                <div class="modal-body">
                                                    <p>Are you sure to approve ?</p>
                                                </div>
                                            </form>
                                        </div>
                                        <!-- Modal Footer -->
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">
                                                Close
                                            </button>
                                            <button type="button" id="approve" class="btn btn-primary"data-dismiss="modal">
                                                Approve
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <script>
                                $(document).ready(function () {
                                    $('#approve').unbind('click').click(function () {

                                <%
                                    if ("Yes".equals(access.get(5).getAccess())) {
                                %>

                                        var ambikcontractorname = $('#ambikcontractorname').val();
                                        $.ajax({
                                            url: "approveData?id=" +<%=con.getContractorCode()%> + "&approval=" +<%=bean.getId()%> + "&contractorname=" + ambikcontractorname,
                                            success: function (result) {

                                                $('#butterscotch').empty();
                                                $('#kotakhitam').empty();
                                                $('#haha').empty().html(result).fadeIn('slow');
                                            }});

                                <% } else {
                                %>
                                        swal({
                                            title: "You have no authority to access",
                                            text: "",
                                            type: "error",
                                            confirmButtonText: "Ok"
                                        });
                                        return false;
                                <%            }

                                %>

                                    })
                                })
                            </script>




                            <!-- Modal utk reject -->
                            <div class="modal fade" id="unapprove" tabindex="-1" role="dialog" 
                                 aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <button type="button" class="close" 
                                                    data-dismiss="modal">
                                                <span aria-hidden="true">&times;</span>
                                                <span class="sr-only">Close</span>
                                            </button>
                                            <h4 class="modal-title" id="myModalLabel">
                                                Confirmation
                                            </h4>
                                        </div>
                                        <!-- Modal Body -->
                                        <div class="modal-body">
                                            <form class="form-horizontal" role="form">
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label"for="input">
                                                        Reason
                                                    </label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" name="whynotapprove" id="inputnotapprove" placeholder="Enter your reason"/>
                                                    </div>
                                                </div>              
                                            </form>    
                                        </div>
                                        <!-- Modal Foter -->
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default"
                                                    data-dismiss="modal">
                                                Close
                                            </button>
                                            <button type="button" id="tak" class="btn btn-primary"data-dismiss="modal">
                                                Submit
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>



                        </div>


                        <div id="haha">
                        </div>


                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </section><!-- /.content -->



    <script>
        $(document).ready(function () {
            $('#tak').unbind('click').click(function () {

        <%                    if ("Yes".equals(access.get(6).getAccess())) {
        %>

                var reason = $('#inputnotapprove').val();
                var ambikcontractorname = $('#ambikcontractorname').val();
                //  alert(reason);                          
                $.ajax({
                    //type: 'POST',                                 
                    url: "reasonNotApprove?id=" +<%=con.getContractorCode()%> + "&reason=" + reason + "&sapereject=" +<%=bean.getId()%> + "&contractorname=" + ambikcontractorname,
                    success: function (result) {

                        $('#butterscotch').empty();
                        $('#kotakhitam').empty();
                        $('#haha').empty().html(result).fadeIn('slow');
                    }});

        <% } else {
        %>
                swal({
                    title: "You have no authority to access",
                    text: "",
                    type: "error",
                    confirmButtonText: "Ok"
                });
                return false;
        <%            }

        %>
            })
        })
    </script>



    <script>

        $(document).ready(function ()
        {
            var statususer = $('#statusservlet').val(); //nak tahu samaada admin,staff atau approver
            var abc = $('#lulusketidak').val();
            if (statususer == 'approver' || statususer == 'admin') {

                //alert(abc);

                if (abc == 'Active') {

                    var c = '<button type="button" class="btn btn-default" onClick = "my()" id = "hantu">Back</button>';
                    var d = '&nbsp<button type="button" class="btn btn-default" data-backdrop="false" data-toggle="modal" data-target="#modalHistory">Reject History</button>';
                    var a = '&nbsp<button class="btn btn-default" data-backdrop = "false"data-toggle="modal" data-target="#approveContractor" disabled>Approve</button>&nbsp&nbsp&nbsp';
                    var b = '&nbsp<button class="btn btn-default" data-backdrop = "false"data-toggle="modal" data-target="#unapprove">Unapprove</button>';
                    $('#butterscotch').empty().append(c, d, a, b);
                } else if (abc == 'Reject') {

                    var c = '<button type="button" class="btn btn-default" onClick = "my()" id = "hantu">Back</button>';
                    var d = '&nbsp<button type="button" class="btn btn-default" data-backdrop="false" data-toggle="modal" data-target="#modalHistory">Reject History</button>';
                    var a = '&nbsp<button class="btn btn-default" data-backdrop = "false"data-toggle="modal" data-target="#approveContractor">Approve</button>&nbsp&nbsp&nbsp';
                    var b = '&nbsp<button class="btn btn-default" data-backdrop = "false"data-toggle="modal" data-target="#unapprove" disabled>Unapprove</button>';
                    $('#butterscotch').empty().append(c, d, a, b);
                } else if (abc == 'Pending') {

                    var c = '<button type="button" class="btn btn-default" onClick = "my()" id = "hantu">Back</button>';
                    var d = '&nbsp<button type="button" class="btn btn-default" data-backdrop="false" data-toggle="modal" data-target="#modalHistory">Reject History</button>';
                    var a = '&nbsp<button class="btn btn-default" data-backdrop = "false"data-toggle="modal" data-target="#approveContractor">Approve</button>&nbsp&nbsp&nbsp';
                    var b = '&nbsp<button class="btn btn-default" data-backdrop = "false"data-toggle="modal" data-target="#unapprove">Unapprove</button>';
                    $('#butterscotch').empty().append(c, d, a, b);
                }
            } else if (statususer == 'staff') {

                var c = '<button type="button" class="btn btn-default" onClick = "my()" id = "hantu">Back</button>';
                var d = '&nbsp<button type="button" class="btn btn-default" data-backdrop="false" data-toggle="modal" data-target="#modalHistory">Reject History</button>';
                $('#butterscotch').empty().append(c, d);
            }

        });
    </script>

















    <!-- Modal utk history -->
    <div class="modal fade" id="modalHistory" tabindex="-1" role="dialog" 
         aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <button type="button" class="close" 
                            data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                        <span class="sr-only">Close</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        History
                    </h4>
                </div>
                <!-- Modal Body -->
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                        <div class="modal-body">


                            <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
                            </table>

                        </div>
                    </form>
                </div>
                <!-- Modal Foter -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default close-modalSend" data-dismiss="modal">
                        Close
                    </button>
                    <button type="button"  class="btn btn-primary" data-dismiss="modal">
                        Ok
                    </button>
                </div>
            </div>
        </div>
    </div>




</body>
</html>
















<!-- Modal utk delete -->
<div class="modal fade" id="modalDelete" tabindex="-1" role="dialog" 
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <button type="button" class="close" 
                        data-dismiss="modal">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    Confirmation
                </h4>
            </div>
            <!-- Modal Body -->
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="modal-body">
                        <p>Are you sure to delete?</p>
                    </div>
                </form>
            </div>
            <!-- Modal Foter -->
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">
                    Close
                </button>
                <button type="button" id="itik" class="btn btn-primary"data-dismiss="modal">
                    Yes
                </button>
            </div>
        </div>
    </div>
</div>
















<!-- Modal utk reject-->
<div class="modal fade" id="modalCannot" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">
                    <span class="glyphicon glyphicon-warning-sign"></span>
                    Warning</h4>
            </div>
            <div class="modal-body">
                Cannot access!!
            </div>
            <div class="modal-footer">
                <button type="button" class="needapprove btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
