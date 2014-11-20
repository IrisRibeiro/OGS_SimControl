<%-- 
    Document   : CreateClass
    Created on : Oct 29, 2014, 4:54:32 PM
    Author     : Iris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import=" OGS.beans.Person, java.util.*"%>
<%
	Person person = (Person) session.getAttribute("currentSessionUser");
	if (person == null) {
		response.sendRedirect("Login.jsp");
		return;
        }
%>
<!DOCTYPE html>
<html lang="en">
    <jsp:include page="DefaultLayout.jsp" flush="true"/>
    <body>
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Create Class</h1>
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
							<form role="form" >
                                <div class="col-lg-6">
                                    
										<div class="form-group">
											<label>Class Identifier</label>
												<input class="form-control" name="tidentifier">
										</div>
										<div class="form-group">
											<label>Credits</label>
												<input class="form-control" name="tcredits" type="number">
										</div>
										<div class="form-group">
											<label>Room/Building</label>
												<input class="form-control" name="tbuilding" type="text">
										</div>
										<div class="form-group">
											<label>Official Webpage</label>
												<input class="form-control" name="twebpage" type="text">
										</div>
										<div class="form-group">
                                            <label>Period</label>
                                            <select class="form-control">
                                                <option>Spring</option>
                                                <option>Summer</option>
                                                <option>Fall</option>
                                                <option>Winter</option>
                                            </select>
                                        </div>
										<div class="form-group">
                                            <label>Import Students</label>
                                            <input type="file">
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
										<div class="form-group">
											<label>Date and Time</label>
												<input class="form-control" name="tdatetime" type="datetime">
										</div>
										<div class="form-group">
											<label>Instructor ID</label>
												<input class="form-control" name="tinstructorId" type="number">
										</div>
										<div class="form-group">
											<label>Instructor Name</label>
												<input class="form-control" name="tinstructorname">
										</div>
										<div class="form-group">
											<label>Instructor Email</label>
												<input class="form-control" name="tinstructoremial" type="email">
										</div>
								<button type="reset" class="btn btn-default" onclick="resetT()" >Reset</button>
								<button type="button" class="btn btn-default" onclick="msg()">Submit</button>								
							</form>							
								</div>
							</div>								
						</div>
					</div>
				</div>
        </div>
</body>

</html>
