<%-- 
    Document   : ModifyClass
    Created on : Nov 27, 2014, 1:35:19 AM
    Author     : Iris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import=" OGS.beans.Person, OGS.beans.Course, OGS.beans.Class , OGS.tables.PersonManager, OGS.tables.CourseManager, OGS.tables.ClassManager , java.util.*"%>

<html lang="en">
    <head>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<%
Person person = (Person) session.getAttribute("currentSessionUser");
if (person == null) {
        response.sendRedirect("faces/Login.jsp");
        return;
}
String classID = request.getParameter("classID");
Class _class = ClassManager.getRowbyID(classID);
Course _course = CourseManager.getRow(_class.getCourseID());
Person Prof = PersonManager.getRowfromID(_class.getInstructorID());

if (_class == null) {
%>
<script type="text/javascript">
	alert("No courses created to creat a class");
	location.href = "ErrorPage.jsp";
</script>
<%
return;
}
%>
        
    </head>
    <jsp:include page="DefaultLayout.jsp" flush="true"/>
    <body>
        <jsp:include page="PageInfo.jsp" flush="true"/>
        <div class="caption">
            <p><a href="#ModifyClass" data-toggle="modal" class="btn btn-primary pull-right" role="button"><span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span></a></p>
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
                                <form role="form" method="Post" action="ModifyClassServlet" enctype="multipart/form-data">
                                        <div class="col-lg-6">							
                                            <div class="form-group">
                                                <label>Course</label>
                                                   <%
                                                          
                                                        String Name = _course.getCourseID() + " - " + _course.getIdentifier() + ":" + _course.getName();
                                                    %>
                                                   <label><%=Name%></label> 
                                                   <input type="hidden" name="CourseID" value="<%=Name%>"/>
                                                                                                
                                            </div> 
                                            <div class="form-group">
                                                    <label>Building</label>
                                                            <input class="form-control" name="tbuilding" type="text" value="<%=_class.getBuilding()%>">
                                            </div>                                           
                                            <div class="form-group">
                                                    <label>Period</label>
                                                    <input class="form-control" name="tsection" type="text" value="<%=_class.getSection()%>">
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
                                                                <input type='text' class="form-control" name="ttime" value="<%=_class.getTime()%>" />
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
                                                    <input class="form-control" name="days" type="text" value="<%=_class.getDays()%>"/>
                                            </div>
                                            <div class="form-group">
                                                    <label>Room</label>
                                                    <input class="form-control" name="tRoom" type="text" value="<%=_class.getRoom()%>">
                                            </div>
                                            <div class="form-group">
                                                <label>Instructor</label>
                                                 
                                                    <%                                                            
                                                      String NameIns = Prof.getID() +" - "+ Prof.getName();
                                                    %>
                                                    <label name="Instructor" ><%=NameIns%></label>   
                                                    <input type="hidden" name="Instructor" value="<%=NameIns%>"/>
                                                    <input type="hidden" name="ClassID" value="<%=_class.getClassID()%>"/>
                                                    <input type="hidden" name="AssignmentNumber" value="<%=_class.getNumberOfAssignments()%>"/>
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
