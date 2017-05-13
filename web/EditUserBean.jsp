

<%@page import="rms.model.UserBean"%>
<%

    UserBean bean = (UserBean) request.getAttribute("bean");

%>


<body>


    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">Edit <%=bean.getFullname() %> profile</h3>
                    </div><!-- /.box-header -->
                    <div class="box-body">


                        <!-- Modal Body -->
                        <div class="modal-body">
                            <form id="myForm" class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label"for="input">
                                        Fullname
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" name="fullname" value = "<%=bean.getFullname()%>" id=""/>
                                    </div>
                                </div>    


                                <div class="form-group">
                                    <label class="col-sm-2 control-label"for="input">
                                        Position
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" name="position" value = "<%=bean.getPosition()%>" id="" />
                                    </div>
                                </div>    

                                <div class="form-group">
                                    <label class="col-sm-2 control-label"for="input">
                                        Estate
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" name="estate" value = "<%=bean.getEstate()%>" id="" />
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
                                        <input type="text" class="form-control" value = "<%=bean.getUsername()%>" name="username" id="uname" />
                                    </div>
                                    <label id = "status" class="col-sm-2"for="input">

                                    </label>
                                </div> 



                                <div class="form-group">
                                    <label class="col-sm-2 control-label"for="input">
                                        Password
                                    </label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" value = "<%=bean.getPassword()%>" name="password" id="inputnotapprove"/>
                                    </div>
                                </div> 


                                <div class="form-group">        
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="button" class="btn btn-default" id = "btnbacktoparadise" >Back</button>
                                        <button type="button" class="btn btn-default" data-backdrop="false" data-toggle="modal" data-target="#modalSubmit">Submit</button>
                                    </div>
                                </div>

                            </form>    
                        </div>


                        <div id="haha">
                        </div>


                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </section><!-- /.content -->


</body>












<script>
    $(document).ready(function () {

        $('#btnbacktoparadise').unbind('click').click(function () {
            $.ajax({url: "datatableAlluser.jsp",
                success: function (result) {
                    $('#haha').empty().html(result).fadeIn('slow');
                }});
        })
    })
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
                <button type="button" id="btnbacktoparadise" class="btn btn-primary"data-dismiss="modal">
                    Yes
                </button>
            </div>
        </div>
    </div>
</div>









        
    <script>

        $(document).ready(function () {
            $('#itik').unbind('click').click(function () {
                var a = $("#myForm").serialize();
                //alert(<%=bean.getId() %>);
               // alert(a);
                $.ajax({
                    data: a,
                 //   type: 'POST',
                    url: "kemaskiniUserBean?userid="+<%=bean.getId() %>,
                    success: function (result) {
                        $('#haha').empty().html(result).fadeIn('slow');
                    }});
            })
        });


    </script>









      
<!-- Modal utk delete -->
<div class="modal fade" id="modalSubmit" tabindex="-1" role="dialog" 
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
                        <p>Are you sure to submit?</p>
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
        
        
        