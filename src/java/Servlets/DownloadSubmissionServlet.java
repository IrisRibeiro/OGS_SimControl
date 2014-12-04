/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import OGS.beans.Assignment;
import OGS.beans.Submission;
import OGS.tables.AssignmentManager;
import OGS.tables.SubmissionManager;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Iris
 */
@WebServlet(name = "DownloadSubmissionServlet", urlPatterns = {"/DownloadSubmissionServlet"})
public class DownloadSubmissionServlet extends HttpServlet {
static final long serialVersionUID = 1L;
private static final int BUFSIZE = 4096;
private String filePath;
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
            out.println("<title>Servlet DownloadSubmissionServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DownloadSubmissionServlet at " + request.getContextPath() + "</h1>");
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
        
        String submisionNumber = request.getParameter("SubmissionID");
        String StudentID = request.getParameter("StudentID");
        
        try {
            submission = SManager.getRow(StudentID, submisionNumber);
            int fileLength = submission.getFile().available();
             String Filename = submission.getFileName();
            ServletContext context = getServletContext();
             // sets MIME type for the file download
                String mimeType = context.getMimeType(Filename);
                if (mimeType == null) {        
                    mimeType = "application/octet-stream";
                }   
                // set content properties and header attributes for the response
                response.setContentType(mimeType);
                response.setContentLength(fileLength);
                String headerKey = "Content-Disposition";
                String headerValue = String.format("attachment; filename=\"%s\"", Filename);
                response.setHeader(headerKey, headerValue);
 
                // writes the file to the client
                OutputStream outStream = response.getOutputStream();
                 
                byte[] buffer = new byte[BUFSIZE];
                int bytesRead = -1;
                 
                while ((bytesRead = submission.getFile().read(buffer)) != -1) {
                    outStream.write(buffer, 0, bytesRead);
                }
                 
                submission.getFile().close();
                outStream.close();             
           
        } catch (SQLException ex) {
            Logger.getLogger(DownloadServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DownloadServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
