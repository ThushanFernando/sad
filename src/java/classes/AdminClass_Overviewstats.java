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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.TimeZone;

/**
 *
 * @author SithuDewmi
 */
public class AdminClass_Overviewstats {

    DbClass dbc = new DbClass();
    private String id = null;
    private String timeStamp = null;
    private String category = null;
    private String count = null;
    private String timePeriod = null;
    private String firstYear = null;
    private String lastYear = null;
    private String dictrict = null;

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
     * @return the category
     */
    public String getCategory() {
        return category;
    }

    /**
     * @param category the category to set
     */
    public void setCategory(String category) {
        this.category = category;
    }

    /**
     * @return the count
     */
    public String getCount() {
        return count;
    }

    /**
     * @param count the count to set
     */
    public void setCount(String count) {
        this.count = count;
    }

    /**
     * @return the timePeriod
     */
    public String getTimePeriod() {
        return timePeriod;
    }

    /**
     * @param timePeriod the timePeriod to set
     */
    public void setTimePeriod(String timePeriod) {
        this.timePeriod = timePeriod;
    }

    /**
     * @return the dictrict
     */
    public String getDictrict() {
        return dictrict;
    }

    /**
     * @param dictrict the dictrict to set
     */
    public void setDictrict(String dictrict) {
        this.dictrict = dictrict;
    }

