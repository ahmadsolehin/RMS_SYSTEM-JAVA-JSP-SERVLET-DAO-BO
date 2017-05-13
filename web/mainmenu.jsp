<%@page import="java.util.List"%>
<%@page import="rms.model.User_Access"%>
<%@page import="rms.model.UserBean"%>
<!DOCTYPE html>


<html>
    <head>
        <style type="text/css">


        </style>
        <meta charset="UTF-8">
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <!-- Bootstrap 3.3.2 -->
        <script src="js/jquery-1.7.1.min.js"></script> 

        <script src="js/ajax.js"></script>
        <script src="js/jquery-1.11.2.min.js"></script> 

        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />

        <!-- Font Awesome Icons -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />

        <link href="dist/css/skins/skin-blue.min.css" rel="stylesheet" type="text/css" />
        <style>


            body {
                padding-right: 0 !important;
            }
            body {
                //overflow-y: scroll;
                height: 100%;
            }
            .saizbadan{
                font-size: 30px;
                font-style: italic;
            }
        </style>

    </head>
    <!--
    BODY TAG OPTIONS:
    =================
    Apply one or more of the following classes to get the 
    desired effect
    |---------------------------------------------------------|
    | SKINS         | skin-blue                               |
    |               | skin-black                              |
    |               | skin-purple                             |
    |               | skin-yellow                             |
    |               | skin-red                                |
    |               | skin-green                              |
    |---------------------------------------------------------|
    |LAYOUT OPTIONS | fixed                                   |
    |               | layout-boxed                            |
    |               | layout-top-nav                          |
    |               | sidebar-collapse                        |  
    |---------------------------------------------------------|
    
    -->
    <body class="skin-blue">

        <%          
            UserBean bean = (UserBean) session.getAttribute("currentSessionUser");
            String x = bean.getFullname(); //utk tahu status current user nie admin atau member,

        %>
        <input type="hidden" id="namauser" value="<%=x%>" />


<!--
        <script>
            $(document).ready(function () {

                var user = $('#namauser').val(); //nak tahu samaada admin atau member

                $('.neymar').empty();

                $.ajax({
                    url: "checkForNotify?id=" +<%=bean.getId()%> + "&user=" + user,
                    dataType: 'json',
                    success: function (json_data) {


                        $('#no').empty().html(json_data.length);

                        var noti = '<li class="header">You have ' + json_data.length + ' notifications</li>';
                        $('#notifyDiv').empty().html(noti);

                        for (var i = 0; i < json_data.length; i++) {

                            if (i < 10) {

                                var a = '<li><a id = "akim" href="newjsp.jsp"><div class="pull-left"><img src="dist/img/wah.jpg" class="img-circle" alt="User Image"/></div><h4>' + json_data[i].FullName + '<small><i class="fa fa-clock-o"></i> 5 mins</small></h4><p>' + json_data[i].notify_text + '</p></a></li>';

                                $('.neymar').append(a);

                            }

                        }

                        //    alert(json_data[i].notify_text);

                        //var re.turnedData = JSON.parse(response);
                        //   alert(returnedData);



                    }});


            })
        </script> -->


<!--
        <script>
            $(document).ready(function () {
                setInterval(function () {
                    $('.neymar').empty();
                    //alert("Hello"); 
                    var user = $('#namauser').val(); //nak tahu samaada admin atau member

                    $.ajax({
                        url: "checkForNotify?id=" +<%=bean.getId()%> + "&user=" + user,
                        dataType: 'json',
                        success: function (json_data) {


                            $('#no').empty().html(json_data.length);

                            var noti = '<li class="header">You have ' + json_data.length + ' notifications</li>';
                            $('#notifyDiv').empty().html(noti);

                            for (var i = 0; i < json_data.length; i++) {

                                if (i < 10) {

                                    var a = '<li><a href="#"><div class="pull-left"><img src="dist/img/wah.jpg" class="img-circle" alt="User Image"/></div><h4>' + json_data[i].FullName + '<small><i class="fa fa-clock-o"></i> 5 mins</small></h4><p>' + json_data[i].notify_text + '</p></a></li>';
                                    $('.neymar').append(a);

                                }

                            }

                            //    alert(json_data[i].notify_text);

                            //var re.turnedData = JSON.parse(response);
                            //   alert(returnedData);



                        }});
                }, 20000);

            })
        </script> -->



        <div class="wrapper">

            <!-- Main Header -->
            <header class="main-header">

                <!-- Logo -->
                <a href="" class="logo"><b>RMS</b></a>

                <!-- Header Navbar -->
                <nav class="navbar navbar-static-top" role="navigation">
                    <!-- Sidebar toggle button-->
                    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                        <span class="sr-only">Toggle navigation</span>
                    </a>
                    <!-- Navbar Right Menu -->
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            <!-- Messages: style can be found in dropdown.less-->
                            <li class="dropdown messages-menu">
                                <!-- Menu toggle button -->
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-envelope-o"></i>
                             <!--       <span class="label label-success">0</span> -->
                                </a>
                                <ul class="dropdown-menu">
