<%@page import="OGS.beans.Assignment"%>
<%@page import=" OGS.beans.Person, OGS.beans.Course, java.util.*"%>
<%
	Person person = (Person) session.getAttribute("currentSessionUser");
	if (person == null) {
		response.sendRedirect("Login.jsp");
		return;
        }
        
        Course currentcourse = (Course) session.getAttribute("currentSessionCourse");        
        String courseID = currentcourse.getCourseID();
%>
<!DOCTYPE html>
<html lang="en">

<head>
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
							<form method="get" action ="CreateAssignmentServelet" >
                                <div class="col-lg-6">
                                    
										<div class="form-group">
											<label>Assignment Number</label>
												<input class="form-control" name="assignNum">
										</div>
										<div class="form-group">
											<label>Assignment Name</label>
												<input class="form-control" name="assignName" type="text">
										</div>
										<div class="form-group">
											<label>Due Date</label>
												<input class="form-control" name="dDate" type="text">
										</div>
										<div class="form-group">
											<label>Specifications</label>
												<input class="form-control" name="specs" type="text">
										</div>
                                                                                <div class="form-group">
											<label>Instructions</label>
												<input class="form-control" name="instrucstions" type="text">
										</div>
                                                                                 
                                                                                <div class="form-group">
											<label>Point Possible</label>
												<input class="form-control" name="points" type="text">
										</div>
                                    
                                                                                 <input type="hidden" name="courseID" value="<%=courseID%>"/>
										
										<div class="form-group">
                                            <label>Import Students</label>
                                            <input type="file">
                                        </div>
									
								</div>
								
								<button type="reset" class="btn btn-default" onclick="resetT()" >Reset</button>
								<input class="btn btn-default" type="submit" value="Submit"/>								
							</form>							
								</div>
							</div>								
						</div>
					</div>
				</div>
        </div>
        <!-- /#page-wrapper -->
	
	<script>
	function msg(){
		alert("New class created! You'll be redirect");
		window.location.href = "Dashboard.jsp"
	}
	</script>
        
<%
     
     Assignment assign = new Assignment();
    assign.setName(request.getParameter("assigNum"));
    System.out.println("This is the nuame"+assign.getName());
     
    
%>

</body>

</html>

