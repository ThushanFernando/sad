/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author SithuDewmi
 */
public class AdminClass_SliderItems {

    DbClass dbc = new DbClass();

    public byte[] getSlider(int img_id) {
        byte barray[] = null;

        dbc.getConnection();//get your connection object here ;
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        try {
            pstmt = dbc.conn.prepareStatement("SELECT  `image` FROM `slider_images` WHERE `img_id`=?");
            pstmt.setInt(1, img_id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                barray = rs.getBytes(1);

            }
        } catch (Exception ex) {
            //ex.printStackTrace();
        } finally {
            try {
                if (dbc.conn != null) {
                    dbc.endConnection();
                }
            } catch (Exception ex) {
                // ex.printStackTrace();
            }
        }
        return barray;
    }

    public int setSlider(InputStream in, String id) {
        int result = 0;
        try {
            // connects to the database
            dbc.getConnection();
            // constructs SQL statement
            String sql = "UPDATE `slider_images` SET `image`=? WHERE `img_id`=? ";
            PreparedStatement statement = dbc.conn.prepareStatement(sql);
            if (in != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(1, in);
                statement.setString(2, id);
            }
            // sends the statement to the database server
            result = statement.executeUpdate();
            if (result > 0) {
                System.out.println("File uploaded and saved into database");
            }
        } catch (SQLException ex) {

            ex.printStackTrace();
        } finally {
            if (dbc.conn != null) {
                dbc.endConnection();
            }

        }
        return result;
    }
}
