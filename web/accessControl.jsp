<%@page import="rms.model.User_Access"%>
<%@page import="rms.model.AccessControl"%>
<%@page import="java.util.List"%>
<%@page import="rms.model.UserBean"%>
<head>
    <style>
        .testes.modal-open {
            overflow: scroll;
        }
    </style>
</head>
<body>





    <%
        UserBean mruser = (UserBean) request.getAttribute("mruser");
    %>


    <%        String id = request.getParameter("id");

        UserBean bean = (UserBean) session.getAttribute("currentSessionUser");
        String x = bean.getUserStatus(); //utk tahu status current user nie admin atau member,
        //kalau admin,button approve bru appear

    %>        
    <input type="hidden" id="statusservlet" value="<%= x%>" />
    <input type="hidden" id="userid" value="<%= id%>" />







    <script>
        $(document).ready(function () {

            var status = $('#statusservlet').val();

            if (status == "admin") {
                var b = '&nbsp&nbsp<button type="button" class="btn btn-default" id = "btnbacktoparadise" >Back</button>';
                var c = '&nbsp<button type="button" class="btn btn-default" data-backdrop="false" data-toggle="modal" data-target="#modalSub">Submit</button>';
            }
            $('#buttonsave').empty().append(b,c);

        })
    </script>




    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">
                            <bold>Fullname</bold> : &nbsp; <%=mruser.getFullname()%> <br>
                            <bold>User Id</bold> : &nbsp; <%=mruser.getId()%> 
                        </h3>



                    </div><!-- /.box-header -->

                    <br>

                    <div class=" box-body table-responsive no-padding">

                        <table class="table table-hover">
                            <tr><th>No</th><th>Function</th><th>Access Right</th> </tr>

                            <%         // x = request.getAttribute("theName");
                                //out.println("alert(\"" +kod+ "\")");
                                try {
                                    List<User_Access> anggur = (List<User_Access>) request.getAttribute("anggur");

                                    for (User_Access c : anggur) {
                                        // out.println(c.getAccess());
                                        if ("Yes".equals(c.getAccess())) {
                            %>

                            <script>
                                $(document).ready(function () {
                                    var ayam = '<tr><td><%=c.getModule_id()%></td><td><%=c.getModule_name()%></td> <td> <input class = "cekbox" id = "<%=c.getModule_name()%>" type="checkbox" name="<%=c.getModule_name()%>" value="<%=c.getModule_id()%>" checked>  </td>  </tr>';
                                    $('.table').append(ayam);
                                })
                            </script>


                            <%} else if (c.getAccess().isEmpty()) {
                            %>

                            <script>
                                $(document).ready(function () {
                                    var itik = '<tr><td><%=c.getModule_id()%></td><td><%=c.getModule_name()%></td> <td> <input class = "cekbox" id = "<%=c.getModule_id()%>" type="checkbox" name="<%=c.getModule_name()%>" value="<%=c.getModule_id()%>">  </td>  </tr>';
                                    $('.table').append(itik);
                                })
                            </script>


                            <%}
                            %>


                            <%
                                    }
                                } catch (Exception ex) {
                                    out.println(ex);
                                }

                            %>
                        </table>

                        <br>
                        
                        <div id="buttonsave">
                        </div>
                        
                        <br>

                    </div><!-- /.box-body -->

                </div><!-- /.box -->
            </div> 
        </div> 
    </section><!-- /.content -->







    <div id ="haha">

    </div>

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






<!-- Modal utk sub -->
<div class="modal fade" id="modalSub" tabindex="-1" role="dialog" 
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










<script>

    $('#itik').unbind('click').click(function () {

        var id = $('#userid').val();

        var val = [];
        var vall = [];

        $('.cekbox:checked').each(function (i) {
            //    val[i] = $(this).val();
            val.push($(this).val());
            vall.push($(this).attr("name"));

        });
        // alert(vall);
        //alert(val);


        var estate = 'estate=';
        var x;
        for (x = 0; x < val.length; x++) {

            if (x == val.length - 1) {
                estate += val[x];
            }//tutup if else
            else {
                estate += val[x] + '&estate=';
            }
        }





        var name = 'name=';
        var xx;
        for (xx = 0; xx < vall.length; xx++) {

            if (xx == vall.length - 1) {
                name += vall[xx];
//                alert(name);
            }//tutup if else
            else {
                name += vall[xx] + '&name=';
            }
        }
        pop(estate, name, id);
    });




    function pop(val, vall, id)
    {
        var request = $.ajax({
            url: "ConfigUserAccess?" + val + "&id=" + id + "&" + vall,
            //type:'POST',
            //dataType: 'json',
            //  data: {check: check, name: namemodule},
            async: false,
            cache: true,
            success: function (result) {
                $('#haha').empty().html(result).fadeIn('slow');
            }, error: function (xhr, textStatus, err) {
                // console.log("error " + dataest[cnt]);
                //alert("Error:" + xhr.status);

            }
        });
    }


</script>