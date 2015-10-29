/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adminservlets;

import classes.AdminClass_Overviewstats;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SithuDewmi
 */
public class Dashboard extends HttpServlet {

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
        HttpSession session = request.getSession();
        if (session.getAttribute("loggin_state") == "success") {                //checking logged in status
            AdminClass_Overviewstats ao = new AdminClass_Overviewstats();

            ArrayList categoriesPresentage = ao.categoriesPresentage();
            request.setAttribute("categoriesPresentage", categoriesPresentage); //getting categories precentage

            ArrayList pagevisitMonth = ao.pagevisitMonth();                     //getting monthly page visit
            request.setAttribute("pagevisitMonth", pagevisitMonth);

            ArrayList usersMonth = ao.usersMonth();                             //getting monthly users
            request.setAttribute("usersMonth", usersMonth);

            ArrayList adsMonth = ao.adsMonth();                                 //getting monthly ads
            request.setAttribute("adsMonth", adsMonth);

            ArrayList pagevisitYear = ao.pagevisitYear();                       //getting yearly page visit
            request.setAttribute("pagevisitYear", pagevisitYear);

            ArrayList usersYear = ao.usersYear();                               //getting yearly users
            request.setAttribute("usersYear", usersYear);

            ArrayList adsYear = ao.adsYear();                                   //getting yearly ads
            request.setAttribute("adsYear", adsYear);

            ArrayList adsDistrict = ao.adsDistricts();                          //getting district ads
            request.setAttribute("adsDistrict", adsDistrict);

            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);

        } else {
            response.sendRedirect("superb_admin.jsp");
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
