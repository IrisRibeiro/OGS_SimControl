/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import OGS.beans.Course;
import OGS.tables.CourseManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Iris
 */
@WebServlet(name = "CreateCourseServlet", urlPatterns = {"/CreateCourseServlet"})
public class CreateCourseServlet extends HttpServlet {

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
            out.println("<title>Servlet CreateCourseServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateCourseServlet at " + request.getContextPath() + "</h1>");
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
        Course _course = new Course();
        CourseManager CManager = new CourseManager();
        String newID = "";
        String LastID = "";
        int tempID = 0;       
        
        try {
            LastID = CManager.getLastCourseID();
        } catch (SQLException ex) {
            Logger.getLogger(CreateClassServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CreateClassServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        if (LastID == null){
            LastID = "0";
        }
        tempID = Integer.parseInt(LastID) + 1;
        newID = Integer.toString(tempID);
        
        _course.setIdentifier(request.getParameter("tidentifier")); 
        _course.setCredits(Integer.parseInt(request.getParameter("tcredits")));
        _course.setWebsite(request.getParameter("twebpage"));
        _course.setName(request.getParameter("tname"));
        _course.setPrerequisites(request.getParameter("tprerequisite"));
        _course.setCourseID(newID);
       
            
        try {
            boolean insert = CManager.insert(_course);
            if (insert==true){
                response.sendRedirect("faces/Dashboard.jsp");
            }else{
                 response.sendRedirect("faces/ErrorPage.jsp");
            }
        } catch (Exception ex) {
            Logger.getLogger(CreateClassServlet.class.getName()).log(Level.SEVERE, null, ex);
             response.sendRedirect("faces/ErrorPage.jsp");
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
