<!DOCTYPE html>
<html lang="en">

<head>
    <jsp:include page="DefaultLayout.jsp" flush="true"/>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
    <body>
        <jsp:include page="PageInfo.jsp" flush="true"/>
        <div class="caption">
            <p><a href="#SearchAssignment" data-toggle="modal" class="btn btn-primary pull-right" role="button"><span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span></a></p>
        </div>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Courses</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Search For Courses
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example" >
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>DueDate</th>
                                                                                    
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="gradeA" >
                                            
                                            <td>Assignment 1</td>
                                            <td>11/12/14</td>
                                            
                                        </tr>
                                        <tr class="gradeA">
                                            
                                            <td>Assignment 2</td>
                                            <td>11/12/14</td>                                        
                                        </tr>
                                        <tr class="gradeA">
                                            
                                           <td>Assignment 3</td>
                                            <td>11/12/14</td>
                                        </tr>
                                        <tr class="gradeA">
                                            
                                           <td>Assignment 4</td>
                                            <td>11/12/14</td>
                                        </tr>
                                        <tr class="gradeA">
                                            
                                            <td>Assignment 5</td>
                                            <td>11/12/14</td>
                                        </tr>
                                        <tr class="gradeA">
                                            <td>Assignment 6</td>
                                            <td>11/12/14</td>
                                        </tr>
                                        <tr class="gradeA">
                                            <td>Assignment 7</td>
                                            <td>11/12/14</td>
                                        </tr>
                                        <tr class="gradeA">
                                            
                                            <td>Assignment 8</td>
                                            <td>11/12/14</td>
                                        </tr>
                                        <tr class="gradeA">
                                           
                                            <td>Assignment 9</td>
                                            <td>11/12/14</td>
                                        </tr>
                                        <tr class="gradeA">
                                            
                                            <td>Assignment 10</td>
                                            <td>11/12/14</td>
                                        </tr>
                                        <tr class="gradeA">
                                           
                                           <td>Assignment 11</td>
                                            <td>11/12/14</td>
                                        </tr>
                                        <tr class="gradeA">
                                           
                                           <td>Assignment 12</td>
                                            <td>11/12/14</td>
                                        </tr>
                                        
                                                                             
                                    </tbody>
                                </table>
                            </div>
                            <p>
                                <a href="ViewClass.jsp"><button type="button" class="btn btn-outline btn-default" >View Class</button></a>
                                <button type="button" class="btn btn-outline btn-default">Edit</button>
                                <button type="button" class="btn btn-outline btn-default">Grade Center</button>
                                <button type="button" class="btn btn-outline btn-default" onclick="checktest()">Delete</button>
                                
                            </p>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
                <!-- /.col-lg-6 -->
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
    
    <script>
        function checktest(){
            var checkboxes = document.getElementsByTagName("input");
            var i = 0;
            for (i = 0; i < checkboxes.length; i++) {               
                if (checkboxes[i].checked ){
                    document.getElementById("dataTables-example").deleteRow(i);
                }
            }
            
        }
    </script>   

</body>

</html>