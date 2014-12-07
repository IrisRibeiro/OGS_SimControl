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
<%@page import=" OGS.tables.PersonManager, OGS.beans.Person , OGS.tables.CourseManager, java.util.*"%>
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
        String courseID = request.getParameter("CourseID");
        boolean worked = false;
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
                    <h1 class="page-header">Page has been/is being Deleted!</h1>
                    <%worked = CourseManager.deleteCourseByID(courseID);
                    if(worked == true){
                    %>
                        <script type="text/javascript">
                            alert("The Course and all its data has been deleted!");
                            location.href = "SearchCourses.jsp";
                        </script>
                    <%
                    } else {
                        %>
                        <script type="text/javascript">
                            alert("Something went wrong while deleting the course!");
                            location.href = "SearchCourses.jsp";
                        </script>
                        <%
                    }
                    
                    %>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
	<!-- jQuery Version 1.11.0 -->
    <script src="js/jquery-1.11.0.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="js/plugins/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/sb-admin-2.js"></script>
    
</body>
</html>

    