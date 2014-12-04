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

	
<%@page import=" OGS.tables.PersonManager , OGS.tables.ClassManager,  OGS.beans.Person,  OGS.beans.Class , OGS.tables.CourseManager , OGS.beans.Course , java.util.*"%>
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
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Grade Assignments</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
		<div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                        <div class="panel-heading">
                                Choose Assignment
                        </div>
                        <!-- /.panel-heading -->
                        <div class="form-group">
                            <label>Instructor</label>
                             <select name="Classes" id="Classes" type="text" class="form-control">
                                <%
                                        for ( Assignment _assignments : assignments ) {
                                            String Name = _assignments.getName() +"-"+ _assignments.getNumber();
                                %>
                                    <option value="<%=_assignments.getID()%>"><%=Name%></option>   
                                <%                                                 
                                    }
                                %>
                            </select> 
                            <div class="form-group">
                                 <button type="button" class="btn btn-outline btn-default" id="Choose" onclick="validate()">Select</button>
                            </div>
                        </div> 
                        <div class="panel-body" id="grid" style=visibility:hidden>
                            <% 
                                        
                            %>
                            <input type="hidden" id="hiddenID" name="hiddenID"/>
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
                                                    Submission  submission = new Submission();
                                                    SubmissionManager SManager = new SubmissionManager();
                                                    String selectedassigment = request.getParameter("hiddenID");
                                                    List<Submission> submissions = SManager.getSubmissionsByAssignment(selectedassigment);
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
                                                        <input type="hidden" name="CourseID" value="<%=_submission.getSubmissionID()%>"/>
                                                    </td> 
                                                    <td Class="something2" type="hidden">
                                                        <input type="hidden" name="studentID" value="<%=_submission.getStudentID()%>"/>
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
                                <button type="button" id="viewSubmissionButton"
                                        class="btn btn-outline btn-default">View Submission</button>
                                
                            </p>
                    </div>
                </div>
                </div>
		</div>
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
<script>
function validate()
{
 var ddl = document.getElementById("Classes");
 var selectedValue = ddl.options[ddl.selectedIndex].value;
 document.getElementById("hiddenID").value = selectedValue; 
 var div = document.getElementById('grid');
 div.style.visibility = 'visible';
}
</script>

<script type="text/javascript">
        $(function() {			
            $("#viewSubmissionButton")
                            .click(
            function() {
                    var checked = $("#dataTables-classes").find(
                                    "td.something").find(":checked");
                    if (checked.size() != 1) {
                            alert("One and ONLY one submission should be checked...");
                    } else {
                            var SubmissionID = checked.parents(
                                            "td.something").find(
                                            "input[type='hidden']").val();
                            var StudentID = checked.parents(
                                            "td.something2").find(
                                            "input[type='hidden']").val();
                            location.href = "ViewSubmission.jsp?SubmissionID="
                                            + SubmissionID+"StudentID="+StudentID;
                    }
            });
        });
        
    </script>
    
</body>
</html>
