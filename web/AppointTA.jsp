<%-- 
    Document   : AppointTA
    Created on : Dec 6, 2014, 10:55:38 PM
    Author     : Iris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import=" OGS.beans.Person, java.util.*"%>

<!DOCTYPE html>
<html>

    <head>
    <jsp:include page="DefaultLayout.jsp" flush="true"/>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <%
        Person person = (Person) session.getAttribute("currentSessionUser");
        if (person == null) {
                response.sendRedirect("faces/Login.jsp");
                return;
        }
    %>
   
    </head>
    <body>
        <jsp:include page="PageInfo.jsp" flush="true"/>
        <div class="caption">
            <p><a href="#AppointTA" data-toggle="modal" class="btn btn-primary pull-right" role="button"><span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span></a></p>
        </div>
       <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Appoint TA</h1>
                </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                                Enter Information
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body" >
                            <div class="row">
                                <form role="form" method="POST" action="TAResult.jsp" >
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label>Name : </label>
                                                <input class="form-control" name="Name" type="text">
                                            </div> 
                                            <input class="btn btn-default" type="submit" value="Search">
                                        </div>
                                </form>
                            </div>
                        </div>
                    </div>
              
            </div>
       </div>
        <script src="js/jquery-1.11.0.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>    

    <!-- DataTables JavaScript -->
    <script src="js/plugins/dataTables/jquery.dataTables.js"></script>
    <script src="js/plugins/dataTables/dataTables.bootstrap.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/sb-admin-2.js"></script>
    
    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').dataTable();
    });
    </script>   
     

</body>
</html>
