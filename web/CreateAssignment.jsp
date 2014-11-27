<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="OGS.beans.Assignment"%>
<%@page import=" OGS.beans.Person, OGS.beans.Course, OGS.tables.CourseManager, java.util.*"%>
<%
    Person person = (Person) session.getAttribute("currentSessionUser");
    if (person == null) {
        response.sendRedirect("faces/Login.jsp");
        
    }
   
    CourseManager CManager = new CourseManager();
   List <Course> _courses = CManager.getCourseByProfessor(person.getID());
    
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
                    <h1 class="page-header">Create Assignment</h1>
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
                                <form role="form" method="get" action ="CreateAssignmentServelet" >
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>Assignment Number</label>
                                                <input class="form-control" name="assignNum" type="number"/>
                                        </div>
                                        
                                        <div class="form-group">
                                             <label>Due Date</label>
                                                <div class='input-group date' id='datetimepicker1' name="dDate">
                                                    <input type='text' class="form-control" />
                                                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                                                    <script type="text/javascript">
                                                        $(function () {
                                                            $('#datetimepicker1').datetimepicker({
                                                               pickTime:false 
                                                            });
                                                        });
                                                    </script>
                                                </div> 
                                        </div>   
                                        <div class="form-group">
                                            <label>Time</label>
                                                    <div class='input-group date' id='datetimepicker4' name="ttime">
                                                        <input type='text' class="form-control" />
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
                                            <label>Course</label>
                                             <select name="Classes" class="form-control">
                                                 <%
                                                        for (Course course : _courses) {
                                                            String Name = course.getCourseID()+ " - " + course.getIdentifier()+" : "+ course.getName();
                                                %>
                                                    <option><%=Name%></option>   
                                                <%                                                 
                                                    }
                                                %>
                                            </select>                                            
                                        </div>
                                        <div class="form-group">
                                            <label>Point Possible</label>
                                            <input class="form-control" name="points" type="number">
                                        </div>                                      

                                        <div class="form-group">
                                            <label>Upload File:</label>
                                            <input type="file">
                                        </div>                                         
                                          <input class="btn btn-default" type="submit" value="Submit"/>
                                    </div>
                                     <div class="col-lg-6">
                                         <div class="form-group">
                                            <label>Assignment Name</label>
                                            <input class="form-control" name="assignName" type="text">
                                        </div>
                                         <div class="form-group">
                                            <label >Specifications</label>
                                            <textarea class="form-control" rows="5" name="specs" id="specs" type="text"></textarea>
                                        </div>
                                         <div class="form-group">
                                            <label>Instructions</label>
                                             <textarea class="form-control" rows="5" name="instrucstions" id="instrucstions" type="text"></textarea>                                            
                                        </div>
                                         
                                     </div>                                    								
                                </form>							
                            </div>
                        </div>								
                    </div>
                </div>
            </div> 
        <script type="text/javascript" src="assets/twitterbootstrap/js/bootstrap.js"></script>
    </body>
</html>

