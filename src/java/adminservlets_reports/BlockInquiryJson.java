/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adminservlets_reports;

import classes.AdminClass_BlockedInquiries;
import classes.AdminClass_Message;
import classes.AdminClass_ReportedInquiries;
import classes.AdminClass_ReportedItems;
import classes.AdminClass_ReportedMessages;
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
public class BlockInquiryJson extends HttpServlet {

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
        AdminClass_ReportedMessages arm = new AdminClass_ReportedMessages();
        AdminClass_ReportedInquiries ari = new AdminClass_ReportedInquiries();
        AdminClass_Message am = new AdminClass_Message();
        String alert=null;

        if (request.getParameter("toBI") != null && request.getParameter("inquiryBI") != null) {

            AdminClass_BlockedInquiries ab = new AdminClass_BlockedInquiries();

            String inbox_content = "Hello,\n"
                    + "\n"
                    + "Your Inquiry \"" + request.getParameter("inquiry_contentBI") + "\" in superb.lk is  disabled due to policy violations.\n\n"
                    + "Policy violations cause accounts to be suspended.\n"
                    + "\n\n"
                    + "Regards,\n"
                    + "The support team at Superb.lk\n";

            int inbox_result = am.sendMessage(inbox_content, request.getParameter("toBI"));

            int result = ab.blockInquiries(request.getParameter("inquiryBI"));//blocking inquiry

            if (result == 1) {

                 alert = "<button class=\"btn btn-green\">" //returning notification of the success 
                        + "<i  class=\"glyphicon glyphicon-ok-sign\">"
                        + "</i></button><br><strong>Blocked !</strong>"
                        + "  Inquiry id " + request.getParameter("inquiryBI") + "";
                
            } else {
                 alert = "<button class=\"btn btn-red\">" //returning notification of the failure 
                        + "<i  class=\"glyphicon glyphicon-remove-circle\">"
                        + "</i></button><br><strong>Failed!</strong>"
                        + " Inquiry id " + request.getParameter("inquiryBI") + " Try again.";
                
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
