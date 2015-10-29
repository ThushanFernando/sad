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
 * @author SithuDewmi
 */
public class AdminClass_DetailedView {

    private String username = null;
    private String email = null;
    private String tel = null;
    private String status = null;
    private String activated_time = null;
    private String last_login = null;
    private String num_of_adds = null;
    private String registration=null;
    DbClass dbc = new DbClass();

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

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the tel
     */
    public String getTel() {
        return tel;
    }

    /**
     * @param tel the tel to set
     */
    public void setTel(String tel) {
        this.tel = tel;
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
     * @return the activated_time
     */
    public String getActivated_time() {
        return activated_time;
    }

    /**
     * @param activated_time the activated_time to set
     */
    public void setActivated_time(String activated_time) {
        this.activated_time = activated_time;
    }

    /**
     * @return the last_login
     */
    public String getLast_login() {
        return last_login;
    }

    /**
     * @param last_login the last_login to set
     */
    public void setLast_login(String last_login) {
        this.last_login = last_login;
    }

    /**
     * @return the num_of_adds
     */
    public String getNum_of_adds() {
        return num_of_adds;
    }

    /**
     * @param num_of_adds the num_of_adds to set
     */
    public void setNum_of_adds(String num_of_adds) {
        this.num_of_adds = num_of_adds;
    }
    
    /**
     * @return the registration
     */
    public String getRegistration() {
        return registration;
    }

    /**
     * @param registration the registration to set
     */
    public void setRegistration(String registration) {
        this.registration = registration;
    }

    public ArrayList userDetailedView(String user) {
        ArrayList al = new ArrayList();
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query="SELECT `username`, `email`, `voice`, `status`, `activated_time_stamp`, `registration`, `last_login`, `total_ads` FROM `userview` WHERE `username`='" + user + "'";
            
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                al.add(rs.getString("username"));
                al.add(rs.getString("email"));
                
                if(rs.getString("voice")==null){
                    al.add("-");
                }else{
                al.add(rs.getString("voice"));
                }
                al.add(rs.getString("registration"));
                al.add(rs.getString("status"));
                
                if(rs.getString("activated_time_stamp")==null){
                    al.add("Still not Activated");
                }else{
                al.add(rs.getString("activated_time_stamp"));
                }
                if(rs.getString("last_login")==null){
                    al.add("Not logged yet");
                }else{
                al.add(rs.getString("last_login"));
                }
                al.add(rs.getString("total_ads"));
                
            }
            
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_DetailedView.class.getName()).log(Level.SEVERE, null, ex);
        }
        return al;
    }
    
    public ArrayList messageDetailedView(String messageId){
        ArrayList al=new ArrayList();
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "SELECT `message_id`, `msg_to`, `msg_from`, `content`, `time_stamp` FROM `user_messages` WHERE `message_id`='"+messageId+"'";
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){
                al.add(rs.getString("message_id"));
                al.add(rs.getString("msg_from"));
                al.add(rs.getString("msg_to"));
                al.add(rs.getString("content"));
                al.add(rs.getString("time_stamp"));
                
                
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_DetailedView.class.getName()).log(Level.SEVERE, null, ex);
        }
        return al;
    }
    
    public ArrayList reportItemDetailedView(String id){
        ArrayList al=new ArrayList();
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "SELECT `item_number`, `report_id`, `reporter_email`, `report_reason`, `reporter_message`,`title` FROM `admin_reported_itemview` WHERE `report_id`='"+id+"'";
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){
                al.add(rs.getString("report_id"));
                al.add(rs.getString("reporter_email"));
                al.add(rs.getString("report_reason"));
                al.add(rs.getString("reporter_message"));
                al.add(rs.getString("item_number"));
                al.add(rs.getString("title"));
                
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_DetailedView.class.getName()).log(Level.SEVERE, null, ex);
        }
        return al;
    }
    
    public ArrayList reportInquiryDetailedView(String id){
        ArrayList al=new ArrayList();
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "SELECT `inquiry_id`, `item_number`, `message_to`, `message_from`, `inquiry_message`, `inquiry_time_stamp`, `inquiry_response`, `response_time_stamp` FROM `admin_reported_inquiryview` WHERE `inquiry_id`='"+id+"'";
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){
                al.add(rs.getString("inquiry_id"));
                al.add(rs.getString("item_number"));
                al.add(rs.getString("message_to"));
                al.add(rs.getString("message_from"));
                al.add(rs.getString("inquiry_message"));
                al.add(rs.getString("inquiry_time_stamp"));
                al.add(rs.getString("inquiry_response"));
                al.add(rs.getString("response_time_stamp"));
                
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_DetailedView.class.getName()).log(Level.SEVERE, null, ex);
        }
        return al;
    }
    
     public ArrayList reportMessageDetailedView(String id){
        ArrayList al=new ArrayList();
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "SELECT `message_id`, `sender`, `receiver`, `content`, `message_time_stamp`, `reported_time_stamp` FROM `admin_reported_messages` WHERE `message_id`='"+id+"'";
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){
                al.add(rs.getString("message_id"));
                al.add(rs.getString("sender"));
                al.add(rs.getString("receiver"));
                al.add(rs.getString("content"));
                al.add(rs.getString("message_time_stamp"));
                al.add(rs.getString("reported_time_stamp"));
                
                
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_DetailedView.class.getName()).log(Level.SEVERE, null, ex);
        }
        return al;
    }
    
    public String itemDetailedView(String id){
        String title=null;
        try {
            
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "SELECT `title` FROM `itemview` WHERE `item_number`='"+id+"' OR `title`='"+id+"'";
            ResultSet rs = stmt.executeQuery(query);
            while(rs.next()){
                title=rs.getString("title");
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_DetailedView.class.getName()).log(Level.SEVERE, null, ex);
        }
        return title;
    }

    
}

