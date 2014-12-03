<%-- 
    Document   : GradeAssignment
    Created on : Dec 2, 2014, 11:44:20 PM
    Author     : Iris
--%>

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
                                    <option><%=Name%></option>   
                                <%                                                 
                                    }
                                %>
                            </select> 
                            <div class="form-group">
                                 <button type="button" class="btn btn-outline btn-default" id="Choose">Select</button>
                            </div>
                        </div> 
                        <div class="panel-body">
                            <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover"
                                            id="dataTables-classes">
                                            <thead>
                                                <tr>
                                                    <th>Select</th>
                                                    <th>Assignment Number </th>
                                                    <th>Course Info</th>
                                                    <th>Days</th>
                                                    <th>Time</th>
                                                    <th>Instructor Info</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    for (Class _class : Classes) {
                                                        String Days = _class.getDays();
                                                        if (Days.endsWith("/")){
                                                             Days = Days.trim();
                                                             Days = Days.substring( 0 , Days.length() - 1) + " ";
                                                        }

                                                        Course Courses = CourseManager.getRow(_class.getCourseID());
                                                        Person Prof = PersonManager.getRowfromID(_class.getInstructorID());
                                                        if ((Prof == null) || (Courses == null)){
                                                            String Url = "faces/ErrorPage.jsp";
                                                            response.sendRedirect(Url);
                                                        }
                                                        String CourseInfo = Courses.getIdentifier() + "-" + Courses.getName();
                                                        String ProfInfo = Prof.getID() + "-" +Prof.getName();

                                                %>
                                                <tr class="gradeA">
                                                    <td Class="something">                                                                                   												
                                                        <label> <input  type="checkbox" value=""></label>
                                                        <input type="hidden" name="CourseID" value="<%=_class.getClassID()%>"/>
                                                    </td> 
                                                    <td><%=_class.getClassID()%></td>										                                                                               
                                                    <td> <%=CourseInfo%></td>
                                                    <td><%=Days%></td>
                                                    <td><%=_class.getTime()%></td>
                                                    <td><%=ProfInfo%></td>
                                                </tr>
                                                <%
                                                        }
                                                %>
                                            </tbody>
                                    </table>
                            </div>
                            <p>
                                <button type="button" id="viewClassButton"
                                        class="btn btn-outline btn-default">View</button>
                                 <% if (AccesLevel == 4){ %>
                                    <button type="button" class="btn btn-outline btn-default" id="ModifyClassButton">Modify</button>
                                    <button type="button" class="btn btn-outline btn-default" id="DeleteClassButton">Delete</button>
                                <% } %>
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
                                                
</body>
</html>
