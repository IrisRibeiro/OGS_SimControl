<%-- 
    Document   : CreateCourse
    Created on : Nov 26, 2014, 7:47:51 PM
    Author     : Iris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import=" OGS.beans.Person, OGS.tables.PersonManager, java.util.*"%>
<%
	Person person = (Person) session.getAttribute("currentSessionUser");
	if (person == null) {
		response.sendRedirect("faces/Login.jsp");
		return;
        }
        
        PersonManager PManager = new PersonManager();
        List <Person> _Professors = PersonManager.getAllProfessor();
%>
<html lang="en">
    <head>
        <script>
        function validateForm() { 
            if(document.frm.tidentifier.value=="") { 
                alert("Course Identifier can't be null"); 
                document.frm.tidentifier.focus(); 
                return false; } 
            else if(document.frm.tcredits.value=="") { 
                alert("Credits can't be null "); 
                document.frm.tcredits.focus(); 
                return false; }
            else if(document.tname.tcredits.value=="") { 
                alert("Name can't be null "); 
                document.frm.tname.focus(); 
                return false; }
             
        }
        </script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        
    </head>
    <jsp:include page="DefaultLayout.jsp" flush="true"/>
    <body>
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Create Course</h1>
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
                                <form role="form" name="frm" onSubmit="return validateForm()" method="get" action="CreateCourseServlet" >
                                        <div class="col-lg-6">								
                                            <div class="form-group">
                                                    <label>Course Identifier</label>
                                                            <input class="form-control" name="tidentifier">
                                            </div>
                                            <div class="form-group">
                                                    <label>Credits</label>
                                                            <input class="form-control" name="tcredits" type="number">
                                            </div>                                            
                                            <div class="form-group">
                                                    <label>Official Webpage</label>
                                                            <input class="form-control" name="twebpage" type="text">
                                            </div>
                                        </div>
                                        <div class="col-lg-6">								
                                            <div class="form-group">
                                                    <label>Name</label>
                                                            <input type="text" class="form-control" name="tname">
                                            </div>
                                            <div class="form-group">
                                                    <label>Prerequisite</label>
                                                            <input class="form-control" name="tprerequisite">
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