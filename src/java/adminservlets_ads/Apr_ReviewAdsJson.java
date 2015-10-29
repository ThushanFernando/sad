/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adminservlets_ads;

import classes.AdminClass_Links;
import classes.AdminClass_Message;
import classes.AdminClass_ReviewAds;
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
public class Apr_ReviewAdsJson extends HttpServlet {

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
        AdminClass_ReviewAds ar = new AdminClass_ReviewAds();
        AdminClass_SendMail as = new AdminClass_SendMail();
        AdminClass_Message am = new AdminClass_Message();
        String alert = null;
        AdminClass_Links al=new AdminClass_Links();

        String reciever = ar.getUserEmail(request.getParameter("to"));
        String subject = "Approval of your ad \"" + request.getParameter("subject") + "\"";
        String view_link = "<a href='"+ al.getAdView()+"' target='blank'><p>Click here to view your advertisement</p></a>";

        String content = "Your ad \"" + request.getParameter("subject") + "\", successfully posted on Superb.lk.\n"
                + "\n"
                + "To view your ad, please click the following link. \n"
                + "If you have any questions, feel free to reply to the email and we will get back to you.\n";

        

        String inbox_content = "Hello,\n"
                + "\n"
                + "Your ad \"" + request.getParameter("subject") + "\", successfully posted on Superb.lk.\n"
                + "\n"
                + "Regards,\n"
                + "The support team at Superb.lk\n"
                + "\n";

        int inbox_result = am.sendMessage(inbox_content, request.getParameter("to"));

        String action = request.getParameter("action");
        String item = request.getParameter("item");
        int result;
        if ("Approve".equals(action) && item != null) {

            result =ar.approveAd(item);                                    //Approving advertiesment
            int mail_result = as.mailClass(reciever, subject, content, view_link);//sending mail to the user
            
            if (result == 1) {
                alert = "<button class=\"btn btn-green\">" //returning notification of the success 
                        + "<i  class=\"glyphicon glyphicon-ok-sign\">"
                        + "</i></button><br><strong>Approved!</strong>"
                        + " Advertiesment number " + request.getParameter("item") + "";

            } else {
                alert = "<button class=\"btn btn-red\">" //returning notification of the the failure
                        + "<i  class=\"glyphicon glyphicon-remove-circle\">"
                        + "</i></button><br><strong>Failed!</strong>"
                        + " Advertiesment number " + request.getParameter("item") + " Try again.";

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
