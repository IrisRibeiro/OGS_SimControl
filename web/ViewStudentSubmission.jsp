<%-- 
    Document   : ViewStudentSubmission
    Created on : Dec 8, 2014, 9:15:56 PM
    Author     : Iris
--%>


<%@page import="OGS.beans.Assignment"%>
<%@page import="OGS.beans.Submission"%>
<%@page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="OGS.tables.*,OGS.beans.Person, OGS.beans.Course, OGS.beans.Classes, java.util.*"%>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="DefaultLayout.jsp" flush="true" />
<%
	Person person = (Person) session.getAttribute("currentSessionUser");
	if (person == null) {
%>
<script type="text/javascript">
	alert("Please Login first...");
	location.href = "Login.jsp";
</script>
<%
	return;
	}
	String SubmissionID = request.getParameter("SubmissionID");
        Submission submission = SubmissionManager.getSubmissionbyIDRow(SubmissionID);
        Assignment assignment = AssignmentManager.getRow(submission.getAssignmentID()); 
%>
<body>
    <jsp:include page="PageInfo.jsp" flush="true"/>
        <div class="caption">
            <p><a href="#ViewClass" data-toggle="modal" class="btn btn-primary pull-right" role="button"><span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span></a></p>
        </div>
	<!-- Page Content -->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">View Class</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Information</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="row">
							<form role="form">
								<fieldset disabled>
									<div class="col-lg-6">
										<div class="form-group">
											<label>Student Name</label> <input class="form-control"
												name="StudentName" value="<%=person.getName()%>">
										</div>
										<div class="form-group">
											<label>Assignment Name</label> <input class="form-control"
												name="AssignmentName" type="number" value="<%=assignment.getName()%>">
										</div>
										<div class="form-group">
											<label>Points Possible</label> <input class="form-control"
												name="points" type="text" value="<%=assignment.getPointsPossible()%>">
										</div>
										<div class="form-group">
											<label>Submission Time</label> <input class="form-control"
												name="Submissiontime" type="text" value="<%=submission.getSubmissionTime()%>">
										</div>
										<div class="form-group">
											<label>Grade</label> <input class="form-control"
												name="Grade" type="text" value="<%=submission.getGrade()%>">
										</div>										
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<label>Your Answers</label> 
										</div>
                                                                                <div class="form-group">
											<label><%=submission.getAnswers()%></label> 
										</div>
										<div class="form-group">
											<label>Comments</label> 
										</div>
                                                                                <div class="form-group">
											<label><%=submission.getComments()%></label> 
										</div>										
									</div>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- /#page-wrapper -->
</body>

</html>
