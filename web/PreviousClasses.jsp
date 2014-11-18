<%-- 
    Document   : PreviousClasses
    Created on : Oct 29, 2014, 4:57:35 PM
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
                    <h1 class="page-header">Previous Courses</h1>
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
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Select</th>
                                            <th>Identifier</th>
                                            <th>Name</th>
                                            <th>Credits</th>
                                            <th>Final Grade</th>
											<th>Season</th>
											<th>Year</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="odd gradeX">										
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 101</td>
                                            <td>Introduction to Computers</td>
                                            <td class="center">3 </td>
                                            <td class="center">A</td>
											<td>Fall</td>
											<td>2013.2</td>
                                        </tr>
                                        <tr class="even gradeC">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 102</td>
                                            <td>Introduction to Web Design and Programming</td>
                                            <td class="center">3 </td>
                                            <td class="center">A</td>
											<td>Fall</td>
											<td>2013.2</td>
                                        </tr>
                                        <tr class="odd gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 110</td>
                                            <td>Introduction to Computer Science</td>
                                            <td class="center">3 </td>
                                            <td class="center">A</td>
											<td>Fall</td>
											<td>2013.2</td>
                                        </tr>
                                        <tr class="odd gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 114</td>
                                            <td>Computer Science I</td>
                                            <td class="center">4 </td>
                                            <td class="center">A-</td>
											<td>Fall</td>
											<td>2013.2</td>
                                        </tr>
                                        <tr class="even gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 130</td>
                                            <td>Introduction to Programming in C</td>
                                            <td class="center">3 </td>
                                            <td class="center">B</td>
											<td>Fall</td>
											<td>2013.2</td>
                                        </tr>
                                        <tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 150</td>
                                            <td> Foundations of Computer Science: Honors</td>
                                            <td class="center">4</td>
                                            <td class="center">B</td>
											<td>Spring</td>
											<td>2013.1</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 160</td>
                                            <td> Computer Science A: Honors</td>
                                            <td class="center">4</td>
                                            <td class="center">B-</td>
											<td>Spring</td>
											<td>2013.1</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 214</td>
                                            <td> Computer Science II</td>
                                            <td class="center">3</td>
                                            <td class="center">A</td>
											<td>Spring</td>
											<td>2013.1</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 215</td>
                                            <td> Foundations of Computer Science</td>
                                            <td class="center">3</td>
                                            <td class="center">C</td>
											<td>Spring</td>
											<td>2013.1</td>
                                        </tr>										
                                    </tbody>
                                </table>
                            </div>
							<p>
								<button type="button" class="btn btn-outline btn-default">View Details</button>
								<button type="button" class="btn btn-outline btn-default">Grade Center</button>
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

