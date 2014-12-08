/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import OGS.beans.Assignment;
import OGS.beans.Classes;
import OGS.beans.Person;
import OGS.beans.Submission;
import OGS.tables.AssignmentManager;
import OGS.tables.ClassManager;
import OGS.tables.PersonManager;
import OGS.tables.SubmissionManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Properties;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Iris
 */
@WebServlet(name = "ViewSubmissionServlet", urlPatterns = {"/ViewSubmissionServlet"})
public class ViewSubmissionServlet extends HttpServlet {

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
            out.println("<title>Servlet ViewSubmissionServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewSubmissionServlet at " + request.getContextPath() + "</h1>");
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
        Submission submission = new Submission();
        SubmissionManager SManager = new SubmissionManager();
        Assignment assignment = new Assignment();
        Classes _class = new Classes();
        Person professor = new Person();
        Person Student = new Person(); 
        Person TA = new Person();
        
        
        String Comments = request.getParameter("comments");
        double grade = Double.parseDouble(request.getParameter("grade"));
        int accessLevel = Integer.parseInt(request.getParameter("accessLevel"));        
        submission.setStudentID(request.getParameter("StudentID"));
        submission.setAssignmentID(request.getParameter("AssignmentID"));
        submission.setGrade(grade);
        submission.setGraderID(request.getParameter("GraderID"));
        submission.setComments(Comments);
        submission.setPath("default");
        submission.setDateFlag(request.getParameter("DateFlag"));
        submission.setSubmissionID(request.getParameter("SubmissionID"));
        submission.setSubmissionTime(request.getParameter("submissionTime"));
        submission.setAnswers(request.getParameter("Typed"));
        
        try {
            assignment = AssignmentManager.getRow(submission.getAssignmentID());
            _class = ClassManager.getRowbyID(assignment.getClassID());
            professor = PersonManager.getRowfromID(_class.getInstructorID());
            Student = PersonManager.getRowfromID(submission.getStudentID());
            TA = PersonManager.getRowfromID(submission.getGraderID());
            
        } catch (SQLException ex) {
            Logger.getLogger(ViewSubmissionServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ViewSubmissionServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        try {
            boolean insert = SManager.update(submission);
            String Subject = "New Assignment Market";
            String body = "The Assignment "+assignment.getNumber()+"-"+ assignment.getNumber() + 
                    "Submitted by the student " + Student.getName() +"Was marked by TA "+ TA.getName();
            if (insert == true){
                if (accessLevel == 3){
                    sendEmail(professor.getEmailAddress(),Subject,body,null, null);
                }
                 response.sendRedirect("faces/Dashboard.jsp");
            }else{
                 response.sendRedirect("faces/ErrorPage.jsp");
            }
        } catch (Exception ex) {
            Logger.getLogger(ViewSubmissionServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public static void sendEmail(String toEmail, String subject, String text, byte[] file, String name) throws MessagingException, UnsupportedEncodingException{
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com ");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
                        "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        
        Session session = Session.getDefaultInstance(props,new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("simcontrologs@gmail.com", "support1234");
                }
        });
 
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress("simcontrologs@stonybrook.edu", "GradeSmart"));
        message.setRecipients(Message.RecipientType.TO,
                        InternetAddress.parse(toEmail));
        message.setSubject(subject);

        MimeMultipart mpRoot = new MimeMultipart("mixed");  
        MimeMultipart mpContent = new MimeMultipart("alternative");  
        MimeBodyPart contentPartRoot = new MimeBodyPart();  
        contentPartRoot.setContent(mpContent);  
        mpRoot.addBodyPart(contentPartRoot);  

        //enviando texto  
        MimeBodyPart mbp1 = new MimeBodyPart();  
        mbp1.setText(text);  
        mpContent.addBodyPart(mbp1);  

        if(file != null){
                //enviando anexo  
            MimeBodyPart mbp3 = new MimeBodyPart();  
            DataSource fds = new ByteArrayDataSource(file, "text/csv");
            mbp3.setDisposition(javax.mail.Part.ATTACHMENT);  
            mbp3.setDataHandler(new DataHandler(fds));  
            mbp3.setFileName(name);  

            mpRoot.addBodyPart(mbp3); 
        }

        message.setContent(mpRoot);  
        message.saveChanges();  
        Transport.send(message);  

        System.out.println("Done");
    		
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
        processRequest(request, response);
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
