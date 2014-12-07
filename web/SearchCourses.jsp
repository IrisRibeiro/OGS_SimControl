<%-- 
    Document   : SearchCourses
    Created on : Oct 29, 2014, 5:18:29 PM
    Author     : Iris
--%>
<%@page import="OGS.tables.AssignmentManager"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="DefaultLayout.jsp" flush="true"/>

<%@page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import=" OGS.tables.PersonManager , OGS.tables.ClassManager,  OGS.beans.Person,  OGS.beans.Classes , OGS.tables.CourseManager , OGS.beans.Course , java.util.*"%>
<%
	Person person = (Person) session.getAttribute("currentSessionUser");
        int AccesLevel = person.getAccessLevel();
	if (person == null) {
%>
<script type="text/javascript">
	alert("Please Login first...");
	location.href = "Login.jsp";
</script>
<%
		return;
	}
	List<Course> Course = CourseManager.getAllCourses();       
	
%>

<script type="text/javascript" src="js/backbone.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
    <jsp:include page="PageInfo.jsp" flush="true"/>
        <div class="caption">
            <p><a href="#SearchCourses" data-toggle="modal" class="btn btn-primary pull-right" role="button"><span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span></a></p>
        </div>

	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">All Courses</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Search For Courses</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover"
								id="example">
								<thead>
									<tr>
                                                                             
                                                                            <% if (AccesLevel == 4){ %>
                                                                                 <th>Select</th>
                                                                            <% } %>
                                                                                 
                                                                            <th>Number</th>
                                                                            <th>Identifier</th>
                                                                            <th>Name</th>
                                                                            <th>Credits</th>
                                                                            <th>Prerequisite</th>
                                                                            <th>WebSite</th>
									</tr>
								</thead>
								<tbody>
									<%
										for (Course _courses : Course) {
                                                                                    
                                                                                   
									%>
									<tr class="gradeA">
                                                                                <% if (AccesLevel == 4){ %>
                                                                                    <td class="something">                                                                                   												
                                                                                    <label> <input  type="checkbox" value=""></label>
                                                                                    <input type="hidden" name="CourseID" value="<%=_courses.getCourseID()%>"/>
                                                                                    </td> 
                                                                                <% } %>
                                                                                <td><%=_courses.getCourseID()%></td>										                                                                               
                                                                                <td> <%=_courses.getIdentifier()%></td>
                                                                                <td><%=_courses.getName()%></td>
										<td><%=_courses.getCredits()%></td>
                                                                                <td><%=_courses.getPrerequisites()%></td>
                                                                                <td><%=_courses.getWebsite()%></td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
						<p>
                                                     <% if (AccesLevel == 4){ %>
							<button type="button" id="DeleteClassButton"
								class="btn btn-outline btn-default">Delete </button>
                                                        <button type="button" id="ModifyClassButton"
								class="btn btn-outline btn-default">Modify </button>                                                                
                                                     <% } %>
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
	 <!-- jQuery Version 1.11.0 -->
    <script src="js/jquery-1.11.1.min.js"></script>
    
    <script src="js/dataTables.js"></script>
  
    <script src="js/jquery.dataTables.min.js"></script>   
     
    <!-- Custom Theme JavaScript -->
    <script src="js/sb-admin-2.js"></script>

    
	<script type="text/javascript">
		$(function() {
			$("#DeleteClassButton")
					.click(
                        function() {
                                var checked = $("#dataTables-example").find(
                                                "td.something").find(":checked");
                                if (checked.size() != 1) {
                                        alert("One and ONLY one course should be checked...");
                                } else {
                                        var CourseID = checked.parents(
                                                        "td.something").find(
                                                        "input[type='hidden']").val();
                                        location.href = "DeleteCourse.jsp?CourseID="
                                                        + CourseID;
                                }
                        });
                        
                        $("#ModifyClassButton")
					.click(
                        function() {
                                var checked = $("#dataTables-example").find(
                                                "td.something").find(":checked");
                                if (checked.size() != 1) {
                                        alert("One and ONLY one course should be checked...");
                                } else {
                                        var CourseID = checked.parents(
                                                        "td.something").find(
                                                        "input[type='hidden']").val();
                                        location.href = "Modifycourse.jsp?CourseID="
                                                        + CourseID;
                                }
                        });
		});
	</script>
     <script type="text/javascript">   
        $(document).ready(function() {
            $('#example').dataTable();
        } );
    </script>
</body>
</html>