<!--                                    <li class="header">You have 0 messages</li>
                                    <li>
                                         inner menu: contains the messages 
                                        <ul class="menu">
                                            <li> start message 
                                                <a href="#">
                                                    <div class="pull-left">
                                                         User Image 
                                                        <img src="dist/img/wah.jpg" class="img-circle" alt="User Image"/>
                                                    </div>
                                                     Message title and timestamp 
                                                    <h4>                            
                                                        Support Team
                                                        <small><i class="fa fa-clock-o"></i> 5 mins</small>
                                                    </h4>
                                                     The message 
                                                    <p>Why not buy a new awesome theme?</p>
                                                </a>
                                            </li> end message                       
                                        </ul> /.menu 
                                    </li>
                                    <li class="footer"><a href="#">See All Messages</a></li>
                            -->    </ul>
                            </li><!-- /.messages-menu -->









                            <!-- Notifications Menu -->
                            <li class="dropdown messages-menu">
                                <!-- Menu toggle button -->
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-bell-o"></i>
                                    <span id = "no" class="label label-warning"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <div id="notifyDiv">
                                    </div>
                                    <li>
                                        <!-- Inner Menu: contains the notifications -->
                                        <ul class="neymar menu">


                                        </ul>
                                    </li>
                                    <li class="footer"><a class = "ayam" href="newjsp.jsp">View all</a></li>
                                </ul>
                            </li>


                            <!-- Tasks Menu -->
                            <li class="dropdown tasks-menu">
                                <!-- Menu Toggle Button -->
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-flag-o"></i>
                            <!--        <span class="label label-danger">0</span> -->
                                </a>
                                <ul class="dropdown-menu">
