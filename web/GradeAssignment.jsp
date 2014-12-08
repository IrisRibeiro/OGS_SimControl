<%-- 
    Document   : GradeAssignment
    Created on : Dec 2, 2014, 11:44:20 PM
    Author     : Iris
--%>

<%@page import="OGS.tables.SubmissionManager"%>
<%@page import="OGS.beans.Submission"%>
<%@page import="OGS.tables.AssignmentManager"%>
<%@page import="OGS.beans.Assignment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="DefaultLayout.jsp" flush="true"/>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

	
<%@page import=" OGS.tables.PersonManager , OGS.tables.ClassManager,  OGS.beans.Person,  OGS.beans.Classes , OGS.tables.CourseManager , OGS.beans.Course , java.util.*"%>
<%
	Person person = (Person) session.getAttribute("currentSessionUser");
        int AccesLevel = person.getAccessLevel();
        String personID = person.getID();
	if (person == null) {
%>
<script type="text/javascript">
	alert("Please Login first...");
	location.href = "Login.jsp";
</script>
<%
		return;
	}	
        List<Assignment> assignments = AssignmentManager.getAssigmentsForPerson(AccesLevel, personID);
	String AssignmentID = request.getParameter("AssignmentID");
%>
</head>

<body>
    <jsp:include page="PageInfo.jsp" flush="true"/>
        <div class="caption">
            <p><a href="#GradeAssignment" data-toggle="modal" class="btn btn-primary pull-right" role="button"><span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span></a></p>
        </div>
        <% 
          Submission  submission = new Submission();
          SubmissionManager SManager = new SubmissionManager();
          List<Submission> submissions = SManager.getSubmissionsByAssignment(AssignmentID);  
          if (submissions.isEmpty()){%>
            <div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">We could not find any submissions for this assignment</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
            </div>
          <%} else {%>
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
					<div class="panel-heading">Select a Submission</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-classes">
								<thead>
									<tr>
                                                                            <th>Select</th>                                                    
                                                                            <th>Student ID</th>
                                                                            <th>Submitted on time</th> 
									</tr>
								</thead>
								<tbody>
                                                                <%
                                                                    for (Submission _submission : submissions) {                                                       
                                                                    String submittedontime = "";
                                                                    String flag = _submission.getDateFlag();
                                                                    if (flag == "A"){
                                                                        submittedontime = "NO";
                                                                    }else{
                                                                        submittedontime = "YES";
                                                                    }
                                                                %>
                                                                <tr class="gradeA">
                                                                    <td Class="something">                                                                                   												
                                                                        <label> <input  type="checkbox" value=""></label>
                                                                        <input type="hidden" name="CourseID" value="<%=_submission.getSubmissionID()+"-"+ _submission.getStudentID()%>"/>
                                                                    </td>
                                                                    
                                                                    <td><%=_submission.getStudentID()%></td>										                                                                               
                                                                    <td> <%=submittedontime%></td>    
                                                                    
                                                                </tr>
                                                                <%
                                                                        }
                                                                %>
								</tbody>
							</table>
						</div>
						<p>
                                                
                                                  <button type="button" class="btn btn-outline btn-default" id="viewSubmissionButton">View Submission</button>       
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
          <% }%>

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
                                var concat = checked.parents(
                                                "td.something").find(
                                                "input[type='hidden']").val();                                
                                location.href = "ViewSubmission.jsp?Info="
                                                + concat;
                        }
                });
        });
        
    </script>
    
</body>
</html>
