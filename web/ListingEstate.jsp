<%-- 
    Document   : ListingEstate
    Created on : May 29, 2015, 3:54:58 PM
    Author     : sony
--%>

<%@page import="rms.model.ServerListEstate"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .modal .modal-body {
                max-height: 420px;
                overflow-y: auto;
            }
        </style>
    </head>
    <body>

        <div class="table-responsive">          

            <table class="table">
                <thead>
                    <tr>
                        <th>Estatecode</th>
                        <th>Name</th>
                        <th><input type="checkbox" name="select-all" id="selectall">&nbsp;Select all</th>
                    </tr>
                </thead>
                <tbody>


                    <%         // x = request.getAttribute("theName");
                        //out.println("alert(\"" +kod+ "\")");
                        try {
                            List<ServerListEstate> clist = (List<ServerListEstate>) request.getAttribute("server");
                            for (ServerListEstate c : clist) {%>

                    <tr><td> <%=c.getEstatecode()%></td><td> <%=c.getDescription()%></td><td> <fieldset id="checkArray"> <input type="checkbox" class = "cekbox" id = "boxer" name="selector[]" value="<%=c.getEstatecode()%>"> </fieldset> </td><td><div class="itikgembo" id="response<%=c.getEstatecode()%>"></div></td></tr><!-- Darker Table Row -->



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

                </tbody>
            </table>
        </div>




    </body>
</html>
