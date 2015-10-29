/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author SithuDewmi
 */
public class AdminClass_BlockedMessages {
    DbClass dbc=new DbClass();
    public int blockMessage(String id){
        int result =0;
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "UPDATE `messageview` SET `content`='Message content blocked permanently due to our privacy policies' WHERE `message_id`='"+id+"'";
            result=stmt.executeUpdate(query);
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_ReportedItems.class.getName()).log(Level.SEVERE, null, ex);
        }
         return result;
    }
    
}
