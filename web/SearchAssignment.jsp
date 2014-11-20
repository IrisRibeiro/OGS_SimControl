<!DOCTYPE html>
<html lang="en">

<head>
<<<<<<< Updated upstream
    <jsp:include page="DefaultLayout.jsp" flush="true"/>
    <body>
=======

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SimControl - Courses </title>

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

<body >

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
                        <li><a href="Login.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
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
                                    <a href="SearchCourses.jsp">Search Class</a> <!-- /.Modify to link to the page -->
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="courses.jsp"><i class="fa fa-files-o fa-fw"></i> Courses <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="PreviousClasses.jsp">Previous Courses</a>  <!-- /.Modify to link to the page -->
                                </li>
                                <li>
                                    <a href="RequestedClasses.jsp">Requested Classes</a> <!-- /.Modify to link to the page -->
                                </li>
                                 <li>
                                    <a href="enrolledClasses.jsp">Enrolled Classes</a> <!-- /.Modify to link to the page -->
                                </li>
                                <li>
                                    <a href="courses.jsp">All Courses</a> <!-- /.Modify to link to the page -->
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

>>>>>>> Stashed changes
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Courses</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Search For Courses
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example" >
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>DueDate</th>
                                                                                    
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="gradeA" >
                                            
                                            <td>Assignment 1</td>
                                            <td>11/12/14</td>
                                            
                                        </tr>
                                        <tr class="gradeA">
                                            
                                            <td>Assignment 2</td>
                                            <td>11/12/14</td>                                        
                                        </tr>
                                        <tr class="gradeA">
                                            
                                           <td>Assignment 3</td>
                                            <td>11/12/14</td>
                                        </tr>
                                        <tr class="gradeA">
                                            
                                           <td>Assignment 4</td>
                                            <td>11/12/14</td>
                                        </tr>
                                        <tr class="gradeA">
                                            
                                            <td>Assignment 5</td>
                                            <td>11/12/14</td>
                                        </tr>
                                        <tr class="gradeA">
                                            <td>Assignment 6</td>
                                            <td>11/12/14</td>
                                        </tr>
                                        <tr class="gradeA">
                                            <td>Assignment 7</td>
                                            <td>11/12/14</td>
                                        </tr>
                                        <tr class="gradeA">
                                            
                                            <td>Assignment 8</td>
                                            <td>11/12/14</td>
                                        </tr>
                                        <tr class="gradeA">
                                           
                                            <td>Assignment 9</td>
                                            <td>11/12/14</td>
                                        </tr>
                                        <tr class="gradeA">
                                            
                                            <td>Assignment 10</td>
                                            <td>11/12/14</td>
                                        </tr>
                                        <tr class="gradeA">
                                           
                                           <td>Assignment 11</td>
                                            <td>11/12/14</td>
                                        </tr>
                                        <tr class="gradeA">
                                           
                                           <td>Assignment 12</td>
                                            <td>11/12/14</td>
                                        </tr>
                                        
                                                                             
                                    </tbody>
                                </table>
                            </div>
                            <p>
                                <a href="ViewClass.jsp"><button type="button" class="btn btn-outline btn-default" >View Class</button></a>
                                <button type="button" class="btn btn-outline btn-default">Edit</button>
                                <button type="button" class="btn btn-outline btn-default">Grade Center</button>
                                <button type="button" class="btn btn-outline btn-default" onclick="checktest()">Delete</button>
                                
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
    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').dataTable();
    });
    </script>   
    
    <script>
        function checktest(){
            var checkboxes = document.getElementsByTagName("input");
            var i = 0;
            for (i = 0; i < checkboxes.length; i++) {               
                if (checkboxes[i].checked ){
                    document.getElementById("dataTables-example").deleteRow(i);
                }
            }
            
        }
    </script>   

</body>

</html>