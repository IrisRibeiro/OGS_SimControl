/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import OGS.beans.Submission;
import OGS.tables.SubmissionManager;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
@WebServlet(name = "SubmitAssignmentServlet", urlPatterns = {"/SubmitAssignmentServlet"})
@MultipartConfig(maxFileSize = 16177215) // 16MB
public class SubmitAssignmentServlet extends HttpServlet {

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
            out.println("<title>Servlet SubmitAssignmentServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubmitAssignmentServlet at " + request.getContextPath() + "</h1>");
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
       
       Submission submission = new Submission();
       SubmissionManager SManager = new SubmissionManager();
       
       InputStream inputStream = null;
       String StudentID = getValue(request.getPart("StudentID"));
       String AssigmentID = getValue(request.getPart("AssigmentID"));
       String[] assigmentID = AssigmentID.split("-");
       AssigmentID =  assigmentID[0].trim();
       double grade = 0;
       String graderId = "Non graded";
       String comments = "Non graded yet";
            
       String dateflag = "";
       String AssigmentDueDate = getValue(request.getPart("DueDate"));
       String AssigmentDueTime = getValue(request.getPart("DueTime"));
       String submissionDate = "";
       String submissionTime = ""; 
       String typedanswers = getValue(request.getPart("typedanswers"));
       String StudentName = getValue(request.getPart("StudentName"));
       String Assignmentname = getValue(request.getPart("AssignmentName"));
       String courseIdentifier = getValue(request.getPart("CourseIdentifier"));
       String OGSEmail = "OGSSimcontrol@outlook.com";
       DateFormat formatter = new SimpleDateFormat("dd/MM/yy");       
       DateFormat formatterTime = new SimpleDateFormat("HH:mm:ss");
       
       Calendar cal = Calendar.getInstance();
       Date currentdatetime = cal.getTime();
       
       String mailTo = getValue(request.getPart( "Instructoremail"));
       String mailsubject = "Late Assignment Submission " + courseIdentifier;               
       String host = "localhost";
       boolean insert = false;
       Properties properties = System.getProperties();  
       properties.setProperty("mail.smtp.host", host);  
       Session session = Session.getDefaultInstance(properties);
       
       String SubmissionID = "";
      
      int tmpID = 0;
        try {
            SubmissionID = SManager.getSubmissionNumber();
        } catch (SQLException ex) {
            Logger.getLogger(SubmitAssignmentServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SubmitAssignmentServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
      if (SubmissionID != null) {
            tmpID = Integer.parseInt(SubmissionID)+1;
            
        }else{
            tmpID = 1;
        }
      
       SubmissionID = Integer.toString(tmpID);       
      
       Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
       String filename = "";
       String filecontentype = "";
       if (filePart != null) {
           filename = getFilename(filePart);
           filecontentype = filePart.getContentType();           
           inputStream = filePart.getInputStream();
        }
        
        try {
            Date Assignmentdate  = formatter.parse(AssigmentDueDate);
            Date AssignmentTime = formatterTime.parse(AssigmentDueTime);
            submissionDate = formatter.format(currentdatetime);
            submissionTime = formatterTime.format(currentdatetime);
            Date SubmssionDate = formatter.parse(submissionDate);
            Date SubmissonTime = formatterTime.parse(submissionTime);
            
            if ((SubmssionDate.after(Assignmentdate)) && (SubmissonTime.after(AssignmentTime))){
                dateflag = "A";
                
            }else{
                dateflag = "B";
            }
            submission.setStudentID(StudentID);
            submission.setAssignmentID(AssigmentID);
            submission.setGrade(grade);
            submission.setGraderID(graderId);
            submission.setComments(comments);
            submission.setPath("");
            submission.setDateFlag(dateflag);
            submission.setSubmissionTime(submissionTime);
            submission.setSubmissionID(SubmissionID);
            submission.setFileName(filename);
            submission.setFile(inputStream);  
            submission.setAnswers(typedanswers);
            
            insert = SManager.insert(submission);
        } catch (ParseException ex) {
            Logger.getLogger(SubmitAssignmentServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(SubmitAssignmentServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if (insert == true){
            if (dateflag == "A"){
                String messagebody = "The Class " + courseIdentifier + " has a new late submission for the student " + StudentName + "\n"
                + "With ID : " + StudentID + "\n"
                + "Assignment Name : " + Assignmentname + "\n"
                + "That was due : " +AssigmentDueDate+ AssigmentDueTime + "\n"
                + "Was submited :"+  submissionDate + submissionTime + "\n";
                MimeMessage message = new MimeMessage(session);
                try { 
                    message.setFrom(new InternetAddress(OGSEmail));
                    message.addRecipient(Message.RecipientType.TO,new InternetAddress(mailTo));  
                    message.setSubject(mailsubject);  
                    message.setText(messagebody);
                    Transport.send(message);  
                } catch (AddressException ex) {
                    Logger.getLogger(SubmitAssignmentServlet.class.getName()).log(Level.SEVERE, null, ex);
                } catch (MessagingException ex) {
                    Logger.getLogger(SubmitAssignmentServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                response.sendRedirect("faces/Dashboard.jsp");
            }else{
                response.sendRedirect("faces/Dashboard.jsp");
            }
        }else{
            response.sendRedirect("faces/ErrorPage.jsp");
        }     
        
}
    
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
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
