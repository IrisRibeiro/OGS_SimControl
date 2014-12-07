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
    <body>
         <jsp:include page="AppointTA.jsp" flush="true"/>
         <% String name =  request.getParameter("Name");
            List <Person> TA = PersonManager.getPersonByName(name);
            List <Classes> Class = ClassManager.getClassByProfessor(person.getID());
         %>
          <div id="page-wrapper">
         <form role="form" method="get" action="AppointTAServlet">
            <div class="form-group">
               <% if (TA != null){  %>
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
                
                    <% if (Class != null){  %>
                        <div class="form-group">
                            <label>Select The Class</label>
                            <select name="ClassID" class="form-control">
                            <%
                               for (Classes _class : Class) {
                                 Course Courses = CourseManager.getRow(_class.getCourseID());
                                 String classinfo = Courses.getIdentifier() + "-" + Courses.getName();
                            %>
                                <option><%=classinfo%></option>   
                            <%                                                 
                                }
                            %>
                            </select> 
                        </div>
                    <% }  %>
                <div class="form-group">
                <input class="btn btn-default" type="submit" value="Submit">
                </div>
               
           
              <% } else { %>
                   <h1 class="page-header">We could not find any student that match your criteria</h1>                   
              <% }%>
                                                          
           </div>          
        </form>
          </div>
    </body>
</html>
