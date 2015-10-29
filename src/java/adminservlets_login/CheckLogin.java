/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adminservlets_login;

import classes.AdminClass_LoginMethods;
import classes.AdminClass_NavbarTools;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SithuDewmi
 */
public class CheckLogin extends HttpServlet {

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
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
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
        HttpSession session = request.getSession();
        
        AdminClass_LoginMethods lm = new AdminClass_LoginMethods();
        
        boolean result = lm.checkPass(request.getParameter("uid"), request.getParameter("pass"));// checking login information
        
        if (result == true) {
            
            session.setAttribute("loggin_state", "success");
            boolean email=lm.validateEmail(request.getParameter("uid"));
            if(email==true){
                session.setAttribute("login", lm.getAdminId(request.getParameter("uid")));
            }else{
                session.setAttribute("login", request.getParameter("uid"));
            }
            
            response.sendRedirect("Dashboard");
        
        } else {
            
            session.setAttribute("loggin_state", "failed");
            String alert = "<div class=\"errorHandler alert alert-danger \">\n" //returning notification of the the failure
                    + "<button data-dismiss=\"alert\" class=\"close\">\n"
                    + "&times;\n"
                    + "</button>\n"
                    + "<strong>Error !</strong> Please check your log-in details.\n"
                    + "</div>";
            session.setAttribute("alert", alert);
            response.sendRedirect("superb_admin.jsp");
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
