/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import OGS.beans.Classes;
import OGS.beans.Course;
import OGS.beans.Person;
import OGS.beans.TACourse;
import OGS.tables.ClassManager;
import OGS.tables.CourseManager;
import OGS.tables.PersonManager;
import OGS.tables.TACourseManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Properties;
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
@WebServlet(name = "AppointTAServlet", urlPatterns = {"/AppointTAServlet"})
public class AppointTAServlet extends HttpServlet {

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
            out.println("<title>Servlet AppointTAServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AppointTAServlet at " + request.getContextPath() + "</h1>");
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
        TACourseManager TAManager = new TACourseManager();
        Person Persontmp = new Person();
        Person Professor = new Person();
        Person Newta = new Person();
        TACourse TA = new TACourse();
        TACourse TAtmp = new TACourse();
        Classes _class = new Classes();
        Course course = new Course();
        
        String lastPersonID = "";
        String Subject = "You Were appointed as a TA";
        String taID = request.getParameter("StudentID");
        String[] ta = taID.split("-");
        taID =   ta[0];
        String ClassID = request.getParameter("ClassID");
        String[] Class = ClassID.split("-");
        ClassID = Class[0];
        boolean insert = false;
        String message = "";
        int tmpID = 0;
        String ProfessorId =  request.getParameter("ProfessorID");
        TA.setClassID(ClassID);
        TA.setTAID(taID);
        
        try {
            Persontmp = PersonManager.getRowfromID(taID);
            if (Persontmp.getAccessLevel() == 2){
                TAtmp = TAManager.getRowwithID(taID,ClassID);
                if (TAtmp == null){
                    insert = TAManager.insert(TA);
                    if (insert == true){
                        message = "TA successfully appointed";
                    }
                }else{
                 message = "TA was already associated with that class";
                
                }
            }else if (Persontmp.getAccessLevel() == 1){
                lastPersonID = PersonManager.getLastPersonID();
                tmpID = Integer.parseInt(lastPersonID) + 1;
                lastPersonID = Integer.toString(tmpID);                
                
                Newta.setID(lastPersonID);
                Newta.setName(Persontmp.getName());
                Newta.setEmailAddress(Persontmp.getEmailAddress());
                Newta.setPassword(Persontmp.getPassword());
                Newta.setUserName(Persontmp.getUserName()+"TA");
                Newta.setAccessLevel(2);
                Newta.setType("T");
                insert = PersonManager.insert(Newta);
                Professor = PersonManager.getRowfromID(ProfessorId);
                _class = ClassManager.getRowbyID(ClassID);
                course = CourseManager.getRow(_class.getCourseID());
                
                String body = "Professor "+ Professor.getName()+ "Appointed you as the TA for the Class " + course.getIdentifier() + "- "+ course.getName()+
                        "Your Password remains the same but your new UserName is: "+ Newta.getUserName() ;
                if (insert == true){
                    TAtmp = TAManager.getRowwithID(taID,ClassID);
                    if (TAtmp == null){
                        insert = false;
                        insert = TAManager.insert(TA);
                        
                        if (insert == true){
                            message = "TA successfully appointed an email was sent to him with hiw new information";
                            sendEmail(Persontmp.getEmailAddress(),Subject, body, null, null);
                        }
                    }else{
                        message = "TA was already associated with that class";
                        
                    }
                }
            }
            
            
            request.setAttribute("message", message);
            request.getRequestDispatcher("/Response.jsp").forward(request, response);  
            response.sendRedirect("faces/Response.jsp");
        } catch (Exception ex) {
            Logger.getLogger(AppointTAServlet.class.getName()).log(Level.SEVERE, null, ex);
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
