<%-- 
    Document   : SearchCourses
    Created on : Oct 29, 2014, 5:18:29 PM
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
                    <h1 class="page-header">Courses</h1>
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
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example" >
                                    <thead>
                                        <tr>
                                            <th>Select</th>
                                            <th>Identifier</th>
                                            <th>Name</th>
                                            <th>Credits</th>
                                            <th>Prerequisite</th>											
                                        </tr>
                                    </thead>
                                    <tbody>
										<tr class="gradeA" >
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="" >
													</label>
												</div>
											</td>
                                            <td>CSE 219</td>
                                            <td>Computer Science III</td>
                                            <td class="center">3</td>
                                            <td> C or higher in CSE 214 and CSE major or ECE major or permission of instructor</td>
											
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 220</td>
                                            <td> Systems-Level Programming</td>
                                            <td class="center">3</td>
                                            <td> CSE 160 or 114 and CSE major or permission of instructor.</td>											
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 230</td>
                                            <td> Intermediate Programming in C and C++</td>
                                            <td class="center">3</td>
                                            <td>CSE 130 or CSE 220 or ESE 124 or ESG 111 or BME 120 or MEC 102.</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 260</td>
                                            <td> Computer Science B: Honors</td>
                                            <td class="center">4</td>
                                            <td>CSE 160.</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 300</td>
                                            <td> Technical Communications</td>
                                            <td class="center">3</td>
                                            <td>WRT 102, CSE or ISE major, U3 or U4 standing.</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 301</td>
                                            <td>  History of Computing</td>
                                            <td class="center">3</td>
                                            <td>U2 standing or higher.</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 303</td>
                                            <td> Introduction to the Theory of Computation</td>
                                            <td class="center">3</td>
                                            <td>CSE 214 and CSE 213 or 215 and CSE major or permission of instructor.</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 304</td>
                                            <td>Compiler Design</td>
                                            <td class="center">3</td>
                                            <td>CSE 219 or CSE 260; CSE 220.</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 305</td>
                                            <td>Principles of Database Systems</td>
                                            <td class="center">3</td>
                                            <td>CSE 219 or CSE 260; CSE 220; CSE major or permission of instructor.</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 306</td>
                                            <td>Operating Systems</td>
                                            <td class="center">3</td>
                                            <td> CSE 219 or CSE 260; CSE 220 or ESE 380 and CSE Major or ECE major or permission of instructor.</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 307</td>
                                            <td>Principles of Programming Languages</td>
                                            <td class="center">3</td>
                                            <td> CSE 219 or CSE 260; CSE 220; CSE major or permission of instructor</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 308</td>
                                            <td>Software Engineering</td>
                                            <td class="center">3</td>
                                            <td> CSE 219 or CSE 260 and CSE major or permission of instructor.</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 310</td>
                                            <td>Computer Networks</td>
                                            <td class="center">3</td>
                                            <td>CSE 214 or 260; CSE 220 or ISE 218; CSE major, ISE major or permission of instructor..</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 311</td>
                                            <td>Systems Administration</td>
                                            <td class="center">3</td>
                                            <td>CSE 214 or CSE 230 or CSE 260 or ISE 208.</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 312</td>
                                            <td>Legal, Social, and Ethical Issues in Information Systems</td>
                                            <td class="center">3</td>
                                            <td>U3 or U4 standing, one D.E.C. E or SNW course.</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 320</td>
                                            <td> Computer Organization and Architecture</td>
                                            <td class="center">3</td>
                                            <td>CSE 220 and CSE major or permission of instructor</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 323</td>
                                            <td> Human-Computer Interaction</td>
                                            <td class="center">3</td>
                                            <td>CSE 214 or CSE 230 or CSE 260 or ISE 208</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 325</td>
                                            <td>Computers and Sculpture</td>
                                            <td class="center">3</td>
                                            <td>CSE 110 or permission of instructor</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 327</td>
                                            <td>Fundamentals of Computer Graphics</td>
                                            <td class="center">3</td>
                                            <td> CSE 219 or CSE 260; CSE 220; permission of instructor</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 332</td>
                                            <td> Introduction to Visualization</td>
                                            <td class="center">3</td>
                                            <td> CSE 219 or CSE 260; MAT 211 or AMS 210</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 333</td>
                                            <td> User Interface Development</td>
                                            <td class="center">3</td>
                                            <td> CSE 219 or CSE 260</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 334</td>
                                            <td>  Introduction to Multimedia Systems</td>
                                            <td class="center">3</td>
                                            <td> U2, U3 or U4 standing</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 336</td>
                                            <td> Internet Programming</td>
                                            <td class="center">3</td>
                                            <td>CSE 219 or CSE 260</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 337</td>
                                            <td>Scripting Languages</td>
                                            <td class="center">3</td>
                                            <td>CSE 114 or ISE 208; CSE or ISE major; U3 or U4 standing</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 346</td>
                                            <td>Computer Communications</td>
                                            <td class="center">3</td>
                                            <td>AMS 310 or 311</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 350</td>
                                            <td>Theory of Computation: Honors</td>
                                            <td class="center">4</td>
                                            <td>CSE 150; AMS 210 or MAT 211; CSE Honors Program or Honors College or WISE or permission of instructor</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 352</td>
                                            <td> Artificial Intelligence</td>
                                            <td class="center">3</td>
                                            <td>CSE 219 or CSE 260</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 353</td>
                                            <td> Machine Learning</td>
                                            <td class="center">3</td>
                                            <td>CSE 219 or CSE 260 or permission of instructor</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 355</td>
                                            <td> Computational Geometry</td>
                                            <td class="center">3</td>
                                            <td> AMS 301; programming knowledge of C or C++ or Java</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 364</td>
                                            <td> Advanced Multimedia Techniques</td>
                                            <td class="center">3</td>
                                            <td>  CSE/ISE 334 and permission of the instructor</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 366</td>
                                            <td> Introduction to Virtual Reality</td>
                                            <td class="center">3</td>
                                            <td>CSE 328, CSE/ISE 332, 333</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 370</td>
                                            <td> Wireless and Mobile Networking</td>
                                            <td class="center">3</td>
                                            <td>CSE 310 or 346</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 371</td>
                                            <td> Logic</td>
                                            <td class="center">3</td>
                                            <td>CSE 150 or CSE 215 or MAT 200</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 373</td>
                                            <td>Analysis of Algorithms</td>
                                            <td class="center">3</td>
                                            <td>MAT 211 or AMS 210; CSE 214 or CSE 260</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 376</td>
                                            <td>Advanced Systems Programming in UNIX/C</td>
                                            <td class="center">3</td>
                                            <td>CSE 219 or 260; CSE 220 or 230 or ESE 224</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 377</td>
                                            <td>Introduction to Medical Imaging</td>
                                            <td class="center">3</td>
                                            <td>AMS 161 or MAT 127 or 132 or 142; AMS 210 or MAT 211</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 378</td>
                                            <td>Introduction to Robotics</td>
                                            <td class="center">3</td>
                                            <td>AMS 161 or MAT 127 or 132 or 142; AMS 210 or MAT 211 or MEC 262</td>
                                        </tr> 
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 380</td>
                                            <td>Computer Game Programming</td>
                                            <td class="center">3</td>
                                            <td>CSE 214 or CSE 230 or CSE 260</td>
                                        </tr> 
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 381</td>
                                            <td> Advanced Game Programming</td>
                                            <td class="center">3</td>
                                            <td>CSE 328 or CSE 380</td>
                                        </tr> 
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 390</td>
                                            <td> Special Topics in Computer Science</td>
                                            <td class="center">3</td>
                                            <td>CSE Major</td>
                                        </tr> 										
                                    </tbody>
                                </table>
                            </div>
							<p>
								<a href="viewClass.jsp"><button type="button" class="btn btn-outline btn-default" >View Class</button></a>
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
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery Version 1.11.0 -->
    <script src="js/jquery-1.11.0.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="trap.min.js"></script>

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
    -->
</body>

</html>

