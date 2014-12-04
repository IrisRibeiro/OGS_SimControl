<%-- 
    Document   : GradeReport
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
<%@page import=" OGS.tables.PersonManager , OGS.tables.CourseManager, OGS.GeneralClasses.GradeSystem, OGS.beans.Course, OGS.tables.ClassManager, OGS.beans.Person,  OGS.beans.Class , OGS.beans.Assignment , OGS.tables.SubmissionManager , OGS.tables.AssignmentManager, OGS.beans.Submission , java.util.*"%>
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
        String assignmentID = request.getParameter("AssignmentID");
	List<Submission> submission = SubmissionManager.getGradedSubmissionsByAssignmentID(assignmentID);       
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
				<h1 class="page-header">Grade Report</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Grade Report</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr>
                                                                            <th>Number of Submissions</th>
                                                                            <th>Maximum Possible Points</th>
                                                                            <th>Maximum Grade</th>
                                                                            <th>Minimum Grade</th>
                                                                            <th>Average Grade</th>
                                                                            <th>Median Grade</th>
									</tr>
								</thead>
								<tbody>
									<%
                                                                            assignmentBean = AssignmentManager.getRow(assignmentID);
                                                                            classBean = ClassManager.getRowbyID(assignmentBean.getClassID());
                                                                            courseBean = CourseManager.getRow(classBean.getCourseID());
									%>
									<tr class="gradeA">
                                                                                <td><%=SubmissionManager.getNumGradedSubmissionsByAssignmentID(assignmentID)%></td>
                                                                                <td><%=assignmentBean.getPointsPossible()%></td>
                                                                                <td><%=GradeSystem.calcMax(submission)%></td>
                                                                                <td><%=GradeSystem.calcMin(submission)%></td>
                                                                                <td><%=GradeSystem.calcAvg(submission)%></td>
                                                                                <td><%=GradeSystem.calcMid(submission)%></td>
									</tr>
								</tbody>
							</table>
						</div>
						<p>
                                                     <button type="button" id="downloadGradeReportButton"
								class="btn btn-outline btn-default">Download </button>
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
                        $("#downloadGradeReport")
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

    