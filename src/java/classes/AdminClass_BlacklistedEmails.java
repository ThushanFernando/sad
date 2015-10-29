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
public class AdminClass_BlacklistedEmails {

    private String email_address = null;
    DbClass dbc = new DbClass();

    /**
     * @return the email_address
     */
    public String getEmail_address() {
        return email_address;
    }

    /**
     * @param email_address the email_address to set
     */
    public void setEmail_address(String email_address) {
        this.email_address = email_address;
    }

    public ArrayList getBlacklistedEmails() {
        ArrayList al = new ArrayList();
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "SELECT `email_address` FROM `admin_blacklisted_emails`";
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                AdminClass_BlacklistedEmails ab = new AdminClass_BlacklistedEmails();
                ab.setEmail_address(rs.getString("email_address"));
                al.add(ab);

            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_ReportedItems.class.getName()).log(Level.SEVERE, null, ex);
        }
        return al;
    }

    public boolean getEnteredEmail(String email) {
        boolean exists = false;
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "SELECT `email_address` FROM `admin_blacklisted_emails` where `email_address`='" + email + "'";
            ResultSet rs = stmt.executeQuery(query);
            if (rs.isBeforeFirst()) {
                exists = true;
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_ReportedItems.class.getName()).log(Level.SEVERE, null, ex);
        }
        return exists;
    }

    public boolean checkUserEmail(String email) {
        boolean exists = false;
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "SELECT `email` FROM `userview` WHERE `email`='" + email + "'";
            ResultSet rs = stmt.executeQuery(query);
            if (rs.isBeforeFirst()) {
                exists = true;
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_ReportedItems.class.getName()).log(Level.SEVERE, null, ex);
        }
        return exists;
    }

    public int RemoveUser(String email) {
        int result = 0;
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "DELETE FROM `user` WHERE `email`='" + email + "'";
            result = stmt.executeUpdate(query);
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_BlockedItems.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;

    }

    public int unblockEmail(String email) {
        int result = 0;
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "DELETE FROM `admin_blacklisted_emails` WHERE `email_address`='" + email + "'";
            result = stmt.executeUpdate(query);
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_ReportedItems.class.getName()).log(Level.SEVERE, null, ex);
        }

        return result;
    }

    public int blockEmail(String email) {
        int result = 0;
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "INSERT INTO `admin_blacklisted_emails`(`email_address`) VALUES ('" + email + "')";
            result = stmt.executeUpdate(query);
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_ReportedItems.class.getName()).log(Level.SEVERE, null, ex);
        }

        return result;
    }

}
