/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Indunil
 */
public class AdminClass_ReportedItems {

    private String report_id = null;
    private String item_number = null;
    private String reporter_email = null;
    private String report_reason = null;
    private String reporter_message = null;
    private String title = null;
    private String status = null;
    private String username=null;
    DbClass dbc = new DbClass();

    /**
     * @return the report_id
     */
    public String getReport_id() {
        return report_id;
    }

    /**
     * @param report_id the report_id to set
     */
    public void setReport_id(String report_id) {
        this.report_id = report_id;
    }

    /**
     * @return the item_number
     */
    public String getItem_number() {
        return item_number;
    }

    /**
     * @param item_number the item_number to set
     */
    public void setItem_number(String item_number) {
        this.item_number = item_number;
    }

    /**
     * @return the reporter_email
     */
    public String getReporter_email() {
        return reporter_email;
    }

    /**
     * @param reporter_email the reporter_email to set
     */
    public void setReporter_email(String reporter_email) {
        this.reporter_email = reporter_email;
    }

    /**
     * @return the report_reason
     */
    public String getReport_reason() {
        return report_reason;
    }

    /**
     * @param report_reason the report_reason to set
     */
    public void setReport_reason(String report_reason) {
        this.report_reason = report_reason;
    }

    /**
     * @return the reporter_message
     */
    public String getReporter_message() {
        return reporter_message;
    }

    /**
     * @param reporter_message the reporter_message to set
     */
    public void setReporter_message(String reporter_message) {
        this.reporter_message = reporter_message;
    }

    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }
    
    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }
    

    public ArrayList getItemReports() {
        ArrayList al = new ArrayList();
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "SELECT `item_number`, `report_id`, `reporter_email`, `report_reason`, `reporter_message`, `status`, `title`,`username` FROM `admin_reported_itemview` WHERE  `read_state`='0'  AND `status`='Active'";
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                AdminClass_ReportedItems ar = new AdminClass_ReportedItems();
                ar.setReport_id(rs.getString("report_id"));
                ar.setItem_number(rs.getString("item_number"));
                ar.setStatus(rs.getString("status"));
                ar.setTitle(rs.getString("title"));
                ar.setReporter_email(rs.getString("reporter_email"));
                ar.setReport_reason(rs.getString("report_reason"));
                ar.setReporter_message(rs.getString("reporter_message"));
                ar.setUsername(rs.getString("username"));
                al.add(ar);
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_ReportedItems.class.getName()).log(Level.SEVERE, null, ex);
        }
        return al;
    }
    
    public String getUserEmail(String user){
        String email=null;
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "SELECT `email` FROM `user` WHERE `username`='"+user+"'";
            ResultSet rs=stmt.executeQuery(query);
            while(rs.next()){
                email=rs.getString("email");
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_ReviewAds.class.getName()).log(Level.SEVERE, null, ex);
        }
        return email;
    }
    
    public int updateViewState(String id){
        int result =0;
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "UPDATE `admin_reported_itemview` SET `read_state`='1' WHERE `report_id`='"+id+"'";
            result=stmt.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_ReportedItems.class.getName()).log(Level.SEVERE, null, ex);
        }
         return result;
    }
    
    public int getItemReportCount(){
        int result =0;
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "SELECT COUNT(`report_id`) FROM `admin_reported_itemview` WHERE `read_state`='0' AND `status`='Active'";
            ResultSet rs=stmt.executeQuery(query);
            while(rs.next()){
                result=rs.getInt("COUNT(`report_id`)");
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_ReportedItems.class.getName()).log(Level.SEVERE, null, ex);
        }
         return result;
    }

    
    

}
