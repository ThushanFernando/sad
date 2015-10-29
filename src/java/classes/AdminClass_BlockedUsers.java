/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author SithuDewmi
 */
public class AdminClass_BlockedUsers {
    DbClass dbc = new DbClass();

    public int RemoveUser(String user) {
        int result=0;
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "DELETE FROM `user` WHERE `username`='"+user+"'";
            result=stmt.executeUpdate(query);
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_BlockedItems.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;

    }
    
    public int BlacklistUser(String user) {
        int result=0;
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "INSERT INTO `admin_blacklisted_emails`(`email_address`) VALUES ('"+user+"')";
            result=stmt.executeUpdate(query);
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_BlockedItems.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;

    }
    
}
