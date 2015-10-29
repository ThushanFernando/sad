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
import java.util.regex.Pattern;

/**
 *
 * @author SithuDewmi
 */
public class AdminClass_LoginMethods {

    DbClass dbc = new DbClass();
    private String username = null;
    private String pass = null;

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
     * @return the pass
     */
    public String getPass() {
        return pass;
    }

    /**
     * @param pass the pass to set
     */
    public void setPass(String pass) {
        this.pass = pass;
    }

    public boolean checkPass(String userid, String password) {
        boolean result = false;
        if (isVldP(password) == true) {
            try {
                dbc.getConnection();
                Statement stmt = dbc.conn.createStatement();
                String query = "SELECT `username`,`email`,`pass` FROM `userview` WHERE `username`='" + userid + "' AND `pass`='" + password + "' AND `user_type`='Admin' OR `email`='" + userid + "' AND `pass`='" + password + "' AND `user_type`='Admin' ";
                ResultSet rs = stmt.executeQuery(query);
                while (rs.next()) {
                    if (rs.getString("username").equals(userid) && rs.getString("pass").equals(password)) {
                        result = true;
                    }else if(rs.getString("email").equals(userid) && rs.getString("pass").equals(password)){
                        result = true;
                    }
                }
                dbc.endConnection();
            } catch (SQLException ex) {
                Logger.getLogger(AdminClass_NavbarTools.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return result;
    }

    public boolean updateAdminCustom(String username, String password) {
        boolean result = false;
        if (isVld(username) == true && isVldP(password) == true) {

            try {
                dbc.getConnection();
                Statement stmt = dbc.conn.createStatement();
                String query = "UPDATE `userview` SET`pass`='" + password + "' WHERE `username`='" + username + "'";
                int res = stmt.executeUpdate(query);
                if (res == 1) {
                    result = true;
                }
                dbc.endConnection();
            } catch (SQLException ex) {
                Logger.getLogger(AdminClass_LoginMethods.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        return result;
    }

    public String updateAdmin(String username, String usernameNew, String password) {
        String result = null;
        if (isVld(username) == true && isVld(usernameNew) == true && isVldP(password) == true) {

            if (isAvailable(usernameNew) == true) {
                try {
                    dbc.getConnection();
                    Statement stmt = dbc.conn.createStatement();
                    String query = "UPDATE `userview` SET`pass`='" + password + "',`username`='" + usernameNew + "' WHERE `username`='" + username + "'";
                    int res = stmt.executeUpdate(query);
                    if (res == 1) {
                        result = "success";
                    }
                    dbc.endConnection();
                } catch (SQLException ex) {
                    Logger.getLogger(AdminClass_LoginMethods.class.getName()).log(Level.SEVERE, null, ex);
                }

            } else {
                result = "unavailable";
            }
        }
        return result;
    }

    public ArrayList checkAdmin(String email) {
        ArrayList al = new ArrayList();
        if (isVE(email) == true) {

            try {
                dbc.getConnection();
                Statement stmt = dbc.conn.createStatement();
                String query = "SELECT `username`, `pass` FROM `userview` WHERE `user_type`='Admin' AND `email`='" + email + "'";
                ResultSet rs = stmt.executeQuery(query);

                if (rs.isBeforeFirst()) {
                    while (rs.next()) {
                        al.add(rs.getString("username"));
                        al.add(rs.getString("pass"));

                    }
                } else {
                    al = null;
                }
                dbc.endConnection();
            } catch (SQLException ex) {
                Logger.getLogger(AdminClass_LoginMethods.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            al = null;
        }
        return al;
    }
    
    public String getAdminId(String email){
        String adminId=null;
        try {
                dbc.getConnection();
                Statement stmt = dbc.conn.createStatement();
                String query = "SELECT `username` FROM `userview` WHERE `email`='" + email + "'";
                ResultSet rs = stmt.executeQuery(query);

                while(rs.next()){
                    adminId=rs.getString("username");
                }
                dbc.endConnection();
            } catch (SQLException ex) {
                Logger.getLogger(AdminClass_LoginMethods.class.getName()).log(Level.SEVERE, null, ex);
            }
        return adminId;
    }

    private static final Pattern VALID_LOGIN_DETAILS = Pattern.compile(
            "[#$_@0-9a-zA-Z]{8,20}");

    public static boolean isVld(String s) {
        return VALID_LOGIN_DETAILS.matcher(s).matches();
    }
    private static final Pattern VALID_PASS = Pattern.compile(
            "[#$_@0-9a-zA-Z]{8,30}");

    public static boolean isVldP(String s) {
        return VALID_PASS.matcher(s).matches();
    }

    public boolean isAvailable(String s) {
        boolean result = false;
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "SELECT `username` FROM `userview` WHERE `username`='" + s + "'";
            ResultSet rs = stmt.executeQuery(query);
            if (!rs.isBeforeFirst()) {
                result = true;
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_LoginMethods.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }

    private static final Pattern VALID_EMAIL = Pattern.compile(
            "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
            + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");

    public static boolean isVE(String s) {
        return VALID_EMAIL.matcher(s).matches();
    }
    
    public boolean validateEmail(String value){
        boolean email=isVE(value);
        return email;
    }

}
