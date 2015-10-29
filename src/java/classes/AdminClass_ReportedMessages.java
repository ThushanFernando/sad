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
public class AdminClass_ReportedMessages {
    private String message_id=null;
    private String sender=null; 
    private String receiver=null;
    private String content=null;
    private String message_time_stamp=null;
    private String reported_time_stamp=null;
    private String reason=null;
    DbClass dbc=new DbClass();

    /**
     * @return the message_id
     */
    public String getMessage_id() {
        return message_id;
    }

    /**
     * @param message_id the message_id to set
     */
    public void setMessage_id(String message_id) {
        this.message_id = message_id;
    }

    /**
     * @return the sender
     */
    public String getSender() {
        return sender;
    }

    /**
     * @param sender the sender to set
     */
    public void setSender(String sender) {
        this.sender = sender;
    }

    /**
     * @return the receiver
     */
    public String getReceiver() {
        return receiver;
    }

    /**
     * @param receiver the receiver to set
     */
    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    /**
     * @return the content
     */
    public String getContent() {
        return content;
    }

    /**
     * @param content the content to set
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * @return the message_time_stamp
     */
    public String getMessage_time_stamp() {
        return message_time_stamp;
    }

    /**
     * @param message_time_stamp the message_time_stamp to set
     */
    public void setMessage_time_stamp(String message_time_stamp) {
        this.message_time_stamp = message_time_stamp;
    }

    /**
     * @return the reported_time_stamp
     */
    public String getReported_time_stamp() {
        return reported_time_stamp;
    }

    /**
     * @param reported_time_stamp the reported_time_stamp to set
     */
    public void setReported_time_stamp(String reported_time_stamp) {
        this.reported_time_stamp = reported_time_stamp;
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
    
    public int getMessageReportCount(){
        int result =0;
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "SELECT COUNT(`message_id`) FROM `admin_reported_messages` WHERE `read_state`='0'";
            ResultSet rs=stmt.executeQuery(query);
            while(rs.next()){
                result=rs.getInt("COUNT(`message_id`)");
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_ReportedItems.class.getName()).log(Level.SEVERE, null, ex);
        }
         return result;
    }
    
    public ArrayList getMessageReports() {
        ArrayList al = new ArrayList();
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "SELECT `message_id`, `sender`, `receiver`, `content`, `message_time_stamp`,  `reported_time_stamp` FROM `admin_reported_messages` WHERE `read_state`='0'";
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                AdminClass_ReportedMessages arm=new AdminClass_ReportedMessages();
                arm.setMessage_id(rs.getString("message_id"));
                arm.setSender(rs.getString("sender"));
                arm.setReceiver(rs.getString("receiver"));
                arm.setContent(rs.getString("content"));
                arm.setMessage_time_stamp(rs.getString("message_time_stamp"));
                arm.setReported_time_stamp(rs.getString("reported_time_stamp"));
                al.add(arm);
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
            String query = "UPDATE `admin_reported_messages` SET `read_state`='1' WHERE `message_id`='"+id+"'";
            result=stmt.executeUpdate(query);
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_ReportedItems.class.getName()).log(Level.SEVERE, null, ex);
        }
         return result;
    }
    
}
