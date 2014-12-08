<%-- 
    Document   : TAResult
    Created on : Dec 6, 2014, 11:14:46 PM
    Author     : Iris
--%>

<%@page import="OGS.beans.Course"%>
<%@page import="OGS.tables.CourseManager"%>
<%@page import="OGS.beans.Classes"%>
<%@page import="OGS.tables.ClassManager"%>
<%@page import="OGS.tables.PersonManager"%>
<%@page import="java.util.List"%>
<%@page import="OGS.beans.Person"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
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

%>
    </head>
     <jsp:include page="DefaultLayout.jsp" flush="true"/>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <body>
         <div id="page-wrapper">
             <%              
                String name =  request.getParameter("Name");
                List <Person> TA = PersonManager.getPersonByName(name);
                List <Classes> Class = ClassManager.getClassByProfessor(person.getID());
             %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Appoint TA</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
		<div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                        <div class="panel-heading">
                                Associate TA
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body" >
                                <div class="row">
                                <form role="form" method="get" action="AppointTAServlet">
                                        <div class="col-lg-6">							
                                            <% if (!TA.isEmpty()){  %>
                   <label>Select The Student</label>
                    <select name="StudentID" class="form-control">
                   <%
                           for (Person personTA : TA) {
                               
                             String Student = personTA.getID() +"-"+ personTA.getName();
                   %>
                       <option><%=Student%></option>   
                   <%                                                 
                       }
                   %>
                    </select>
                
                   <% if (!Class.isEmpty()){  %>
                        <div class="form-group">
                            <label>Select The Class</label>
                            <select name="ClassID" class="form-control">
                            <%
                               for (Classes _class : Class) {
                                 Course Courses = CourseManager.getRow(_class.getCourseID());
                                 String classinfo = _class.getClassID() +"-"+ Courses.getIdentifier() + "-" + Courses.getName();
                            %>
                                <option><%=classinfo%></option>   
                            <%                                                 
                                }
                            %>
                            </select> 
                        </div>
                    <% }  %>
                <div class="form-group">
                <input type="hidden" name="ProfessorID" value="<%=person.getID()%>"/>
                <input class="btn btn-default" type="submit" value="Submit">
                </div>
               
           
              <% } else { %>
                   <h1 class="page-header">We could not find any student that match your criteria</h1>                   
              <% }%>

                                        </div>
                                        							
                                </form>
                                </div>								
                        </div>
                </div>
			</div>
		</div>
		</div>
    <script src="js/jquery-1.11.0.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>    

    <!-- DataTables JavaScript -->
    <script src="js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/sb-admin-2.js"></script>
    
    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').dataTable();
    });
    </script>   
    </body>
</html>
