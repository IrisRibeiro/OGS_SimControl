<%-- 
    Document   : enrolledClasses
    Created on : Oct 29, 2014, 5:09:50 PM
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
                    <h1 class="page-header">Enrolled Classes</h1>
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
                                            <th>Select</th>
                                            <th>Identifier</th>
                                            <th>Name</th>
                                            <th>Credits</th>                                            
											<th>Instructor Name</th>
											<th>WebPage</th>
											<th>Assignments Posted</th>
                                        </tr>
                                    </thead>
                                    <tbody>										
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 308</td>
                                            <td>Software Engineering</td>
                                            <td class="center">3</td>                                           
											<td>Charles Hernandez</td>
											<td> <a href="http://www3.cs.stonybrook.edu/~cse308/" target="_blank">Link</a></td>
											<td class="center">1</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 310</td>
                                            <td>Computer Networks</td>
                                            <td class="center">3</td>                                            
											<td>Jennifer Robinson</td>
											<td> <a href="https://www.cs.stonybrook.edu/students/Undergraduate-Studies/courses/CSE310" target="_blank">Link</a></td>
											<td class="center">0</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 311</td>
                                            <td>Systems Administration</td>
                                            <td class="center">3</td>                                            
											<td>Joseph Taylor</td>
											<td> <a href="https://www.cs.stonybrook.edu/undergrad/cse_courses/cse311.html?destination=undergrad/cse_courses/cse311.html" target="_blank">Link</a></td>
											<td class="center">3</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 312</td>
                                            <td>Legal, Social, and Ethical Issues in Information Systems</td>
                                            <td class="center">3</td>                                            
											<td>Steven Moore</td>
											<td> <a href="http://www3.cs.stonybrook.edu/~cse312/" target="_blank">Link</a></td>
											<td class="center">2</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 320</td>
                                            <td> Computer Organization and Architecture</td>
                                            <td class="center">3</td>                                            
											<td>Sandra Baker</td>
											<td> <a href="https://piazza.com/stonybrook/spring2014/cse320/home" target="_blank">Link</a></td>
											<td class="center">0</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 323</td>
                                            <td> Human-Computer Interaction</td>
                                            <td class="center">3</td>                                            
											<td>Donna Garcia</td>
											<td> <a href="http://www.mm.cs.sunysb.edu/323/" target="_blank">Link</a></td>
											<td class="center">1</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 325</td>
                                            <td>Computers and Sculpture</td>
                                            <td class="center">3</td>                                            
											<td>Mark White</td>
											<td> <a href="http://pub.cs.sunysb.edu/students/undergrad/cse_courses/cse325.html" target="_blank">Link</a></td>
											<td class="center">2</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 327</td>
                                            <td>Fundamentals of Computer Graphics</td>
                                            <td class="center">3</td>                                            
											<td>Jeff Collins</td>
											<td> <a href="http://www.coursehero.com/sitemap/schools/64-SUNY-Stony-Brook/courses/936274-CSE327/" target="_blank">Link</a></td>
											<td class="center">1</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 332</td>
                                            <td> Introduction to Visualization</td>
                                            <td class="center">3</td>                                            
											<td>Donald Campbell</td>
											<td> <a href="http://www3.cs.stonybrook.edu/~mueller/teaching/cse332/" target="_blank">Link</a></td>
											<td class="center">0</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 333</td>
                                            <td> User Interface Development</td>
                                            <td class="center">3</td>                                            
											<td>Carol Parker</td>
											<td> <a href="https://www.cs.stonybrook.edu/students/Undergraduate-Studies/courses/CSE333" target="_blank">Link</a></td>
											<td class="center">0</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 334</td>
                                            <td>  Introduction to Multimedia Systems</td>
                                            <td class="center">3</td>                                            
											<td> Lisa Carter</td>
											<td> <a href="http://www.mm.cs.stonybrook.edu/334/" target="_blank">Link</a></td>
											<td class="center">2</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 336</td>
                                            <td> Internet Programming</td>
                                            <td class="center">3</td>                                            
											<td>Helen Turner</td>
											<td> <a href="https://www.cs.stonybrook.edu/students/Undergraduate-Studies/courses/CSE336" target="_blank">Link</a></td>
											<td class="center">1</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 337</td>
                                            <td>Scripting Languages</td>
                                            <td class="center">3</td>                                            
											<td>Anthony Young</td>
											<td> <a href="https://www.cs.stonybrook.edu/students/Undergraduate-Studies/courses/CSE337" target="_blank">Link</a></td>
											<td class="center">0</td>
                                        </tr>																		
                                    </tbody>
                                </table>
                            </div>
							<p>
								<button type="button" class="btn btn-outline btn-default">Assignment Page</button>
								<button type="button" class="btn btn-outline btn-default">Course Details</button>
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
</body>

</html>

