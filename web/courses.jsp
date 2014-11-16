<%-- 
    Document   : courses
    Created on : Oct 29, 2014, 5:03:16 PM
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
                    <h1 class="page-header">Courses</h1>
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
                                            <th>Prerequisite</th>
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
                                            <td>CSE 219</td>
                                            <td>Computer Science III</td>
                                            <td class="center">3</td>
                                            <td> C or higher in CSE 214 and CSE major or ECE major or permission of instructor</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 220</td>
                                            <td> Systems-Level Programming</td>
                                            <td class="center">3</td>
                                            <td> CSE 160 or 114 and CSE major or permission of instructor.</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 230</td>
                                            <td> Intermediate Programming in C and C++</td>
                                            <td class="center">3</td>
                                            <td>CSE 130 or CSE 220 or ESE 124 or ESG 111 or BME 120 or MEC 102.</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 260</td>
                                            <td> Computer Science B: Honors</td>
                                            <td class="center">4</td>
                                            <td>CSE 160.</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 300</td>
                                            <td> Technical Communications</td>
                                            <td class="center">3</td>
                                            <td>WRT 102, CSE or ISE major, U3 or U4 standing.</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 301</td>
                                            <td>  History of Computing</td>
                                            <td class="center">3</td>
                                            <td>U2 standing or higher.</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 303</td>
                                            <td> Introduction to the Theory of Computation</td>
                                            <td class="center">3</td>
                                            <td>CSE 214 and CSE 213 or 215 and CSE major or permission of instructor.</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 304</td>
                                            <td>Compiler Design</td>
                                            <td class="center">3</td>
                                            <td>CSE 219 or CSE 260; CSE 220.</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 305</td>
                                            <td>Principles of Database Systems</td>
                                            <td class="center">3</td>
                                            <td>CSE 219 or CSE 260; CSE 220; CSE major or permission of instructor.</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 306</td>
                                            <td>Operating Systems</td>
                                            <td class="center">3</td>
                                            <td> CSE 219 or CSE 260; CSE 220 or ESE 380 and CSE Major or ECE major or permission of instructor.</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 307</td>
                                            <td>Principles of Programming Languages</td>
                                            <td class="center">3</td>
                                            <td> CSE 219 or CSE 260; CSE 220; CSE major or permission of instructor</td>
                                        </tr>
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
                                            <td> CSE 219 or CSE 260 and CSE major or permission of instructor.</td>
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
                                            <td>CSE 214 or 260; CSE 220 or ISE 218; CSE major, ISE major or permission of instructor..</td>
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
                                            <td>CSE 214 or CSE 230 or CSE 260 or ISE 208.</td>
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
                                            <td>U3 or U4 standing, one D.E.C. E or SNW course.</td>
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
                                            <td>CSE 220 and CSE major or permission of instructor</td>
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
                                            <td>CSE 214 or CSE 230 or CSE 260 or ISE 208</td>
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
                                            <td>CSE 110 or permission of instructor</td>
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
                                            <td> CSE 219 or CSE 260; CSE 220; permission of instructor</td>
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
                                            <td> CSE 219 or CSE 260; MAT 211 or AMS 210</td>
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
                                            <td> CSE 219 or CSE 260</td>
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
                                            <td> U2, U3 or U4 standing</td>
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
                                            <td>CSE 219 or CSE 260</td>
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
                                            <td>CSE 114 or ISE 208; CSE or ISE major; U3 or U4 standing</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 346</td>
                                            <td>Computer Communications</td>
                                            <td class="center">3</td>
                                            <td>AMS 310 or 311</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 350</td>
                                            <td>Theory of Computation: Honors</td>
                                            <td class="center">4</td>
                                            <td>CSE 150; AMS 210 or MAT 211; CSE Honors Program or Honors College or WISE or permission of instructor</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 352</td>
                                            <td> Artificial Intelligence</td>
                                            <td class="center">3</td>
                                            <td>CSE 219 or CSE 260</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 353</td>
                                            <td> Machine Learning</td>
                                            <td class="center">3</td>
                                            <td>CSE 219 or CSE 260 or permission of instructor</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 355</td>
                                            <td> Computational Geometry</td>
                                            <td class="center">3</td>
                                            <td> AMS 301; programming knowledge of C or C++ or Java</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 364</td>
                                            <td> Advanced Multimedia Techniques</td>
                                            <td class="center">3</td>
                                            <td>  CSE/ISE 334 and permission of the instructor</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 366</td>
                                            <td> Introduction to Virtual Reality</td>
                                            <td class="center">3</td>
                                            <td>CSE 328, CSE/ISE 332, 333</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 370</td>
                                            <td> Wireless and Mobile Networking</td>
                                            <td class="center">3</td>
                                            <td>CSE 310 or 346</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 371</td>
                                            <td> Logic</td>
                                            <td class="center">3</td>
                                            <td>CSE 150 or CSE 215 or MAT 200</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 373</td>
                                            <td>Analysis of Algorithms</td>
                                            <td class="center">3</td>
                                            <td>MAT 211 or AMS 210; CSE 214 or CSE 260</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 376</td>
                                            <td>Advanced Systems Programming in UNIX/C</td>
                                            <td class="center">3</td>
                                            <td>CSE 219 or 260; CSE 220 or 230 or ESE 224</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 377</td>
                                            <td>Introduction to Medical Imaging</td>
                                            <td class="center">3</td>
                                            <td>AMS 161 or MAT 127 or 132 or 142; AMS 210 or MAT 211</td>
                                        </tr>
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 378</td>
                                            <td>Introduction to Robotics</td>
                                            <td class="center">3</td>
                                            <td>AMS 161 or MAT 127 or 132 or 142; AMS 210 or MAT 211 or MEC 262</td>
                                        </tr> 
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 380</td>
                                            <td>Computer Game Programming</td>
                                            <td class="center">3</td>
                                            <td>CSE 214 or CSE 230 or CSE 260</td>
                                        </tr> 
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 381</td>
                                            <td> Advanced Game Programming</td>
                                            <td class="center">3</td>
                                            <td>CSE 328 or CSE 380</td>
                                        </tr> 
										<tr class="gradeA">
                                            <td>
												<div class="checkbox">
													<label>
														<input type="checkbox" value="">
													</label>
												</div>
											</td>
                                            <td>CSE 390</td>
                                            <td> Special Topics in Computer Science</td>
                                            <td class="center">3</td>
                                            <td>CSE Major</td>
                                        </tr> 										
                                    </tbody>
                                </table>
                            </div>
							<p>
								<button type="button" class="btn btn-outline btn-default" onclick="RequestC()" >Request Class</button>
								<button type="button" class="btn btn-outline btn-default">View Details</button>
								<button type="button" class="btn btn-outline btn-default" >Grade Center</button>
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
</body>

</html>


