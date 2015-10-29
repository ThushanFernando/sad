/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adminservlets_Json;

import classes.AdminClass_Message;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SithuDewmi
 */
public class MsgJson extends HttpServlet {

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
        AdminClass_Message am = new AdminClass_Message();
        String filter;
        if (request.getParameter("filter") == null) {
            filter = " ";
        } else {
            filter = request.getParameter("filter");
        }

        ArrayList al = am.allMessages(filter);
        Iterator itr = al.iterator();
        AdminClass_Message received = null;
        PrintWriter out = response.getWriter();

        Gson gson = new Gson();
        JsonObject myObj = new JsonObject();

        out.write(myObj.toString());
        out.close();
        while (itr.hasNext()) {
            Object a = itr.next();
            received = (AdminClass_Message) a;
            if (request.getParameter("sid") == null || "".equals(request.getParameter("sid"))) {
                String time = received.getTimeStamp();
                if ("0".equals(received.getState())) {
                    myObj.addProperty("sender", (String) received.getSender());
                    myObj.addProperty("content", (String) received.getContent());
                    myObj.addProperty("time", (String) time);
                    myObj.addProperty("status", "style=\"background-color:#E2DEE3;\"");

                } else {
                    myObj.addProperty("sender", (String) received.getSender());
                    myObj.addProperty("content", (String) received.getContent());
                    myObj.addProperty("time", (String) time);
                    myObj.addProperty("status", "");

                }
            } else {
                if (received.getSender().contains(request.getParameter("sid"))) {
                    String time = am.timeDiff(received.getTimeStamp());
                    if ("0".equals(received.getState())) {
                        myObj.addProperty("sender", (String) received.getSender());
                        myObj.addProperty("content", (String) received.getContent());
                        myObj.addProperty("time", (String) time);
                        myObj.addProperty("status", "style=\"background-color:#E2DEE3;\"");

                    } else {
                        myObj.addProperty("sender", (String) received.getSender());
                        myObj.addProperty("content", (String) received.getContent());
                        myObj.addProperty("time", (String) time);
                        myObj.addProperty("status", "");

                    }

                }
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
