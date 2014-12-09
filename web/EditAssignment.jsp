<%-- 
    Document   : EditAssignment
    Created on : Dec 2, 2014, 6:19:12 PM
    Author     : zainul101
--%>

<%@page import="Servlets.SubmitAssignmentServlet"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
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
   
    String AssignmentID = request.getParameter("AssignmentID");
    DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");       
    DateFormat formatterTime = new SimpleDateFormat("hh:mm:ss");
       
    Calendar cal = Calendar.getInstance();
    Date currentdatetime = cal.getTime();
    Assignment assign = AssignmentManager.getRow(AssignmentID);
    String submissionDate = "";
    String submissionTime = "";
 
    
    try {
            Date Assignmentdate  = formatter.parse(assign.getDueDate());
            Date AssignmentTime = formatterTime.parse(assign.getTimeDue());
            
            submissionDate = formatter.format(currentdatetime);
            submissionTime = formatterTime.format(currentdatetime);
            Date SubmssionDate = formatter.parse(submissionDate);
            Date SubmissonTime = formatterTime.parse(submissionTime);
            boolean check=SubmssionDate.before(Assignmentdate);
            
            if (!check){
                response.sendRedirect("PastDueDate.jsp");
            }
           
    }catch (ParseException ex) {
             Logger.getLogger(SubmitAssignmentServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
             Logger.getLogger(SubmitAssignmentServlet.class.getName()).log(Level.SEVERE, null, ex);
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
                                <form role="form" method="post" action ="ModifyAssignmentServelet" enctype="multipart/form-data" >
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>Assignment Number</label>
                                            <label name="AssignmentNumber"><%=assign.getNumber()%></label> 
                                            <input type="hidden" name="AssignmentID" value="<%=assign.getID()%>" />
                                            <input type="hidden" name="ClassID" value="<%=assign.getClassID()%>" />
                                            <input type="hidden" name="AssignmentNumber" value="<%=assign.getNumber()%>" />
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
                                          <input class="btn btn-default" type="submit" value="Update"/>
                                    </div>
                                     <div class="col-lg-6">
                                         <div class="form-group">
                                            <label>Assignment Name</label>
                                            <label name="AssignmentName"><%=assign.getName()%></label>  
                                            <input type="hidden" name="AssignmentName" value="<%=assign.getName()%>" />
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
