/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adminservlets_reports;

import classes.AdminClass_BlockedUsers;
import classes.AdminClass_Links;
import classes.AdminClass_ReportedItems;
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
public class BlockAdUserJson extends HttpServlet {

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
        AdminClass_ReportedItems art = new AdminClass_ReportedItems();
        AdminClass_SendMail as = new AdminClass_SendMail();
        AdminClass_Links al=new AdminClass_Links();
        String alert = null;

        if (request.getParameter("toBU") != null && request.getParameter("reportBU") != null) {

            AdminClass_BlockedUsers ab = new AdminClass_BlockedUsers();

            String reciever = art.getUserEmail(request.getParameter("toBU"));
            String subject = "About temporarily disabeling your account";

            String content = "Your account in Superb.lk is temporarily disabled due to invalid activity or policy violations.\n\n"
                    + "Visit the link for common reasons and policy violations cause accounts to be suspended.\n";

            String link = "<a href='" + al.getPolicies() + "' target='blank'><p>Click here to view our privacy ploicies</p></a>";

            

            int result1 = ab.RemoveUser(request.getParameter("toBU"));      //removing user
            int result2 = ab.BlacklistUser(reciever);                       //Blacklisting user
            int mail_result = as.mailClass(reciever, subject, content, link);//sending mail to the user

            if (result1 == 1 && result2 == 1) {

                alert = "<button class=\"btn btn-green\">" //returning notification of the success 
                        + "<i  class=\"glyphicon glyphicon-ok-sign\">"
                        + "</i></button><br><strong>Blocked !</strong>"
                        + "  User " + reciever + "  ";

            } else {

                alert = "<button class=\"btn btn-red\">" //returning notification of the failure 
                        + "<i  class=\"glyphicon glyphicon-remove-circle\">"
                        + "</i></button><br><strong>Failed!</strong>"
                        + " User " + reciever + " Try again.";

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
