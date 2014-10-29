<%-- 
    Document   : RequestedClasses
    Created on : Oct 29, 2014, 5:07:18 PM
    Author     : Iris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SimControl - Courses - Requested </title>

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
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope fa-fw"></i> Emails <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <a href="#">
                                <div>
                                    <strong>CSE 220 - Systems Level Programming </strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Introduces systems-level programming concepts using the C language and assembly language ...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>CSE 101 - Introduction to Computers</strong>
                                    <span class="pull-right text-muted">
                                        <em>09/29/2014</em>
                                    </span>
                                </div>
                                <div>Introduces central ideas of computing and computer science...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>CSE 130 - Introduction to Programming in C</strong>
                                    <span class="pull-right text-muted">
                                        <em>09/28/2014</em>
                                    </span>
                                </div>
                                <div>Introduces programming concepts using the C language...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>Read All Emails</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-messages -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-tasks fa-fw"></i> Assignments <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-tasks">
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Assignment 1</strong>
                                        <span class="pull-right text-muted">Due: 10/08/2014</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                            <span class="sr-only">20%</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Assignment 2</strong>
                                        <span class="pull-right text-muted">Due: 10/05/2014 </span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                            <span class="sr-only">40% </span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Assignment 3</strong>
                                        <span class="pull-right text-muted">Due:  10/04/2014  </span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                            <span class="sr-only">60% </span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Assignment 4</strong>
                                        <span class="pull-right text-muted">Due: Tomorrow</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width: 90%">
                                            <span class="sr-only">90% </span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Assignments</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-tasks -->

                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> UserName <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
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
                            <a class="active" href="Dashboard.jsp"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Manager Panel<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="CreateClass.jsp">Create Class</a>  <!-- /.Modify to link to the page -->
                                </li>
                                <li>
                                    <a href="serarchCourses.jsp">Search Class</a> <!-- /.Modify to link to the page -->
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="courses.jsp"><i class="fa fa-files-o fa-fw"></i> Courses <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="PreviousClasses.jsp">Previous Classes</a>  <!-- /.Modify to link to the page -->
                                </li>
                                <li>
                                    <a href="RequestedClasses.jsp">Requested Classes</a> <!-- /.Modify to link to the page -->
                                </li>
				<li>
                                    <a href="enrolledClasses.jsp">Enrolled Classes</a> <!-- /.Modify to link to the page -->
                                </li>
				<li>
                                    <a href="courses.jsp">All Classes</a> <!-- /.Modify to link to the page -->
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Requested Classes</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Search For Classes
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>                                            
                                            <th>Identifier</th>
                                            <th>Name</th>
                                            <th>Credits</th>
                                            <th>Prerequisite</th>
											<th>Instructor Name</th>											
											<th>Date of Request</th>
                                        </tr>
                                    </thead>
                                    <tbody>
										<tr class="gradeA">                                            
                                            <td>CSE 219</td>
                                            <td>Computer Science III</td>
                                            <td class="center">3</td>
                                            <td> C or higher in CSE 214 and CSE major or ECE major or permission of instructor</td>
											<td> James Smith</td>
											<td >09/27/2014</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>CSE 220</td>
                                            <td> Systems-Level Programming</td>
                                            <td class="center">3</td>
                                            <td> CSE 160 or 114 and CSE major or permission of instructor.</td>
											<td>Mary Clark</td>
											<td >09/27/2014</td>
                                        </tr>
										<tr class="gradeA">                                            
                                            <td>CSE 230</td>
                                            <td> Intermediate Programming in C and C++</td>
                                            <td class="center">3</td>
                                            <td>CSE 130 or CSE 220 or ESE 124 or ESG 111 or BME 120 or MEC 102.</td>
											<td>John Johnson</td>
											<td >09/27/2014</td>
                                        </tr>
										<tr class="gradeA">                                           
                                            <td>CSE 260</td>
                                            <td> Computer Science B: Honors</td>
                                            <td class="center">4</td>
                                            <td>CSE 160.</td>
											<td>Patricia Rodriguez</td>
											<td >09/27/2014</td>
                                        </tr>
										<tr class="gradeA">                                            
                                            <td>CSE 300</td>
                                            <td> Technical Communications</td>
                                            <td class="center">3</td>
                                            <td>WRT 102, CSE or ISE major, U3 or U4 standing.</td>
											<td>Robert Williams</td>
											<td >09/27/2014</td>
                                        </tr>
										<tr class="gradeA">                                           
                                            <td>CSE 301</td>
                                            <td>  History of Computing</td>
                                            <td class="center">3</td>
                                            <td>U2 standing or higher.</td>
											<td>Linda Lewis</td>
											<td >09/27/2014</td>
                                        </tr>
										<tr class="gradeA">                                            
                                            <td>CSE 303</td>
                                            <td> Introduction to the Theory of Computation</td>
                                            <td class="center">3</td>
                                            <td>CSE 214 and CSE 213 or 215 and CSE major or permission of instructor.</td>
											<td>Michael Brown</td>
											<td >09/27/2014</td>
                                        </tr>
										<tr class="gradeA">
                                            
                                            <td>CSE 304</td>
                                            <td>Compiler Design</td>
                                            <td class="center">3</td>
                                            <td>CSE 219 or CSE 260; CSE 220.</td>
											<td>Barbara Lee</td>
											<td >09/27/2014</td>
                                        </tr>
										<tr class="gradeA">
                                            
                                            <td>CSE 305</td>
                                            <td>Principles of Database Systems</td>
                                            <td class="center">3</td>
                                            <td>CSE 219 or CSE 260; CSE 220; CSE major or permission of instructor.</td>
											<td>William Davis</td>
											<td >09/27/2014</td>
                                        </tr>
										<tr class="gradeA">                                            
                                            <td>CSE 306</td>
                                            <td>Operating Systems</td>
                                            <td class="center">3</td>
                                            <td> CSE 219 or CSE 260; CSE 220 or ESE 380 and CSE Major or ECE major or permission of instructor.</td>
											<td>Elizabeth Walker</td>
											<td >09/27/2014</td>
                                        </tr>
										<tr class="gradeA">
                                            
                                            <td>CSE 307</td>
                                            <td>Principles of Programming Languages</td>
                                            <td class="center">3</td>
                                            <td> CSE 219 or CSE 260; CSE 220; CSE major or permission of instructor</td>
											<td>Richard Moore</td>
											<td >09/27/2014</td>
                                        </tr>																	
                                    </tbody>
                                </table>
                            </div>
							<p>								
							</p>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
                <!-- /.col-lg-6 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery Version 1.11.0 -->
    <script src="js/jquery-1.11.0.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="js/plugins/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference 
    <script>
    $(document).ready(function() {
        $('#dataTables-example').dataTable();
    });
    </script>
-->
</body>

</html>


