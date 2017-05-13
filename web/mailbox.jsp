<%@page import="rms.model.UserBean"%>
<head> 

    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>


    <link rel="stylesheet" type="text/css" href="css/dataTable.css">


    <script src="js/jquery-1.11.2.min.js"></script>

    <script src="js/jquery.js"></script>
    <script src="js/dataTable.js"></script>
    <script src="js/bootstrap_dataTable.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



    <%

        UserBean bean = (UserBean) session.getAttribute("currentSessionUser");
        String id = bean.getId();

    %>
<input type="hidden" id="userid" value="<%= id%>" />







<script>



    $(document).ready(function () {

        var iduser = $('#userid').val(); //nak tahu samaada admin,staff atau approver
        alert(iduser);

        var columntoView = ["id", "from", "subject", "message_text", "datetime"];
        var columnName = ["From", "Subject", "Message", "Datetime"];
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
            "bDestroy": true, //utk buang error bile kite g mari ke page lain.. cannot reinitialise ..
                 "sPaginationType": "full_numbers",
                 "bProcessing": true,
                 "bServerSide": true,
            "sScrollY": "320px",
                        "sAjaxSource": "retrievetable.jsp?table=message&code=id&" + colsTosend + "&order=",
            "aoColumns": [
                {"sTitle": columnName[0], "mData": columntoView[0], "sWidth": "3%"},
                {"sTitle": columnName[1], "mData": columntoView[1], "sWidth": "3%", "bSearchable": true},
                {"sTitle": columnName[2], "mData": columntoView[2], "sWidth": "9%"},
                {"sTitle": columnName[3], "mData": columntoView[3], "sWidth": "15%"},
                {"sTitle": "Action", "mData": null, "bSortable": false, "bSearchable": false, "sWidth": "9%"}
            ],
            "aoColumnDefs": [{
                    "aTargets": [4],
                    "fnCreatedCell": function (nTd, sData, oData, iRow, iCol) {

                        if (statususer == "admin") {
                            var ayam = $('<div class=" dropdown"><button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Choose <span class="caret"></span></button><ul class="dropdown-menu"><li><a class = "keldai" href="">Edit</a></li><li><a class="lembu"href="">View</a></li><li><a data-backdrop="false" data-toggle="modal" data-target="#modalDelete" href="">Delete</a></li><li><a data-backdrop="false" data-toggle="modal" data-target="#modalSend" href = "">Send</a></li></ul></div>');
                        } else {
                            var ayam = $('<div class=" dropdown"><button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Choose <span class="caret"></span></button><ul class="dropdown-menu"><li><a data-backdrop="false" data-toggle="modal" data-target="#onlyadmin" href="">Edit</a></li><li><a data-backdrop="false" data-toggle="modal" data-target="#onlyadmin" href="">View</a></li><li><a data-backdrop="false" data-toggle="modal" data-target="#onlyadmin" href="">Delete</a></li><li><a class  = "btnAccess" href="">Send</a></li></ul></div>');
                        }

                        ayam.on('click', function () {



                            $('.btnAccess').click(function () {

                                //    alert("ghrh");

                                $.ajax({
                                    url: "accessControl.jsp",
                                    success: function (result) {
                                        //$('.messi').remove();
                                        //alert(oData.contractorcode);
                                        $('#haha').empty().html(result).fadeIn('slow');
                                    }});
                                return false;
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

<html>
    <body>

        <script>

            $(document).ready(function () {


            })


        </script>

        <div class="mailbox row">
            <div class="col-xs-12">
                <div class="box box-solid">
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-3 col-sm-4">
                                <!-- BOXES are complex enough to move the .box-header around.
                                          This is an example of having the box header within the box body -->
                                <div class="box-header">
                                    <i class="fa fa-inbox"></i>
                                    <h3 class="box-title">INBOX</h3>
                                </div>
                                <!-- compose message btn -->
                                <a class="btn btn-block btn-primary" data-toggle="modal" data-target="#compose-modal"><i class="fa fa-pencil"></i> Compose Message</a>
                                <!-- Navigation - folders-->
                                <div style="margin-top: 15px;">
                                    <ul class="nav nav-pills nav-stacked">
                                        <li class="header">Folders</li>
                                        <li class="active"><a href="#"><i class="fa fa-inbox"></i> Inbox (14)</a></li>
                                        <li><a href="#"><i class="fa fa-pencil-square-o"></i> Drafts</a></li>
                                        <li><a href="#"><i class="fa fa-mail-forward"></i> Sent</a></li>
                                        <li><a href="#"><i class="fa fa-star"></i> Starred</a></li>
                                        <li><a href="#"><i class="fa fa-folder"></i> Junk</a></li>
                                    </ul>
                                </div>
                            </div><!-- /.col (LEFT) -->


                            <div class="col-md-9 col-sm-8">
                                <div class="row pad">



                                    <table id="example" class="table table-bordered  table-striped" cellspacing="0" width="100%">
                                    </table>




                                </div><!-- /.row -->


                            </div><!-- /.col (RIGHT) -->
                        </div><!-- /.row -->
                    </div><!-- /.box-body -->

                </div><!-- /.box -->
            </div><!-- /.col (MAIN) -->
        </div>
        <!-- MAILBOX END -->









        <!-- COMPOSE MESSAGE MODAL -->
        <div class="modal fade" id="compose-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="fa fa-envelope-o"></i> Compose New Message</h4>
                    </div>
                    <form action="#" method="post">
                        <div class="modal-body">
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">TO:</span>





                                    <div class="input-group">                                            
                                        <select class="form-control hantarke" name="sendto">
                                            <script>
                                                var id = $('#statusservlet').val(); //nak tahu samaada admin,staff atau approver

                                                $('.hantarke').click(function () {
                                                $.ajax({
                                                url: "ListingAllUser,"
                                                        success: function (result) {
                                                        //$('.messi').remove();
                                                        //alert(oData.contractorcode);
                                                        $('.hantarke').empty().html(result).fadeIn('slow');
                                                        }});
                                                })
                                            </script>
                                        </select>
                                    </div>




                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">CC:</span>
                                    <input name="email_to" type="email" class="form-control" placeholder="Email CC">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">BCC:</span>
                                    <input name="email_to" type="email" class="form-control" placeholder="Email BCC">
                                </div>
                            </div>
                            <div class="form-group">
                                <textarea name="message" id="email_message" class="form-control" placeholder="Message" style="height: 120px;"></textarea>
                            </div>
                            <div class="form-group">
                                <div class="btn btn-success btn-file">
                                    <i class="fa fa-paperclip"></i> Attachment
                                    <input type="file" name="attachment"/>
                                </div>
                                <p class="help-block">Max. 32MB</p>
                            </div>

                        </div>
                        <div class="modal-footer clearfix">

                            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i> Discard</button>

                            <button type="submit" class="btn btn-primary pull-left"><i class="fa fa-envelope"></i> Send Message</button>
                        </div>
                    </form>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

    </body>
</html>