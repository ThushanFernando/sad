/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author SithuDewmi
 */
public class AdminClass_Message {

    DbClass dbc = new DbClass();
    private String id=null;
    private String user = null;
    private String sender = null;
    private String content = null;
    private String timeStamp = null;
    private String state = null;

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
     * @return the timeStamp
     */
    public String getTimeStamp() {
        return timeStamp;
    }

    /**
     * @param timeStamp the timeStamp to set
     */
    public void setTimeStamp(String timeStamp) {
        this.timeStamp = timeStamp;
    }

    /**
     * @return the user
     */
    public String getUser() {
        return user;
    }

    /**
     * @param user the user to set
     */
    public void setUser(String user) {
        this.user = user;
    }

    /**
     * @return the state
     */
    public String getState() {
        return state;
    }

    /**
     * @param state the state to set
     */
    public void setState(String state) {
        this.state = state;
    }
    
    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }

    public ArrayList allMessages(String filter) {
       ArrayList al = new ArrayList();
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "SELECT DISTINCT(`msg_from`),`content`,`time_stamp`,`read_state` FROM `messageview` WHERE `msg_from` LIKE '%"+filter+"%' AND `msg_to`='Admin' OR `time_stamp` LIKE '%"+filter+"%' AND `msg_to`='Admin'";
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                AdminClass_Message am = new AdminClass_Message();
                am.setSender(rs.getString("msg_from"));
                am.setContent(rs.getString("content"));
                am.setTimeStamp(timeDiff(rs.getString("time_stamp")));
                am.setState(rs.getString("read_state"));
                al.add(am);
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_Message.class.getName()).log(Level.SEVERE, null, ex);
        }
        return al;
    }
    
    public String initialUserAll() {
       String iniUser=null;
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "SELECT `msg_from` FROM `messageview` WHERE `msg_to`='Admin' LIMIT 1";
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                iniUser=rs.getString("msg_from");
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_Message.class.getName()).log(Level.SEVERE, null, ex);
        }
        return iniUser;
    }

    public ArrayList readMessages() {
        ArrayList al = new ArrayList();
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "SELECT `sender`,`content`,`time_stamp` FROM `user_messages` WHERE `receiver`='Admin' AND `read_state`='1'  ORDER BY `time_stamp` DESC";
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                AdminClass_Message am = new AdminClass_Message();
                am.setSender(rs.getString("sender"));
                am.setContent(rs.getString("content"));
                am.setTimeStamp(rs.getString("time_stamp"));
                al.add(am);
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_Message.class.getName()).log(Level.SEVERE, null, ex);
        }
        return al;
    }
    
    

    public ArrayList unreadMessages() {
        ArrayList al = new ArrayList();
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "SELECT  `sender`, `content`,`time_stamp`,`receiver` FROM `user_messages` WHERE  `time_stamp` IN (SELECT MAX(`time_stamp`) FROM `user_messages` WHERE`receiver`='Admin' AND `read_state`='0' GROUP BY `sender`) ORDER BY `time_stamp` DESC";
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                AdminClass_Message am = new AdminClass_Message();
                am.setSender(rs.getString("sender"));
                am.setContent(rs.getString("content"));
                am.setTimeStamp(rs.getString("time_stamp"));
                al.add(am);
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_Message.class.getName()).log(Level.SEVERE, null, ex);
        }
        return al;
    }

    public ArrayList getConversation(String user) {
        ArrayList al = new ArrayList();
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "SELECT `message_id`,`sender`,`content`,`time_stamp` FROM `messageview` WHERE `sender`='"+user+"' AND `receiver`='Admin' OR `sender`='Admin' AND `receiver`='"+user+"' ORDER BY `time_stamp`";
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                AdminClass_Message am = new AdminClass_Message();
                am.setId(rs.getString("message_id"));
                am.setSender(rs.getString("sender"));
                am.setContent(rs.getString("content"));
                am.setTimeStamp(timeDiff(rs.getString("time_stamp")));
                al.add(am);
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_Message.class.getName()).log(Level.SEVERE, null, ex);
        }
        return al;
    }

    public int deleteMessage(String id,String type){
        int result=0; 
        String query;
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            if("sent".equals(type)){
                query = "DELETE FROM `user_messages_inbox` WHERE `message_id`='"+id+"'";
            }else{
                query = "DELETE FROM `user_messages_outbox` WHERE `message_id`='"+id+"'";
            }
            result=stmt.executeUpdate(query);
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_Message.class.getName()).log(Level.SEVERE, null, ex);
        }
         return result;
    }
    
    public int sendMessage(String content,String reciever){
        int result=0; 
        String query;
        dbc.getConnection();
        try {
            Statement stmt = dbc.conn.createStatement();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_Message.class.getName()).log(Level.SEVERE, null, ex);
        }
        dbc.endConnection();
         return result;
    }
    
    public int deleteConversation(String reciever){
        int result=0; 
        String query;
        dbc.getConnection();
        try {
            Statement stmt = dbc.conn.createStatement();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_Message.class.getName()).log(Level.SEVERE, null, ex);
        }
        dbc.endConnection();
         return result;
    }
    
     public int markAsRead(String reciever){
        int result=0; 
        String query;
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            query="UPDATE `messageview` SET `read_state`='1' WHERE `receiver`='Admin' AND `sender`='"+reciever+"'";
            result=stmt.executeUpdate(query);
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_Message.class.getName()).log(Level.SEVERE, null, ex);
        }
         return result;
    }
    
    public String timeDiff(String time) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String timeZone = "Asia/Colombo";
        format.setTimeZone(TimeZone.getTimeZone(timeZone));
        Date date = new Date();
        String dateStart = time;
        String dateStop = format.format(date);
        String result = null;
        Date d1 = null;
        Date d2 = null;

        try {
            d1 = format.parse(dateStart);
            d2 = format.parse(dateStop);

            //in milliseconds
            long diff = d2.getTime() - d1.getTime();

            long diffSeconds = diff / 1000 % 60;
            long diffMinutes = diff / (60 * 1000) % 60;
            long diffHours = diff / (60 * 60 * 1000) % 24;
            long diffDays = diff / (24 * 60 * 60 * 1000);
            if (diffSeconds < 60 && diffDays == 0 && diffHours == 0 && diffMinutes == 0) {
                result = "Just now";
            } else if (diffDays == 0 && diffHours == 0 && diffSeconds == 0) {
                result = diffMinutes + " min";

            } else if (diffDays == 0 && diffHours == 0 && diffSeconds != 0) {
                result = diffMinutes + " min " + diffSeconds + " sec";
            } else if (diffDays == 0 && diffHours != 0 && diffMinutes == 0) {
                result = diffHours + " hrs";

            } else if (diffDays == 0 && diffHours != 0 && diffMinutes != 0) {
                result = diffHours + " hrs " + diffMinutes + " min";
            } else if (diffDays != 0 && diffHours != 0 && diffDays < 8) {
                result = diffDays + " days " + diffHours + " hrs";
            } else if (diffDays != 0 && diffHours == 0 && diffDays < 8) {

                result = diffDays + " days";

            } else {
                final String OLD_FORMAT = "yyyy-MM-dd HH:mm:ss";
                final String NEW_FORMAT = "dd MMM yyyy";
                String newDateString;

                SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
                sdf.setTimeZone(TimeZone.getTimeZone(timeZone));
                Date d = sdf.parse(dateStart);
                sdf.applyPattern(NEW_FORMAT);
                newDateString = sdf.format(d);
                result = newDateString;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    

   

}
