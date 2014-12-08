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
<%@page import=" OGS.tables.PersonManager , OGS.tables.CourseManager, OGS.GeneralClasses.GradeSystem, OGS.beans.Course, OGS.tables.ClassManager, OGS.beans.Person,  OGS.beans.Classes , OGS.beans.Assignment , OGS.tables.SubmissionManager , OGS.tables.AssignmentManager, OGS.beans.Submission , java.util.*"%>
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
            <p><a href="#GradeReport" data-toggle="modal" class="btn btn-primary pull-right" role="button"><span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span></a></p>
        </div>

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
                                                                <!-- Second Half Grade Distribution-->
                                                                <thead>
									<tr>
                                                                            <th>[0-10)</th>
                                                                            <th>[10-20)</th>
                                                                            <th>[20-30)</th>
                                                                            <th>[30-40)</th>
                                                                            <th>[40-50)</th>
                                                                            <th>[50-60)</th>
                                                                            <th>[60-70)</th>
                                                                            <th>[70-80)</th>
                                                                            <th>[80-90)</th>
                                                                            <th>[90-100)</th>
                                                                            <th>[100+]</th>
									</tr>
								</thead>
								<tbody>
									<tr class="gradeA">
                                                                                <td><%=GradeSystem.calcGradeDist(submission, 0)%></td>
                                                                                <td><%=GradeSystem.calcGradeDist(submission, 1)%></td>
                                                                                <td><%=GradeSystem.calcGradeDist(submission, 2)%></td>
                                                                                <td><%=GradeSystem.calcGradeDist(submission, 3)%></td>
                                                                                <td><%=GradeSystem.calcGradeDist(submission, 4)%></td>
                                                                                <td><%=GradeSystem.calcGradeDist(submission, 5)%></td>
                                                                                <td><%=GradeSystem.calcGradeDist(submission, 6)%></td>
                                                                                <td><%=GradeSystem.calcGradeDist(submission, 7)%></td>
                                                                                <td><%=GradeSystem.calcGradeDist(submission, 8)%></td>
                                                                                <td><%=GradeSystem.calcGradeDist(submission, 9)%></td>
                                                                                <td><%=GradeSystem.calcGradeDist(submission, 10)%></td>
									</tr>
								</tbody>
							</table>
						</div>
                                                                        
						<p>
                                                     <button type="button" id="downloadGradeReportButton"
								class="btn btn-outline btn-default">Download </button>
                                                     <button type="button" id="backButton"
								class="btn btn-outline btn-default">Back </button>
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
                        $("#downloadGradeReportButton")
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
        
        <script type="text/javascript">
		$(function() {
                        $("#backButton")
					.click(
                        function() {
                                        location.href = "GradeSystem.jsp";
                                });
                        });
	</script>
</body>
</html>

    