<%-- 
    Document   : Dashboard
    Created on : Oct 29, 2014, 4:39:40 PM
    Author     : Iris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import=" OGS.beans.Person, java.util.*"%>
<%
	Person person = (Person) session.getAttribute("currentSessionUser");
	if (person == null) {
		response.sendRedirect("Login.jsp");
		return;
        }
%>

<!DOCTYPE html>
<html lang="en">
    <jsp:include page="DefaultLayout.jsp" flush="true"/>
    <body>
        <jsp:include page="PageInfo.jsp" flush="true"/>
        <div class="caption">
            <p><a href="#Dashboard" data-toggle="modal" class="btn btn-primary pull-right" role="button"><span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span></a></p>
        </div>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header"> Welcome , <%= person.getUserName()%> </h1>
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
</body>

</html>

