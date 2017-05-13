<%@page import="rms.model.ServerListEstate"%>
<%@page import="java.util.List"%>

<head>   
    
    
    <link href="css/static.min.css" rel="stylesheet"/>
    <link href="css/demo.css" rel="stylesheet"/>
    
    
     <link rel="stylesheet" type="text/css" href="css/cssForDialogBox/messi.min.css">
     <link rel="stylesheet" type="text/css" href="css/cssForDialogBox/messi.css">
       
     <script src="js/jquery-1.11.2.min.js"></script>
     <script src="js/jsForDialogBox/messi.js"> </script>
     <script src="js/jsForDialogBox/messi.min.js"> </script>
     
     
     
<script src="js/static.min.js"></script>
<script src="js/jquery.progresstimer.js"></script>


<style type="text/css">
    
      
#kotakhati {

width: 1100px;
text-align: left;
//background: red;
webkit-box-shadow: 0px 0px 5px rgba(0,0,0,0.1);
-moz-box-shadow: 0px 0px 5px rgba(0,0,0,0.1);
box-shadow: 0px 0px 5px rgba(0,0,0,0.1);
padding: 50px 80px 20px 50px;

}
    
    #submit{
        margin-top: 30px;
        margin-left: 20px;
    }
    
     #btnback{
        margin-top: 30px;
        margin-left: 360px;
    }

