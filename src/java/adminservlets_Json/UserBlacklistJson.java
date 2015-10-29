/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adminservlets_Json;

import classes.AdminClass_BlacklistedEmails;
import classes.AdminClass_Links;
import classes.AdminClass_SendMail;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SithuDewmi
 */
public class UserBlacklistJson extends HttpServlet {

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
        AdminClass_BlacklistedEmails ab = new AdminClass_BlacklistedEmails();
        AdminClass_SendMail as = new AdminClass_SendMail();
        AdminClass_Links al=new AdminClass_Links();
        String alert = null;
        if (request.getParameter("email_unblock") != null) {                //checking blacklist action
            boolean exists = ab.getEnteredEmail(request.getParameter("email_unblock"));//checking exsistence

            if (exists == true) {
                int result = ab.unblockEmail(request.getParameter("email_unblock"));//unblacklist an email

                if (result == 1) {                                          //returning notification of the success
                    alert = "<button class=\"btn btn-green\"><i  class=\""
                            + "glyphicon glyphicon-ok-sign\"></i></button><br><strong>"
                            + "Unblocked !</strong> Email- " + request.getParameter("email_unblock") + "";

                } else {
                    alert = "<button class=\"btn btn-red\">" //returning notification of the failure
                            + "<i  class=\"glyphicon glyphicon-remove-circle\"></i></button><br><strong>"
                            + "Failed !</strong> Email- " + request.getParameter("email_unblock") + "";

                }

            } else {                                                        //returning notification of the failure
                alert = "<button class=\"btn btn-red\"><i  class=\""
                        + "glyphicon glyphicon-remove-circle\"></i></button><br><strong>"
                        + "Failed !</strong> Email- " + request.getParameter("email_unblock") + " "
                        + "Does not exsist in the list";

            }

        } else if (request.getParameter("email_block") != null) {           //checking if the email is null
            boolean exists = ab.getEnteredEmail(request.getParameter("email_block"));//checking if the email is already blacklisted

            if (exists == true) {                                           //returning notification of  the failure
                alert = "<button class=\"btn btn-red\"><i  class=\""
                        + "glyphicon glyphicon-remove-circle\"></i></button><br><strong>"
                        + "Failed !</strong> Email- " + request.getParameter("email_block") + " "
                        + "is already blacklisted";

            } else {
                boolean exsist = ab.checkUserEmail(request.getParameter("email_block")); //check for current user
                if (exsist == true) {

                    ab.RemoveUser(request.getParameter("email_block"));     //remove current user content
                }
                int result = ab.blockEmail(request.getParameter("email_block")); //blacklisting an email

                String subject = "About temporarily disabeling your account";

                String content = "Your account in Superb.lk is temporarily disabled due to invalid activity or policy violations.\n\n"
                        + "Visit the link for common reasons and policy violations cause accounts to be suspended.\n";

                String link="<a href='"+al.getPolicies()+"' target='blank'><p>Click here to view our privacy ploicies</p></a>";
                int mail_result = as.mailClass(request.getParameter("email_block"), subject, content, link);//sending mail to the user

                if (result == 1) {                                          //returning notification of the success 
                    alert = "<button class=\"btn btn-green\"><i  class=\""
                            + "glyphicon glyphicon-ok-sign\"></i></button><br><strong>"
                            + "Blocked !</strong> Email- " + request.getParameter("email_block") + "";

                } else {
                    alert = "<button class=\"btn btn-red\"><i  class=\""
                            + "glyphicon glyphicon-remove-circle\"></i></button><br><strong>"
                            + "Failed !</strong> Email- " + request.getParameter("email_block") + "";

                }

            }
        }

        PrintWriter out = response.getWriter();

        Gson gson = new Gson();
        JsonObject myObj = new JsonObject();

        myObj.addProperty("result", alert);

        out.write(myObj.toString());
        out.close();
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
