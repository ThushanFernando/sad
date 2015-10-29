<%@page import='classes.AdminClass_Links'%>
<html>
    <head>
        <meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
        <title>Nettuts Email Newsletter</title>
        <style type='text/css'>
            a {color: #4A72AF;}
            body, #header h1, #header h2, p {margin: 0; padding: 0;}
            #main {border: 1px solid #cfcece;}
            img {display: block;}
            #top-message p, #bottom-message p {color: #3f4042; font-size: 12px; font-family: Arial, Helvetica, sans-serif; }
            #header h1 {color: #ffffff !important; font-family: 'Lucida Grande', 'Lucida Sans', 'Lucida Sans Unicode', sans-serif; font-size: 24px; margin-bottom: 0!important; padding-bottom: 0; }
            #header h2 {color: #ffffff !important; font-family: Arial, Helvetica, sans-serif; font-size: 24px; margin-bottom: 0 !important; padding-bottom: 0; }
            #header p {color: #ffffff !important; font-family: 'Lucida Grande', 'Lucida Sans', 'Lucida Sans Unicode', sans-serif; font-size: 12px;  }
            h1, h2, h3, h4, h5, h6 {margin: 0 0 0.8em 0;}
            h3 {font-size: 28px; color: #444444 !important; font-family: Arial, Helvetica, sans-serif; }
            h4 {font-size: 22px; color: #4A72AF !important; font-family: Arial, Helvetica, sans-serif; }
            h5 {font-size: 18px; color: #444444 !important; font-family: Arial, Helvetica, sans-serif; }
            p {font-size: 12px; color: #444444 !important; font-family: 'Lucida Grande', 'Lucida Sans', 'Lucida Sans Unicode', sans-serif; line-height: 1.5;}
            tr.four-px { height:30px;  }
        </style>
    </head>



    <body>

        <% AdminClass_Links al = new AdminClass_Links();%>

        <table width='100%' cellpadding='0' cellspacing='0' bgcolor='e4e4e4'><tr><td>







                    <table id='main' width='600' align='center' cellpadding='0' cellspacing='15' bgcolor='ffffff'>
                        <tr>
                            <td>
                                <table id='header' cellpadding='10' cellspacing='0' align='center' bgcolor='8fb3e9'>
                                    <tr>
                                        <td width='570' bgcolor='2273F8'><img src=<%=al.getLogo()%> width='170' /></td>
                                    </tr>
                                    <tr>
                                        <td width='570' bgcolor='2273F8' ><h5 style='color:#ffffff!important'>Buy Superb sell Superb be Superb</h5></td>
                                    </tr>
                                    <tr>
                                        <td width='570' align='right' bgcolor='7aa7e9'><p>July 2010</p></td>
                                    </tr>
                                </table><!-- header -->
                            </td>
                        </tr><!-- header -->

                        <tr>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <table id='content-1' cellpadding='0' cellspacing='0' align='center'>
                                    <tr>
                                        <td  valign='top'  align='center'>
                                            <h4><u>Space for the subject</u></h4>
                                        </td>
                                    </tr>
                                </table><!-- content 1 -->
                            </td>
                        </tr><!-- content 1 -->
                        <tr>
                            <td>
                                <table id='content-2' cellpadding='0' cellspacing='0' align='center'>
                                    <tr style='height: 40px;'><td><p>Hello customer,</p></td></tr>
                                    <tr><td></td></tr>
                                    <tr>
                                        <td width='570'><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p></td>
                                    </tr>
                                    <tr style='height: 40px;'><td><p>Thank you.</p></td></tr>
                                </table><!-- content-2 -->
                            </td>
                        </tr><!-- content-2 -->
                        <tr class='four-px'></tr>
                        <tr>
                            <td style='margin-top: 300px;'>
                                <table id='content-6' cellpadding='0' cellspacing='0' align='center'>
                                    <p align='center'>--------------------------------------------</p>
                                    <p align='center'>
                                        Did you know that Superb.lk has the best mobile deals in Sri Lanka? </p>
                                    <p align='center'><a target='blank' href='http://www.Superb.lk'>Visit Superb.lk</a></p>
                                </table>
                            </td>
                        </tr>

                    </table><!-- main -->
                    <table id='bottom-message' cellpadding='0' cellspacing='0' width='300' align='center'>
                        <tr style='height: 0px;'>
                            <td></td>
                            <td align='center'>
                                <p>Follow us on</p>

                            </td>
                        </tr>
                        <tr>

                            <td align='center'><a target='blank' href='<%=al.getFacebook()%>'><img src=<%=al.getFacebookIcon() %> width='40' /></a></td>
                            <td align='center'><a target='blank' href='<%=al.getTwitter()%>'><img src=<%=al.getTwitterIcon() %> width='40' /></a></td>
                            <td align='center'><a target='blank' href='<%=al.getGoogle()%>'><img src=<%=al.getGoogleIcon() %> width='40' /></a></td>
                        </tr>
                    </table><!-- top message -->
                </td></tr></table><!-- wrapper -->



    </body>
</html> 