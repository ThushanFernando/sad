<%-- 
    Document   : index
    Created on : Jun 22, 2015, 6:48:51 PM
    Author     : SithuDewmi
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="classes.AdminClass_BlacklistedEmails"%>
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
        <link rel="stylesheet" type="text/css" href="plugins/select2/select2.css" />
        <link rel="stylesheet" href="plugins/DataTables/media/css/DT_bootstrap.css" />
        <link rel="stylesheet" href="plugins/summernote/build/summernote.css">
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
            }
            ArrayList blacklistedEmails = (ArrayList) request.getAttribute("blacklistedEmails");
            Iterator itr = blacklistedEmails.iterator();
            AdminClass_BlacklistedEmails received = null;


        %>
        <!-- start: HEADER -->
        <jsp:include page="page-elements/header.jsp"/>
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


                        <li class="active open">
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
                                    Blacklisted Users
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
                            <div class="page-header">
                                <h1 class=" hidden-xs">Users <small class=" hidden-xs">blacklisted</small></h1>
                            </div>

                            <!-- end: PAGE TITLE & BREADCRUMB -->
                        </div>
                    </div>
                    <!-- end: PAGE HEADER -->
                    <!-- start: PAGE CONTENT -->
                    <div class="row" >
                        <div class="col-sm-10 col-xs-6">
                            <input type="email" id="emailId" value=""  placeholder="Enter email" class="form-control" onkeyup="email_val()"></td>
                        </div>
                        <div class="col-sm-1 col-xs-3">
                            <a href="#confirm_block" data-toggle="modal">
                                <button class="btn btn-blue next-step btn-block" id="B1" style="display: none; width: 50px;" onclick="email_block()" >
                                    <span class="fa clip-locked"></span> <i class="fa fa-arrow-circle-right"></i>
                                </button>
                            </a>
                        </div>
                        <div class="col-sm-1 col-xs-3">
                            <a href="#confirm_unblock" data-toggle="modal">
                                <button class="btn btn-blue next-step btn-block" id="B2" style="display: none; width: 50px;" onclick="email_unblock()" >
                                    <span class="fa fa-unlock"></span> <i class="fa fa-arrow-circle-right"></i>
                                </button>
                            </a>
                        </div>

                    </div>
                    <div class="row">
                        <div class="panel panel-default" style="border-top:none">

                            <div class="panel-body">
                                <table class="table table-striped table-hover" id="sample_1">
                                    <thead>
                                        <tr>

                                            <th >Blacklisted Emails &nbsp;&nbsp;<i class="fa fa-refresh" onclick="location.reload();"></i></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody id="bmail">

                                        <%                                                while (itr.hasNext()) {
                                                Object a = itr.next();
                                                received = (AdminClass_BlacklistedEmails) a;
                                        %>
                                        <tr>
                                            <td><%=received.getEmail_address()%></td>
                                            <td class="">
                                                <div>
                                                    <div class="btn-group">
                                                        <a class="btn btn-primary dropdown-toggle btn-sm" data-toggle="dropdown" href="#">
                                                            <i class="fa fa-cog"></i> <span class="caret"></span>
                                                        </a>
                                                        <ul role="menu" class="dropdown-menu pull-right">
                                                            <li role="presentation">
                                                            <clickedUnblockingEmail id="<%=received.getEmail_address()%>">&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <a role="menuitem" tabindex="-1" href="#confirm_unblock" data-toggle="modal">
                                                                    <i class="fa fa-unlock"></i> Unblock
                                                                </a>
                                                            </clickedUnblockingEmail>
                                                            </li>


                                                        </ul>
                                                    </div>
                                                </div></td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                            </div>                                                                              
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


        <!-- start: BOOTSTRAP EXTENDED MODALS -->
        <jsp:include page="page-elements/login_update_modals.jsp"/>
        <jsp:include page="page-elements/user_blacklist_modals.jsp"/>


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
        <script type="text/javascript" src="plugins/DataTables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="plugins/DataTables/media/js/DT_bootstrap.js"></script>
        <script src="js/table-data-blacklist-user.js"></script>
        <script src="plugins/jquery-validation/dist/jquery.validate.min.js"></script>
        <script src="plugins/summernote/build/summernote.min.js"></script>
        <script src="plugins/ckeditor/ckeditor.js"></script>
        <script src="plugins/ckeditor/adapters/jquery.js"></script>
        <script src="plugins/bootstrap-modal/js/bootstrap-modal.js"></script>
        <script src="plugins/bootstrap-modal/js/bootstrap-modalmanager.js"></script>
        <script src="js/ui-modals.js"></script>
        <script src="js/user-blacklist-clickevents.js"></script>
        <script src="js/user-blacklist-functions.js"></script>
        <script src="plugins/gritter/js/jquery.gritter.min.js"></script>
        <script src="plugins/bootstrap-switch/static/js/bootstrap-switch.js"></script>
        <script type="text/javascript" src="js/CapsLock.js"></script>
        <script type="text/javascript" src="js/data-refresh.js"></script>
        
        <!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->

        <script>
            jQuery(document).ready(function () {
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
                Main.init();
                TableData.init();
                UIModals.init();
            });
        </script>
    </body>
    <!-- end: BODY -->
</html>
