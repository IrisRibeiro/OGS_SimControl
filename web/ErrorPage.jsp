<%-- 
    Document   : ErrorPage
    Created on : Oct 29, 2014, 12:37:40 PM
    Author     : Eric
--%>


<%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"   %>
<%@page import=" OGS.beans.Person, java.util.*"%>
<%
	Person person = (Person) session.getAttribute("currentSessionUser");
	if (person == null) {
		response.sendRedirect("faces/Login.jsp");
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
                    <h1 class="page-header">Oops! Something went wrong. Sorry, try again</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
</body>

</html>