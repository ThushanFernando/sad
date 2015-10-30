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
 * @author Asus
 */
public class AdminClass_CurrentState {

    DbClass dbc = new DbClass();

    public void updateState() {
        String state = null;
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "SELECT `current_state` FROM `user_current_state` WHERE `username`='Admin'";
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                state = rs.getString("current_state");
            }
            if ("Online".equals(state)) {
                query = "UPDATE `user_current_state` SET `last_seen`=now() WHERE `username`='Admin'";
                int result = stmt.executeUpdate(query);
            }

            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_CurrentState.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean getState() {
        boolean state = false;
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "SELECT `current_state` FROM `user_current_state` WHERE `username`='Admin'";
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                if ("Online".equals(rs.getString("current_state"))) {
                    state=true;
                }
            }

            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_CurrentState.class.getName()).log(Level.SEVERE, null, ex);
        }
        return state;
    }

    public void setOnline() {
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "UPDATE `user_current_state` SET `current_state`='Online' WHERE `username`='Admin'";
            int result = stmt.executeUpdate(query);

            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_CurrentState.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void setOffline() {
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "UPDATE `user_current_state` SET `current_state`='Offline' WHERE `username`='Admin'";
            int result = stmt.executeUpdate(query);

            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_CurrentState.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
