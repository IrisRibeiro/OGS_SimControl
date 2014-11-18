<%-- 
    Document   : SearchCourses
    Created on : Oct 29, 2014, 5:18:29 PM
    Author     : Iris
--%>

<%@page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="OGS.tables.*,OGS.beans.*, java.util.*"%>
<%
	Person person = (Person) session.getAttribute("currentSessionUser");
	if (person == null) {
		response.sendRedirect("Login.jsp");
		return;
	}
	List<Course> courses = CourseManager.getCoursesForPerson(person);
%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="DefaultLayout.jsp" flush="true" />
<body>

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
					<div class="panel-heading">Search For Classes</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-example">
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
									<%
										for (Course course : courses) {
									%>
									<tr class="gradeA">
										<td>
											<div class="checkbox">
												<label> <input type="checkbox" value=""></label>
											</div>
										</td>
										<td><%=course.getIdentifier()%></td>
										<td><%=course.getName()%></td>
										<td class="center"><%=course.getCredits()%></td>
										<td><%=course.getPrerequisites()%></td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
						<p>
							<a href="ViewClass.jsp"><button type="button"
									class="btn btn-outline btn-default">View Class</button></a>
							<button type="button" class="btn btn-outline btn-default">Edit</button>
							<button type="button" class="btn btn-outline btn-default">Grade
								Center</button>
							<button type="button" class="btn btn-outline btn-default"
								onclick="checktest()">Delete</button>

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
</body>

</html>

