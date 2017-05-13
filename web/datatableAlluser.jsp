<%-- 
    Document   : datatabletest
    Created on : Mar 30, 2015, 9:37:16 AM
    Author     : sony
--%>

<%@page import="rms.model.User_Access"%>
<%@page import="java.util.List"%>
<%@page import="rms.model.UserBean"%>
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

        <!-- DATATABLE -->
        <link rel="stylesheet" type="text/css" href="css/dataTable.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap_dataTable.css">

        <script src="js/jquery-1.11.2.min.js"></script>    
        <script src="js/jquery.js"></script>
        <script src="js/dataTable.js"></script>
        <script src="js/bootstrap_dataTable.js"></script>
        <script src="js/jquery-ui.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- Font Awesome Icons -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
        <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
              page. However, you can choose any other skin. Make sure you
              apply the skin class to the body tag so the changes take effect.
        -->
        <link href="dist/css/skins/skin-blue.min.css" rel="stylesheet" type="text/css" />


        <style> //utk add edit delete update cursor
            .dropdown-menu li:hover {
                cursor: pointer;
            }



        </style>


        <%            UserBean bean = (UserBean) session.getAttribute("currentSessionUser");
            String x = bean.getUserStatus(); //utk tahu status current user nie admin atau member,
            //kalau admin,button approve bru appear

        %>        
    <input type="hidden" id="statusservlet" value="<%= x%>" />



    <script>



        $(document).ready(function () {

            var statususer = $('#statusservlet').val(); //nak tahu samaada admin,staff atau approver

            var columntoView = ["id", "fullname", "position", "estate", "status"];
            var columnName = ["User id", "Full name", "Position", "Estate", "Status"];
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
                     "sPaginationType": "full_numbers",
                     "bProcessing": true,
                     "bServerSide": true,
                "bDestroy": true, //utk buang error bile kite g mari ke page lain.. cannot reinitialise ..
                "sScrollY": "320px",
                    "sAjaxSource": "retrievetable.jsp?table=user&code=id&" + colsTosend + "&order=",
                "aoColumns": [
                    {"sTitle": columnName[0], "mData": "id", "sWidth": "3%"},
                    {"sTitle": columnName[1], "mData": columntoView[1], "sWidth": "3%", "bSearchable": true},
                    {"sTitle": columnName[2], "mData": columntoView[2], "sWidth": "9%"},
                    {"sTitle": columnName[3], "mData": columntoView[3], "sWidth": "15%"},
                    {"sTitle": columnName[4], "mData": columntoView[4], "sWidth": "15%"},
                    {"sTitle": "Action", "mData": null, "bSortable": false, "bSearchable": false, "sWidth": "15%"}
                ],
                "aoColumnDefs": [
                    {
                        "aTargets": [5],
                        "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {

                            var ayam = $('<div class=" dropdown"><button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Choose <span class="caret"></span></button><ul class="dropdown-menu"><li><a class = "unta" href="">Edit</a></li><li><a class="lembu"href="">View</a></li><li><a data-backdrop="false" data-toggle="modal" data-target="#modalDelete" href="">Delete</a></li><li><a class="accessbtn"href="">Access</a></li></ul></div>');


                            ayam.on('click', function () {

                                $('.lembu').click(function () {

        <%
            if ("Yes".equals(access.get(10).getAccess())) {
        %>

                                    $.ajax({
                                        url: "viewUserBean?id=" + oData.id,
                                        success: function (result) {
                                            $('#haha').empty().html(result).fadeIn('slow');
                                        }});
                                    return false;

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


                                $('.unta').click(function () {
                                    //     alert("th");

        <%            if ("Yes".equals(access.get(9).getAccess())) {
        %>
                                    $.ajax({
                                        url: "editUserBean?id=" + oData.id,
                                        success: function (result) {
                                            $('#haha').empty().html(result).fadeIn('slow');
                                        }});
                                    return false;
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
                                });


                                $('#itik').off('click').click(function () {

        <%            if ("Yes".equals(access.get(8).getAccess())) {
        %>
                                    $.ajax({
                                        url: "deleteUserBean?id=" + oData.id,
                                        success: function (result) {
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





                                $('.accessbtn').unbind('click').click(function () {
                                    $.ajax({
                                        url: "viewAccessControl?id=" + oData.id,
                                        success: function (result) {
                                            $('#haha').empty().html(result).fadeIn('slow');
                                        }});
                                    return false;
                                })







                            });
                            $(nTd).empty();
                            $(nTd).attr("id", 'btntest');
                            $(nTd).prepend(ayam);
                        }

                    }
                ]
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
                        <h3 class="box-title">All Data User</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body">

                        <table id="example" class="table table-bordered  table-striped" cellspacing="0" width="100%">
                        </table>



                        <div id="buttersweet"></div>




                        <div id = "haha">
                        </div>

                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </section><!-- /.content -->




    <script>
        $(document).ready(function ()
        {
            var statususer = $('#statusservlet').val(); //nak tahu samaada admin atau member
            //   var abc = $('#lulusketidak').val();

            if (statususer == 'admin') {

                var along = '<button type="button" class="btn btn-default" data-backdrop="false" data-toggle="modal" data-target="#adduser">Add user</button>';
                $('#buttersweet').empty().append(along);
            } else if (statususer == 'staff') {

                $('#buttersweet').empty();
            }

        });</script>




















    <!-- Modal utk sub -->
    <div class="modal fade" id="adduser" tabindex="-1" role="dialog" 
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
                                Fullname
                            </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="fullname" id="inputnotapprove"/>
                            </div>
                        </div>    


                        <div class="form-group">
                            <label class="col-sm-2 control-label"for="input">
                                Position
                            </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="position" id="inputnotapprove" />
                            </div>
                        </div>    

                        <div class="form-group">
                            <label class="col-sm-2 control-label"for="input">
                                Estate
                            </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="estate" id="inputnotapprove" />
                            </div>
                        </div>    


                        <div class="form-group">
                            <label class="col-sm-2 control-label"for="input">
                                Status
                            </label>
                            <div class="col-sm-8">
                                <select class="form-control" name="status">
                                    <option value="admin">admin</option>
                                    <option value="approver">approver</option>
                                    <option value="staff">staff</option>
                                </select>
                            </div>
                        </div>    



                        <div class="form-group">
                            <label class="col-sm-2 control-label"for="input">
                                Username
                            </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="username" id="uname" />
                            </div>
                            <label id = "status" class="col-sm-2"for="input">

                            </label>
                        </div> 



                        <div class="form-group">
                            <label class="col-sm-2 control-label"for="input">
                                Password
                            </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="password" id="inputnotapprove"/>
                            </div>
                        </div> 



                    </form>    
                </div>
                <!-- Modal Foter -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default tutupmodal"
                            data-dismiss="modal">
                        Close
                    </button>
                    <button type="button" id="itikgembo" class="btn btn-primary"data-dismiss="modal" disabled>
                        Yes
                    </button>
                </div>
            </div>
        </div>
    </div>



    <script>
        $('#itikgembo').click(function () {
            //  alert("dewf");

        <%        if ("Yes".equals(access.get(7).getAccess())) {
        %>

            var a = $("form").serialize();
            $.ajax({
                data: a,
                //  type: 'POST',
                url: "addNewUser",
                success: function (result) {
                    $('#haha').empty().html(result).fadeIn('slow');
                }});
            // return false;
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
        });
    </script>




















    <!-- Modal utk reject-->
    <div class="modal fade" id="onlyadmin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">
                        <span class="glyphicon glyphicon-warning-sign"></span>
                        Warning</h4>
                </div>
                <div class="modal-body">
                    Only admin can access!
                </div>
                <div class="modal-footer">
                    <button type="button" class="needapprove btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>













<script type="text/javascript">
    $(document).ready(function ()
    {

        var tick = $('<img />', {
            id: '',
            src: 'image/ada.gif',
            alt: '',
            // width: '100px',
            // height: '10px',
            // align: 'middle'
        });
        var erase = $('<img />', {
            id: '',
            src: 'image/erase.png',
            alt: '',
            // width: '100px',
            // height: '10px',
            // align: 'middle'
        });
        $('.tutupmodal').click(function () {
            $('#status').empty();
            document.getElementById("sendData").removeAttribute('enabled');
        })

        $("#uname").change(function ()
        {
            var uname = $(this).val();
            if (uname.length > 3)
            {
                //   $("#status").html(" availability.");
                $.ajax
                        ({
                            type: "POST",
                            url: "checkExistenceUsername",
                            data: "uname=" + uname,
                            success: function (output_string)
                            {
                                var u = $.trim(output_string);
                                if (u == 'tiada') {
                                    $("#status").empty().append(tick);
                                    document.getElementById("itikgembo").removeAttribute('disabled');
                                } else if (u == 'ada') {
                                    $("#status").empty().append(erase);
                                }
                            }
                        });
            }

            else
            {
                $("#status").empty().html("should be 3 chars");
            }

        });
    });</script>












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
















<!-- Modal utk edit -->
<div class="modal fade" id="modalEdit" tabindex="-1" role="dialog" 
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
                    Edit user
                </h4>
            </div>


            <div id="nakLetakEditUser">

            </div>

            <script>
                $.ajax({url: "editUserBean?id=" + oData.id",
                            success: function (result) {
                                $('#nakLetakEditUser').empty().html(result).fadeIn('slow');
                            }});</script>



            <!-- Modal Foter -->
            <div class="modal-footer">
                <button type="button" class="tutupmodal btn btn-default"
                        data-dismiss="modal">
                    Close
                </button>
                <button type="button" id="editbtnsubmit" class="btn btn-primary"data-dismiss="modal" disabled>
                    Submit
                </button>
            </div>
        </div>
    </div>
</div>



