/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import OGS.beans.Person;
import OGS.beans.StudentEnrollment;
import OGS.tables.ClassManager;
import OGS.tables.PersonManager;
import OGS.tables.StudentEnrollmentManager;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Iris
 */
@WebServlet(name = "ModifyClassServlet", urlPatterns = {"/ModifyClassServlet"})
@MultipartConfig
public class ModifyClassServlet extends HttpServlet {
    
    private static String getValue(Part part) throws IOException {
    BufferedReader reader = new BufferedReader(new InputStreamReader(part.getInputStream(), "UTF-8"));
    StringBuilder value = new StringBuilder();
    char[] buffer = new char[1024];
    for (int length = 0; (length = reader.read(buffer)) > 0;) {
        value.append(buffer, 0, length);
    }
        return value.toString();
    }
    
   private static String getFilename(Part part) {
    for (String cd : part.getHeader("content-disposition").split(";")) {
        if (cd.trim().startsWith("filename")) {
            String filename = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
            return filename.substring(filename.lastIndexOf('/') + 1).substring(filename.lastIndexOf('\\') + 1); // MSIE fix.
        }
    }
    return null;
}

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ModifyClassServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ModifyClassServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         OGS.beans.Classes _class = new OGS.beans.Classes();        
        ClassManager CManager = new ClassManager();
        Person student = new Person();
        PersonManager PManager = new PersonManager();
        Person studentTMP = new Person();
        StudentEnrollment StudentEn = new StudentEnrollment();
        StudentEnrollmentManager SEManager = new StudentEnrollmentManager();
        StudentEnrollment StudentEnTMP = new StudentEnrollment();
        String message = "";
        boolean flag = false;
            BufferedReader bufferedReader = null;  
            String line="";           
            int newStudentID = 0;
            String time = "";        
            String ProfessorID = getValue(request.getPart("Instructor"));
            String Course = getValue(request.getPart("CourseID"));
            String[] CourseID = Course.split("-");
            Course = CourseID[0].trim();
            String[] Professor = ProfessorID.split("-");
            ProfessorID = Professor[0].trim();
            String Days = getValue(request.getPart("days"));
             
            Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
            String filename = getFilename(filePart);
            InputStream filecontent = filePart.getInputStream();
            bufferedReader = new BufferedReader(new InputStreamReader(filecontent));     
            String finaldays = "";
            
            _class.setRoom(getValue(request.getPart("tRoom")));
            _class.setBuilding(getValue(request.getPart("tbuilding")));               
            _class.setSection(getValue(request.getPart("tsection")));
            _class.setDays(Days);
            _class.setInstructorID(ProfessorID);
            _class.setClassID(getValue(request.getPart("ClassID")));
            _class.setCourseID(Course);
            time = getValue(request.getPart("ttime")); 
            _class.setNumberOfAssignments(Integer.parseInt(getValue(request.getPart("AssignmentNumber"))));
            _class.setTime(time);
            
        try {
            boolean insert = CManager.UpdateClass(_class);
            if (insert==true){
                if (bufferedReader != null){
                    while( (line = bufferedReader.readLine()) != null ){
                        flag = true;
                        String[] info = line.split(",");                
                        student.setName(info[0]);
                        student.setUserName(info[1].trim());
                        student.setPassword(info[2].trim());
                        student.setEmailAddress(info[3].trim());
                        student.setAccessLevel(Integer.parseInt(info[4].trim()));
                        student.setType(info[5].trim());
                       try {
                           studentTMP = PManager.getRowfromUserName(student.getUserName());

                           if (studentTMP != null){
                               StudentEn.setClassID(_class.getClassID());
                               StudentEn.setFlag("E");
                               StudentEn.setStudentID(studentTMP.getID());
                               StudentEnTMP = SEManager.getRowID(studentTMP.getID(), _class.getClassID());
                               if (StudentEnTMP == null){
                                   insert = SEManager.insert(StudentEn);
                               }   
                              
                           }else{
                              newStudentID = Integer.parseInt(PManager.getLastPersonID());
                              newStudentID = newStudentID + 1;
                              student.setID(Integer.toString(newStudentID));
                              insert = PManager.insert(student);
                              if (insert == true){
                                  StudentEn.setClassID(_class.getClassID());
                                  StudentEn.setFlag("E");
                                  StudentEn.setStudentID(Integer.toString(newStudentID));
                                   insert = SEManager.insert(StudentEn);
                              }

                           }
                       } catch (SQLException ex) {
                           Logger.getLogger(CreateClassServlet.class.getName()).log(Level.SEVERE, null, ex);
                       } catch (ClassNotFoundException ex) {
                           Logger.getLogger(CreateClassServlet.class.getName()).log(Level.SEVERE, null, ex);
                       }

                    }
                    
                    
                }
                
                if (flag == false){
                  message = "Class was modified but we coudn't import students";
                }else{
                  message = "Class was modified and students were imported";                
                }
                
                request.setAttribute("message", message);
                request.getRequestDispatcher("/Response.jsp").forward(request, response);
                response.sendRedirect("faces/Response.jsp");
                
            }else{
                 response.sendRedirect("faces/ErrorPage.jsp");
            }
        } catch (Exception ex) {
            Logger.getLogger(CreateClassServlet.class.getName()).log(Level.SEVERE, null, ex);
             response.sendRedirect("faces/ErrorPage.jsp");
        } 
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
