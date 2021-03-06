<%-- 
    Document   : CreateClass
    Created on : Oct 29, 2014, 4:54:32 PM
    Author     : Iris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import=" OGS.beans.Person, OGS.beans.Course, OGS.tables.PersonManager, OGS.tables.CourseManager, java.util.*"%>

<html lang="en">
    <head>
        <script>
        function validateForm() { 
            if(document.frm.ttime.value=="") { 
                alert("Time Can't be Blank"); 
                document.frm.ttime.focus(); 
                return false; } 
             
        }
        </script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
         <jsp:include page="DefaultLayout.jsp" flush="true"/>
<%
Person person = (Person) session.getAttribute("currentSessionUser");
if (person == null) {
        response.sendRedirect("faces/Login.jsp");
        return;
}

PersonManager PManager = new PersonManager();
List <Person> _Professors = PersonManager.getAllProfessor();
List <Course> _Courses = CourseManager.getAllCourses();

if (_Courses == null) {
%>
<script type="text/javascript">
	alert("No courses created to creat a class");
	location.href = "Login.jsp";
</script>
<%
return;
}
%>
        
</head>
   
    <body>
        <jsp:include page="PageInfo.jsp" flush="true"/>
        <div class="caption">
            <p><a href="#CreateClass" data-toggle="modal" class="btn btn-primary pull-right" role="button"><span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span></a></p>
        </div>
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Create Class</h1>
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
                                <form role="form" method="post" name="frm" onSubmit="return validateForm()" action="CreateClassServlet" enctype="multipart/form-data">
                                        <div class="col-lg-6">							
                                            <div class="form-group">
                                                <label>Course</label>
                                                 <select name="CourseID" class="form-control">
                                                    <%
                                                            for (Course _course : _Courses) {
                                                                String Name = _course.getCourseID() + " - " + _course.getIdentifier() + ":" + _course.getName();
                                                    %>
                                                        <option><%=Name%></option>   
                                                    <%                                                 
                                                        }
                                                    %>
                                                </select>                                            
                                            </div> 
                                            <div class="form-group">
                                                    <label>Building</label>
                                                            <input class="form-control" name="tbuilding" type="text">
                                            </div>                                           
                                            <div class="form-group">
                                                    <label>Period</label>
                                                    <select name="tsection" class="form-control">
                                                            <option value="Spring">Spring</option>
                                                            <option value="Summer">Summer</option>
                                                            <option value="Fall">Fall</option>
                                                            <option value="Winter">Winter</option>
                                                    </select>
                                            </div>                                           
                                            <div class="form-group">
                                                    <label>Import Students</label>
                                                    <input type="file" name="file">
                                            </div>

                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                    <label>Time</label>
                                                            <div class='input-group date' id='datetimepicker4'>
                                                                <input type='text' class="form-control" name="ttime" />
                                                                <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span>
                                                                </span>
                                                                <script type="text/javascript">
                                                                    $(function () {
                                                                        $('#datetimepicker4').datetimepicker({
                                                                            pickDate: false
                                                                        });
                                                                    });
                                                                </script>
                                                            </div>
                                            </div>
                                            <div class="form-group">
                                                    <label>Days</label>
                                                    <select name="days" class="form-control">
                                                            <option value="Mon - Wed">Mon - Wed</option>
                                                            <option value="Tue - Thu">Tue - Thu</option>
                                                            <option value="Mon - Fri">Mon - Fri</option>
                                                            <option value="Wed - Fri">Wed - Fri</option>
                                                    </select>       
                                            </div>
                                            <div class="form-group">
                                                    <label>Room</label>
                                                    <input class="form-control" name="tRoom" type="text">
                                            </div>
                                            <div class="form-group">
                                                <label>Instructor</label>
                                                 <select name="Instructor" id="Instructor" type="text" class="form-control">
                                                    <%
                                                            for (Person Professor : _Professors) {
                                                                String Name = Professor.getID() +"-"+ Professor.getName();
                                                    %>
                                                        <option><%=Name%></option>   
                                                    <%                                                 
                                                        }
                                                    %>
                                                </select>                                            
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