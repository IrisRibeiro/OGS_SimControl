<%-- 
    Document   : Response
    Created on : Dec 6, 2014, 6:12:33 PM
    Author     : Iris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
         <jsp:include page="DefaultLayout.jsp" flush="true"/>
    </head>
    <body>        
        <!-- Page Content -->
	<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <c:if test="${not empty message}">
                        <h1 class="page-header">${message}</h1>
                    </c:if>           
                </div>                  
            </div>
        </div>       
        
    </body>
</html>
