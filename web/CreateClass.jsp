<%-- 
    Document   : CreateClass
    Created on : Oct 29, 2014, 4:54:32 PM
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
                                <form role="form" method="get" action="CreateClassServlet" >
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
                                                <label>Specifications</label>
                                                 <select name="Instructor" class="form-control">
                                                    <%
                                                            for (Person Professor : _Professors) {
                                                                String Name = Professor.getID() +"-"+ Professor.getName();
                                                    %>
                                                        <option><%=Name%></option>   
                                                    <%                                                 
                                                        }
                                                    %>
                                                </select>                                            
                                            </div>
                                        <button type="reset" class="btn btn-default" onclick="resetT()" >Reset</button>
                                        <button type="button" class="btn btn-default" onclick="msg()">Submit</button>	
                                        </div>							
                                </form>
                                </div>								
                        </div>
                </div>
			</div>
		</div>
		</div>
</body>

</html>