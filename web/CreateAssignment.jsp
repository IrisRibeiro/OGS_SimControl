
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="OGS.tables.CourseManager"%>
<%@page import="OGS.beans.Course"%>
<%@page import="OGS.beans.Assignment"%>
<%@page import=" OGS.beans.Person, OGS.beans.Classes, OGS.tables.ClassManager, java.util.*"%>
<%
    Person person = (Person) session.getAttribute("currentSessionUser");
    if (person == null) {
        response.sendRedirect("faces/Login.jsp");
        
    }
   
    ClassManager CManager = new ClassManager();
   List <Classes> _classes = CManager.getClassByProfessor(person.getID());
    
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
                                <form role="form" method="post" name="frm" action ="CreateAssignmentServelet" enctype="multipart/form-data" >
                                    
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>Assignment Number</label>
                                                <input class="form-control" name="assignNum" type="number"/>
                                        </div>
                                        
                                        <div class="form-group">
                                             <label>Due Date</label>
                                                <div class='input-group date' id='datetimepicker1' name="dDate">
                                                    <input type='text' class="form-control" name="dDate" />
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
                                                    <div class='input-group date' id='ttime' >
                                                        <input type='text' class="form-control" name="ttime"/>
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
                                             <select name="ClassID" class="form-control">
                                                 <%
                                                    for (Classes _class : _classes) {
                                                    Course _course = CourseManager.getRow(_class.getCourseID());
                                                    String Name = _class.getClassID() +"-"+ _course.getIdentifier() + "-" + _course.getName();
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
                                            <label>Upload File or Enter Questions</label>
                                             <select id="option" class="form-control">
                                                 
                                                 <option ></option>
                                                    <option value="upload">Upload File</option>   
                                                    <option value="enter">Enter Questions</option>
                                            </select>                                             
                                        </div>
                                        <div class="form-group">
                                            <button type="button" class="btn btn-outline btn-default"
								onclick=" validate()">Select</button>
                                        </div>

                                       <div class="form-group" id="uploadFile" style=visibility:hidden>
                                            <label hidden>Upload File:</label>
                                            <input  type="file" name="file">
                                            
                                        </div> 
                                        <div class="form-group" id="enterQuestion" style=visibility:hidden>
                                            <label  >Enter Questions</label>
                                            <textarea class="form-control" rows="5" name="Questions"  type="text"></textarea>
                                            
                                        </div> 
                                        <div class="form-group">
                                          <input class="btn btn-default" type="submit" value="Submit"/>
                                        </div>
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
         <!-- jQuery Version 1.11.0 -->
    <script src="js/jquery-1.11.0.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>    

    <!-- DataTables JavaScript -->
    <script src="js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/sb-admin-2.js"></script>
    
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

