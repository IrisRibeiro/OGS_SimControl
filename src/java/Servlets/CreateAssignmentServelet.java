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
        Assignment assign = new Assignment();
        AssignmentManager man = new AssignmentManager();
        ClassManager CManager = new ClassManager();
        String newId = "";
        int idValue = 0;
        String time = ""; 
        int numberofassignments = 0;
        try {
            newId = man.getAssignmentNumber();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CreateAssignmentServelet.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (newId != null) {
            idValue = Integer.parseInt(newId)+1;
            
        }else{
            idValue = 1;
        }
        time=getValue(request.getPart("ttime"));
        //time = request.getParameter("ttime");
        newId = Integer.toString(idValue);
        String name = request.getParameter("assignName");        
        String dueDate = request.getParameter("dDate");
        String specs = request.getParameter("specs");        
        String instructions = request.getParameter("instrucstions"); 
        String ClassID = request.getParameter("Classes");        
        String[] Course = ClassID.split("-");
        ClassID = Course[0].trim();
        int assignmentnum = Integer.parseInt(request.getParameter("assignNum"));
        int points = Integer.parseInt(request.getParameter("points"));
       
        InputStream inputStream = null;
        
        Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
       String filename = "";
       String filecontentype = "";
       if (filePart != null) {
           filename = getFilename(filePart);
           filecontentype = filePart.getContentType();           
           inputStream = filePart.getInputStream();
       }
        
        assign.setID("11");
        assign.setName(name);
        assign.setDueDate(dueDate);
        assign.setSpecification(specs);
        assign.setInstructions(instructions);
        assign.setPointsPossible(points);
        assign.setClassID(ClassID);
        assign.setNumber(assignmentnum);
        assign.setTimeDue(time);
        assign.setPath("default");
        assign.setQuestions("default");
       assign.setFile(inputStream);
       assign.setFileName(filename);
        
        
        boolean check = false;
        try {
            check = man.insert(assign);
        } catch (Exception ex) {
            Logger.getLogger(CreateAssignmentServelet.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (check == true) {
            try {
                numberofassignments = CManager.getNumberofAssignments(ClassID);
                if (numberofassignments ==-1){
                    response.sendRedirect("faces/ErrorPage.jsp");
                }else{
                    check = CManager.UpdateNumofAssignments(ClassID,numberofassignments);
                }
                
            } catch (Exception ex) {
                Logger.getLogger(CreateAssignmentServelet.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("faces/Dashboard.jsp");

        } else {
            response.sendRedirect("faces/ErrorPage.jsp");
        }
        //processRequest(request, response);
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
