<%-- 
    Document   : StudentSubmission
    Created on : Dec 8, 2014, 8:58:10 PM
    Author     : Iris
--%>
<%@page import="OGS.tables.AssignmentManager"%>
<%@page import="OGS.beans.Assignment"%>
<%@page import="OGS.tables.SubmissionManager"%>
<%@page import="OGS.beans.Submission"%>
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
	List<Submission> submission = SubmissionManager.getStudentsSubmissions(person.getID());
        
	//List<Course> courses = new ArrayList<>();
%>
<link href="css/bootstrap.min.css" rel="stylesheet">
  <!-- DataTables CSS -->
<link href="css/plugins/dataTables.bootstrap.css" rel="stylesheet">
     <!-- Custom Fonts -->
<link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<body>
    <jsp:include page="PageInfo.jsp" flush="true"/>
        <div class="caption">
            <p><a href="#SearchClass" data-toggle="modal" class="btn btn-primary pull-right" role="button"><span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span></a></p>
        </div>
    <% if (submission.isEmpty()) {%>
        <div id="page-wrapper">
            <div class="row">
                    <div class="col-lg-12">
                            <h1 class="page-header">Submissions</h1>
                    </div>
                    <!-- /.col-lg-12 -->
            </div>
        </div>
    <% } else {%>
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Submissions</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Search For Submissions</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-classes">
								<thead>
									<tr>
                                                                            <th>Select</th>
                                                                            <th>Assignment Name</th>
                                                                            <th>Status Submission</th>
                                                                            <th>Grade</th>
										
									</tr>
								</thead>
								<tbody>
									<%
										for (Submission _submission : submission) {
                                                                                    Assignment assignment = AssignmentManager.getRow(_submission.getAssignmentID());
                                                                                    String submissionStatus = "";
                                                                                    if (_submission.getDateFlag()== "B"){
                                                                                        submissionStatus = "Submitted On Time";
                                                                                    }else{
                                                                                        submissionStatus = "Submitted Past Due ";
                                                                                    }
                                                                                    
                                                                                    
									%>
									<tr class="gradeA">
										<td Class="something">                                                                                   												
                                                                                    <label> <input  type="checkbox" value=""></label>
                                                                                    <input type="hidden" name="SubmissionID" value="<%=_submission.getSubmissionID()%>"/>
										</td> 
                                                                                <td><%=assignment.getName()%></td>										                                                                               
                                                                                <td> <%=submissionStatus%></td>
                                                                                <td><%=_submission.getGrade()%></td>										
									</tr>
									<%
										}
									%>
								</tbody>
							</table>
						</div>
						<p>
							<button type="button" id="viewSubmissionButton"
								class="btn btn-outline btn-default">View</button>
                                                        
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
    <% } %>
    <script src="js/bootstrap.min.js"></script>    

    <!-- DataTables JavaScript -->
    <script src="js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/sb-admin-2.js"></script>

    <script type="text/javascript">
        $(function() {
                $("#viewSubmissionButton")
                                .click(
                function() {
                        var checked = $("#dataTables-classes").find(
                                        "td.something").find(":checked");
                        if (checked.size() != 1) {
                                alert("One and ONLY one Class should be checked...");
                        } else {
                                var SubmissionID = checked.parents(
                                                "td.something").find(
                                                "input[type='hidden']").val();
                                location.href = "ViewStudentSubmission.jsp?SubmissionID="
                                                + SubmissionID;
                        }
                });
        });
        
    </script>   
    
</body>
</html>

