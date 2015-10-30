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
    <!-- start HEAD -->
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
        <link rel="stylesheet" href="plugins/bootstrap-switch/static/stylesheets/bootstrap-switch.css">
        <link rel="stylesheet" href="css/theme_light.css" type="text/css" id="skin_color">
        <link rel="stylesheet" href="css/print.css" type="text/css" media="print"/>
        <!--[if IE 7]>
        <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome-ie7.min.css">
        <![endif]-->
        <!-- end: MAIN CSS -->
        <!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
        <link rel="stylesheet" href="plugins/fullcalendar/fullcalendar/fullcalendar.css">
        <link href="plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="plugins/select2/select2.css" />
        <link rel="stylesheet" href="plugins/DataTables/media/css/DT_bootstrap.css" />
        <link rel="stylesheet" href="plugins/summernote/build/summernote.css">
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
            ArrayList reviewAds = (ArrayList) request.getAttribute("reviewAds");
            Iterator itr = reviewAds.iterator();
            AdminClass_ReviewAds received = null;

            String alert = (String) request.getAttribute("alert");

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


                        <li>
                            <a href="BlacklistedUsers" ><i class="clip-user-block"></i>
                                <span class="title"> Blacklisted Users</span><span class="selected"></span>
                            </a>
                        </li>
                        <li class="active open">
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
                                    Review Ads
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
                            <div class="page-header" >
                                <h1 class="hidden-xs">Ads <small class="hidden-xs">review</small></h1>
                            </div>

                            <!-- end: PAGE TITLE & BREADCRUMB -->
                        </div>
                    </div>
                    <!-- end: PAGE HEADER -->
                    <!-- start: PAGE CONTENT -->
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="panel panel-default">
                                <div class="panel-heading hidden-xs">
                                    <i class="clip-user-4"></i>


                                </div>
                                <div class="panel-body">
                                    <table class="table table-striped table-hover" id="sample_1">
                                        <thead>
                                            <tr>
                                                <th class="center hidden-xs">Ad-ID</th>
                                                <th>Title</th>
                                                <th  class="center hidden-xs">Time</th>
                                                <th>Status</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%                                                while (itr.hasNext()) {
                                                    Object a = itr.next();
                                                    received = (AdminClass_ReviewAds) a;
                                            %>

                                            <tr>
                                                <td class=""><%=received.getItem_number()%></td>
                                                <td><%=received.getTitle()%></td>
                                                <td class=""><%=received.getTime_stamp()%></td>
                                                <td><div data-content="<%=received.getReason()%>" data-placement="right" data-trigger="hover" class="btn popovers"><%=received.getStatus()%></div></td>
                                                <td class="">
                                                    <div>
                                                        <div class="btn-group">
                                                            <a class="btn btn-primary dropdown-toggle btn-sm" data-toggle="dropdown" href="#">
                                                                <i class="fa fa-cog"></i> <span class="caret"></span>
                                                            </a>
                                                            <ul role="menu" class="dropdown-menu pull-right">
                                                                <li role="presentation">
                                                                    <a role="menuitem" tabindex="-1" href="#" target="blank">
                                                                        <i class="fa clip-arrow-right-2"></i> View
                                                                    </a>
                                                                </li>
                                                                <li role="presentation">
                                                                    <a role="menuitem" tabindex="-1" href="#confirm_approve<%=received.getItem_number()%>" data-toggle="modal">
                                                                        <i class="fa clip-checkbox-checked"></i><span> Approve</span>

                                                                    </a>
                                                                    <div id="confirm_approve<%=received.getItem_number()%>"  class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" data-width="350" style="display: none;">
                                                                        <div class="modal-header">
                                                                            <h4 class="modal-title"><input type="radio" class="square-green" value="" checked="checked" >Confirmation</h4>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <span class="badge badge-info">Approve the advertiesment?</span>

                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" data-dismiss="modal" class="btn btn-light-grey">
                                                                                Cancel
                                                                            </button>
                                                                            <button type="button" class="btn btn-blue" onclick="approve('<%=received.getItem_number()%>', '<%=received.getUsername()%>', '<%=received.getTitle()%>')">
                                                                                Approve
                                                                            </button>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li role="presentation">
                                                                    <a role="menuitem" tabindex="-1"  href="#Modify<%=received.getItem_number()%>" data-toggle="modal">
                                                                        <i class="fa clip-bulb"></i>Modify
                                                                    </a>
                                                                    <div id="Modify<%=received.getItem_number()%>" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" style="display: none;">
                                                                        <div class="modal-header">
                                                                            <label class=" control-label">
                                                                                <span class=" badge">Reason for Modifying Ad:</span><span class="symbol required"></span>
                                                                            </label>
                                                                        </div>

                                                                        <div class="modal-body">

                                                                            <input type="hidden" id="MINMA<%=received.getItem_number()%>" value="<%=received.getItem_number()%>">
                                                                            <input type="hidden" id="MITMA<%=received.getItem_number()%>" value="<%=received.getTitle()%>">
                                                                            <input type="hidden" id="MIUMA<%=received.getItem_number()%>" value="<%=received.getUsername()%>">
                                                                            <div class="form-group">

                                                                                <textarea class="autosize form-control" placeholder="Reason for modification" id="itemRMA<%=received.getItem_number()%>" required="true"  rows="5" style="overflow-y: auto;resize: none; word-wrap: break-word;"></textarea>
                                                                            </div>

                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" data-dismiss="modal" class="btn btn-default">
                                                                                Cancel
                                                                            </button>
                                                                            <clickedReportModifyAd id="MA<%=received.getItem_number()%>">
                                                                                <button class="btn btn-primary">
                                                                                    Proceed
                                                                                </button>
                                                                            </clickedReportModifyAd>
                                                                        </div>
                                                                    </div>
                                                                </li>
                                                                <li role="presentation">
                                                                    <a role="menuitem" tabindex="-1" href="#confirm_remove<%=received.getItem_number()%>" data-toggle="modal">
                                                                        <i class="fa clip-remove"></i><span> Remove</span>

                                                                    </a>
                                                                    <div id="confirm_remove<%=received.getItem_number()%>"  class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false" data-width="350" style="display: none;">
                                                                        <div class="modal-header">
                                                                            <h4 class="modal-title"><input type="radio" class="square-green" value="" checked="checked" >Confirmation</h4>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <span class="badge badge-info">Remove the advertiesment?</span>

                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" data-dismiss="modal" class="btn btn-light-grey">
                                                                                Cancel
                                                                            </button>
                                                                            <button type="button" class="btn btn-blue" onclick="removeAd('<%=received.getItem_number()%>', '<%=received.getUsername()%>', '<%=received.getTitle()%>');">
                                                                                Remove
                                                                            </button>
                                                                        </div>
                                                                    </div>
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
        <jsp:include page="page-elements/ads_review_modals.jsp"/>
        <jsp:include page="page-elements/login_update_modals.jsp"/>
        <!-- start: MAIN JAVASCRIPTS -->
        <!--[if lt IE 9]>
        <script src="admin/plugins/respond.min.js"></script>
        <script src="admin/plugins/excanvas.min.js"></script>
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
        <script src="plugins/bootstrap-modal/js/bootstrap-modal.js"></script>
        <script src="plugins/bootstrap-modal/js/bootstrap-modalmanager.js"></script>
        <script src="js/ui-modals.js"></script>
        <script src="plugins/jquery-inputlimiter/jquery.inputlimiter.1.3.1.min.js"></script>
        <script src="plugins/autosize/jquery.autosize.min.js"></script>
        <script type="text/javascript" src="plugins/DataTables/media/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="plugins/DataTables/media/js/DT_bootstrap.js"></script>
        <script src="js/table-data-ads.js"></script>
        <script src="plugins/jquery-validation/dist/jquery.validate.min.js"></script>
        <script src="plugins/summernote/build/summernote.min.js"></script>
        <script src="plugins/ckeditor/ckeditor.js"></script>
        <script src="plugins/ckeditor/adapters/jquery.js"></script>
        <script src="js/form-validation.js"></script>
        <script src="plugins/bootstrap-modal/js/bootstrap-modal.js"></script>
        <script src="plugins/bootstrap-modal/js/bootstrap-modalmanager.js"></script>
        <script src="plugins/bootstrap-switch/static/js/bootstrap-switch.js"></script>
        <script src="js/ui-modals.js"></script>
        <script src="js/ads-review-clickevents.js"></script>
        <script src="js/ads-review-functions.js"></script>
        <script src="plugins/gritter/js/jquery.gritter.min.js"></script>
        <script type="text/javascript" src="js/CapsLock.js"></script>
        <script type="text/javascript" src="js/data-refresh.js"></script>


        <!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
        <script>
                                                                                jQuery(document).ready(function () {
                                                                                    Main.init();
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
                                                                                    TableData.init();

                                                                                });

        </script>

    </body>
    <!-- end: BODY -->
</html>
