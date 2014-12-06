<%-- 
    Document   : EditAssignment
    Created on : Dec 2, 2014, 6:19:12 PM
    Author     : zainul101
--%>

<%@page import="OGS.beans.Classes"%>
<%@page import="OGS.tables.ClassManager"%>
<%@page import="OGS.tables.AssignmentManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="OGS.beans.Assignment"%>
<%@page import=" OGS.beans.Person, OGS.beans.Course, OGS.tables.ClassManager,OGS.tables.CourseManager, java.util.*"%>
<%
    Person person = (Person) session.getAttribute("currentSessionUser");
    if (person == null) {
        response.sendRedirect("faces/Login.jsp");
        
    }
   
    
   
   
    String classID = request.getParameter("classID");
    List<Classes> _courses = ClassManager.getClassByProfessor(person.getID());
	Assignment assign = AssignmentManager.getRow(classID);
    
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
                    <h1 class="page-header">Modify Assignment</h1>
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
                                <form role="form" method="get" action ="ModifyAssignmentServelet" >
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>Assignment Number</label>
                                                <input class="form-control" name="assignNum" type="number"/>
                                        </div>
                                        
                                        <div class="form-group">
                                             <label>Due Date</label>
                                                <div class='input-group date' id='datetimepicker1'>
                                                    <input type='text' class="form-control" name="dDate" value="<%=assign.getDueDate()%>"/>
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
                                                    <div class='input-group date' id='datetimepicker4'>
                                                        <input type='text' class="form-control" name="timedue" value="<%=assign.getTimeDue()%>" />
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
                                                        for (Classes course :_courses) {
                                                            String Name = course.getCourseID()+ " - " + course.getClassID()+" : "+ course.getSection();
                                                %>
                                                    <option><%=Name%></option>   
                                                <%                                                 
                                                    }
                                                %>
                                            </select>                                            
                                        </div>
                                        <div class="form-group">
                                            <label>Point Possible</label>
                                            <input class="form-control" name="points" type="number" value="<%=assign.getPointsPossible()%>">
                                        </div>                                      
                                          <div class="form-group">
                                            <label>Upload File or Enter Questions</label>
                                             <select id="option" class="form-control">
                                                 
                                                 <option ></option>
                                                    <option value="upload">Upload File</option>   
                                                    <option value="enter">Enter Questions</option>
                                            </select>  
                                            <div class="form-group">
                                            <button type="button" class="btn btn-outline btn-default"
								onclick=" validate()">Select</button>
                                            </div>
                                        </div>
                                        <div class="form-group" id="uploadFile" style=visibility:hidden>
                                            <label hidden>Upload File:</label>
                                            <input  type="file">
                                            
                                        </div> 
                                            <div class="form-group" id="enterQuestion" style=visibility:hidden>
                                            <label  >Enter Questions</label>
                                            <textarea class="form-control" rows="5" name="specs" id="specs" type="text"></textarea>
                                            
                                        </div>
                                          <input class="btn btn-default" type="submit" value="Submit"/>
                                    </div>
                                     <div class="col-lg-6">
                                         <div class="form-group">
                                            <label>Assignment Name</label>
                                            <input class="form-control" name="assignName" type="text" value="<%=assign.getName()%>">
                                        </div>
                                         <div class="form-group">
                                            <label >Specifications</label>
                                            <textarea class="form-control" rows="5" name="specs" id="specs" type="text"><%=assign.getSpecification()%></textarea>
                                        </div>
                                         <div class="form-group">
                                            <label>Instructions</label>
                                             <textarea class="form-control" rows="5" name="instrucstions" id="instrucstions" type="text"><%=assign.getInstructions()%></textarea>                                            
                                        </div>
                                        
                                     </div>                                    								
                                </form>							
                            </div>
                        </div>								
                    </div>
                </div>
            </div> 
        <script type="text/javascript" src="assets/twitterbootstrap/js/bootstrap.js"></script>
        <script>
function validate()
{
 var ddl = document.getElementById("option");
 var selectedValue = ddl.options[ddl.selectedIndex].value;
    if (selectedValue ==="enter")
   {
    var div = document.getElementById('enterQuestion');

div.style.visibility = 'visible';
// OR
 var div2 = document.getElementById('uploadFile');
div2.style.visibility="hidden";

   }
   else if(selectedValue ==="upload")
   {
       var div2 = document.getElementById('uploadFile');
        div2.style.visibility="visible";
        
        var div = document.getElementById('enterQuestion');
        div.style.visibility = 'hidden';
   }
}
</script>
    </body>
</html>
