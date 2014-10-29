<%-- 
    Document   : Dashboard
    Created on : Oct 29, 2014, 4:39:40 PM
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

    <title>SimControl - Dashboard</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="css/plugins/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	
    <link rel="stylesheet" href="css/calendar.css">


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
                                    <a href="SearchCourses.jsp">Search Class</a> <!-- /.Modify to link to the page -->
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
                    <h1 class="page-header">Dashboard</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>			
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bolt fa-fw"></i> Notifications							
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">                            
							<div class="header">
								<ul class="chat">
									<li>
										<strong class="primary-font">CSE 220 - Systems Level Programming</strong>
										<p>No classes this Tuesday</p>
									</li>
									<li>
										<strong class="primary-font">CSE 101 - Introduction to Computers</strong>
										<p>Assignment 1 is now posted</p>
									</li>
									<li>
										<strong class="primary-font">CSE 130 - Introduction to Programming in C</strong>
										<p>I have a meeting this week and need to be out of town, so I'm cancelling office hours, but the TA will be in class to explain assignment 3</p>
									</li>
								</ul>
                            </div>								
                        </div>
                        <!-- /.panel-body -->
                    </div>
					<div class="panel panel-default">
                        <div class="panel-heading">
							<i class="fa fa-bolt fa-fw"></i> Calendar
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">  
                            <div class="pull-right form-inline">
                                    <div class="btn-group">
                                            <button class="btn btn-primary" data-calendar-nav="prev"><< Prev</button>
                                            <button class="btn" data-calendar-nav="today">Today</button>
                                            <button class="btn btn-primary" data-calendar-nav="next">Next >></button>
                                    </div>
                                    <div class="btn-group">
                                            <button class="btn btn-warning" data-calendar-view="year">Year</button>
                                            <button class="btn btn-warning active" data-calendar-view="month">Month</button>
                                            <button class="btn btn-warning" data-calendar-view="week">Week</button>
                                            <button class="btn btn-warning" data-calendar-view="day">Day</button>
                                    </div>
                            </div>
			</div>		
							
                        <div class="panel-body">
                                <div class="span9">
                                        <div id="calendar"></div>
                                </div>				
                        </div>
                        
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bolt fa-fw"></i> Usefull Links
						</div>	
                            <div class="panel-body">
                                <div class="list-group">
                                        <a href="https://www.google.com/" target="_blank" class="list-group-item">Google</a>
                                        <a href="https://www.youtube.com/" target="_blank" class="list-group-item">Youtube</a>
                                        <a href="http://www.lynda.com/member.aspx" target="_blank" class="list-group-item">Lynda</a>
                                        <a href="http://www.stonybrook.edu/" target="_blank" class="list-group-item">Stony Brook</a>
                                        <a href="http://scholar.google.com/" target="_blank" class="list-group-item">Google Academic</a>
                                </div>
                            </div>
                    </div>    
                    <!-- /.panel -->                   
                </div>
                <!-- /.col-lg-8 -->
                <div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bolt fa-fw"></i> My Courses
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="list-group">
                                <a href="#" class="list-group-item">
                                    CSE 220 - Systems Level Programming 
                                </a>
                                <a href="#" class="list-group-item">
                                    CSE 101 - Introduction to Computers
                                </a>
                                <a href="#" class="list-group-item">
                                    CSE 130 - Introduction to Programming in C
                                </a>
                                <a href="#" class="list-group-item">
                                    CSE 214: Computer Science II
                                </a>
                                <a href="#" class="list-group-item">
                                    CSE 230: Intermediate Programming in C and C++
                                </a>
                            </div>
                            <!-- /.list-group -->
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    
                    <!-- /.panel -->
                    <div class="chat-panel panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bolt fa-fw"></i>
                            Tasks
                            <div class="btn-group pull-right">
                            </div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <ul class="chat">
                                <li class="left clearfix">
                                        <div class="header">
                                            <strong class="primary-font">Call mom</strong>
                                        </div>
                                        <p>
                                            Call mom to ask where my books are and if she paid the tuition for this semester.
                                        </p>
                                </li>
                                <li class="left clearfix">                                    
                                    
                                        <div class="header">                                            
                                            <strong class="primary-font">Go to walmart</strong>
                                        </div>
                                        <p>
                                           need to buy shampoo, noodles, soda, and cheetos.
                                        </p>
                                    
                                </li>
                                <li class="left clearfix">                                    
                                    
                                        <div class="header">
                                            <strong class="primary-font">Buy book</strong>                                             
                                        </div>
                                        <p>
                                           Buy book for 220 at amazon.
                                        </p>
                                   
                                </li>
					<li class="left clearfix">                                    
                                    
                                        <div class="header">
                                            <strong class="primary-font"> for the meeting</strong>                                             
                                        </div>
                                        <p>
                                           don't forget to read book 1 pg 2-12.
                                        </p>
                                   
                                </li>
                            </ul>
                        </div>
                        <!-- /.panel-body -->
                        
                        <!-- /.panel-footer -->
                    </div>
                    <!-- /.panel .chat-panel -->
                </div>
                <!-- /.col-lg-4 -->
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

    <!-- Morris Charts JavaScript -->
    <script src="js/plugins/morris/raphael.min.js"></script>
    <script src="js/plugins/morris/morris.min.js"></script>
    <script src="js/plugins/morris/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/sb-admin-2.js"></script>

    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/app.js"></script>

    <!--<script type="text/javascript">
            var disqus_shortname = 'bootstrapcalendar'; // required: replace example with your forum shortname
            (function() {
                    var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
                    dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
                    (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
            })();
    </script>
    -->
    
</body>

</html>

