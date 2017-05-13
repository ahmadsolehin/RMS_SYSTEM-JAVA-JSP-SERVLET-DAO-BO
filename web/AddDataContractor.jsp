<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--BOOTSTRAP FORM -->
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="js/maxlengthAlert.js"></script>

        <style>

            .centerkan{
                margin-left: 90px;
                margin-top: 30px;
            }
        </style>

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


                                <legend class="centerkan">Add Data Contractor</legend>

                                <form id="myForm" class="form-horizontal" method="post" action="addData" role="form">

                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="contractorcode">Contractor code : </label>
                                        <div class="col-sm-4 ">
                                            <input type="text" class="form-control" id="code" placeholder="Auto generate" disabled>
                                        </div>
                                    </div>



                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="">Company name : </label>
                                        <div class="col-sm-4">          
                                            <input name = "companyname" type="text" class="form-control" id="companyname" placeholder="Enter company name">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="">Co. Registration No : </label>
                                        <div class="col-sm-4">          
                                            <input name = "regno" type="text" class="form-control" id="regno" placeholder="Enter register no">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="">GST ID : </label>
                                        <div class="col-sm-4">          
                                            <input name = "gstid" type="text" class="form-control" id="" placeholder="Enter gst id">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="">Bumiputera : </label>
                                        <div class="col-sm-4">          
                                            <select name="bumiputera" class="form-control" id="">
                                                <option value="yes">Yes</option>
                                                <option value="no">No</option>
                                            </select>
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="">Owner name : </label>
                                        <div class="col-sm-4">          
                                            <input name = "ownername" type="text" class="form-control" id="" placeholder="Enter owner name">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="">Owner ic : </label>
                                        <div class="col-sm-4">          
                                            <input name = "owneric" type="text" class="form-control" id="" placeholder="Enter owner ic">
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="">Owner nationality : </label>
                                        <div class="col-sm-4">          
                                            <input name = "ownernation" type="text" class="form-control" id="" placeholder="Enter owner nationality">
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="">Class : </label>
                                        <div class="col-sm-4">          
                                            <input name = "kelas" type="text" class="form-control" id="" placeholder="Enter class">
                                        </div>
                                    </div>




                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="">Contact person : </label>
                                        <div class="col-sm-4">          
                                            <input name = "person" type="text" class="form-control" id="" placeholder="Enter contact person">
                                        </div>
                                    </div>



                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="">Contact title : </label>
                                        <div class="col-sm-4">          
                                            <input name = "title" type="text" class="form-control" id="" placeholder="Enter contact title">
                                        </div>
                                    </div>



                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="">Contact position : </label>
                                        <div class="col-sm-4">          
                                            <input name = "position" type="text" class="form-control" id="" placeholder="Enter contact position">
                                        </div>
                                    </div>



                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="">Contact HP no : </label>
                                        <div class="col-sm-4">          
                                            <input name = "contact" type="text" class="form-control" id="" placeholder="Enter hp no">
                                        </div>
                                    </div>



                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="">Address : </label>
                                        <div class="col-sm-4">          
                                            <input name = "address" type="text" class="form-control" id="" placeholder="Enter address">
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="">Postcode : </label>
                                        <div class="col-sm-4">          
                                            <input name = "postcode" type="text" class="form-control" id="" placeholder="Enter postcode">
                                        </div>
                                    </div>



                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="">City : </label>
                                        <div class="col-sm-4">          
                                            <input name = "city" type="text" class="form-control" id="" placeholder="Enter city">
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="">State : </label>
                                        <div class="col-sm-4">          
                                            <select class="form-control" name="state">
                                                <option value="melaka">Melaka</option>
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
                                            <select class="form-control" name="country">
                                                <option value="malaysia">Malaysia</option>
                                            </select>
                                        </div>
                                    </div>




                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="">Telephone : </label>
                                        <div class="col-sm-4">          
                                            <input name = "phone" type="text" class="form-control" id="" placeholder="Enter phone">
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="">Fax : </label>
                                        <div class="col-sm-4">          
                                            <input name = "fax" type="text" class="form-control" id="" placeholder="Enter fax">
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="">Email : </label>
                                        <div class="col-sm-4">          
                                            <input name = "email" type="email" class="form-control" id="" placeholder="Enter email">
                                        </div>
                                    </div>



                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="">Url : </label>
                                        <div class="col-sm-4">          
                                            <input name = "url" type="text" class="form-control" id="" placeholder="Enter url">
                                        </div>
                                    </div>



                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="">Payment Term (Days) : </label>
                                        <div class="col-sm-4">          
                                            <input name = "bayaran" type="text" class="form-control" id="" placeholder="Enter payment days">
                                        </div>
                                    </div>



                                    <div class="form-group">
                                        <label class="control-label col-sm-2" for="">Remarks : </label>
                                        <div class="col-sm-4">          
                                            <input name = "remark" type="text" class="form-control" id="" placeholder="Enter remarks">
                                        </div>
                                    </div>


                                    <br>

                                    <div class="form-group">        
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <button type="button" class="btn btn-default" id = "btnback">Back</button>
                                            <button type="button" class="btn btn-default" data-backdrop="false" data-toggle="modal" data-target="#modalSubmit">Submit</button>
                                        </div>
                                    </div>



                                </form>


                                <script>

                                    $(document).ready(function () {
                                        $('#btnsubmit').unbind('click').click(function () {
                                            var a = $("form").serialize();
                                            $.ajax({
                                                data: a,
                                                type: 'POST',
                                                url: "addData",
                                                success: function (result) {
                                                    $('#haha').empty().html(result).fadeIn('slow');
                                                }});
                                        })
                                    });


                                </script>














                            </div> <!-- class container-->


                            <div id="haha">
                            </div>




                        </div><!-- /.box-body -->
                    </div><!-- /.box -->
                </div><!-- /.col -->
            </div><!-- /.row -->
        </section><!-- /.content -->















































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
                        <button type="button" id="btnsubmit" class="btn btn-primary"data-dismiss="modal">
                            Submit
                        </button>
                    </div>
                </div>
            </div>
        </div>



        <script>
            $(document).ready(function () {

                $('#btnback').unbind('click').click(function () {
                    $.ajax({url: "datatabletest.jsp",
                        success: function (result) {
                            $('#haha').empty().html(result).fadeIn('slow');
                        }});
                })
            })
        </script>


<!--
         Modal utk back 
        <div class="modal fade" id="modalBack" tabindex="-1" role="dialog" 
             aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                     Modal Header 
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
                     Modal Body 
                    <div class="modal-body">
                        <form class="form-horizontal" role="form">
                            <div class="modal-body">
                                <p>Back to previous page?</p>
                            </div>
                        </form>
                    </div>
                     Modal Foter 
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
        </div>-->



    </body>
</html>