/*
Table Style - This is what you want
------------------------------------------------------------------ */
table a:link {
	color: #666;
	font-weight: bold;
	text-decoration:none;
}
table a:visited {
	color: #999999;
	font-weight:bold;
	text-decoration:none;
}
table a:active,
table a:hover {
	color: #bd5a35;
	text-decoration:underline;
}
table{
	font-family:Arial, Helvetica, sans-serif;
	color:#666;
	font-size:12px;
	text-shadow: 1px 1px 0px #fff;
	background:#eaebec;

        margin-left: 35%;
	border:#ccc 1px solid;

	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;

	-moz-box-shadow: 0 1px 2px #d1d1d1;
	-webkit-box-shadow: 0 1px 2px #d1d1d1;
	box-shadow: 0 1px 2px #d1d1d1;
}
table th {
	padding:21px 25px 22px 25px;
	border-top:1px solid #fafafa;
	border-bottom:1px solid #e0e0e0;

	background: #ededed;
	background: -webkit-gradient(linear, left top, left bottom, from(#ededed), to(#ebebeb));
	background: -moz-linear-gradient(top,  #ededed,  #ebebeb);
}
table th:first-child{
	text-align: left;
	padding-left:20px;
}
table tr:first-child th:first-child{
	-moz-border-radius-topleft:3px;
	-webkit-border-top-left-radius:3px;
	border-top-left-radius:3px;
}
table tr:first-child th:last-child{
	-moz-border-radius-topright:3px;
	-webkit-border-top-right-radius:3px;
	border-top-right-radius:3px;
}
table tr{
	text-align: center;
	padding-left:20px;
}
table tr td:first-child{
	text-align: left;
	padding-left:20px;
	border-left: 0;
}
table tr td {
	padding:18px;
	border-top: 1px solid #ffffff;
	border-bottom:1px solid #e0e0e0;
	border-left: 1px solid #e0e0e0;
	
	background: #fafafa;
	background: -webkit-gradient(linear, left top, left bottom, from(#fbfbfb), to(#fafafa));
	background: -moz-linear-gradient(top,  #fbfbfb,  #fafafa);
}
table tr.even td{
	background: #f6f6f6;
	background: -webkit-gradient(linear, left top, left bottom, from(#f8f8f8), to(#f6f6f6));
	background: -moz-linear-gradient(top,  #f8f8f8,  #f6f6f6);
}
table tr:last-child td{
	border-bottom:0;
}
table tr:last-child td:first-child{
	-moz-border-radius-bottomleft:3px;
	-webkit-border-bottom-left-radius:3px;
	border-bottom-left-radius:3px;
}
table tr:last-child td:last-child{
	-moz-border-radius-bottomright:3px;
	-webkit-border-bottom-right-radius:3px;
	border-bottom-right-radius:3px;
}
table tr:hover td{
	background: #f2f2f2;
	background: -webkit-gradient(linear, left top, left bottom, from(#f2f2f2), to(#f0f0f0));
	background: -moz-linear-gradient(top,  #f2f2f2,  #f0f0f0);	
}

</style>

</head>

<body>

            <div id="kotakhati">

<table cellspacing='0'> <!-- cellspacing='0' is important, must stay -->
    <tr><th>Estate code</th><th>Name</th><th>Status</th><th><input type="checkbox" name="select-all" id="selectall" />&nbsp;Select all</th></tr><!-- Table Header -->

        <%
           String kod = request.getParameter("contractorcode");
         // x = request.getAttribute("theName");
            //out.println("alert(\"" +kod+ "\")");
       try{
            List<ServerListEstate> clist=(List<ServerListEstate>)request.getAttribute("clist");
              for(ServerListEstate c:clist)
               { %>
               
               <tr class='even'><td> <%=c.getEstatecode() %></td><td> <%=c.getDescription() %></td><td><%=c.getStatus() %></td><td>  <input type="checkbox" class = "cekbox" id = "boxer" name="selector[]" value=" <%=c.getEstatecode() %>"></td></tr><!-- Darker Table Row -->

       <%  
               }
            }catch(Exception ex){
                out.println(ex);
            }
            
            %>
            
</table>
            
            
            
                          
            <div id = "haha">         
         <div class="loading-progress"></div>

            </div>
                        
                           
                           

  <div class="form-group">        
        <button type="button" id="btnback" class="btn btn-default" >Back</button>
        <button type="button" id="submit" class="btn btn-default" >Submit</button>


    </div>
            
            

            
            
            
            
            
    <script>
        
        
        $(document).ready(function() {
    $('#selectall').click(function(event) {  //on click 
        if(this.checked) { // check select status
            $('.cekbox').each(function() { //loop through each checkbox
                this.checked = true;  //select all checkboxes with class "checkbox1"               
            });
        }else{
            $('.cekbox').each(function() { //loop through each checkbox               
                this.checked = false; //deselect all checkboxes with class "checkbox1"                       
            });         
        }
    });
    
});

    //button disable bile chekbox x diselek
$(document).ready(function() { 
   $('#submit').attr("disabled",true);
   
   $('#selectall').change(function() {
      $('#submit').attr('disabled', false);
   }); 
   
   $('#boxer').change(function() {
      $('#submit').attr('disabled', false);
   }); 
});



        
        $(document).ready(function(){
            
          <%
           String kodak = request.getParameter("contractorcode");
           %>
       
        
        
        
    $('#submit').click(function(){
      
       new Messi('Are you sure to send ? ', 
                                        {
                                            title: 'Confirmation', 
                                            buttons: [{id: 0, 
                                                    label: 'Yes', 
                                                    val: 'Y'
                                                }, 
                                                { id: 1, 
                                                    label: 'No', 
                                                    val: 'N'}],
                                            callback: function(val) { 
                                                
                                                if(val == 'Y'){
                                                    var val = [];
                                                    $(':checkbox:checked').each(function(i){
                                                        val[i] = $(this).val();
                                                    });
                                                    var est = 'estate=';
                                                    var x;
                                                    for( x = 0; x < val.length; x++){
                                                        if( x == val.length-1){
                                                            est+=val[x];
                                                        //    alert(est);
                                                        }//tutup if else
                                                     else{
                                                           est+=val[x]+'&estate=';                       
                                                         }
                                                        }
                                                   //tututp for loop
                        
                       // alert(est);
                 
                    
                    var progress = $(".loading-progress").progressTimer({
                       // timeLimit: 20,
                        onFinish: function () {
                            alert("Data is successfully send..");
                        }
                    });
                    
                    $.ajax({
                        url:"NewServlet?"+est+"&code="+<% out.println(kodak); %>,
                        type : "POST", 
                        async:true,
                        success: function(result){
                                $('.messi').remove();
                                $('#haha').hide().html(result).fadeIn('slow');  
                            }                     
            }).error(function(){
                progress.progressTimer('error', {
                    errorText:'ERROR!',
                    onFinish:function(){
                        alert('There was an error processing your information!');
                    }
                });
            }).done(function(){
                progress.progressTimer('complete');
            });
      
                                      }else{
                                              $('.messi').remove();
                                      }
                                            }//tutup callback function
                                        }); 
       
        })
    })
    </script>
    
    
    <script>
        
        $(document).ready(function(){
            
        
    $('#btnback').click(function(){
      
       new Messi('Back to previous page ? ', 
                                        {
                                            title: 'Confirmation', 
                                            buttons: [{id: 0, 
                                                    label: 'Yes', 
                                                    val: 'Y'
                                                }, 
                                                { id: 1, 
                                                    label: 'No', 
                                                    val: 'N'}],
                                            callback: function(val) { 
                                                
                                                if(val == 'Y'){
                                                    
                                                    
                                      $.ajax({url: "datatabletest.jsp", 
                                          success: function(result){                          
                                              $('.messi').remove();
                                              $('#haha').hide().html(result).fadeIn('slow');
                                         }});
                                      }else{
                                              $('.messi').remove();
                                      }
                                            }//tutup callback function
                                        }); 
       
        })
    })
    </script>
    
            </div>
                           
                           
                           
                           
                           
                           
                           
                           
<script>
    </script>
</body>
</html>
