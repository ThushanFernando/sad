/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Properties;
import java.util.TimeZone;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author SithuDewmi
 */
public class AdminClass_SendMail {

    AdminClass_Links al = new AdminClass_Links();

    public int mailClass(String reciever, String subject, String content, String link) {
        Date curDate = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("dd, MMMM yyyy", Locale.ENGLISH);
        String timeZone = "Asia/Colombo";

        sdf.setTimeZone(TimeZone.getTimeZone(timeZone));

        String DateToStr = sdf.format(curDate);

        int result = 1;
        Properties props = new Properties();
        props.setProperty("mail.host", "mail.superb.lk");
        props.setProperty("mail.smtp.port", "25");
        props.setProperty("mail.smtp.auth", "true");

        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                //TODO Auto-generated method stub
                return new PasswordAuthentication("support@superb.lk", "support@ishan");
            }
        };

        Session session = Session.getInstance(props, auth);
        Message msg = new MimeMessage(session);
        try {
            msg.setSubject(subject);
            msg.setContent("<html>\n"
                    + "    <head>\n"
                    + "        <meta http-equiv='Content-Type' content='text/html; charset=utf-8'>\n"
                    + "        <title>Nettuts Email Newsletter</title>\n"
                    + "        <style type='text/css'>\n"
                    + "            a {color: #4A72AF;}\n"
                    + "            body, #header h1, #header h2, p {margin: 0; padding: 0;}\n"
                    + "            #main {border: 1px solid #cfcece;}\n"
                    + "            img {display: block;}\n"
                    + "            #top-message p, #bottom-message p {color: #3f4042; font-size: 12px; font-family: Arial, Helvetica, sans-serif; }\n"
                    + "            #header h1 {color: #ffffff !important; font-family: 'Lucida Grande', 'Lucida Sans', 'Lucida Sans Unicode', sans-serif; font-size: 24px; margin-bottom: 0!important; padding-bottom: 0; }\n"
                    + "            #header h2 {color: #ffffff !important; font-family: Arial, Helvetica, sans-serif; font-size: 24px; margin-bottom: 0 !important; padding-bottom: 0; }\n"
                    + "            #header p {color: #ffffff !important; font-family: 'Lucida Grande', 'Lucida Sans', 'Lucida Sans Unicode', sans-serif; font-size: 12px;  }\n"
                    + "            h1, h2, h3, h4, h5, h6 {margin: 0 0 0.8em 0;}\n"
                    + "            h3 {font-size: 28px; color: #444444 !important; font-family: Arial, Helvetica, sans-serif; }\n"
                    + "            h4 {font-size: 22px; color: #4A72AF !important; font-family: Arial, Helvetica, sans-serif; }\n"
                    + "            h5 {font-size: 18px; color: #444444 !important; font-family: Arial, Helvetica, sans-serif; }\n"
                    + "            p {font-size: 12px; color: #444444 !important; font-family: 'Lucida Grande', 'Lucida Sans', 'Lucida Sans Unicode', sans-serif; line-height: 1.5;}\n"
                    + "            tr.four-px { height:30px;  }\n"
                    + "        </style>\n"
                    + "    </head>\n"
                    + "\n"
                    + "\n"
                    + "\n"
                    + "    <body>\n"
                    + "\n"
                    + "\n"
                    + "        <table width='100%' cellpadding='0' cellspacing='0' bgcolor='e4e4e4'><tr><td>\n"
                    + "\n"
                    + "\n"
                    + "\n"
                    + "\n"
                    + "\n"
                    + "\n"
                    + "\n"
                    + "                    <table id='main' width='600' align='center' cellpadding='0' cellspacing='15' bgcolor='ffffff'>\n"
                    + "                        <tr>\n"
                    + "                            <td>\n"
                    + "                                <table id='header' cellpadding='10' cellspacing='0' align='center' bgcolor='8fb3e9'>\n"
                    + "                                    <tr>\n"
                    + "                                        <td width='570' bgcolor='2273F8'><img src=" + al.getLogo() + " width='170' /></td>\n"
                    + "                                    </tr>\n"
                    + "                                    <tr>\n"
                    + "                                        <td width='570' bgcolor='2273F8' ><h5 style='color:#ffffff!important'>All in one classifieds in Sri Lanka</h5></td>\n"
                    + "                                    </tr>\n"
                    + "                                    <tr>\n"
                    + "                                        <td width='570' align='right' bgcolor='7aa7e9'><p style='color:#ffffff!important'>" + DateToStr + "</p></td>\n"
                    + "                                    </tr>\n"
                    + "                                </table><!-- header -->\n"
                    + "                            </td>\n"
                    + "                        </tr><!-- header -->\n"
                    + "\n"
                    + "                        <tr>\n"
                    + "                            <td></td>\n"
                    + "                        </tr>\n"
                    + "                        <tr>\n"
                    + "                            <td>\n"
                    + "                                <table id='content-1' cellpadding='0' cellspacing='0' align='center'>\n"
                    + "                                    <tr>\n"
                    + "                                        <td  valign='top'  align='center'>\n"
                    + "                                            <h4><u>" + subject + "</u></h4>\n"
                    + "                                        </td>\n"
                    + "                                    </tr>\n"
                    + "                                </table><!-- content 1 -->\n"
                    + "                            </td>\n"
                    + "                        </tr><!-- content 1 -->\n"
                    + "                        <tr>\n"
                    + "                            <td>\n"
                    + "                                <table id='content-2' cellpadding='0' cellspacing='0' align='center'>\n"
                    + "                                    <tr style='height: 40px;'><td><p>Hello customer,</p></td></tr>\n"
                    + "                                    <tr><td></td></tr>\n"
                    + "                                    <tr>\n"
                    + "                                        <td width='570'><p>" + content + "</p></td>\n"
                    + "                                    </tr>\n"
                    + "                                    <tr style='height: 30px;'><td>" + link + "</td></tr>\n"
                    + "                                    <tr style='height: 40px;'><td><p>Regards,</p></td></tr>\n"
                    + "                                    <tr><td><p>The support team at Superb.lk</p></td></tr>\n"
                    + "                                </table><!-- content-2 -->\n"
                    + "                            </td>\n"
                    + "                        </tr><!-- content-2 -->\n"
                    + "                        <tr class='four-px'></tr>\n"
                    + "                        <tr>\n"
                    + "                            <td style='margin-top: 300px;'>\n"
                    + "                                <table id='content-6' cellpadding='0' cellspacing='0' align='center'>\n"
                    + "                                    <p align='center'>--------------------------------------------</p>\n"
                    + "                                    <p align='center'>\n"
                    + "                                        Did you know that Superb.lk has the best mobile deals in Sri Lanka? </p>\n"
                    + "                                    <p align='center'><a target='blank' href='http://www.Superb.lk'>Visit Superb.lk</a></p>\n"
                    + "                                </table>\n"
                    + "                            </td>\n"
                    + "                        </tr>\n"
                    + "\n"
                    + "                    </table><!-- main -->\n"
                    + "                    <table id='bottom-message' cellpadding='0' cellspacing='0' width='300' align='center'>\n"
                    + "                        <tr style='height: 0px;'>\n"
                    + "                            <td></td>\n"
                    + "                            <td align='center'>\n"
                    + "                                <p>Follow us on</p>\n"
                    + "\n"
                    + "                            </td>\n"
                    + "                        </tr>\n"
                    + "                        <tr>\n"
                    + "\n"
                    + "                            <td align='center'><a target='blank' href='" + al.getFacebook() + "'><img src='" + al.getFacebookIcon() + "' width='40' /></a></td>\n"
                    + "                            <td align='center'><a target='blank' href='" + al.getTwitter() + "'><img src='" + al.getTwitterIcon() + "' width='40' /></a></td>\n"
                    + "                            <td align='center'><a target='blank' href='" + al.getGoogle() + "'><img src='" + al.getGoogleIcon() + "' width='40' /></a></td>\n"
                    + "                        </tr>\n"
                    + "                    </table><!-- top message -->\n"
                    + "                </td></tr></table><!-- wrapper -->\n"
                    + "\n"
                    + "\n"
                    + "\n"
                    + "    </body>\n"
                    + "</html>", "text/html");
            msg.setFrom(new InternetAddress("support@superb.lk", "Support@Superb.lk"));
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress("indunil.tharanga.priyadarshana@gmail.com"));
            Transport.send(msg);
        } catch (MessagingException | UnsupportedEncodingException ex) {
            result = 0;
            Logger.getLogger(AdminClass_SendMail.class.getName()).log(Level.SEVERE, null, ex);

        }
        return result;
    }

}
