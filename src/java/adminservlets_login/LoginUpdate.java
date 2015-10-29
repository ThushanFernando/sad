/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adminservlets_login;

import classes.AdminClass_LoginMethods;
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
public class LoginUpdate extends HttpServlet {

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
        Enumeration<String> parameterNames = request.getParameterNames();       //checking for unappropriate parameters
        if (parameterNames.hasMoreElements()) {
            processRequest(request, response);
        } else {
            doPost(request, response);
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
        HttpSession session = request.getSession();
        if (session.getAttribute("loggin_state") == "success") {                //checking logged in status

            boolean result;

            AdminClass_LoginMethods lm = new AdminClass_LoginMethods();

            if ("".equals(request.getParameter("usernamenew"))) {
                
                result = lm.updateAdminCustom((String) session.getAttribute("login"), request.getParameter("password"));//update admin password
                if (result == true) {
                    
                    session.setAttribute("loggin_state", "failed");
                    String alert = "<div class='alert alert-success'>\n"      //returning notification of the success 
                            + "<button data-dismiss='alert' class='close'>\n"
                            + "&times;\n"
                            + "</button>\n"
                            + "<i class='fa fa-check-circle'></i>\n"
                            + "<strong>Success !</strong> Login details are upto date, Please log-in again.\n"
                            + "</div>";
                    session.setAttribute("alert", alert);
                    response.sendRedirect("superb_admin.jsp");
                
                } else {
                    
                    String alert = "<button class='btn btn-red'>"             //returning notification of the failure
                            + "<i  class='glyphicon glyphicon-remove-circle'>"
                            + "</i></button><strong> Note! </strong>"
                            + "<br><li>Password must contain at least 8-30 characters, including UPPER/lowercase and number. Special characters '$', '@', '_', '#' only.</li>";
                    session.setAttribute("alert", alert);
                    session.setAttribute("login_change", "true");
                    response.sendRedirect("LoginChange");
                }
            
            } else {
                String res = lm.updateAdmin((String) session.getAttribute("login"), request.getParameter("usernamenew"), request.getParameter("password"));//update admin username and password

                if ("success".equals(res)) {
                    
                    session.setAttribute("loggin_state", "failed");             //returning notification of the success 
                    String alert = "<div class='alert alert-success'>\n"
                            + "<button data-dismiss='alert' class='close'>\n"
                            + "&times;\n"
                            + "</button>\n"
                            + "<i class='fa fa-check-circle'></i>\n"
                            + "<strong>Success !</strong> Login details are upto date, Please log-in again.\n"
                            + "</div>";
                    session.setAttribute("alert", alert);
                    response.sendRedirect("superb_admin.jsp");
                
                } else if ("unavailable".equals(res)) {
                    
                    String alert = "<button class='btn btn-red'>"             //returning notification of the failure 
                            + "<i  class='glyphicon glyphicon-remove-circle'>"
                            + "</i></button><strong> Failed! </strong><li>User name is not available.</li>";

                    session.setAttribute("alert", alert);
                    session.setAttribute("login_change", "true");
                    response.sendRedirect("LoginChange");
                
                } else {
                    
                    String alert = "<button class='btn btn-red'>"             //returning notification of the failure 
                            + "<i  class='glyphicon glyphicon-remove-circle'>"
                            + "</i></button><strong> Note! </strong>"
                            + "<br><li>Password must contain at least 8-30 characters, including UPPER/lowercase and number. Special characters '$', '@', '_', '#' only.</li>"
                            + "<br><li>User name must contain at least 8-20 characters.</li>";

                    session.setAttribute("alert", alert);
                    session.setAttribute("login_change", "true");
                    response.sendRedirect("LoginChange");
                }

            }
        } else {
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
