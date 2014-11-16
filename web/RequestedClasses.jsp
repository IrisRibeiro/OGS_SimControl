<%-- 
    Document   : RequestedClasses
    Created on : Oct 29, 2014, 5:07:18 PM
    Author     : Iris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <jsp:include page="DefaultLayout.jsp" flush="true"/>
    <body>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Requested Classes</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Search For Classes
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>                                            
                                            <th>Identifier</th>
                                            <th>Name</th>
                                            <th>Credits</th>
                                            <th>Prerequisite</th>
											<th>Instructor Name</th>											
											<th>Date of Request</th>
                                        </tr>
                                    </thead>
                                    <tbody>
										<tr class="gradeA">                                            
                                            <td>CSE 219</td>
                                            <td>Computer Science III</td>
                                            <td class="center">3</td>
                                            <td> C or higher in CSE 214 and CSE major or ECE major or permission of instructor</td>
											<td> James Smith</td>
											<td >09/27/2014</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>CSE 220</td>
                                            <td> Systems-Level Programming</td>
                                            <td class="center">3</td>
                                            <td> CSE 160 or 114 and CSE major or permission of instructor.</td>
											<td>Mary Clark</td>
											<td >09/27/2014</td>
                                        </tr>
										<tr class="gradeA">                                            
                                            <td>CSE 230</td>
                                            <td> Intermediate Programming in C and C++</td>
                                            <td class="center">3</td>
                                            <td>CSE 130 or CSE 220 or ESE 124 or ESG 111 or BME 120 or MEC 102.</td>
											<td>John Johnson</td>
											<td >09/27/2014</td>
                                        </tr>
										<tr class="gradeA">                                           
                                            <td>CSE 260</td>
                                            <td> Computer Science B: Honors</td>
                                            <td class="center">4</td>
                                            <td>CSE 160.</td>
											<td>Patricia Rodriguez</td>
											<td >09/27/2014</td>
                                        </tr>
										<tr class="gradeA">                                            
                                            <td>CSE 300</td>
                                            <td> Technical Communications</td>
                                            <td class="center">3</td>
                                            <td>WRT 102, CSE or ISE major, U3 or U4 standing.</td>
											<td>Robert Williams</td>
											<td >09/27/2014</td>
                                        </tr>
										<tr class="gradeA">                                           
                                            <td>CSE 301</td>
                                            <td>  History of Computing</td>
                                            <td class="center">3</td>
                                            <td>U2 standing or higher.</td>
											<td>Linda Lewis</td>
											<td >09/27/2014</td>
                                        </tr>
										<tr class="gradeA">                                            
                                            <td>CSE 303</td>
                                            <td> Introduction to the Theory of Computation</td>
                                            <td class="center">3</td>
                                            <td>CSE 214 and CSE 213 or 215 and CSE major or permission of instructor.</td>
											<td>Michael Brown</td>
											<td >09/27/2014</td>
                                        </tr>
										<tr class="gradeA">
                                            
                                            <td>CSE 304</td>
                                            <td>Compiler Design</td>
                                            <td class="center">3</td>
                                            <td>CSE 219 or CSE 260; CSE 220.</td>
											<td>Barbara Lee</td>
											<td >09/27/2014</td>
                                        </tr>
										<tr class="gradeA">
                                            
                                            <td>CSE 305</td>
                                            <td>Principles of Database Systems</td>
                                            <td class="center">3</td>
                                            <td>CSE 219 or CSE 260; CSE 220; CSE major or permission of instructor.</td>
											<td>William Davis</td>
											<td >09/27/2014</td>
                                        </tr>
										<tr class="gradeA">                                            
                                            <td>CSE 306</td>
                                            <td>Operating Systems</td>
                                            <td class="center">3</td>
                                            <td> CSE 219 or CSE 260; CSE 220 or ESE 380 and CSE Major or ECE major or permission of instructor.</td>
											<td>Elizabeth Walker</td>
											<td >09/27/2014</td>
                                        </tr>
										<tr class="gradeA">
                                            
                                            <td>CSE 307</td>
                                            <td>Principles of Programming Languages</td>
                                            <td class="center">3</td>
                                            <td> CSE 219 or CSE 260; CSE 220; CSE major or permission of instructor</td>
											<td>Richard Moore</td>
											<td >09/27/2014</td>
                                        </tr>																	
                                    </tbody>
                                </table>
                            </div>
							<p>								
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
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

</body>

</html>


