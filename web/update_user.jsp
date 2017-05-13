<%-- 
    Document   : contractorInformation.jsp
    Created on : Feb 26, 2015, 12:21:15 PM
    Author     : sony
--%>

<%@page import="java.util.List"%>
<%@page import="rms.model.Contractor"%>
<%@page import="rms.util.ConnectionUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <script src="js/jquery-1.11.2.min.js"></script>

        <style>

            .centerkan{
                margin-left: 90px;
                margin-top: 30px;
            }
        </style>



    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                    </div><!-- /.box-header -->
                    <div class="box-body">


                        <div class="container">


                            <legend class="centerkan">Contractor Information - Update</legend>



                            <form id = "form" class="form-horizontal" role="form">


                                <%

                                    Contractor con = (Contractor) request.getAttribute("contractor");

                                %>


                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="contractorcode">Contractor code : </label>
                                    <div class="col-sm-4 ">
                                        <input name="contractorcode" type="text" value = "<%=con.getContractorCode()%>"  class="form-control" readonly>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="">Company name : </label>
                                    <div class="col-sm-4">          
                                        <input name = "companyname" type="text" class="form-control" id=""  value="<%=con.getCompanyName()%>">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="">Co. Registration No : </label>
                                    <div class="col-sm-4">          
                                        <input name = "regno" type="text" class="form-control" id="" value = "<%=con.getRegNo()%>">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="">GST ID : </label>
                                    <div class="col-sm-4">          
                                        <input name = "gstid" type="text" class="form-control" id="" value = "<%=con.getGstId()%>">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="">Bumiputera : </label>
                                    <div class="col-sm-4">          
                                        <select name="bumiputera"  value = "<%=con.getBumiputera()%> " class="form-control" id="">
                                            <option value="yes">Yes</option>
                                            <option value="no">No</option>
                                        </select>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="">Owner name : </label>
                                    <div class="col-sm-4">          
                                        <input name = "ownername" type="text" class="form-control" id="" value = "<%=con.getOwnername()%> ">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="">Owner ic : </label>
                                    <div class="col-sm-4">          
                                        <input name = "owneric" type="text" class="form-control" id="" value = "<%=con.getOwneric()%>" >
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="">Owner nationality : </label>
                                    <div class="col-sm-4">          
                                        <input name = "ownernation" type="text" class="form-control" id=""  value = "<%=con.getOwnernation()%> ">
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="">Class : </label>
                                    <div class="col-sm-4">          
                                        <input name = "kelas" type="text" class="form-control" id="" value = "<%=con.getKelas()%> ">
                                    </div>
                                </div>




                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="">Contact person : </label>
                                    <div class="col-sm-4">          
                                        <input name = "person" type="text" class="form-control" id=""  value = "<%=con.getPerson()%> ">
                                    </div>
                                </div>



                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="">Contact title : </label>
                                    <div class="col-sm-4">          
                                        <input name = "title" type="text" class="form-control" id="" value = "<%=con.getTitle()%> " >
                                    </div>
                                </div>



                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="">Contact position : </label>
                                    <div class="col-sm-4">          
                                        <input name = "position" type="text" class="form-control" id=""  value = "<%=con.getPosition()%> ">
                                    </div>
                                </div>



                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="">Contact HP no : </label>
                                    <div class="col-sm-4">          
                                        <input name = "contact" type="text" class="form-control" id="" value = "<%=con.getContact()%>" >
                                    </div>
                                </div>



                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="">Address : </label>
                                    <div class="col-sm-4">          
                                        <input name = "address" type="text" class="form-control" id=""  value = "<%=con.getAddress()%> ">
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="">Postcode : </label>
                                    <div class="col-sm-4">          
                                        <input name = "postcode" type="text" class="form-control" id=""  value = "<%=con.getPostcode()%> ">
                                    </div>
                                </div>



                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="">City : </label>
                                    <div class="col-sm-4">          
                                        <input name = "city" type="text" class="form-control" id=""  value = "<%=con.getCity()%>" >
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="">State : </label>
                                    <div class="col-sm-4">          
                                        <select class="form-control"  value = "" name="state">

                                            <option value="melaka"> <%=con.getState()%></option>
                                            <option value="johor">Johor</option>
                                            <option value="pahang">Pahang</option>
                                            <option value="selangor">Selangor</option>
                                            <option value="perak">Perak</option>
                                            <option value="wilayah">Wilayah Persekutuan</option>
                                            <option value="kelantan">Kelantan</option>
                                            <option value="perlis">Perlis</option>
                                            <option value="kedah">Kedah</option>
                                            <option value="negeri sembilan">Negeri Sembilan</option>
                                            <option value="pulau pinang">Pulau Pinang</option>
                                            <option value="terenggganu">Terengganu</option>
                                            <option value="sabah">Sabah</option>
                                            <option value="sarawak">Sarawak</option>
                                        </select>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="">Country : </label>
                                    <div class="col-sm-4">          
                                        <select class="form-control"   value = "<%=con.getCountry()%> "name="country">
                                            <option value="malaysia">Malaysia</option>
                                        </select>
                                    </div>
                                </div>




                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="">Telephone : </label>
                                    <div class="col-sm-4">          
                                        <input name = "phone" type="text" class="form-control" id=""  value = "<%=con.getPhone()%>">
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="">Fax : </label>
                                    <div class="col-sm-4">          
                                        <input name = "fax" type="text" class="form-control" id=""  value = "<%=con.getFax()%> ">
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="">Email : </label>
                                    <div class="col-sm-4">          
                                        <input name = "email" type="email" class="form-control" id="" value = "<%=con.getEmail()%>" >
                                    </div>
                                </div>



                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="">Url : </label>
                                    <div class="col-sm-4">          
                                        <input name = "url" type="text" class="form-control" id=""  value = "<%=con.getUrl()%> " >
                                    </div>
                                </div>



                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="">Payment Term (Days) : </label>
                                    <div class="col-sm-4">          
                                        <input name = "bayaran" type="text" class="form-control" id="" value = "<%=con.getBayaran()%> ">
                                    </div>
                                </div>



                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="">Remarks : </label>
                                    <div class="col-sm-4">          
                                        <input name = "remark" type="text" class="form-control" id="" value = "<%=con.getRemark()%> " >
                                    </div>
                                </div>


                                <br>

                                <div class="form-group">        
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="button" class="btn btn-default" data-backdrop="false" data-toggle="modal" data-target="#modalBack">Back</button>
                                        <button type="button" class="btn btn-default" data-backdrop="false" data-toggle="modal" data-target="#modalSubmit">Submit</button>
                                    </div>
                                </div>



                            </form>
                        </div>

                                    
                                    
                        <div id="haha"></div>





                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </section><!-- /.content -->










    <script>

        $(document).ready(function () {
            $('#btnsubmit').click(function () {
                var a = $("form").serialize();
                //alert(a);
                $.ajax({data: a,
                    type: 'POST',
                    url: "update",
                    success: function (result) {
                        $('#haha').empty().html(result).fadeIn('slow');
                    }});
            })
        });


    </script>



    <script>
        $(document).ready(function () {

            $('#btnback').click(function () {
                $.ajax({url: "datatabletest.jsp",
                    success: function (result) {
                       // $(this).data('modal', null);
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
                    <button type="button" id="btnback" class="btn btn-primary"data-dismiss="modal">
                        Yes
                    </button>
                </div>
            </div>
        </div>
    </div>

















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
                    <button type="button" id="btnsubmit" class="btn btn-primary"data-dismiss="modal">
                        Submit
                    </button>
                </div>
            </div>
        </div>
    </div>


</body>
</html>