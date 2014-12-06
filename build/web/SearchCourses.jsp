<%-- 
    Document   : SearchCourses
    Created on : Oct 29, 2014, 5:18:29 PM
    Author     : Iris
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="DefaultLayout.jsp" flush="true"/>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
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

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
  <!-- DataTables CSS -->
<link href="css/plugins/dataTables.bootstrap.css" rel="stylesheet">
 <!-- MetisMenu CSS -->
<link href="css/plugins/metisMenu/metisMenu.min.css" rel="stylesheet">
    <!-- Custom CSS -->
<link href="css/sb-admin-2.css" rel="stylesheet">
     <!-- Custom Fonts -->
<link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
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
								id="dataTables-classes">
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
    
	<script type="text/javascript">
		$(function() {
			$("#DeleteClassButton")
					.click(
                        function() {
                                var checked = $("#dataTables-classes").find(
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
                                var checked = $("#dataTables-classes").find(
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
</body>
</html>

