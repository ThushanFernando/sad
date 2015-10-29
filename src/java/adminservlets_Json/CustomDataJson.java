/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adminservlets_Json;

import classes.AdminClass_Overviewstats;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SithuDewmi
 */
public class CustomDataJson extends HttpServlet {

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
        String fd = request.getParameter("fd");
        String sd = request.getParameter("sd");
        String result;
        AdminClass_Overviewstats ao = new AdminClass_Overviewstats();
        boolean checkFD = ao.isValidDate(fd);
        boolean checkSD = ao.isValidDate(sd);

        if (checkFD == true && checkSD == true) {
            ArrayList al = ao.pagevisitCustom(fd, sd);
            DecimalFormat twoDForm = new DecimalFormat("#.#");
            if (al.get(1).equals("0")) {
                result = "Site visit: " + (String) al.get(1) + " Percentage: 0%";
            } else {
                result = "Site visit: " + (String) al.get(1) + " Percentage: " + twoDForm.format(Float.parseFloat((String) al.get(1)) / Float.parseFloat((String) al.get(0)) * 100) + "%";
            }

        } else {
            result = "Incorrect entry";
        }
        PrintWriter out = response.getWriter();

        Gson gson = new Gson();
        JsonObject myObj = new JsonObject();
        
        myObj.addProperty("result", result);
        

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
