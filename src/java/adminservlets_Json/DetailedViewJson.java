/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adminservlets_Json;

import classes.AdminClass_DetailedView;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SithuDewmi
 */
public class DetailedViewJson extends HttpServlet {

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
        String id = request.getParameter("id");
        ArrayList al;
        AdminClass_DetailedView ad = new AdminClass_DetailedView();
        PrintWriter out = response.getWriter();

        Gson gson = new Gson();
        JsonObject myObj = new JsonObject();

        if ("U".equals(String.valueOf(id.charAt(0)))) {

            al = ad.userDetailedView(id.substring(1));

            myObj.addProperty("username", (String) al.get(0));
            myObj.addProperty("email", (String) al.get(1));
            myObj.addProperty("tel", (String) al.get(2));
            myObj.addProperty("reg", (String) al.get(3));
            myObj.addProperty("status", (String) al.get(4));
            myObj.addProperty("activation", (String) al.get(5));
            myObj.addProperty("login", (String) al.get(6));
            myObj.addProperty("ads", (String) al.get(7));

        } else if ("M".equals(String.valueOf(id.charAt(0)))) {

            al = ad.messageDetailedView(id.substring(1));
            myObj.addProperty("id", (String) al.get(0));
            myObj.addProperty("sender", (String) al.get(1));
            myObj.addProperty("reciever", (String) al.get(2));
            myObj.addProperty("content", (String) al.get(3));
            myObj.addProperty("time", (String) al.get(4));

        } else if ("1".equals(String.valueOf(id.charAt(0)))) {

            al = ad.reportItemDetailedView(id.substring(1));
            myObj.addProperty("id", (String) al.get(0));
            myObj.addProperty("email", (String) al.get(1));
            myObj.addProperty("reason", (String) al.get(2));
            myObj.addProperty("message", (String) al.get(3));
            myObj.addProperty("item", (String) al.get(4));
            myObj.addProperty("title", (String) al.get(5));

        } else if ("2".equals(String.valueOf(id.charAt(0)))) {
            al = ad.reportInquiryDetailedView(id.substring(1));
            myObj.addProperty("id", (String) al.get(0));
            myObj.addProperty("item", (String) al.get(1));
            myObj.addProperty("message_to", (String) al.get(2));
            myObj.addProperty("message_from", (String) al.get(3));
            myObj.addProperty("message", (String) al.get(4));
            myObj.addProperty("message_time", (String) al.get(5));
            myObj.addProperty("response", (String) al.get(6));
            myObj.addProperty("response_time", (String) al.get(7));

        } else if ("3".equals(String.valueOf(id.charAt(0)))) {
            al = ad.reportMessageDetailedView(id.substring(1));
            myObj.addProperty("id", (String) al.get(0));
            myObj.addProperty("sender", (String) al.get(1));
            myObj.addProperty("reciever", (String) al.get(2));
            myObj.addProperty("content", (String) al.get(3));
            myObj.addProperty("message_time", (String) al.get(4));
            myObj.addProperty("reported_time", (String) al.get(5));

        } else {
            String tilte = ad.itemDetailedView(String.valueOf(id.substring(1)));
            myObj.addProperty("id", tilte);

        }
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
