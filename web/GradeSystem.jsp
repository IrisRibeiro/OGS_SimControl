<%-- 
    Document   : GradeSystem
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
<%@page import=" OGS.tables.PersonManager , OGS.tables.CourseManager, OGS.beans.Course, OGS.tables.ClassManager, OGS.beans.Person,  OGS.beans.Classes , OGS.beans.Assignment , OGS.tables.SubmissionManager , OGS.tables.AssignmentManager, OGS.beans.Submission , java.util.*"%>
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
	List<Submission> submission = SubmissionManager.getStudentsSubmissions(person.getID());    
        List<Assignment> assign = AssignmentManager.getAllAssignments();    
	Classes classBean = new Classes();
        Assignment assignmentBean = new Assignment();
        Course courseBean = new Course();
%>
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
            <p><a href="#GradeSystem" data-toggle="modal" class="btn btn-primary pull-right" role="button"><span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span></a></p>
        </div>
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
								id="dataTables-gradeSystem">
								<thead>
									<tr>
                                                                             
                                                                            <% if (AccesLevel > 1){ %>
                                                                                <th>Select</th>
                                                                                <th>CourseID</th>
                                                                                <th>Identifier</th>
                                                                                <th>Class</th>
                                                                                <th>Assignment</th>
                                                                                <th>Maximum Possible Points</th>
                                                                                <th>Number of Submitted Submissions</th>
                                                                            <% } else {%>
                                                                            <th>CourseID</th>
                                                                            <th>Identifier</th>
                                                                            <th>Class</th>
                                                                            <th>Assignment</th>
                                                                            <th>Grade</th>
                                                                            <th>Comments</th>
                                                                            <% } %>
									</tr>
								</thead>
								<tbody>
									<%
                                                                            if(AccesLevel == 1){
										for (Submission subs : submission) {
                                                                                   assignmentBean = AssignmentManager.getRow(subs.getAssignmentID());
                                                                                   classBean = ClassManager.getRowbyID(assignmentBean.getClassID());
                                                                                   courseBean = CourseManager.getRow(classBean.getCourseID());
									%>
									<tr class="gradeA">
                                                                                <td><%=courseBean.getCourseID()%></td>										                                                                               
                                                                                <td> <%=courseBean.getIdentifier()%></td>
                                                                                <td><%=courseBean.getName()%></td>
                                                                                <td><%=assignmentBean.getName()%></td>
                                                                                <td><%=subs.getGrade()%> / <%=assignmentBean.getPointsPossible()%></td>
                                                                                <td><%=subs.getComments()%></td>
									</tr>
									<%
										}
                                                                            } if(AccesLevel > 1){
										for (Assignment assignments : assign) {
                                                                                   classBean = ClassManager.getRowbyID(assignments.getClassID());
                                                                                   courseBean = CourseManager.getRow(classBean.getCourseID());
									%>
                                                                        <tr class="gradeA">
                                                                                <td class="gradeReportButton">                                                                                  												
                                                                                    <label> <input  type="checkbox" value=""></label>
                                                                                    <input type="hidden" name="AssignmentID" value="<%=assignments.getID()%>"/>
                                                                                </td>
                                                                                <td><%=courseBean.getCourseID()%></td>										                                                                               
                                                                                <td> <%=courseBean.getIdentifier()%></td>
                                                                                <td><%=courseBean.getName()%></td>
                                                                                <td><%=assignments.getName()%></td>
                                                                                <td><%=assignments.getPointsPossible()%></td>
                                                                                <td><%=SubmissionManager.getNumGradedSubmissionsByAssignmentID(assignments.getID())%></td>
									</tr>
									<%
										}
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
                                                        if ((AccesLevel == 3) || (AccesLevel == 2)) { %>
                                                        <button type="button" id="viewGradeReportButton"
								class="btn btn-outline btn-default">View Grade Report </button>
                                                     <% } if (AccesLevel == 1) { %>
                                                        <button type="button" id="viewCommentsButton"
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

    <!-- Metis Menu Plugin JavaScript -->
    <script src="js/plugins/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/sb-admin-2.js"></script>
    
	<script type="text/javascript">
		$(function() {
			$("#viewGradeReportButton")
					.click(
                        function() {
                                var checked = $("#dataTables-gradeSystem").find(
                                                "td.gradeReportButton").find(":checked");
                                if (checked.size() !== 1) {
                                        alert("One and ONLY one course should be checked...");
                                } else {
                                        var assignmentID = checked.parents(
                                                        "td.gradeReportButton").find(
                                                        "input[type='hidden']").val();
                                        location.href = "GradeReport.jsp?AssignmentID="
                                                        + assignmentID;
                                }
                        });
		});
	</script>
</body>
</html>

    