<!--                                  <li class="header">You have 0 tasks</li>
                                    <li>
                                        <ul class="menu">
                                            <li> Task item 
                                                <a href="#">
                                                     Task title and progress text 
                                                    <h3>
                                                        Design some buttons
                                                        <small class="pull-right">20%</small>
                                                    </h3>
                                                     The progress bar 
                                                    <div class="progress xs">
                                                         Change the css width attribute to simulate progress 
                                                        <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                            <span class="sr-only">20% Complete</span>
                                                        </div>
                                                    </div>
                                                </a>
                                            </li>                    
                                        </ul>
                                    </li>
                                    <li class="footer">
                                        <a href="#">View all tasks</a>
                                    </li>  -->
                                </ul>
                            </li>
                            <!-- User Account Menu -->
                            <li class="dropdown user user-menu">
                                <!-- Menu Toggle Button -->
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <!-- The user image in the navbar-->
                                    <img src="dist/img/hoho.jpg" class="user-image" alt="User Image"/>
                                    <!-- hidden-xs hides the username on small devices so only the image appears. -->
                                    <span class="hidden-xs"> <%=bean.getFullname()%></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- The user image in the menu -->
                                    <li class="user-header">
                                        <img src="dist/img/hoho.jpg" class="img-circle" alt="User Image" />
                                        <p>
                                            <%=bean.getFullname()%> - <%=bean.getPosition()%>
                                            <small>Member since Nov. 2012</small>
                                        </p>
                                    </li>
                                    <!-- Menu Body -->
                                    <li class="user-body">
                                        <div class="col-xs-4 text-center">
                                            <a href="#">Followers</a>
                                        </div>
                                        <div class="col-xs-4 text-center">
                                            <a href="#">Sales</a>
                                        </div>
                                        <div class="col-xs-4 text-center">
                                            <a href="#">Friends</a>
                                        </div>
                                    </li>
                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        <div class="pull-left">
                                            <a  id = "" class="ayam btn btn-default btn-flat" href="myProfile.jsp">Profile</a>
                                        </div>
                                        <div class="pull-right">
                                            <a href="logout" class="btn btn-default btn-flat">Sign out</a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="main-sidebar">

                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">

                    <!-- Sidebar user panel (optional) -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="dist/img/hoho.jpg" class="img-circle" alt="User Image" />
                        </div>
                        <div class="pull-left info">
                            <p><%=bean.getFullname()%></p>
                            <!-- Status -->
                            <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                        </div>
                    </div>

                    <!-- search form (Optional) -->
                    <form action="#" method="get" class="sidebar-form">
                        <div class="input-group">
                            <input type="text" name="q" class="form-control" placeholder="Search..."/>
                            <span class="input-group-btn">
                                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </form>
                    <!-- /.search form -->

                    <!-- Sidebar Menu -->
                    <ul class="sidebar-menu">
                        <li class="header">MAIN NAVIGATION</li>


                        <li class="active treeview">

                            <a href="#">
                                <i class="fa fa-home"></i>
                                <span>Home</span>
                                <!-- <span class="label label-primary pull-right">4</span> -->
                            </a>

                            <a href="#">
                                <i class="fa fa-dashboard"></i> <span>Configuration</span> <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li class="active"><a class = "ayam" href="datatabletest.jsp"><i class="fa fa-circle-o"></i> Contractor</a></li>
                                <li class="active"><a class = "ayam" href=""><i class="fa fa-circle-o"></i> Supplier</a></li>
                            </ul>
                        </li>

                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-table"></i>
                                <span>Estate</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a class = "ayam" href="newjsp.jsp"><i class="fa fa-circle-o"></i> Morris</a></li>
                                <li><a href="pages/charts/flot.html"><i class="fa fa-circle-o"></i> Flot</a></li>
                                <li><a href="pages/charts/inline.html"><i class="fa fa-circle-o"></i> Inline charts</a></li>
                            </ul>

                        </li>


                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-pie-chart"></i>
                                <span>Financial</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-laptop"></i>
                                <span>Management</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="pages/UI/general.html"><i class="fa fa-circle-o"></i> General</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-edit"></i> <span>Administration</span>
                                <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li><a class ="ayam" href=""><i class="fa fa-circle-o"></i> User Accessibility</a></li>
                                <li><a class ="ayam" href="datatableAlluser.jsp"><i class="fa fa-circle-o"></i> All User</a></li>
                            </ul>
                        </li>


                        <li>
                            <a class="ayam" href="mailbox.jsp">
                                <i class="fa fa-envelope"></i> <span>Mailbox</span>
                             <!--   <small class="label pull-right bg-yellow">0</small> -->
                            </a>
                        </li>



                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->

                <div id="hoho">

                </div>
                <div id = "haha">
                    
                    <p class="logo saizbadan"><b>WELCOME TO RMS</b></p>
                </div>


                <!-- Main content -->
                <section class="content">


                    <!-- Your Page Content Here -->

                </section><!-- /.content -->
            </div><!-- /.content-wrapper -->

            <!-- Main Footer -->
            <footer class="main-footer">
                <!-- To the right -->
                <div class="pull-right hidden-xs">
                    <!-- Anything you want -->
                </div>
                <!-- Default to the left --> 
                <strong>Copyright &copy; 2015 <a href="#">LKPP CORPORATION SDN BHD</a>.</strong> All rights reserved.
            </footer>

        </div><!-- ./wrapper -->

        <!-- REQUIRED JS SCRIPTS -->

        <!-- jQuery 2.1.3 -->
        <script src="plugins/jQuery/jQuery-2.1.3.min.js"></script>
        <!-- Bootstrap 3.3.2 JS -->
        <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- AdminLTE App -->
        <script src="dist/js/app.min.js" type="text/javascript"></script>

        <!-- Optionally, you can add Slimscroll and FastClick plugins. 
              Both of these plugins are recommended to enhance the 
              user experience -->
    </body>
</html>