<%-- 
    Document   : SubmitAssignment
    Created on : Dec 1, 2014, 10:08:24 PM
    Author     : Iris
--%>


<!DOCTYPE html>
<html lang="en">
<head>
    <script>       
    
    <%@page import="OGS.tables.AssignmentManager"%>
<%@page import="OGS.beans.Assignment"%>
    <jsp:include page="DefaultLayout.jsp" flush="true"/>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<%@page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import=" OGS.tables.PersonManager , OGS.tables.ClassManager,  OGS.beans.Person,  OGS.beans.Class , OGS.tables.CourseManager , OGS.beans.Course , java.util.*"%>
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
        String AssignmentID = request.getParameter("AssigmentID");	
        Assignment assignments = AssignmentManager.getRow(AssignmentID);
        String InstructorEmail = PersonManager.getInstructorEmail(assignments.getClassID());
        Course _course = CourseManager.getCourseByClass(assignments.getClassID());
        String courseIdentifier = _course.getIdentifier();
       
	//List<Course> courses = new ArrayList<>();
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
                    <h1 class="page-header">Submit Assignment</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
		<div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                        <div class="panel-heading">
                                Enter Information
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body" >
                                <div class="row">
                                <form role="form" method="post" name="frm" action="SubmitAssignmentServlet"  enctype="multipart/form-data">
                                        <div class="col-lg-6">								
                                            <div class="form-group">
                                                <label>Available Assignment</label>                                                
                                                   <%                                                            
                                                    String AssigmentSpeci = assignments.getID() + " - " + assignments.getName();
                                                   %>
                                                <label name="AssigmentID"><%=AssigmentSpeci%></label>                                                  
                                               
                                            </div>
                                            <div class="form-group">
                                                    <label>Specifications</label>
                                                    <textarea class="form-control" rows="5" name="specs" id="specs" type="text" value="<%=assignments.getSpecification()%>" disabled></textarea>
                                            </div>                                            
                                            <div class="form-group">
                                                <label>Instructions</label>
                                                <textarea class="form-control" rows="5" name="instructions" id="instructions" type="text" value="<%=assignments.getInstructions()%>" disabled></textarea>
                                                                                                
                                            </div>
                                             <% 
                                                if (assignments.getFlag() == "Y"){                                                    
                                             %>
                                             <div class="form-group">
                                                <label>Download Assignment File</label>
                                                <a href="DownloadServlet">Download Link</a>           
                                            </div>
                                             <%   } %>
                                             
                                             
                                            <div class="form-group">
                                                <label>Upload File</label>
                                                 <input type="file" name="file">
                                            </div>
                                            <div class="form-group">
                                                <label>Type Answers</label>
                                                <textarea class="form-control" rows="5" name="typedanswers" id="typedanswers" type="text"></textarea>                                                                                                
                                            </div> 
                                                
                                             <div class="form-group">
                                                <input type="hidden" name="StudentID" value="<%=person.getID()%>"/>
                                                <input type="hidden" name="StudentName" value="<%=person.getName()%>"/>
                                                <input type="hidden" name="DueDate" value="<%=assignments.getDueDate()%>"/>
                                                <input type="hidden" name="DueTime" value="<%=assignments.getTimeDue()%>"/>
                                                <input type="hidden" name="AssignmentName" value="<%=assignments.getName()%>"/>
                                                <input type="hidden" name="Instructoremail" value="<%=InstructorEmail%>"/>
                                                <input type="hidden" name="CourseIdentifier" value="<%=courseIdentifier%>"/>
                                            </div> 
                                            
                                        </div>	
                                </form>
                                </div>								
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
    <script type="text/javascript">
      
    </script>                                         
</body>
</html>
