<%-- 
    Document   : SearchCourses
    Created on : Oct 29, 2014, 5:18:29 PM
    Author     : Eric
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="DefaultLayout.jsp" flush="true"/>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<%@page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import=" OGS.tables.PersonManager , OGS.tables.CourseManager, OGS.beans.Course, OGS.tables.ClassManager, OGS.beans.Person,  OGS.beans.Class , OGS.beans.Assignment , OGS.tables.SubmissionManager , OGS.tables.AssignmentManager, OGS.beans.Submission , java.util.*"%>
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
	List<Submission> submission = SubmissionManager.getAllSubmissions(person.getID());       
	Class classBean = new Class();
        Assignment assignmentBean = new Assignment();
        Course courseBean = new Course();
%>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    
</head>
<body>

	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Grade System</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Grade System</div>
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
                                                                                 
                                                                            <th>CourseID</th>
                                                                            <th>Identifier</th>
                                                                            <th>Class</th>
                                                                            <th>Assignment</th>
                                                                            <th>Grade</th>
                                                                            <th>Comments</th>
									</tr>
								</thead>
								<tbody>
									<%
										for (Submission subs : submission) {
                                                                                   assignmentBean = AssignmentManager.getRow(subs.getAssignmentID());
                                                                                   classBean = ClassManager.getRowbyID(assignmentBean.getClassID());
                                                                                   courseBean = CourseManager.getRow(classBean.getCourseID());
									%>
									<tr class="gradeA">
                                                                                <% if (AccesLevel == 4){ %>
                                                                                    <td class="something">                                                                                   												
                                                                                    <label> <input  type="checkbox" value=""></label>
                                                                                    <input type="hidden" name="CourseID" value="<%=courseBean.getCourseID()%>"/>
                                                                                    </td>
                                                                                <% } %>
                                                                                <td><%=courseBean.getCourseID()%></td>										                                                                               
                                                                                <td> <%=courseBean.getIdentifier()%></td>
                                                                                <td><%=courseBean.getName()%></td>
                                                                                <td><%=assignmentBean.getName()%></td>
                                                                                <td><%=subs.getGrade()%> / <%=assignmentBean.getPointsPossible()%></td>
                                                                                <td><%=subs.getComments()%></td>
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
						<p>
                                                     <% if (AccesLevel == 4){ %>
							<button type="button" id="InitClassButton"
								class="btn btn-outline btn-default">Initialize </button>                                                            
                                                     <% }
                                                        if (AccesLevel == 3) { %>
                                                        <button type="button" id="DeleteAssignmentButton"
								class="btn btn-outline btn-default">Delete </button>
                                                        <button type="button" id="ModifyAssignmentButton"
								class="btn btn-outline btn-default">Modify </button>
                                                     <% } if (AccesLevel == 1) { %>
                                                        <button type="button" id="DeleteAssignmentButton"
								class="btn btn-outline btn-default">View Comments </button>
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

    <!-- DataTables JavaScript -->
    <script src="js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/sb-admin-2.js"></script>
    
	<script type="text/javascript">
		$(function() {
			$("#DeleteAssignmentButton")
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
                                        location.href = "DeleteAssignment.jsp?CourseID="
                                                        + CourseID;
                                }
                        });
                        
                        $("#ModifyAssignmentButton")
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
                                        location.href = "ModifyAssignment.jsp?CourseID="
                                                        + CourseID;
                                }
                        });
		});
	</script>
</body>
</html>

    