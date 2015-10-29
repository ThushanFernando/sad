/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adminservlets_ads;

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
public class Rmv_ReviewAdsJson extends HttpServlet {

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

        String reciever = ar.getUserEmail(request.getParameter("to"));
        String subject = "Refusal of your Ad \"" + request.getParameter("subject") + "\"";

        String content = "Your ad \"" + request.getParameter("subject") + "\", cannot be posted on Superb.lk.\n"
                + "\n"
                + "The reason why we could not approve your ad:\n"
                + "\n"
                + "<br/><br/>- Illegal item or service\n"
                + "<br/>Your ad features an item or service that is illegal or not suitable, which we cannot allow on our site. Please post a new ad with suitable content.\n"
                + "<br/><br/>we do not allow any content that Superb.lk considers in its complete and unfettered discretion to be- \n"
                + "<br/>(i) offensive and/or inappropriate (including, without limitation, defamatory, threatening, hateful, or pornographic content);\n"
                + "\n"
                + "<br/>(ii) false, fraudulent, misleading or deceptive, or incorrect;\n"
                + "\n"
                + "<br/>(iv) Content that discloses another’s personal, confidential or proprietary information (including content that identifies a person, or that is capable of being used to identify a person without that person's consent)."
                + "\n"
                + "<br/>If you have any questions, feel free to reply to the email and we will get back to you.\n";

        String inbox_content = "Hello,\n"
                + "\n"
                + "Your ad \"" + request.getParameter("subject") + "\", cannot be posted on Superb.lk.\n"
                + "\n"
                + "The reason why we could not approve your ad:\n"
                + "\n"
                + "- Illegal item or service\n"
                + "Your ad features an item or service that is illegal or not suitable, which we cannot allow on our site. Please post a new ad with suitable content.\n"
                + "\n"
                + "Regards,\n"
                + "The support team at Superb.lk\n"
                + "\n";

        int inbox_result = am.sendMessage(inbox_content, request.getParameter("to"));

        String action = request.getParameter("action");
        String item = request.getParameter("item");

        int result;

        if (("Remove".equals(action) && item != null)) {
            result = ar.removeAd(item);                                 //removing advertiesment
            int mail_result = as.mailClass(reciever, subject, content, "");//sending mail to the user
            
            if (result == 1) {
                alert = "<button class=\"btn btn-green\">" //returning notification of the success 
                        + "<i  class=\"glyphicon glyphicon-ok-sign\">"
                        + "</i></button><br><strong>Removed!</strong>"
                        + " Advertiesment number " + request.getParameter("item") + "";
            } else {
                alert = "<button class=\"btn btn-red\">" //returning notification of the failure 
                        + "<i  class=\"glyphicon glyphicon-remove-circle\">"
                        + "</i></button><br><strong>Failed!</strong> Advertiesment number " + request.getParameter("item") + " Try again.";
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
