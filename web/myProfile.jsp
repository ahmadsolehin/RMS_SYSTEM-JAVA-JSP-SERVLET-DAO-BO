<%@page import="rms.model.UserBean"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--BOOTSTRAP FORM -->
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>

        <Script src="http://code.jquery.com/jquery-2.1.1-rc2.min.js" ></script>
        <script src="http://malsup.github.com/jquery.form.js"></script> 
        <script src="js/dragdropimage/script.js"></script>
        <script src="js/dragdropimage/drop.js"></script>

    </head>

    <body>
        
        
    <script>

        $(document).ready(function(){
            $('#adoi').click(function(){
                alert("hh");
            })
        })


    </script>

        <%

            UserBean bean = (UserBean) session.getAttribute("currentSessionUser");

        %>

        <div class="container">
            <h2>Edit Your Profile</h2>



<!--           <form method="post" action="${ pageContext.request.contextPath}/uploader"
encType="multipart/form-data">
<input type="file" name="file" value="select images..."/>
<input type="submit" value="start upload"/>
</form>-->

        </div>



        <form id = "myform" class="form-horizontal" role="form">

            <div class="form-group">
                <label class="control-label col-sm-2" for="">Full name</label>
                <div class="col-sm-6">
                    <input value = "<%=bean.getFullname()%>" type="text" class="form-control" id="" >
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="">Position</label>
                <div class="col-sm-6">
                    <input value = "<%=bean.getPosition()%>" type="text" class="form-control" id="" >
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="">User name</label>
                <div class="col-sm-6">
                    <input value = "<%=bean.getUsername()%>" type="text" class="form-control" id="" >
                </div>
            </div>


            <div class="form-group">
                <label class="control-label col-sm-2" for="pwd">Password:</label>
                <div class="col-sm-6">          
                    <input value = "<%=bean.getPassword()%>" type="password" class="form-control" id="pwd" >
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-2" for="">Status</label>
                <div class="col-sm-6">
                    <input value = "<%=bean.getUserStatus()%>" type="text" class="form-control" id="" readonly>
                </div>
            </div>

            <div class="form-group">        
                <div class="col-sm-offset-2 col-sm-10">
                    <!--  <button type="button" id = "btnback" class="btn btn-default">Back</button> -->
                    <button type="button" class="btn btn-default" data-backdrop="false" data-toggle="modal" data-target="#modalSubmit">Submit</button>
                </div>
            </div>
        </form>
    </div>










    <div id="haha">

    </div>

</body>
</html>















<!-- Modal utk submit -->
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
                        <p>Are you sure to update?</p>
                    </div>
                </form>
            </div>
            <!-- Modal Foter -->
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">
                    Close
                </button>
                <button type="button" id="adoi" class="btn btn-primary">
                    Submit
                </button>
            </div>
        </div>
    </div>
</div>



