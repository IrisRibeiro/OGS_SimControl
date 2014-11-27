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
<%@page import=" OGS.tables.PersonManager , OGS.tables.ClassManager,  OGS.beans.Person,  OGS.beans.Class , OGS.tables.CourseManager , OGS.beans.Course , java.util.*"%>
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
</head>

</head>
<body>

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
								id="dataTables-example">
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
								class="btn btn-outline btn-default">Delete Course</button>
                                                        <button type="button" id="ModifyClassButton"
								class="btn btn-outline btn-default">Modify Course</button>                                                                
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
	<!-- /.row -->
	<!-- 	</div>
	/#page-wrapper
	</div>
	/#wrapper -->
	<script type="text/javascript">
		$(function() {
			$("#viewClassButton")
					.click(
                        function() {
                                var checked = $("#dataTables-classes").find(
                                                "td.something").find(":checked");
                                if (checked.size() != 1) {
                                        alert("One and ONLY one course should be checked...");
                                } else {
                                        var classID = checked.parents(
                                                        "td.something").find(
                                                        "input[type='hidden']").val();
                                        location.href = "ViewClass.jsp?classID="
                                                        + classID;
                                }
                        });
		});
	</script>
</body>
</html>

