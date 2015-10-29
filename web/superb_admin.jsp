<%-- 
    Document   : index
    Created on : Jun 22, 2015, 6:48:51 PM
    Author     : SithuDewmi
--%>

<%@page import="classes.AdminClass_ReviewAds"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
    <!--<![endif]-->
    <!-- start: HEAD -->
    <head>
        <title>Superb.lk-Admin</title>
        <!-- start: META -->
        <meta charset="utf-8" />
        <!--[if IE]><meta http-equiv='X-UA-Compatible' content="IE=edge,IE=9,IE=8,chrome=1" /><![endif]-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <meta content="" name="description" />
        <meta content="" name="author" />
        <!-- end: META -->
        <!-- start: MAIN CSS -->
        <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="fonts/style.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/main-responsive.css">
        <link rel="stylesheet" href="plugins/iCheck/skins/all.css">
        <link rel="stylesheet" href="plugins/bootstrap-colorpalette/css/bootstrap-colorpalette.css">
        <link rel="stylesheet" href="plugins/perfect-scrollbar/src/perfect-scrollbar.css">
        <!--[if IE 7]>
        <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome-ie7.min.css">
        <![endif]-->
        <!-- end: MAIN CSS -->
        <!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
        <link href="plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css"/>
        <!-- end: CSS REQUIRED FOR THIS PAGE ONLY -->
        <link rel="shortcut icon"  href="images/icon.png" type="image/x-icon" />
    </head>
    <!-- end: HEAD -->
    <!-- start: BODY -->
    <body class="login superb">
        <%
        if (session.getAttribute("loggin_state") == "success") {
                response.sendRedirect("Dashboard");
            }
        %>

        <div class="loader">
            <jsp:include page="page-elements/javascript_required.jsp"/>
        </div>
        <div class="main-login col-sm-4 col-sm-offset-4">
            <div class="logo">SUPERB<i class=""></i>.lk
            </div>
            <!-- start: LOGIN BOX -->
            <div class="box-login">
                <div id="alert-id"><%if (session.getAttribute("alert") != null) {%>
                    <%=session.getAttribute("alert")%>
                    <%}
                        session.setAttribute("alert", null);%></div>

                <h3>Sign in to your account</h3>
                <p>
                    Please enter your name and password to log in.
                </p>
                <form class="form-login" action="CheckLogin" method="POST">
                    <fieldset>
                        <div class="form-group">
                            <span class="input-icon">
                                <input type="text" value="" class="form-control" name="uid" placeholder="Enter username or email" onclick="document.getElementById('alert-id').innerHTML = ''" required="true">
                                <i class="fa fa-user"></i> </span>
                        </div>
                        <div class="form-group form-actions">
                            <span class="input-icon">
                                <input type="password" value=""  class="form-control password" name="pass" placeholder="Password" onclick="document.getElementById('alert-id').innerHTML = '';"   required="true" >
                                <i class="fa fa-lock"></i>
                                <a class="forgot" href="#box-forgot" data-toggle="modal" onclick="document.getElementById('email').value = null">
                                    I forgot my password
                                </a> </span><br>
                            <span class="badge badge-success" id="caps" ></span>
                        </div>
                        <div class="form-actions">

                            <button type="submit" class="btn btn-primary pull-right">
                                Login <i class="fa fa-arrow-circle-right"></i>
                            </button>

                        </div>

                    </fieldset>
                </form>

            </div>
            <!-- end: LOGIN BOX -->

            <!-- start: COPYRIGHT -->
            <div class="copyright">
                <span style="color: black">
                    Copyright @2015 - Superb.lk - All rights reserved<br>
                    Design & Developed by 
                </span>
                <a href="http://www.nextglow.com/" target="blank" style="color: black;"><img src="images/nextglow-transparent.png"  style="width: 75px;"/></a>
            </div>
            <!-- end: COPYRIGHT -->
        </div>
        <div id="box-forgot"  class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" data-width="350" style="display: none;">
            <div class="modal-header">
                <h3>Forget Password?</h3>
                <p>
                    Enter your e-mail address below to recover your password.
                </p>
            </div>
            <div class="modal-body">

                <form class="form-forgot" onsubmit="return recover();">
                    <fieldset>
                        <div class="form-group">
                            <span class="input-icon">
                                <input type="email" class="form-control" required="true" id="email" placeholder="Email">
                                <i class="fa fa-envelope"></i> </span>
                        </div>
                        <div class="form-actions">
                            <a class="btn btn-light-grey go-back " data-dismiss="modal">
                                <i class="fa fa-circle-arrow-left"></i> Back
                            </a>
                            <button type="submit" class="btn btn-bricky pull-right" >
                                Submit <i class="fa fa-arrow-circle-right"></i>
                            </button>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>


        <!-- end: FOOTER -->
        <!-- start: BOOTSTRAP EXTENDED MODALS -->
        <!-- start: MAIN JAVASCRIPTS -->
        <!--[if lt IE 9]>
        <script src="admin/plugins/respond.min.js"></script>
        <script src="admin/plugins/excanvas.min.js"></script>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <![endif]-->
        <!--[if gte IE 9]><!-->


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script>

                    function recover() {
                        document.getElementById("alert-id").innerHTML = "<div class=\"alert alert-success\">\n"          //returning notification of the success or the failure
                                + "<button data-dismiss=\"alert\" class=\"close\">\n"
                                + "&times;\n"
                                + "</button>\n"
                                + "<i class=\"fa fa-check-circle\"></i>\n"
                                + "<strong>processing the email..</strong><br>\n"
                                + "Login details will be sent to your email"
                                + "</div>";
                        $('#box-forgot').modal('hide');
                        $.ajax({
                            type: "POST",
                            url: "ForgotPassword",
                            data: {
                                email: document.getElementById("email").value
                            },
                            dataType: "xml",
                            success: function (xml) {
                                $(xml).find('value').each(function () {
                                    if ($(this).find('result').text() === "failed") {
                                        document.getElementById("alert-id").innerHTML = "<div class=\"errorHandler alert alert-danger \">\n"//returning notification of the success or the failure
                                                + "<button data-dismiss=\"alert\" class=\"close\">\n"
                                                + "&times;\n"
                                                + "</button>\n"
                                                + "Please re-enter your valid "
                                                + "email address.\n"
                                                + "</div>";
                                    }
                                });
                            },
                            error: function () {
                                document.getElementById("alert-id").innerHTML = "<div class=\"errorHandler alert alert-danger \">\n"//returning notification of the success or the failure
                                        + "<button data-dismiss=\"alert\" class=\"close\">\n"
                                        + "&times;\n"
                                        + "</button>\n"
                                        + "<strong>Server is offline..</strong><br>\n"
                                        + "Please try again in a minute\n"
                                        + "</div>";
                            }
                        });
                        return false;


                    }
                    ;


        </script>
        <!--<![endif]-->
        <script src="plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>
        <script src="plugins/bootstrap/js/bootstrap.min.js"></script>
        <script src="plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"></script>
        <script src="plugins/blockUI/jquery.blockUI.js"></script>
        <script src="plugins/iCheck/jquery.icheck.min.js"></script>
        <script src="plugins/perfect-scrollbar/src/jquery.mousewheel.js"></script>
        <script src="plugins/perfect-scrollbar/src/perfect-scrollbar.js"></script>
        <script src="plugins/less/less-1.5.0.min.js"></script>
        <script src="plugins/jquery-cookie/jquery.cookie.js"></script>
        <script src="plugins/bootstrap-colorpalette/js/bootstrap-colorpalette.js"></script>
        <script src="js/main.js"></script>
        <!-- end: MAIN JAVASCRIPTS -->
        <!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
        <script src="plugins/bootstrap-modal/js/bootstrap-modal.js"></script>
        <script src="plugins/bootstrap-modal/js/bootstrap-modalmanager.js"></script>
        <script src="js/ui-modals.js"></script>
        <script type="text/javascript" src="js/CapsLock.js"></script>

        <!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
        <script>

                    jQuery(document).ready(function () {
                        $(".loader").fadeOut("slow");
                        Main.init();
                        $("input").keydown(function () {
                            if (CapsLock.isOn()) {
                                document.getElementById("caps").innerHTML = "Caps Lock is on!\n";
                            } else {
                                document.getElementById("caps").innerHTML = "";
                            }
                        });
                         $("input").keyup(function () {
                            if (CapsLock.isOn()) {
                                document.getElementById("caps").innerHTML = "Caps Lock is on!\n";
                            } else {
                                document.getElementById("caps").innerHTML = "";
                            }
                        });
                    });
        </script>

    </body>
    <!-- end: BODY -->
</html>
