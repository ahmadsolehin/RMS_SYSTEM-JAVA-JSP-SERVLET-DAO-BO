<%-- 
    Document   : datatabletest
    Created on : Mar 30, 2015, 9:37:16 AM
    Author     : sony
--%>

<%@page import="rms.model.User_Access"%>
<%@page import="rms.model.ServerListEstate"%>
<%@page import="java.util.List"%>
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


        <script>



            $(document).ready(function () {



                var columntoView = ["contractorcode", "companyname", "regno", "gstid", "ownername", "status"];
                var columnName = ["Code", "company name", "regno", "gstid", "ownername", "status"];
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
                    "bDestroy": true, //utk buang error bile kite g mari ke page lain.. cannot reinitialise ..
                         "bProcessing": true,
                         "bServerSide": true,
                    "sScrollY": "320px",
                        "sAjaxSource": "retrievetable.jsp?table=contractorinfo&code=contractorcode&" + colsTosend + "&order=",
                    "aoColumns": [
                        {"sTitle": columnName[0], "mData": "contractorcode", "sWidth": "3%", "bSearchable": true},
                        {"sTitle": columnName[1], "mData": columntoView[1], "sWidth": "15%"},
                        {"sTitle": columnName[2], "mData": columntoView[2], "sWidth": "10%"},
                        {"sTitle": columnName[3], "mData": columntoView[3], "sWidth": "15%"},
                        {"sTitle": columnName[4], "mData": columntoView[4], "sWidth": "15%"},
                        {"sTitle": "Status", "mData": null, "bSortable": false, "bSearchable": false, "sWidth": "15%"},
                        {"sTitle": "Action", "mData": null, "bSortable": false, "bSearchable": false, "sWidth": "15%"}
                    ],
                    "aoColumnDefs": [
                        {
                            "aTargets": [5],
                            "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {

                                // alert(oData.status);
                                if (sData.status == "Reject") {
                                    //       var img = $('htghf');
                                    var img = $('<img src="image/cancel.png" >');
                                } else if (sData.status == "Active") {
                                    var img = $('<img src="image/tick.png" >');
                                } else if (sData.status == "Pending") {
                                    var img = $('<img src="image/glass.png" >');
                                }

                                $(nTd).empty();
                                $(nTd).attr("id", 'btntest');
                                $(nTd).prepend(img);
                            }
                        },
                        {
                            "aTargets": [6],
                            "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {

                                if (sData.status == "Active") {
                                    var ayam = $('<div class="dropdown"><button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Choose <span class="caret"></span></button><ul class="dropdown-menu"><li><a class = "keldai" href="">Edit</a></li><li><a class="lembu"href="">View</a></li><li><a data-backdrop="false" data-toggle="modal" data-target="#modalDelete" href="">Delete</a></li><li><a data-backdrop="false" data-toggle="modal" data-target="#modalSend" href = "">Send</a></li></ul></div>');
                                }
                                else if (sData.status == "Reject") {
                                    var ayam = $('<div class="dropdown"><button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Choose <span class="caret"></span></button><ul class="dropdown-menu"><li><a class = "keldai" href="">Edit</a></li><li><a class="lembu"href="">View</a></li><li><a data-backdrop="false" data-toggle="modal" data-target="#modalDelete" href="">Delete</a></li><li><a  data-backdrop="false" data-toggle="modal" data-target="#modalReject" href="">Send</a></li></ul></div>');
                                }
                                else if (sData.status == "Pending") {
                                    var ayam = $('<div class="dropdown"><button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Choose <span class="caret"></span></button><ul class="dropdown-menu"><li><a class = "keldai" href="">Edit</a></li><li><a class="lembu"href="">View</a></li><li><a data-backdrop="false" data-toggle="modal" data-target="#modalDelete" href="">Delete</a></li><li><a  data-backdrop="false" data-toggle="modal" data-target="#modalPending" href="">Send</a></li></ul></div>');
                                }




                                ayam.on('click', function () {




                                    $('#tutupmodal').unbind('click').click(function () {


                                        $('.itikgembo').empty();
                                        document.getElementById("sendData").removeAttribute('disabled');
                                        $('input:checkbox').removeAttr('checked');
                                    })


                                    $('#sendData').unbind('click').click(function () {

            <%                      if ("Yes".equals(access.get(4).getAccess())) {

            %>

                                        var val = [];
                                        $('.cekbox:checked').each(function (i) {
                                            //    val[i] = $(this).val();
                                            val.push($(this).val());
                                        });
                                        var est = 'estate=';
                                        var x;
                                        //   alert(val);
                                        document.getElementById("sendData").setAttribute("disabled", true);
                                        document.getElementById("tutupmodal").setAttribute("disabled", true);
                                        $('body').removeClass('modal-open');
                                        sendData(val, oData.contractorcode);

            <% } else {
            %>
                                        swal({
                                            title: "You have no authority to access",
                                            text: "",
                                            type: "error",
                                            confirmButtonText: "Ok"
                                        });
            <%            }

            %>

                                    });


                                    $('#itik').off('click').click(function () {

            <%                if ("Yes".equals(access.get(1).getAccess())) {

            %>
//alert(oData.contractorcode);
                                        $.ajax({
                                            url: "delete?id=" + oData.contractorcode,
                                            success: function (result) {
                                                //$('.messi').remove();
                                                //alert(oData.contractorcode);
                                                $('#haha').empty().html(result).fadeIn('slow');
                                            }});
                                        //    return false;

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





                                    $('.keldai').unbind('click').click(function () {

            <%                                             if ("Yes".equals(access.get(2).getAccess())) {

            %>

                                        $.ajax({
                                            url: "kemaskini?id=" + oData.contractorcode,
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




                                    $('.lembu').unbind('click').click(function () {

            <%                     if ("Yes".equals(access.get(3).getAccess())) {

            %>
                                        $.ajax({
                                            url: "viewdata?id=" + oData.contractorcode,
                                            success: function (result) {
                                                // $("#haha").html(result);
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



                                });
                                $(nTd).empty();
                                $(nTd).attr("id", 'btntest');
                                $(nTd).prepend(ayam);
                            }

                        }
                    ]
                });
            })

            var dataest;
            var cnt = 0;
            function sendData(estlist, con)
            {
                cnt = 0;
                dataest = estlist;
                console.log(dataest)
                sendRec(con);
            }

            function sendRec(con)
            {

                var cancel = $('<img />', {
                    id: '',
                    src: 'image/cancel.png',
                    alt: '',
                    // width: '100px',
                    // height: '10px',
                    // align: 'middle'
                });
                var tick = $('<img />', {
                    id: '',
                    src: 'image/tick.png',
                    alt: '',
                    // width: '100px',
                    // height: '10px',
                    // align: 'middle'
                });
                var img = $('<img />', {
                    id: 'Myid',
                    src: 'image/378.gif',
                    alt: 'MyAlt',
                    width: '100px',
                    height: '10px',
                    // align: 'middle'
                });
                img.empty().appendTo($('#response' + dataest[cnt]));
                console.log("enter send ");
                var request = $.ajax({
                    url: "NewServlet?estate=" + dataest[cnt] + "&code=" + con,
                    //type:'POST',
                    data: dataest[cnt],
                    async: true,
                    cache: true,
                    success: function (output_string) {
                        var u = $.trim(output_string);
                        if (u == 'yes') {
                            $('#response' + dataest[cnt]).empty().append(tick);
                        } else if (u == "no") {
                            $('#response' + dataest[cnt]).empty().append(cancel);
                        }
                        console.log("success " + dataest[cnt]);
                        cnt++;
                        if (cnt < dataest.length) {
                            sendRec(con);
                        } else {
                            alert("All process has complete..\nPress close to exit..");
                            $('#divGambar').empty();
                            document.getElementById("tutupmodal").removeAttribute('disabled');
                        }
                    },
                    error: function (xhr, textStatus, err) {
                        console.log("error " + dataest[cnt]);
                        //alert("Error:" + xhr.status);
                        cnt++;
                        if (cnt < dataest.length)
                            sendRec(con);
                    }, beforeSend: function () {
                        //  $('#response' + dataest[cnt]).append('Waiting');

                    }

                });
            }


        </script>






    </head>
    <body>

        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">Data Contractor</h3>
                        </div><!-- /.box-header -->
                        <div class="box-body">

                            <table id="example" class="table table-bordered table-hover" cellspacing="0" width="100%">
                            </table>



                            <button class="btn btn-default" onclick="" id = "addDataCon" >Add</button>




                            <div id = "haha">
                            </div>


                        </div><!-- /.box-body -->
                    </div><!-- /.box -->
                </div><!-- /.col -->
            </div><!-- /.row -->
        </section><!-- /.content -->




        <script>

            $(document).ready(function () {


                $('#addDataCon').unbind('click').click(function () {

            <%                if ("Yes".equals(access.get(0).getAccess())) {

            %>

                    $.ajax({url: "AddDataContractor.jsp",
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
            <%            }

            %>



                })
            })
        </script>











































        <!-- Modal utk reject-->
        <div class="modal fade" id="modalReject" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">
                            <span class="glyphicon glyphicon-warning-sign"></span>
                            Warning</h4>
                    </div>
                    <div class="modal-body">
                        User has been reject!!
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="needapprove btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>







        <!-- Modal utk pending-->
        <div class="modal fade" id="modalPending" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">
                            <span class="glyphicon glyphicon-warning-sign"></span>
                            Warning</h4>    
                    </div>
                    <div class="modal-body">
                        Waiting for approval..
                    </div>
                    <div class="modal-footer">
                        <button type="button" class=" btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>







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

















        <!-- Modal utk send -->
        <div class="modal fade" id="modalSend" tabindex="-1" role="dialog" 
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
                            Choose Estate to Send
                        </h4>
                    </div>
                    <!-- Modal Body -->
                    <div class="modal-body">
                        <div id="loadtable"></div>

                        <div id="divGambar"></div>


                        <script>
                            $.ajax({url: "ListingEstate",
                                success: function (result) {
                                    $('#loadtable').empty().html(result).fadeIn('slow');
                                }});
                        </script>

                    </div>
                    <!-- Modal Foter -->
                    <div class="modal-footer">
                        <button type="button" id = "tutupmodal" class="btn btn-default close-modalSend"
                                data-dismiss ="modal"      >
                            Close
                        </button>
                        <button type="button" id="sendData" class="btn btn-primary" >
                            Send
                        </button>
                    </div>
                </div>
            </div>
        </div>


    </body>
</html>














