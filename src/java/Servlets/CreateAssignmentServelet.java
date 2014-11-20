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
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
/**
 *
 * @author zainul101
 */

@WebServlet(name = "CreateAssignmentServelet", urlPatterns = {"/CreateAssignmentServelet"})
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
            throws ServletException, IOException 
    {
        Assignment assign= new Assignment();
        AssignmentManager man= new AssignmentManager();
        String newId="";
        int idValue=0;
        try {
            newId = man.getAssignmentNumber();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CreateAssignmentServelet.class.getName()).log(Level.SEVERE, null, ex);
        }
        if(newId!=null)
        {
       idValue =Integer.parseInt(newId);
        }
        else
        {
            idValue=1;
        }
       
       
       assign.setID(idValue);
       String name=request.getParameter("assignName");
       assign.setName(name);
       String dueDate=request.getParameter("dDate");
       
       DateFormat formatter = new SimpleDateFormat("dd-MM");
       java.util.Date date = null;
        try {
            date = formatter.parse(dueDate);
        } catch (ParseException ex) {
            Logger.getLogger(CreateAssignmentServelet.class.getName()).log(Level.SEVERE, null, ex);
        }
       
       java.util.Date utilDate = new java.util.Date();//date;
       java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
       assign.setDueDate(sqlDate);
       String specs=request.getParameter("specs");
       assign.setSpecification(specs);
       String instructions=request.getParameter("instrucstions");
       assign.setInstructions(instructions);
       int points=Integer.parseInt(request.getParameter("points"));
       assign.setPointsPossible(points);
        boolean check=false;
        try {
            check= man.insert(assign);
        } catch (Exception ex) {
            Logger.getLogger(CreateAssignmentServelet.class.getName()).log(Level.SEVERE, null, ex);
        }
       if (check == true){  
                response.sendRedirect("Dashboard.jsp");

            }else{
                response.sendRedirect("ErrorPage.jsp");
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
            throws ServletException, IOException
    {
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
