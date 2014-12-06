<!DOCTYPE html>
<html lang="en">
    <head>
<%@page import="OGS.tables.AssignmentManager"%>
<%@page import="OGS.beans.Assignment"%>
<%@page import="java.util.List"%>
<%@page import="OGS.beans.Person"%>

    <jsp:include page="DefaultLayout.jsp" flush="true"/>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
    <body>
        <jsp:include page="PageInfo.jsp" flush="true"/>
        <div class="caption">
            <p><a href="#SearchAssignment" data-toggle="modal" class="btn btn-primary pull-right" role="button"><span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span></a></p>
        </div>
<%@page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

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
            List<Assignment> assignment = AssignmentManager.getAssigmentsForPerson(person.getAccessLevel(), person.getID());
             //AssignmentManager.deleteAssignmentForPerson(1);  
		
	
	//List<Assignment> courses = AssignmentManager.getAssignmentForPerson(person);
	//List<Course> courses = new ArrayList<>();
%>
    
            <body>
         <form  role="form" method="get" action ="SearchAssignmentServelet" >
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                   
                    <h1 class="page-header">Assignments</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Search For Assignment
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example" >
                                    <thead>
                                        <tr>
                                            <th>Select</th>
                                            <th>Name</th>
                                            <th>DueDate</th>
                                            <th>DueTime</th>
                                            <th>PointPossible</th>
                                                                                    
                                        </tr>
                                    </thead>
                                    <tbody>
                                      
									<%
										for (Assignment assign : assignment)
                                                                                {
									%>
									<tr class="gradeA">
										<td class="something">
                                                                                   												
                                                                                <label> <input  type="checkbox" value=""></label>
                                                                                <input type="hidden" name="CourseID" value="<%=assign.getID()%>" />
										</td>
                                                                                
										<td><%=assign.getName()%></td>
                                                                                <td><%=assign.getDueDate()%></td>
                                                                                <td><%=assign.getTimeDue()%></td>
										<td><%=assign.getPointsPossible()%></td>
									</tr>
									<%
										}
									%>
								</tbody>
                                </table>
                            </div>
                            
                                
                            <p>
                                <% 
                                    int acesslevel = person.getAccessLevel();
                                    
                                    if (acesslevel == 1){ // student
                                      
                                %> 
                                <button id="ViewAssignmentButton" type="button" class="btn btn-outline btn-default" >View Assignment</button>
                                 <%    }else if (acesslevel == 2) { // TA %> 
                                 <button id="ViewAssignmentButton" type="button" class="btn btn-outline btn-default" >View Assignment</button>
                                 <%    }else if (acesslevel == 3) { // Professor %> 
                                 <button id="ViewAssignmentButton" type="button" class="btn btn-outline btn-default" >View Assignment</button>
                                <button id="EditAssignment" type="button" class="btn btn-outline btn-default">Edit</button>
                                <button id="deleteAssignment" type="button" class="btn btn-outline btn-default" >Delete</button>
                                
                                 <%    }else if (acesslevel == 4) { // Manager %>
                                 <button id="ViewAssignmentButton" type="button" class="btn btn-outline btn-default" >View Assignment</button>
                                
                                <% }%>
                                
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
                     </form>             
      
    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
     
    <script type="text/javascript">
		$(function() {
			$("#ViewAssignmentButton")
					.click(
                        function() {
                                var checked = $("#dataTables-example").find(
                                                "td.something").find(":checked");
                                if (checked.size() != 1) {
                                        alert("One and ONLY one course should be checked...");
                                } else {
                                        var classID = checked.parents(
                                                        "td.something").find(
                                                        "input[type='hidden']").val();
                                        location.href = "ViewAssignment.jsp?classID="
                                                        + classID;
                                }
                        });
		});
	</script>
        
        <script type="text/javascript">
		$(function() {
			$("#deleteAssignment")
					.click(
                        function() {
                                var checked = $("#dataTables-example").find(
                                                "td.something").find(":checked");
                                if (checked.size() != 1) {
                                        alert("One and ONLY one course should be checked...");
                                } else {
                                        var classID = checked.parents(
                                                        "td.something").find(
                                                        "input[type='hidden']").val();
                                        location.href = "DeleteAssignment.jsp?classID="
                                                        + classID;
                                }
                        });
		});
	</script>
        
        <script type="text/javascript">
		$(function() {
			$("#EditAssignment")
					.click(
                        function() {
                                var checked = $("#dataTables-example").find(
                                                "td.something").find(":checked");
                                if (checked.size() != 1) {
                                        alert("One and ONLY one course should be checked...");
                                } else {
                                        var classID = checked.parents(
                                                        "td.something").find(
                                                        "input[type='hidden']").val();
                                        location.href = "EditAssignment.jsp?classID="
                                                        + classID;
                                }
                        });
		});
	</script>
        
    <script>
        function checktest()
        {
            var checkboxes = document.getElementsByTagName("input");
            var i = 0;
            for (i = 0; i < checkboxes.length; i++) 
            {               
                if (checkboxes[i].checked )
                {
                    document.getElementById("dataTables-example").deleteRow(i);
                      AssignmentManager.deleteAssignmentForPerson(assignment.get(i).getID());
                }
               
            }
          
        }
    </script>   
</body>

</html>
