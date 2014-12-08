<%-- 
    Document   : deleteAssignment
    Created on : Nov 30, 2014, 2:43:55 AM
    Author     : zainul101
--%>

<%@page import="OGS.tables.SubmissionManager"%>
<%@page import="OGS.beans.Submission"%>
<%@page import="OGS.beans.Classes"%>
<%@page import="OGS.tables.ClassManager"%>
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
    boolean delete = false;
    String AssignmentID = request.getParameter("AssignmentID");    
    Assignment assignment = AssignmentManager.getRow(AssignmentID);
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
                    <% 
                        List <Submission> submission = SubmissionManager.getSubmissionsByAssignmentID(AssignmentID);
                        if(!submission.isEmpty()){
                            delete = SubmissionManager.DeleteSubmissionsByAssignmentID(AssignmentID);
                            if (delete == true){
                                delete = false;
                                delete = AssignmentManager.DeleteAssignments(AssignmentID);
                                if (delete == true){
                                   delete = false;
                                    int NumberofAssignments = ClassManager.getNumberofAssignments(assignment.getClassID());
                                    NumberofAssignments = NumberofAssignments - 1;
                                    delete = ClassManager.UpdateNumofAssignments(assignment.getClassID(), NumberofAssignments);
                                    if (delete == true){ %>
                                        <h1 class="page-header">Assignment was deleted</h1> 
                                   <% }
                                }
                            }
                        }else{
                            delete = AssignmentManager.DeleteAssignments(AssignmentID);
                            if (delete == true){
                                delete = false;
                                int NumberofAssignments = ClassManager.getNumberofAssignments(assignment.getClassID());
                                NumberofAssignments = NumberofAssignments - 1;
                                delete = ClassManager.UpdateNumofAssignments(assignment.getClassID(), NumberofAssignments);
                                if (delete == true){ %>
                                    <h1 class="page-header">Assignment was deleted</h1> 
                               <% }
                            }
                        }
                    %>
                   
                </div>
                <!-- /.col-lg-12 -->
            </div>
        </div>
                                            
        <script type="text/javascript" src="assets/twitterbootstrap/js/bootstrap.js"></script>
        
    </body>
</html>
