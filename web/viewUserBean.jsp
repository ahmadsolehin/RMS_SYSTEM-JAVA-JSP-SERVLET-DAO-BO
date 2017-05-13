<%-- 
    Document   : viewUserBean
    Created on : Aug 10, 2015, 2:15:00 PM
    Author     : sony
--%>

<%@page import="rms.model.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>

    <body>



    <body>

        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                        </div><!-- /.box-header -->
                        <div class="box-body">



                            <div class="container">


                                <fieldset>

                                    <legend>User Information - All details</legend>


                                    <%

                                        UserBean con = (UserBean) request.getAttribute("userBean");

                                    %>

                                    <ol>

                                        <br>

                                        <table class="table table-striped">

                                            <tbody>

                                                <tr>
                                                    <th>Fullname </th>
                                                    <td class="col-md-8"><%=con.getFullname()%> </td>
                                                </tr>

                                                <tr>
                                                    <th>Position</th>
                                                    <td><%=con.getPosition()%> </td>
                                                </tr>

                                                <tr>
                                                    <th>Estate</th>
                                                    <td><%=con.getEstate()%> </td>
                                                </tr>

                                                <tr>
                                                    <th>Status </th>
                                                    <td><%=con.getUserStatus()%> </td>
                                                </tr>

                                                <tr>
                                                    <th>Username</th>
                                                    <td><%=con.getUsername()%> </td>
                                                </tr>

                                                <tr>
                                                    <th>Password</th>
                                                    <td><%=con.getPassword()%> </td>
                                                </tr>



                                            </tbody>
                                        </table>

                                        <div class="form-group">        
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <button type="button" class="btn btn-default" id="btnbacktoparadise" >Back</button>
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



                                        </body>
                                        </html>











                                       










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
