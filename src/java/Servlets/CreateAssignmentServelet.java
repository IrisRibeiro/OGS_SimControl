/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import OGS.beans.Assignment;
import OGS.tables.AssignmentManager;
import OGS.tables.ClassManager;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
/**
 *
 * @author zainul101
 */
@WebServlet(name = "CreateAssignmentServelet", urlPatterns = {"/CreateAssignmentServelet"})
@MultipartConfig(maxFileSize = 16177215) // 16MB
public class CreateAssignmentServelet extends HttpServlet {

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
            out.println("<title>Servlet CreatAssignmentServelet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreatAssignmentServelet at " + request.getContextPath() + "</h1>");
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
       Assignment assignment = new Assignment();
       String AssignmentID = "";
       int AssignmentIDtmp = 0;
       
       BufferedReader bufferedReader = null;      
       String Name = getValue(request.getPart("assignName"));
       String Specification = getValue(request.getPart("specs"));
       String DueDate = getValue(request.getPart("dDate"));
       String PointsPossible = getValue(request.getPart("points"));
       String Instructions = getValue(request.getPart("instrucstions"));
       String Path = "default";
       String ClassID = getValue(request.getPart("ClassID"));
       String number = getValue(request.getPart("assignNum"));
       String TimeDue = getValue(request.getPart("ttime"));
       String Flag = "N";
       String Questions = getValue(request.getPart("Questions"));
       boolean insert = false;
       String message = "";
       int NumberofAssignments = 0;       
       
       String[] classid = ClassID.split("-");
       ClassID = classid[0].trim();
        try {
            AssignmentID = AssignmentManager.getAssignmentNumber();
            if (AssignmentID == null){
                AssignmentID = "0";
            }
            AssignmentIDtmp = Integer.parseInt(AssignmentID) + 1;
            AssignmentID = Integer.toString(AssignmentIDtmp);
        } catch (SQLException ex) {
            Logger.getLogger(CreateAssignmentServelet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CreateAssignmentServelet.class.getName()).log(Level.SEVERE, null, ex);
        }
       
       assignment.setID(AssignmentID);  
       assignment.setName(Name);
       assignment.setSpecification(Specification);
       assignment.setDueDate(DueDate);
       assignment.setPointsPossible(Integer.parseInt(PointsPossible));
       assignment.setInstructions(Instructions);
       assignment.setPath(Path);
       assignment.setClassID(ClassID);
       assignment.setNumber(Integer.parseInt(number));
       assignment.setTimeDue(TimeDue);
       assignment.setQuestions(Questions);
       
       Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
       
        String filename = "";       
        InputStream filecontent = null;
        if (filePart != null) {
           Flag = "Y";
           filename = getFilename(filePart);                      
           filecontent = filePart.getInputStream();
        }
       
       assignment.setFile(filecontent);
       assignment.setFileName(filename);
       assignment.setFlag(Flag);
       
        try {
            insert = AssignmentManager.insert(assignment);
            if (insert == true){
               insert = false;
               NumberofAssignments = ClassManager.getNumberofAssignments(ClassID);
               NumberofAssignments = NumberofAssignments + 1;
               insert = ClassManager.UpdateNumofAssignments(ClassID, NumberofAssignments);
               if (insert==true){
                   message = "Assignment was succefully created";
               }else{
                   message = "Assignment was succefully created, but we had an inter error";
               }
            }else{
                message = "We coudn't create this assignment. Sorry!";
                
            }
            
            request.setAttribute("message", message);
            request.getRequestDispatcher("/Response.jsp").forward(request, response);
            response.sendRedirect("faces/Response.jsp");
        } catch (Exception ex) {
            Logger.getLogger(CreateAssignmentServelet.class.getName()).log(Level.SEVERE, null, ex);
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
   
}
