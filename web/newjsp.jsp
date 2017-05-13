<%@page import="rms.controller.ListingNotify"%>
<%@page import="java.util.List"%>
<%@page import="rms.model.Notify"%>
<%@page import="rms.model.UserBean"%>
<head>

</head>
<body>


    <%
        UserBean bean = (UserBean) session.getAttribute("currentSessionUser");
        String x = bean.getId();


    %>        
    <input type="hidden" id="statusservlet" value="<%= x%>" />



    <script>
        $(document).ready(function () {

            var code = $('#statusservlet').val();
            alert(code);
            $.ajax({
                url: "ListingNotify?id=" + code,
                success: function (result) {
                    //  $('#haha').empty().html(result).fadeIn('slow');
                }});
        });
    </script>

    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">Notification</h3>
                        <div class="box-tools">
                            <div class="input-group">
                                <input type="text" name="table_search" class="form-control input-sm pull-right" style="width: 150px;" placeholder="Search"/>
                                <div class="input-group-btn">
                                    <button class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                        </div>
                    </div><!-- /.box-header -->
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">


                            <tr>
                                <th>Contractorcode</th>
                                <th>Owner name</th>
                                <th>About</th>
                                <th>Approval Name</th>
                                <th>Date</th>
                                <th><input type="checkbox" name="select-all" id="selectall">&nbsp;Select all</th>
                            </tr>            

                            <%         // x = request.getAttribute("theName");
                                //out.println("alert(\"" +kod+ "\")");
                                try {
                                    List<Notify> clist = (List<Notify>) request.getAttribute("list");
                                    for (Notify c : clist) {%>

                            <tr><td> <%=c.getContractorcode()%></td><td> <%=c.getContractorname()%></td><td> <%=c.getNotify_text() %></td><td> <%=c.getFullName() %></td><td> <%=c.getDate() %></td>                                    <td> <fieldset id="checkArray"> <input type="checkbox" class = "cekbox" id = "boxer" name="selector[]" value=""> </fieldset> </td><td><div id="response"></div></td></tr><!-- Darker Table Row -->



                            <script>

                                $(document).ready(function () {
                                    $('#selectall').click(function (event) {  //on click 
                                        if (this.checked) { // check select status
                                            $('.cekbox').each(function () { //loop through each checkbox
                                                this.checked = true;  //select all checkboxes with class "checkbox1"             

                                            });
                                        } else {
                                            $('.cekbox').each(function () { //loop through each checkbox               
                                                this.checked = false; //deselect all checkboxes with class "checkbox1"                       
                                            });
                                        }
                                    });




                                });
                            </script>
                            <%
                                    }
                                } catch (Exception ex) {
                                    out.println(ex);
                                }

                            %>



                        </table>
                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div>
        </div>



        <button class="btn btn-default" data-toggle="modal" data-target="#modalDelete">
            <img src="image/cancel.png">
        </button>
    </section><!-- /.content -->



    
        <!-- Modal utk submit -->
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
                        <button type="button" id="klik" class="btn btn-primary"data-dismiss="modal">
                            Yes
                        </button>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        <script>
                           $('#klik').unbind('click').click(function () {


                                        var val = [];
                                        $(':checkbox:checked').each(function (i) {
                                            val[i] = $(this).val();
                                        });
                                      alert(val[4]);

                           });
        </script>
</body>