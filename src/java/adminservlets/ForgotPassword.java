/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adminservlets;

import classes.AdminClass_LoginMethods;
import classes.AdminClass_SendMail;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class ForgotPassword extends HttpServlet {

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
        Enumeration<String> parameterNames = request.getParameterNames();
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
        response.setContentType("text/xml");
        response.setCharacterEncoding("UTF-8");
        if (request.getParameter("email") != null) {                            //checking if the email is null
            AdminClass_LoginMethods lm = new AdminClass_LoginMethods();

            ArrayList al = lm.checkAdmin(request.getParameter("email"));        //getting admin loggin details
            if (al != null) {

                AdminClass_SendMail sm = new AdminClass_SendMail();
                String reciever = request.getParameter("email");
                String subject = "www.superb.lk - Admin password recovery";
                String content = "Someone requested that the password be "
                        + "recovered for the following site:\n"
                        + "\n"
                        + "http://superb.lk/ \n"
                        + "\n"
                        + "Username: '" + al.get(0) + "'\n"
                        + "\n"
                        + "Password: '" + al.get(1) + "'\n"
                        + "\n"
                        + "If this was a mistake, just ignore this email and "
                        + "nothing will happen.\n"
                        + "\n"
                        + "To re-enter your password, visit the following "
                        + "address:\n"
                        + "\n"
                        + "<http://localhost:8080/ClassifiedSiteProject/superb_"
                        + "admin.jsp>\n"
                        + "Thank you";
                int result = sm.mailClass(reciever, subject, content,null);          //sending email to the admin          

            } else {
                String content = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
                        + "<values>\n"
                        + "	<value>\n"
                        + "		<result>failed</result>\n"
                        + "	</value>\n"
                        + "</values>";

                response.getWriter().write(content);
            }

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
