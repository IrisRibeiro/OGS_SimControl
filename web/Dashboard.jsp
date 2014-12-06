<%-- 
    Document   : Dashboard
    Created on : Oct 29, 2014, 4:39:40 PM
    Author     : Iris
--%>

<%@page import="OGS.beans.Course"%>
<%@page import="OGS.tables.CourseManager"%>
<%@page import="OGS.tables.ClassManager"%>
<%@page import="OGS.beans.Classes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import=" OGS.beans.Person, java.util.*"%>
<%
	Person person = (Person) session.getAttribute("currentSessionUser");
        int AccesLevel = person.getAccessLevel();
	if (person == null) {
		response.sendRedirect("Login.jsp");
		return;
        }
        
        List<Classes> Classes = ClassManager.getClassesForPerson(person.getAccessLevel(), person.getID());
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
                            <i class="fa fa-bolt fa-fw"></i> Courses Website							
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">                            
                            <div class="header">
                                <ul class="chat">
                                    <%
                                        for (Classes _class : Classes) { 
                                        Course Courses = CourseManager.getRow(_class.getCourseID());
                                    %>
                                    <li>
                                        <strong class="primary-font"><%=Courses.getIdentifier()%></strong>
                                        <a> <%=Courses.getWebsite()%></a>
                                    </li>
                                   <% } %>
                                </ul>
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
                     <% if (AccesLevel != 4 ) { %>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           <% if (AccesLevel == 1) { %>
                            <i class="fa fa-bolt fa-fw"></i>Classes I'm Taking
                            <% } else if (AccesLevel == 2) { %>
                                <i class="fa fa-bolt fa-fw"></i> Classes I'm teaching
                            <%  } else if (AccesLevel == 3) { %>
                                <i class="fa fa-bolt fa-fw"></i> Classes I'm TA
                            <% } %>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="list-group">
                                 <%
                                        List<Classes> Classes2 = ClassManager.getClassesForPerson(person.getAccessLevel(), person.getID());
                                        for (Classes _class : Classes2) { 
                                        Course Courses = CourseManager.getRow(_class.getCourseID());
                                    %>
                                <p href="#" class="list-group-item">
                                    <%=Courses.getIdentifier() + "- " + Courses.getName()%>
                                </p> 
                                 <% } %>
                            </div>
                            <!-- /.list-group -->
                            
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <%} %>
                   
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

