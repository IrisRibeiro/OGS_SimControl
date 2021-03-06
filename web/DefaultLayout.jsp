<%-- 
    Document   : DefaultLayout
    Created on : Nov 15, 2014, 6:56:04 PM
    Author     : Iris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import=" OGS.beans.Person, java.util.*"%>
<%
	Person person = (Person) session.getAttribute("currentSessionUser");
	if (person == null) {
		response.sendRedirect("faces/Login.jsp");
		return;
        }
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SimControl - OGS </title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="css/plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="Dashboard.jsp"> <img src="images/Logo_Small.png" alt="logo_Small" width="60px" height="33px"> SimControl</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">             
                    <!-- /.dropdown-tasks -->

                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <%= person.getUserName()%> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">                       
                        <li class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/LogoutServelet"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a class="active" href="faces/Dashboard.jsp"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                        <li>                            
                            <ul class="nav nav-second-level">
                                <% 
                                    int acesslevel = person.getAccessLevel();
                                    
                                    if (acesslevel == 1){ // student
                                %>  
                                    <li>
                                        <a href="SearchCourses.jsp">All Courses</a> <!-- /.Modify to link to the page -->
                                    </li>
                                   <li>
                                        <a href="SearchClass.jsp">Classes I'm enrolled</a> <!-- /.Modify to link to the page -->
                                    </li>                                   
                                    <li>
                                        <a href="GradeSystem.jsp">Grade system</a> <!-- /.Modify to link to the page -->
                                    </li>
                                    <li>
                                        <a href="SearchAssignment.jsp">Search Assignment</a> <!-- /.Modify to link to the page -->
                                    </li>
                                    <li>
                                        <a href="StudentSubmission.jsp">View Submissions</a> <!-- /.Modify to link to the page -->
                                    </li>
                                    
                                <%    }else if (acesslevel == 2) { // TA %> 
                                    <li>
                                        <a href="SearchClass.jsp">Classes I'm TA</a> <!-- /.Modify to link to the page -->
                                    </li>                                    
                                    <li>
                                        <a href="SearchAssignment.jsp">Search Assignment</a> <!-- /.Modify to link to the page -->
                                    </li>
                                    <li>
                                        <a href="SearchCourses.jsp">All Courses</a> <!-- /.Modify to link to the page -->
                                    </li>
                                    <li>
                                        <a href="GradeSystem.jsp">Grade system</a> <!-- /.Modify to link to the page -->
                                    </li>
                                   
                                
                                <% }else if(acesslevel == 3) {// Professor %>
                                     <li>
                                        <a href="SearchClass.jsp">Classes I'm Teaching</a> <!-- /.Modify to link to the page -->
                                    </li>
                                    <li>
                                        <a href="CreateAssignment.jsp">Create Assignment</a>  <!-- /.Modify to link to the page -->
                                    </li>
                                    <li>
                                        <a href="SearchAssignment.jsp">Search Assignment</a> <!-- /.Modify to link to the page -->
                                    </li>
                                    <li>
                                        <a href="SearchCourses.jsp">All Courses</a> <!-- /.Modify to link to the page -->
                                    </li>                                    
                                    <li>
                                        <a href="GradeSystem.jsp">Grade system</a> <!-- /.Modify to link to the page -->
                                    </li>
                                    <li>
                                        <a href="AppointTA.jsp">Appoint TA</a> <!-- /.Modify to link to the page -->
                                    </li>
                                
                                <% }else if(acesslevel == 4) { // Manager %> <!-- / -->
                                    <li>
                                        <a href="CreateClass.jsp">Create Class</a>  <!-- /.Modify to link to the page -->
                                    </li>
                                    <li>
                                        <a href="CreateCourse.jsp">Create Course</a>  <!-- /.Modify to link to the page -->
                                    </li>
                                    
                                    <li>
                                        <a href="SearchCourses.jsp">All Courses</a> <!-- /.Modify to link to the page -->
                                    </li>
                                     <li>
                                        <a href="SearchClass.jsp">All Classes</a> <!-- /.Modify to link to the page -->
                                    </li>
                                  
                                    <li>
                                        <a href="SearchAssignment.jsp">Search Assignment</a> <!-- /.Modify to link to the page -->
                                    </li>                                    
                                    
                                    <li>
                                        <a href="GradeSystem.jsp">Grade system</a> <!-- /.Modify to link to the page -->
                                    </li>
                                <% } %>                                
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        
    </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery Version 1.11.0 -->
    <script src="js/jquery-1.11.0.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').dataTable();
    });
    </script>

</body>

</html>
