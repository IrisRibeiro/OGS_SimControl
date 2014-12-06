<%-- 
    Document   : SearchClass
    Created on : Nov 27, 2014, 12:29:23 AM
    Author     : Iris
--%>

<!DOCTYPE html>
<html lang="en">
<head>
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
	List<Class> Classes = ClassManager.getClassesForPerson(person.getAccessLevel(), person.getID());
        
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
    <jsp:include page="PageInfo.jsp" flush="true"/>
        <div class="caption">
            <p><a href="#SearchClass" data-toggle="modal" class="btn btn-primary pull-right" role="button"><span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span></a></p>
        </div>

	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Courses</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">Search For Classes</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-striped table-bordered table-hover"
								id="dataTables-classes">
								<thead>
									<tr>
										<th>Select</th>
										<th>Class Number</th>
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
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>

		<!-- /.col-lg-6 -->
	</div>
	
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
                $("#viewClassButton")
                                .click(
                function() {
                        var checked = $("#dataTables-classes").find(
                                        "td.something").find(":checked");
                        if (checked.size() != 1) {
                                alert("One and ONLY one Class should be checked...");
                        } else {
                                var classID = checked.parents(
                                                "td.something").find(
                                                "input[type='hidden']").val();
                                location.href = "ViewClass.jsp?classID="
                                                + classID;
                        }
                });
        });
        
    </script>
    
    <script type="text/javascript">
        $(function() {			
            $("#ModifyClassButton")
                            .click(
            function() {
                    var checked = $("#dataTables-classes").find(
                                    "td.something").find(":checked");
                    if (checked.size() != 1) {
                            alert("One and ONLY one Class should be checked...");
                    } else {
                            var classID = checked.parents(
                                            "td.something").find(
                                            "input[type='hidden']").val();
                            location.href = "ModifyClass.jsp?classID="
                                            + classID;
                    }
            });
        });
        
    </script>
    
	<script type="text/javascript">
            $(function() {

                     $("#DeleteClassButton")
                                    .click(
                    function() {
                            var checked = $("#dataTables-classes").find(
                                            "td.something").find(":checked");
                            if (checked.size() != 1) {
                                    alert("One and ONLY one Class should be checked...");
                            } else {
                                    var classID = checked.parents(
                                                    "td.something").find(
                                                    "input[type='hidden']").val();
                                    location.href = "DeleteClass.jsp?classID="
                                                    + classID;
                            }
                    });
            });
	</script>
</body>
</html>