    public String reviewAdsCount() {
        String count = null;
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "SELECT COUNT(`item_number`) FROM `itemview` WHERE `status`='Pending'";
            ResultSet rs = stmt.executeQuery(query);
            if (!rs.isBeforeFirst()) {
                count = "0";
            } else {
                while (rs.next()) {
                    count = rs.getString("COUNT(`item_number`)");
                }
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_NavbarTools.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public String reportCount() {
        int count = 0;
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "select (SELECT COUNT(`report_id`) FROM `admin_reported_itemview` WHERE `read_state`='0' AND `status`='Active') as t1, \n"
                    + "(SELECT Count(`inquiry_id`) FROM `admin_reported_inquiries` WHERE `read_state`='0') as t2, \n"
                    + "(SELECT Count(`message_id`) FROM `admin_reported_messages` WHERE `read_state`='0') as t3";
            ResultSet rs = stmt.executeQuery(query);
            if (!rs.isBeforeFirst()) {
                count = 0;
            } else {
                while (rs.next()) {
                    count = rs.getInt("t1");
                    count = count + rs.getInt("t2");
                    count = count + rs.getInt("t3");
                }
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_NavbarTools.class.getName()).log(Level.SEVERE, null, ex);
        }
        return String.valueOf(count);
    }

    public int reviewTopAdsCount() {
        int count = 0;
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "";
            ResultSet rs = stmt.executeQuery(query);
            if (!rs.isBeforeFirst()) {
                count = 0;
            } else {
                while (rs.next()) {
                    count = rs.getInt("");
                }
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_NavbarTools.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public int viewReports() {
        int count = 0;
        try {
            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "";
            ResultSet rs = stmt.executeQuery(query);
            if (!rs.isBeforeFirst()) {
                count = 0;
            } else {
                while (rs.next()) {
                    count = rs.getInt("");
                }
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_NavbarTools.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public ArrayList pagevisitMonth() {
        ArrayList al = new ArrayList();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String timeZone = "Asia/Colombo";
        sdf.setTimeZone(TimeZone.getTimeZone(timeZone));
        Calendar c1 = Calendar.getInstance();
        Calendar now = Calendar.getInstance();

        c1.set(now.get(Calendar.YEAR), now.get(Calendar.MONTH), 01);

        c1.add(Calendar.MONTH, -12); // substract 12month
        try {

            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            for (int i = 0; i < 13; i++) {
                String thisMonth = (String) sdf.format(c1.getTime());
                c1.add(Calendar.MONTH, +1);
                String nextMonth = (String) sdf.format(c1.getTime());

                String query = "SELECT count(`time_stamp`) FROM  `site_visits` WHERE  `time_stamp` BETWEEN  '" + thisMonth + " 00:00:00' AND '" + nextMonth + " 00:00:00' AND `time_stamp` != '" + nextMonth + " 00:00:00'";
                ResultSet rs = stmt.executeQuery(query);

                while (rs.next()) {
                    AdminClass_Overviewstats ao = new AdminClass_Overviewstats();
                    ao.setTimePeriod(String.valueOf(thisMonth.charAt(5)) + String.valueOf(thisMonth.charAt(6)));
                    ao.setCount(rs.getString("COUNT(`time_stamp`)"));
                    al.add(ao);

                }
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_Overviewstats.class.getName()).log(Level.SEVERE, null, ex);
        }
        return al;
    }

    public ArrayList pagevisitYear() {
        ArrayList al = new ArrayList();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String timeZone = "Asia/Colombo";
        sdf.setTimeZone(TimeZone.getTimeZone(timeZone));
        Calendar c1 = Calendar.getInstance();
        Calendar now = Calendar.getInstance();
        c1.set(now.get(Calendar.YEAR), 00, 01);

        c1.add(Calendar.YEAR, -6); // substract 6 years
        try {

            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            for (int i = 0; i < 7; i++) {
                String thisYear = (String) sdf.format(c1.getTime());
                c1.add(Calendar.YEAR, +1);
                String nextYear = (String) sdf.format(c1.getTime());

                String query = "SELECT count(`time_stamp`) FROM  `site_visits` WHERE  `time_stamp` BETWEEN  '" + thisYear + " 00:00:00' AND '" + nextYear + " 00:00:00'  AND `time_stamp` != '" + nextYear + " 00:00:00'";
                ResultSet rs = stmt.executeQuery(query);

                while (rs.next()) {
                    AdminClass_Overviewstats ao = new AdminClass_Overviewstats();
                    ao.setTimePeriod(String.valueOf(thisYear + " to " + nextYear));
                    ao.setCount(rs.getString("COUNT(`time_stamp`)"));
                    al.add(ao);

                }
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_Overviewstats.class.getName()).log(Level.SEVERE, null, ex);
        }
        return al;
    }

    public ArrayList pagevisitCustom(String firstdate, String seconddate) {
        ArrayList al = new ArrayList();
        try {

            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "SELECT count(`time_stamp`) FROM  `site_visits`";
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                al.add(rs.getString("count(`time_stamp`)"));
            }
            query = "SELECT count(`time_stamp`) FROM  `site_visits` WHERE  `time_stamp` BETWEEN  '" + firstdate + "' AND '" + seconddate + "'  AND `time_stamp` != '" + seconddate + "'";
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                al.add(rs.getString("count(`time_stamp`)"));
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_Overviewstats.class.getName()).log(Level.SEVERE, null, ex);
        }
        return al;
    }

    public ArrayList usersMonth() {
        ArrayList al = new ArrayList();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String timeZone = "Asia/Colombo";
        sdf.setTimeZone(TimeZone.getTimeZone(timeZone));
        Calendar c1 = Calendar.getInstance();
        Calendar now = Calendar.getInstance();
        c1.set(now.get(Calendar.YEAR), now.get(Calendar.MONTH), 01);

        c1.add(Calendar.MONTH, -12); // substract 12 month
        try {

            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            for (int i = 0; i < 13; i++) {
                String thisMonth = (String) sdf.format(c1.getTime());
                c1.add(Calendar.MONTH, +1);
                String nextMonth = (String) sdf.format(c1.getTime());

                String query = "SELECT COUNT(`registration`) FROM `userview` WHERE  `registration` BETWEEN  '" + thisMonth + " 00:00:00' AND '" + nextMonth + " 00:00:00' AND `status`='Activated' AND `user_type`='Member' AND `registration`!='" + nextMonth + " 00:00:00'";
                ResultSet rs = stmt.executeQuery(query);
                while (rs.next()) {
                    AdminClass_Overviewstats ao = new AdminClass_Overviewstats();
                    ao.setTimePeriod(String.valueOf(thisMonth.charAt(5)) + String.valueOf(thisMonth.charAt(6)));
                    ao.setCount(rs.getString("COUNT(`registration`)"));

                    al.add(ao);

                }
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_Overviewstats.class.getName()).log(Level.SEVERE, null, ex);
        }
        return al;
    }

    public ArrayList usersYear() {
        ArrayList al = new ArrayList();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String timeZone = "Asia/Colombo";
        sdf.setTimeZone(TimeZone.getTimeZone(timeZone));
        Calendar c1 = Calendar.getInstance();
        Calendar now = Calendar.getInstance();
        c1.set(now.get(Calendar.YEAR), 00, 01);

        c1.add(Calendar.YEAR, -6); // substract 6 years
        try {

            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            for (int i = 0; i < 7; i++) {
                String thisYear = (String) sdf.format(c1.getTime());
                c1.add(Calendar.YEAR, +1);
                String nextYear = (String) sdf.format(c1.getTime());

                String query = "SELECT COUNT(`activated_time_stamp`) FROM `userview` WHERE  `activated_time_stamp` BETWEEN  '" + thisYear + " 00:00:00' AND '" + nextYear + " 00:00:00'  AND `status`='Activated' AND `user_type`='Member' AND `activated_time_stamp`!='" + nextYear + " 00:00:00'";
                ResultSet rs = stmt.executeQuery(query);

                while (rs.next()) {
                    AdminClass_Overviewstats ao = new AdminClass_Overviewstats();
                    ao.setTimePeriod(String.valueOf(thisYear + " to " + nextYear));
                    ao.setCount(rs.getString("COUNT(`activated_time_stamp`)"));
                    al.add(ao);

                }
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_Overviewstats.class.getName()).log(Level.SEVERE, null, ex);
        }
        return al;
    }

    public ArrayList usersCustom(String firstdate, String seconddate) {
        ArrayList al = new ArrayList();
        try {

            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "SELECT COUNT(`activated_time_stamp`) FROM `userview` WHERE `status`='Activated' AND user_type='Member'";
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                al.add(rs.getString("COUNT(`activated_time_stamp`)"));
            }
            query = "SELECT COUNT(`activated_time_stamp`) FROM `userview` WHERE  `activated_time_stamp` BETWEEN  '" + firstdate + "' AND '" + seconddate + "'AND `status`='Activated' AND `user_type`='Member' AND `activated_time_stamp`!='" + seconddate + "'";
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                al.add(rs.getString("COUNT(`activated_time_stamp`)"));
            }
            dbc.endConnection();

        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_Overviewstats.class.getName()).log(Level.SEVERE, null, ex);
        }
        return al;
    }

    public ArrayList adsMonth() {
        ArrayList al = new ArrayList();

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String timeZone = "Asia/Colombo";
        sdf.setTimeZone(TimeZone.getTimeZone(timeZone));
        Calendar c1 = Calendar.getInstance();
        Calendar now = Calendar.getInstance();
        c1.set(now.get(Calendar.YEAR), now.get(Calendar.MONTH), 01);

        c1.add(Calendar.MONTH, -12); // substract 12 month
        try {

            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            for (int i = 0; i < 13; i++) {
                String thisMonth = (String) sdf.format(c1.getTime());
                c1.add(Calendar.MONTH, +1);
                String nextMonth = (String) sdf.format(c1.getTime());

                String query = "SELECT COUNT(`time_stamp`) FROM `itemview` WHERE  `time_stamp` BETWEEN  '" + thisMonth + " 00:00:00' AND '" + nextMonth + " 00:00:00' AND status='Active'  AND `time_stamp` != '" + nextMonth + " 00:00:00'";
                ResultSet rs = stmt.executeQuery(query);
                while (rs.next()) {
                    AdminClass_Overviewstats ao = new AdminClass_Overviewstats();
                    ao.setTimePeriod(String.valueOf(thisMonth.charAt(5)) + String.valueOf(thisMonth.charAt(6)));
                    ao.setCount(rs.getString("COUNT(`time_stamp`)"));

                    al.add(ao);

                }
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_Overviewstats.class.getName()).log(Level.SEVERE, null, ex);
        }
        return al;
    }

    public ArrayList adsYear() {
        ArrayList al = new ArrayList();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String timeZone = "Asia/Colombo";
        sdf.setTimeZone(TimeZone.getTimeZone(timeZone));
        Calendar c1 = Calendar.getInstance();
        Calendar now = Calendar.getInstance();
        c1.set(now.get(Calendar.YEAR), 00, 01);

        c1.add(Calendar.YEAR, -6); // substract 6 years
        try {

            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            for (int i = 0; i < 7; i++) {
                String thisYear = (String) sdf.format(c1.getTime());
                c1.add(Calendar.YEAR, +1);
                String nextYear = (String) sdf.format(c1.getTime());

                String query = "SELECT COUNT(`time_stamp`) FROM `itemview` WHERE  `time_stamp` BETWEEN  '" + thisYear + " 00:00:00' AND '" + nextYear + " 00:00:00' AND status='Active'  AND `time_stamp` != '" + nextYear + " 00:00:00'";
                ResultSet rs = stmt.executeQuery(query);

                while (rs.next()) {
                    AdminClass_Overviewstats ao = new AdminClass_Overviewstats();
                    ao.setTimePeriod(String.valueOf(thisYear + " to " + nextYear));
                    ao.setCount(rs.getString("COUNT(`time_stamp`)"));
                    al.add(ao);

                }
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_Overviewstats.class.getName()).log(Level.SEVERE, null, ex);
        }
        return al;
    }

    public ArrayList adsCustom(String firstdate, String seconddate) {
        ArrayList al = new ArrayList();
        try {

            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "SELECT COUNT(`time_stamp`) FROM `itemview` WHERE status='Active'";
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                al.add(rs.getString("COUNT(`time_stamp`)"));
            }
            query = "SELECT COUNT(`time_stamp`) FROM `itemview` WHERE status='Active' AND  `time_stamp` BETWEEN  '" + firstdate + "' AND '" + seconddate + "'  AND `time_stamp` != '" + seconddate + "'";
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                al.add(rs.getString("COUNT(`time_stamp`)"));
            }
            dbc.endConnection();

        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_Overviewstats.class.getName()).log(Level.SEVERE, null, ex);
        }
        return al;
    }

    public ArrayList categoriesPresentage() {
        ArrayList al = new ArrayList();
        ArrayList al2 = new ArrayList();

        try {

            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();

            String query = "SELECT `main_name` FROM `category_main`";
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                al.add(rs.getString("main_name"));
            }
            for (int i = 0; i < al.size(); i++) {
                query = "SELECT count(`time_stamp`) from `itemview` where `category_main`='" + al.get(i) + "' and status='Active'";
                rs = stmt.executeQuery(query);
                while (rs.next()) {
                    AdminClass_Overviewstats ao = new AdminClass_Overviewstats();
                    ao.setCategory(String.valueOf(al.get(i)));
                    ao.setCount(rs.getString("count(`time_stamp`)"));

                    al2.add(ao);

                }
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_Overviewstats.class.getName()).log(Level.SEVERE, null, ex);
        }
        return al2;

    }

    public ArrayList adsDistricts() {
        ArrayList al = new ArrayList();
        ArrayList al2 = new ArrayList();
        try {

            dbc.getConnection();
            Statement stmt = dbc.conn.createStatement();
            String query = "SELECT `district_name` FROM `location_district`";
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                al.add(rs.getString("district_name"));
            }
            for (int i = 0; i < al.size(); i++) {
                query = "SELECT `district`,count(`item_number`) FROM `itemview` WHERE `district`='" + al.get(i) + "' AND `status`='Active'";
                rs = stmt.executeQuery(query);

                while (rs.next()) {
                    AdminClass_Overviewstats ao = new AdminClass_Overviewstats();
                    ao.setDictrict(String.valueOf(al.get(i)));
                    ao.setCount(rs.getString("count(`item_number`)"));
                    al2.add(ao);
                }
            }
            dbc.endConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminClass_Overviewstats.class.getName()).log(Level.SEVERE, null, ex);
        }
        return al2;
    }

    public boolean isValidDate(String inDate) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        try {
            dateFormat.parse(inDate.trim());
        } catch (ParseException pe) {
            return false;
        }
        return true;
    }

}
