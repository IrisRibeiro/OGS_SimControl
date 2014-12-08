<%-- 
    Document   : ViewAssignment
    Created on : Nov 28, 2014, 4:53:23 PM
    Author     : zainul101
--%>

<%@page import="OGS.tables.AssignmentManager"%>
<%@page import="OGS.tables.PersonManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="OGS.beans.Assignment"%>
<%@page import=" OGS.beans.Person, OGS.beans.Course, OGS.tables.CourseManager, java.util.*"%>
<%
    Person person = (Person) session.getAttribute("currentSessionUser");
    if (person == null) {
        response.sendRedirect("faces/Login.jsp");      
        
    }
   
    String AssignmentID = request.getParameter("AssignmentID");	
    Assignment assign = AssignmentManager.getRow(AssignmentID);
    Course cla = CourseManager.getCourseByClass(assign.getClassID());
    if (assign == null) {
       response.sendRedirect("faces/ErrorPage.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
       <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        
        
    </head>
    <jsp:include page="DefaultLayout.jsp" flush="true"/>
    <body>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">View Assignment</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Information
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body" > 
                            <div class="row">
                                
                                    <div class="col-lg-6">
                                        
                                        
                                        <div class="form-group">
                                             <label>Due Date</label>
                                                    <input type='text' class="form-control" name="dDate" value="<%=assign.getDueDate()%>" disabled />
                                                     
                                                </div>
                                        <div class="form-group">
                                            <label>Time</label>
                                                    
                                                        <input type='text' class="form-control" name="timedue" value="<%=assign.getTimeDue()%>" disabled/>
                                                        
                                                        
                                                    
                                            </div>
                                        <div class="form-group">
                                            <label>Course</label>
                                             <input type='text' class="form-control" name="timedue" value="<%=cla.getName()%>" disabled/>
                                                 
                                                                           
                                        </div>
                                        <div class="form-group">
                                            <label>Point Possible</label>
                                            <input class="form-control" name="points" type="number" value="<%=assign.getPointsPossible()%>" disabled/>
                                        </div>                                      
                                             
                                    </div>
                                     <div class="col-lg-6">
                                         <div class="form-group">
                                            <label>Assignment Name</label>
                                            <input class="form-control" name="assignName" type="text" value="<%=assign.getName()%>" disabled/>
                                        </div>
                                         <div class="form-group">
                                            <label >Specifications</label>
                                            <textarea class="form-control" rows="5" name="specs" id="specs"   disabled><%=assign.getSpecification()%></textarea>
                                        </div>
                                         <div class="form-group">
                                            <label>Instructions</label>
                                             <textarea class="form-control" rows="5" name="instrucstions" id="instrucstions"   disabled><%=assign.getInstructions()%></textarea>                                            
                                        </div>
                                         
                                     </div>                                    														
                            </div>
                        </div>								
                    </div>
                </div>
            </div> 
                                            
        <script type="text/javascript" src="assets/twitterbootstrap/js/bootstrap.js"></script>
    </body>
</html>
