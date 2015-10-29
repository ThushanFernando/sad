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
public class AdminClass_ReportedInquiries {
   private String inquiry_id=null;
   private String reason=null;
   private String item_number=null;
   private String message_to=null;
   private String message_from=null;
   private String inquiry_message=null;
   private String inquiry_time_stamp=null;
   private String inquiry_response=null;
   private String response_time_stamp=null;
   private String reported_user=null;
   DbClass dbc=new DbClass();

    /**
     * @return the inquiry_id
     */
    public String getInquiry_id() {
        return inquiry_id;
    }

    /**
     * @param inquiry_id the inquiry_id to set
     */
    public void setInquiry_id(String inquiry_id) {
        this.inquiry_id = inquiry_id;
    }

    /**
     * @return the reason
     */
    public String getReason() {
        return reason;
    }

    /**
     * @param reason the reason to set
     */
    public void setReason(String reason) {
        this.reason = reason;
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
     * @return the message_to
     */
    public String getMessage_to() {
        return message_to;
    }

    /**
     * @param message_to the message_to to set
     */
    public void setMessage_to(String message_to) {
        this.message_to = message_to;
    }

    /**
     * @return the message_from
     */
    public String getMessage_from() {
        return message_from;
    }

    /**
     * @param message_from the message_from to set
     */
    public void setMessage_from(String message_from) {
        this.message_from = message_from;
    }

    /**
     * @return the inquiry_message
     */
    public String getInquiry_message() {
        return inquiry_message;
    }

    /**
     * @param inquiry_message the inquiry_message to set
     */
    public void setInquiry_message(String inquiry_message) {
        this.inquiry_message = inquiry_message;
    }

    /**
     * @return the inquiry_time_stamp
     */
    public String getInquiry_time_stamp() {
        return inquiry_time_stamp;
    }

    /**
     * @param inquiry_time_stamp the inquiry_time_stamp to set
     */
    public void setInquiry_time_stamp(String inquiry_time_stamp) {
        this.inquiry_time_stamp = inquiry_time_stamp;
    }

    /**
     * @return the inquiry_response
     */
    public String getInquiry_response() {
        return inquiry_response;
    }

    /**
     * @param inquiry_response the inquiry_response to set
     */
    public void setInquiry_response(String inquiry_response) {
        this.inquiry_response = inquiry_response;
    }

    /**
     * @return the response_time_stamp
     */
    public String getResponse_time_stamp() {
        return response_time_stamp;
    }

    /**
     * @param response_time_stamp the response_time_stamp to set
     */
    public void setResponse_time_stamp(String response_time_stamp) {
        this.response_time_stamp = response_time_stamp;
    }
    /**
     * @return the reported_user
     */
    public String getReported_user() {
        return reported_user;
    }

    /**
     * @param reported_user the reported_user to set
     */
    public void setReported_user(String reported_user) {
        this.reported_user = reported_user;
    }
    
     public int getInquiryReportCount(){
        int result =0;
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "SELECT COUNT(`inquiry_id`) FROM `admin_reported_inquiryview` WHERE `read_state`='0'";
            ResultSet rs=stmt.executeQuery(query);
            while(rs.next()){
                result=rs.getInt("COUNT(`inquiry_id`)");
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_ReportedItems.class.getName()).log(Level.SEVERE, null, ex);
        }
         return result;
    }
     
      public ArrayList getInquiryReports() {
        ArrayList al = new ArrayList();
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "SELECT `inquiry_id`, `item_number`, `message_to`, `message_from`, `inquiry_message`, `inquiry_time_stamp`, `inquiry_response`, `response_time_stamp` FROM `admin_reported_inquiryview` WHERE `read_state`='0'";
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
               AdminClass_ReportedInquiries ari=new AdminClass_ReportedInquiries();
               ari.setInquiry_id(rs.getString("inquiry_id"));
               ari.setItem_number(rs.getString("item_number"));
               ari.setMessage_to(rs.getString("message_to"));
               ari.setMessage_from(rs.getString("message_from"));
               ari.setInquiry_message(rs.getString("inquiry_message"));
               ari.setInquiry_time_stamp(rs.getString("inquiry_time_stamp"));
               ari.setInquiry_response(rs.getString("inquiry_response"));
               ari.setResponse_time_stamp(rs.getString("response_time_stamp"));
               al.add(ari);
                  
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_ReportedItems.class.getName()).log(Level.SEVERE, null, ex);
        }
        return al;
    }
      
      public int updateViewState(String id){
        int result =0;
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "UPDATE `admin_reported_inquiryview` SET `read_state`='1' WHERE `inquiry_id`='"+id+"'";
            result=stmt.executeUpdate(query);
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_ReportedItems.class.getName()).log(Level.SEVERE, null, ex);
        }
         return result;
    }

    
}
