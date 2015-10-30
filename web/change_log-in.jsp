<%-- 
    Document   : index
    Created on : Jun 22, 2015, 6:48:51 PM
    Author     : SithuDewmi
--%>

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
        <link rel="stylesheet" href="css/theme_light.css" type="text/css" id="skin_color">
        <link rel="stylesheet" href="css/print.css" type="text/css" media="print"/>
        <link rel="stylesheet" href="plugins/bootstrap-switch/static/stylesheets/bootstrap-switch.css">
        <!--[if IE 7]>
        <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome-ie7.min.css">
        <![endif]-->
        <!-- end: MAIN CSS -->
        <!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
        <link rel="stylesheet" href="plugins/fullcalendar/fullcalendar/fullcalendar.css">
        <link rel="stylesheet" href="plugins/summernote/build/summernote.css">
        <link href="plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="plugins/gritter/css/jquery.gritter.css">

        <!-- end: CSS REQUIRED FOR THIS PAGE ONLY -->
        <link rel="shortcut icon"  href="images/icon.png" type="image/x-icon" />
    </head>
    <!-- end: HEAD -->
    <!-- start: BODY -->
    <body>
        <div class="loader">
            <jsp:include page="page-elements/javascript_required.jsp"/>
        </div>
        <%
            if (session.getAttribute("loggin_state") != "success") {
                response.sendRedirect("superb_admin.jsp");
            } else if (session.getAttribute("login_change") != "true") {
                response.sendRedirect("Dashboard");
            } else {
                session.setAttribute("login_change", null);
            }
            String alert = null;
            if (session.getAttribute("alert") != null) {
                alert = (String) session.getAttribute("alert");
                session.setAttribute("alert", null);
            }

        %>
        <!-- start: HEADER -->
        <jsp:include page="page-elements/header_custom.jsp"/>
        <!-- end: HEADER -->
        <!-- start: MAIN CONTAINER -->
        <div class="main-container">
            <div class="navbar-content">
                <!-- start: SIDEBAR -->
                <div class="main-navigation navbar-collapse collapse">
                    <!-- start: MAIN MENU TOGGLER BUTTON -->
                    <div class="navigation-toggler">
                        <i class="clip-chevron-left"></i>
                        <i class="clip-chevron-right"></i>
                    </div>
                    <!-- end: MAIN MENU TOGGLER BUTTON -->
                    <!-- start: MAIN NAVIGATION MENU -->
                    <ul class="main-navigation-menu">
                        <li>
                            <a href="Dashboard"><i class="clip-home-3"></i>
                                <span class="title"> Dashboard </span><span class="selected"></span>
                            </a>
                        </li>

                        <li>
                            <a href="http://superb.lk/web/" target="_blank"><i class="clip-cursor"></i>
                                <span class="title"> Frontend </span><span class="selected"></span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0)"><i class="clip-bubble"></i>
                                <span class="title"> Messages </span><span id="MC1" class="badge"></span><i class="icon-arrow"></i>
                                <span class="selected"></span>
                            </a>
                            <ul class="sub-menu">
                                <li>
                                    <a href="MsgAll">
                                        <span class="title"> All </span>
                                        <span class="badge badge-new">new</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <span class="title"> Read </span>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <span class="title"> Unread </span>
                                        <span class="badge badge-new">new</span>
                                        <span id="MC2" class="badge"></span>
                                    </a>
                                </li>


                            </ul>
                        </li>


                        <li>
                            <a href="BlacklistedUsers" ><i class="clip-user-block"></i>
                                <span class="title"> Blacklisted Users</span><span class="selected"></span>
                            </a>
                        </li>
                        <li>
                            <a href="ReviewAds" ><i class="clip-user-4"></i>
                                <span class="title"> Review Ads</span><span class="selected"></span>
                            </a>
                        </li>
                        <li>
                            <a href="upgrade.jsp" ><i class="clip-thumbs-up"></i>
                                <span class="title"> Upgrade Top Ads</span><span class="selected"></span>
                            </a>
                        </li>
                        <li>
                            <a href="ViewReports" ><i class="clip-clip"></i>
                                <span class="title"> View Reports</span><span class="selected"></span>
                            </a>
                        </li>
                        <li>
                            <a href="#" ><i class="clip-file"></i>
                                <span class="title"> free space</span><span class="selected"></span>
                            </a>
                        </li>
                        <li>
                            <a href="#" ><i class="clip-file"></i>
                                <span class="title"> free space</span><span class="selected"></span>
                            </a>
                        </li>


                    </ul>
                    <!-- end: MAIN NAVIGATION MENU -->
                </div>
                <!-- end: SIDEBAR -->
            </div>
            <!-- start: PAGE -->
            <div class="main-content">

                <div class="container">
                    <!-- start: PAGE HEADER -->
                    <div class="row">
                        <div class="col-sm-12">

                            <!-- start: PAGE TITLE & BREADCRUMB -->
                            <ol class="breadcrumb">
                                <li>
                                    <i class="clip-home-3"></i>
                                    <a href="#">
                                        Home
                                    </a>
                                </li>
                                <li class="active">
                                    Change log-in
                                </li>
                                <li class="search-box hidden-xs">
                                    <form class="sidebar-search" action="SearchResult" method="GET">
                                        <div class="form-group">
                                            <input type="text" placeholder="Start Searching..." name="sid">
                                            <button class="submit">
                                                <i class="clip-search-3"></i>
                                            </button>
                                        </div>
                                    </form>
                                </li>
                                <div class="visible-xs"> 
                                    <form class="mobile-search-box"  action="SearchResult" method="GET">
                                        <input type="text" placeholder="Start Searching..." name="sid" class="form-control" style="width: 130px;">
                                    </form>
                                </div>
                            </ol>

                            <!-- end: PAGE TITLE & BREADCRUMB -->
                        </div>
                    </div>
                    <!-- end: PAGE HEADER -->
                    <!-- start: PAGE CONTENT -->
                    <div class="row" style="margin-top: 5px">
                        <div class="col-md-12">
                            <!-- start: FORM VALIDATION 1 PANEL -->
                            <div class="panel panel-default">

                                <div class="panel-body">
                                    <h2 class="hidden-xs"><i class="fa fa-pencil-square teal"></i> Change Your Log-in</h2>

                                    <hr>
                                    <form name="LoginUpdate" action="LoginUpdate" method="POST" onsubmit="return validateForm()" >

                                        <div class="row">
                                            <div class="col-md-4">

                                                <div class="form-group">
                                                    <label class="control-label">
                                                        New User Name 
                                                    </label>
                                                    <input type="text" placeholder="Insert your User Name(if you want to change)" class="form-control" id="usernamenew" name="usernamenew"  >
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label">
                                                        New Password <span class="symbol required"></span>
                                                    </label>
                                                    <input type="password" class="form-control" name="password" id="password"  onclick="document.getElementById('password').value = null;
                                                            document.getElementById('password_again').value = null;
                                                            document.getElementById('alert-id').innerHTML = null">
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label">
                                                        Confirm Password <span class="symbol required"></span>
                                                    </label>
                                                    <input type="password" class="form-control" name="password_again" id="password_again"  onclick="document.getElementById('alert-id').innerHTML = null">
                                                    <br><span class="badge badge-success" id="caps" ></span>
                                                </div>

                                            </div>

                                        </div>

                                        <div class="row">
                                            <div class="col-md-4">
                                                <button class="btn btn-blue btn-block" type="submit" >
                                                    Proceed <i class="fa fa-arrow-circle-right"></i>
                                                </button>
                                            </div>

                                        </div>
                                    </form>

                                </div>
                            </div>
                            <!-- end: FORM VALIDATION 1 PANEL -->
                        </div>
                    </div>
                    <!-- end: PAGE CONTENT-->
                </div>
            </div>
            <!-- end: PAGE -->
        </div>
        <!-- end: MAIN CONTAINER -->
        <!-- start: FOOTER -->
        <div class="footer clearfix">
            <div class="footer-inner">
                <span style="color: black">
                    Copyright @2015 - Superb.lk - All rights reserved<br>
                    Design & Developed by 
                </span>
                <a href="http://www.nextglow.com/" target="blank" style="color: black;"><img src="images/nextglow-transparent.png"  style="width: 75px;"/></a>
            </div>
            <div class="footer-items">
                <span class="go-top"><i class="clip-chevron-up"></i></span>
            </div>
        </div>
        <!-- end: FOOTER -->

        <!-- start: MAIN JAVASCRIPTS -->
        <!--[if lt IE 9]>
        <script src="plugins/respond.min.js"></script>
        <script src="plugins/excanvas.min.js"></script>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <![endif]-->
        <!--[if gte IE 9]><!-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
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
        <script src="plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
        <script src="plugins/fullcalendar/fullcalendar/fullcalendar.js"></script>
        <script src="js/index.js"></script>
        <script src="plugins/jquery-validation/dist/jquery.validate.min.js"></script>
        <script src="plugins/summernote/build/summernote.min.js"></script>
        <script src="plugins/ckeditor/ckeditor.js"></script>
        <script src="plugins/ckeditor/adapters/jquery.js"></script>
        <script src="plugins/bootstrap-modal/js/bootstrap-modal.js"></script>
        <script src="plugins/bootstrap-modal/js/bootstrap-modalmanager.js"></script>
        <script src="js/ui-modals.js"></script>
        <script src="js/CapsLock.js"></script>
        <script src="plugins/gritter/js/jquery.gritter.min.js"></script>
        <script src="plugins/bootstrap-switch/static/js/bootstrap-switch.js"></script>
        <script type="text/javascript" src="js/data-refresh.js"></script>
        
        
        <script>

            function validateForm() {
                var x = document.forms["LoginUpdate"]["password"].value;
                var y = document.forms["LoginUpdate"]["password_again"].value;
                var z = document.forms["LoginUpdate"]["usernamenew"].value;
                re = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.{8,30})");
                if (x === null || x === "") {
                    runNotification("<button class=\"btn btn-red\">"             //returning notification of the failure
                            + "<i  class=\"glyphicon glyphicon-remove-circle\">"
                            + "</i></button><strong> Note! </strong><br><li>Enter the password</li>"
                            + "<br><li>Password must contain at least 8-30 characters, including UPPER/lowercase and number. Special characters '$', '@', '_', '#' only.</li>");
                    return false;
                } else if (y === null || y === "") {
                    runNotification("<button class=\"btn btn-red\">"             //returning notification of the failure
                            + "<i  class=\"glyphicon glyphicon-remove-circle\">"
                            + "</i></button><strong> Note! </strong><br><li>Confirm the password</li>"
                            + "<br><li>Password must contain at least 8-30 characters, including UPPER/lowercase and number. Special characters '$', '@', '_', '#' only.</li>");
                    return false;
                } else if (x.length < 8 || !re.test(x) || x.length > 30) {
                    runNotification("<button class=\"btn btn-red\">"             //returning notification of the failure
                            + "<i  class=\"glyphicon glyphicon-remove-circle\">"
                            + "</i></button><strong> Note! </strong>"
                            + "<br><li>Password must contain at least 8-30 characters, including UPPER/lowercase and number. Special characters '$', '@', '_', '#' only.</li>");
                    return false;

                } else if (y !== x) {
                    runNotification("<button class=\"btn btn-red\">"             //returning notification of the failure
                            + "<i  class=\"glyphicon glyphicon-remove-circle\">"
                            + "</i></button><strong> Note! </strong><br><li>Passwords Do not match !</li>");
                    return false;
                } else if (z.length > 0) {
                    if (z.length < 8 || z.length > 20) {
                        runNotification("<button class=\"btn btn-red\">"             //returning notification of the failure
                                + "<i  class=\"glyphicon glyphicon-remove-circle\">"
                                + "</i></button><strong> Note! </strong><br><li>User name must contain at least 8-20 characters.</li>");
                        return false;
                    }
                }

            }
            //function to initiate jquery.gritter
            function runNotification(alert) {
                var i = alert;
                if (i !== "null") {

                    var unique_id = $.gritter.add({
                        // (string | mandatory) the heading of the notification
                        title: 'Notification!',
                        // (string | mandatory) the text inside the notification
                        text: alert,
                        // (bool | optional) if you want it to fade out on its own or just sit there
                        sticky: false,
                        // (int | optional) the time you want it to be alive for before fading out
                        time: 5000,
                        // (string | optional) the class name you want to apply to that specific message
                        class_name: 'my-sticky-class'
                    });
                    // You can have it return a unique id, this can be used to manually remove it later using
                    /*
                     setTimeout(function(){
                     $.gritter.remove(unique_id, {
                     fade: true,
                     speed: 'slow'
                     });
                     }, 6000)
                     */
                    return false;

                }

            }


        </script>
        <!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
        <script>
            jQuery(document).ready(function () {
                Main.init();
                runNotification("<%=alert%>");
                $(".loader").fadeOut("slow");
                getState();
                refresh_data();
                window.setInterval(function () {
                    refresh_data();
                }, 3000);
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
                UIModals.init();
                

            });
        </script>
    </body>
    <!-- end: BODY -->
</html>
