<%-- 
    Document   : ViewSubmission
    Created on : Dec 3, 2014, 11:12:21 PM
    Author     : Iris
--%>

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
        String StudentID = request.getParameter("StudentID");
        
        Submission submission = SubmissionManager.getRow(StudentID,SubmissionID);
        
        if (( submission == null)) {		
%>
<script type="text/javascript">
	alert("Class  not Found... You'll be redirected");
        location.href = "faces/ErrorPage.jsp";
</script>
<%
	}
%>
    <body>
        <jsp:include page="PageInfo.jsp" flush="true"/>
        <div class="caption">
            <p><a href="#ViewSubmission" data-toggle="modal" class="btn btn-primary pull-right" role="button"><span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span></a></p>
        </div>
        <!-- Page Content -->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">View and Grade Submission</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Submission</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="row">
							<form role="form" action="ViewSubmissionServlet" method="get">
								<fieldset disabled>
									<div class="col-lg-6">

                                                                            <div class="form-group">
                                                                                    <label>Student ID</label> <input class="form-control"
                                                                                            name="StudentID" value="<%=submission.getStudentID()%>">
                                                                                    <input type="hidden" name="GraderID" value="<%=person.getID()%>"/>
                                                                                    <input type="hidden" name="accessLevel" value="<%=person.getAccessLevel()%>"/>
                                                                                    <input type="hidden" name="DateFlag" value="<%=submission.getDateFlag()%>"/>
                                                                                    <input type="hidden" name="SubmissionID" value="<%=submission.getSubmissionID()%>"/>
                                                                                    <input type="hidden" name="submissionTime" value="<%=submission.getSubmissionTime()%>"/>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                    <label>Assignment ID</label> <input class="form-control"
                                                                                            name="AssignmentID" type="text" value="<%=submission.getAssignmentID()%>">
                                                                            </div>
                                                                            <div class="form-group">
                                                                                    <label>Typed Answers</label> <input class="form-control"
                                                                                            name="Typed" type="text" value="<%=submission.getAnswers()%>">
                                                                            </div>
                                                                        </div>	
								</fieldset>
                                                                     <div class="col-lg-6">
                                                                         <div class="form-group">
                                                                             <% 
                                                                                if (submission.getFileName() != null){                                                    
                                                                             %>
                                                                             <div class="form-group">
                                                                                <label>Download Submission File</label>
                                                                                <a href="DownloadSubmissionServlet">Download Link</a>           
                                                                            </div>
                                                                             <%   } %>
                                                                         </div>
                                                                         <div class="form-group">
                                                                         <label>Comments</label>
                                                                            <textarea class="form-control" rows="5" name="comments" id="comments" type="text" value="<%=submission.getComments()%>"></textarea> 
                                                                         </div>
                                                                         <div class="form-group">
                                                                         <label>Grade</label>
                                                                            <input class="form-control" name="grade" id="instrucstions" type="number" value="<%=submission.getGrade()%>">
                                                                         </div>
                                                                         <input class="btn btn-default" type="submit" value="Submit">
                                                                     </div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	
    </body>
</html>
