<%-- 
    Document   : index
    Created on : Jun 22, 2015, 6:48:51 PM
    Author     : SithuDewmi
--%>

<%@page import="java.util.TimeZone"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="classes.AdminClass_Overviewstats"%>
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
        <link href="plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="plugins/summernote/build/summernote.css">
        <link href="plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css"/>
        <link href="plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="plugins/bootstrap-daterangepicker/daterangepicker-bs3.css">
        <link rel="stylesheet" href="plugins/bootstrap-switch/static/stylesheets/bootstrap-switch.css">
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
            ArrayList al = (ArrayList) request.getAttribute("categoriesPresentage");
            Iterator itr = al.iterator();
            AdminClass_Overviewstats received = null;
            ArrayList catname = new ArrayList();
            ArrayList catval = new ArrayList();
            while (itr.hasNext()) {
                Object a = itr.next();
                received = (AdminClass_Overviewstats) a;
                catname.add(received.getCategory());
                catval.add(received.getCount());
            }

            al = (ArrayList) request.getAttribute("pagevisitMonth");
            itr = al.iterator();
            ArrayList pvmonth = new ArrayList();
            ArrayList pvcount = new ArrayList();
            while (itr.hasNext()) {
                Object a = itr.next();
                received = (AdminClass_Overviewstats) a;
                pvmonth.add(received.getTimePeriod());
                pvcount.add(received.getCount());

            }

            al = (ArrayList) request.getAttribute("usersMonth");
            itr = al.iterator();
            ArrayList umonth = new ArrayList();
            ArrayList ucount = new ArrayList();
            while (itr.hasNext()) {
                Object a = itr.next();
                received = (AdminClass_Overviewstats) a;
                umonth.add(received.getTimePeriod());
                ucount.add(received.getCount());

            }

            al = (ArrayList) request.getAttribute("adsMonth");
            itr = al.iterator();
            ArrayList amonth = new ArrayList();
            ArrayList acount = new ArrayList();
            while (itr.hasNext()) {
                Object a = itr.next();
                received = (AdminClass_Overviewstats) a;
                amonth.add(received.getTimePeriod());
                acount.add(received.getCount());

            }

            al = (ArrayList) request.getAttribute("pagevisitYear");
            itr = al.iterator();
            ArrayList pvyear = new ArrayList();
            ArrayList pvycount = new ArrayList();
            while (itr.hasNext()) {
                Object a = itr.next();
                received = (AdminClass_Overviewstats) a;
                pvyear.add(received.getTimePeriod());
                pvycount.add(received.getCount());

            }

            al = (ArrayList) request.getAttribute("usersYear");
            itr = al.iterator();
            ArrayList uyear = new ArrayList();
            ArrayList uycount = new ArrayList();
            while (itr.hasNext()) {
                Object a = itr.next();
                received = (AdminClass_Overviewstats) a;
                uyear.add(received.getTimePeriod());
                uycount.add(received.getCount());

            }

            al = (ArrayList) request.getAttribute("adsYear");
            itr = al.iterator();
            ArrayList ayear = new ArrayList();
            ArrayList aycount = new ArrayList();
            while (itr.hasNext()) {
                Object a = itr.next();
                received = (AdminClass_Overviewstats) a;
                ayear.add(received.getTimePeriod());
                aycount.add(received.getCount());

            }

            al = (ArrayList) request.getAttribute("adsDistrict");
            itr = al.iterator();
            ArrayList district = new ArrayList();
            ArrayList count = new ArrayList();
            while (itr.hasNext()) {
                Object a = itr.next();
                received = (AdminClass_Overviewstats) a;
                district.add(received.getDictrict());
                count.add(received.getCount());

            }


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
                        <li class="active open">
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
                                    Dashboard
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
                                <h1>Dashboard <small>overview &amp; stats </small></h1>
                            </div>
                            <!-- end: PAGE TITLE & BREADCRUMB -->
                        </div>
                    </div>
                    <!-- end: PAGE HEADER -->
                    <!-- start: PAGE CONTENT -->
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="core-box">
                                <div class="heading">
                                    <a href="ReviewAds">
                                        <i class="clip-user-4 circle-icon circle-green"></i>  
                                        <span id="RA" class="badge"></span>
                                        <h2>Review Ads</h2>
                                    </a>
                                </div>


                            </div>
                        </div>

                        <div class="col-sm-4">
                            <div class="core-box">
                                <div class="heading">
                                    <a href="ViewReports">
                                        <i class="clip-clip circle-icon circle-teal"></i>
                                        <span id="VR" class="badge"></span>
                                        <h2>View Reports</h2>
                                    </a>
                                </div>

                            </div>
                        </div>

                        <div class="col-sm-4">
                            <div class="core-box">
                                <div class="heading">
                                    <a href="upgrade.jsp">	
                                        <i class="clip-thumbs-up circle-icon circle-bricky"></i>
                                        <span id="TA" class="badge"></span>
                                        <h2>Upgrade Top Ads</h2>
                                    </a>
                                </div>

                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-sm-7">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <i class="clip-stats"></i>
                                    <div id="date"></div>
                                    <div class="panel-tools">

                                        <a class="btn btn-xs btn-link panel-close" href="#">
                                            <i class="fa fa-times"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <div id="chart_div"  style=" height: 200px; " ></div>

                                </div>
                            </div>
                        </div>
                        <div class="col-sm-5">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <i class="clip-pie"></i>
                                            Categories
                                            <div class="panel-tools">

                                                <a class="btn btn-xs btn-link panel-close" href="#">
                                                    <i class="fa fa-times"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="panel-body">
                                            <div id="piechart" style=""></div>


                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="row space12">
                                <ul class="mini-stats col-sm-12">
                                    <a href="#sitevisit" data-toggle="modal" onclick="clr()">
                                        <li class="col-sm-4">
                                            <div id="columnchart_sitevisit" style="width: 250px; height: 170px;"></div>

                                        </li>
                                    </a>
                                    <a href="#allusers" data-toggle="modal" onclick="clr()">
                                        <li class="col-sm-4">
                                            <div id="columnchart_users" style="width: 250px; height: 170px;"></div>

                                        </li>
                                    </a>
                                    <a href="#allads" data-toggle="modal" onclick="clr()">
                                        <li class="col-sm-4">
                                            <div id="columnchart_ads" style="width: 250px; height: 170px;"></div>

                                        </li>
                                    </a>

                                </ul>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="row space12">
                                <ul class="mini-stats col-sm-12">
                                    <div id="columnchart_districts" ></div>
                                </ul>
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
        <jsp:include page="page-elements/login_update_modals.jsp"/>

        <%            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String timeZone = "Asia/Colombo";
            sdf.setTimeZone(TimeZone.getTimeZone(timeZone));
            Calendar c1 = Calendar.getInstance();
            Calendar now = Calendar.getInstance();
            c1.set(now.get(Calendar.YEAR), now.get(Calendar.MONTH), 01);

            c1.add(Calendar.MONTH, -12);

            double totalVisit = 0;
            for (int i = 0; i < pvcount.size(); i++) {
                totalVisit += Integer.parseInt((String) pvcount.get(i));
            }

            double totalVisitYear = 0;
            for (int i = 0; i < pvycount.size(); i++) {
                totalVisitYear += Integer.parseInt((String) pvycount.get(i));
            }

        %>

        <div id="sitevisit" class="modal fade" tabindex="-1" data-width="1000" style="display: none;">
            <div class="modal-header">

                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>


            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <!-- start: FORM VALIDATION 1 PANEL -->
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <i class="fa fa-external-link-square"></i>
                                Site visit Summary

                            </div>
                            <div class="panel-body">
                                <div class="col-md-6">
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-hover" id="sample-table-1">
                                            <thead>
                                                <tr>

                                                    <th class="hidden-xs">Time period(Month)</th><th class="visible-xs">By Month</th>
                                                    <th class="hidden-xs">Visit count</th><th class="visible-xs">Visits</th>
                                                    <th class="hidden-xs">Percentage</th><th class="visible-xs">%</th>


                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%for (int i = 0; i < 13; i++) {
                                                        String thisMonth = (String) sdf.format(c1.getTime());
                                                        c1.add(Calendar.MONTH, +1);
                                                        String nextMonth = (String) sdf.format(c1.getTime());
                                                        DecimalFormat twoDForm = new DecimalFormat("#.#");
                                                        String percentage = twoDForm.format(Integer.parseInt((String) pvcount.get(i)) / totalVisit * 100);
                                                        if (totalVisit == 0) {
                                                            percentage = "0";
                                                        }
                                                %>

                                                <tr>

                                                    <td class="hidden-xs"><%=thisMonth%> to <%=nextMonth%></td><td class="visible-xs"><%=thisMonth%></td>
                                                    <td><%=pvcount.get(i)%></td>
                                                    <td><%=percentage%>%</td>

                                                </tr>
                                                <%}%>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md-5"><span class="badge">For the past 12 Months:</span></div>
                                        <div class="col-md-1"><span class="badge badge-success"><%=Math.round(totalVisit)%></span></div>
                                    </div><br>
                                    <div class="row">
                                        <div class="col-md-5"><span class="badge">For the past 6 Years:</span></div>
                                        <div class="col-md-1"><span class="badge badge-success"><%=Math.round(totalVisitYear)%></span></div>
                                    </div>
                                </div>
                                <div class="col-md-6">

                                    <br><span class="badge">Custom Visit count</span>
                                    <br><input id="firstdate" type="text" placeholder="Ex-2015-01-31" >To<br class="visible-xs"><input type="text" placeholder="Ex-2015-01-31" id="seconddate">

                                    <button onclick="customData()" class="btn btn-blue btn-xs">Search</button>&nbsp;<button onclick="clr()" class="btn btn-danger btn-xs">clear</button>
                                    <br><br><div><span class="badge badge-success" id="CustomDataJson"></span></div>
                                </div><br>

                                <div class="col-md-6">
                                    <div class="table-responsive"><br>
                                        <table class="table table-bordered table-hover" id="sample-table-1">
                                            <thead>
                                                <tr>

                                                    <th class="hidden-xs">Time period(Year)</th><th class="visible-xs">By Year</th>
                                                    <th class="hidden-xs">Visit count</th><th class="visible-xs">Visits</th>
                                                    <th class="hidden-xs">Percentage</th><th class="visible-xs">%</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%for (int i = 0; i < 7; i++) {

                                                        DecimalFormat twoDForm = new DecimalFormat("#.#");
                                                        String percentage = twoDForm.format(Integer.parseInt((String) pvycount.get(i)) / totalVisitYear * 100);
                                                        if (totalVisitYear == 0) {
                                                            percentage = "0";
                                                        }
                                                %>

                                                <tr>

                                                    <td class="hidden-xs"><%=pvyear.get(i)%></td><td class="visible-xs"><%=String.valueOf(pvyear.get(i)).substring(0, 10)%></td>
                                                    <td><%=pvycount.get(i)%></td>
                                                    <td><%=percentage%>%</td>

                                                </tr>
                                                <%    }%>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>

                            </div>
                        </div>
                        <!-- end: FORM VALIDATION 1 PANEL -->
                    </div>
                </div>
            </div>

        </div>
        <%

            float totalUsers = 0;
            for (int i = 0; i < ucount.size(); i++) {
                totalUsers += Integer.parseInt((String) ucount.get(i));
            }

            float totalUsersYear = 0;
            for (int i = 0; i < uycount.size(); i++) {
                totalUsersYear += Integer.parseInt((String) uycount.get(i));
            }
            c1.set(now.get(Calendar.YEAR), now.get(Calendar.MONTH), 01);
            c1.add(Calendar.MONTH, -12);

        %>

        <div id="allusers" class="modal fade" tabindex="-1" data-width="1000" style="display: none;">
            <div class="modal-header">

                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>


            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <!-- start: FORM VALIDATION 1 PANEL -->
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <i class="fa fa-external-link-square"></i>
                                All users Summary

                            </div>
                            <div class="panel-body">
                                <div class="col-md-6">
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-hover" id="sample-table-1">
                                            <thead>
                                                <tr>

                                                    <th class="hidden-xs">Time period(Month)</th><th class="visible-xs">By Month</th>
                                                    <th class="hidden-xs">Users count</th><th class="visible-xs">Users</th>
                                                    <th class="hidden-xs">Percentage</th><th class="visible-xs">%</th>


                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%for (int i = 0; i < 13; i++) {
                                                        String thisMonth = (String) sdf.format(c1.getTime());
                                                        c1.add(Calendar.MONTH, +1);
                                                        String nextMonth = (String) sdf.format(c1.getTime());
                                                        DecimalFormat twoDForm = new DecimalFormat("#.#");
                                                        String percentage = twoDForm.format(Integer.parseInt((String) ucount.get(i)) / totalUsers * 100);
                                                        if (totalUsers == 0) {
                                                            percentage = "0";
                                                        }
                                                %>

                                                <tr>

                                                    <td class="hidden-xs"><%=thisMonth%> to <%=nextMonth%></td><td class="visible-xs"><%=thisMonth%></td>
                                                    <td><%=ucount.get(i)%></td>
                                                    <td><%=percentage%>%</td>

                                                </tr>
                                                <%    }%>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md-5"><span class="badge">Users for the past 12 Months:</span></div>
                                        <div class="col-md-1"><span class="badge badge-success"><%=Math.round(totalUsers)%></span></div>
                                    </div><br>
                                    <div class="row">
                                        <div class="col-md-5"><span class="badge">Users for the past 6 Years:</span></div>
                                        <div class="col-md-1"><span class="badge badge-success"><%=Math.round(totalUsersYear)%></span></div>
                                    </div>
                                </div>
                                <div class="col-md-6">

                                    <br><span class="badge">Custom User count</span>
                                    <br> <input id="firstdateuser" type="text" placeholder="Ex-2015-01-31" >To<br class="visible-xs"><input type="text" placeholder="Ex-2015-01-31" id="seconddateuser">

                                    <button onclick="customDataUser()" class="btn btn-blue btn-xs">Search</button>&nbsp;<button onclick="clr()" class="btn btn-danger btn-xs">clear</button>
                                    <br><br><div><span class="badge badge-success" id="CustomDataUserJson"></span></div>
                                </div><br>
                                <div class="col-md-6">
                                    <div class="table-responsive"><br>
                                        <table class="table table-bordered table-hover" id="sample-table-1">
                                            <thead>
                                                <tr>


                                                    <th class="hidden-xs">Time period(Year)</th><th class="visible-xs">By Year</th>
                                                    <th class="hidden-xs">Users count</th><th class="visible-xs">Users</th>
                                                    <th class="hidden-xs">Percentage</th><th class="visible-xs">%</th>


                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%for (int i = 0; i < 7; i++) {

                                                        DecimalFormat twoDForm = new DecimalFormat("#.#");
                                                        String percentage = twoDForm.format(Integer.parseInt((String) uycount.get(i)) / totalUsersYear * 100);
                                                        if (totalUsersYear == 0) {
                                                            percentage = "0";
                                                        }
                                                %>

                                                <tr>

                                                    <td class="hidden-xs"><%=uyear.get(i)%></td><td class="visible-xs"><%=String.valueOf(uyear.get(i)).substring(0, 10)%></td>
                                                    <td><%=uycount.get(i)%></td>
                                                    <td><%=percentage%>%</td>

                                                </tr>
                                                <%    }%>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>

                            </div>
                        </div>
                        <!-- end: FORM VALIDATION 1 PANEL -->
                    </div>
                </div>
            </div>

        </div>

        <%

            float totalAds = 0;
            for (int i = 0; i < acount.size(); i++) {
                totalAds += Integer.parseInt((String) acount.get(i));
            }

            float totalAdsYear = 0;
            for (int i = 0; i < aycount.size(); i++) {
                totalAdsYear += Integer.parseInt((String) aycount.get(i));
            }
            c1.set(now.get(Calendar.YEAR), now.get(Calendar.MONTH), 01);
            c1.add(Calendar.MONTH, -12);

        %>                                    

        <div id="allads" class="modal fade" tabindex="-1" data-width="1000" style="display: none;">
            <div class="modal-header">

                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>


            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <!-- start: FORM VALIDATION 1 PANEL -->
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <i class="fa fa-external-link-square"></i>
                                All ads Summary

                            </div>
                            <div class="panel-body">
                                <div class="col-md-6">
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-hover" id="sample-table-1">
                                            <thead>
                                                <tr>

                                                    <th class="hidden-xs">Time period(Month)</th><th class="visible-xs">By Month</th>
                                                    <th class="hidden-xs">Ads count</th><th class="visible-xs">Ads</th>
                                                    <th class="hidden-xs">Percentage</th><th class="visible-xs">%</th>



                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%for (int i = 0; i < 13; i++) {
                                                        String thisMonth = (String) sdf.format(c1.getTime());
                                                        c1.add(Calendar.MONTH, +1);
                                                        String nextMonth = (String) sdf.format(c1.getTime());
                                                        DecimalFormat twoDForm = new DecimalFormat("#.#");
                                                        String percentage = twoDForm.format(Integer.parseInt((String) acount.get(i)) / totalAds * 100);
                                                        if (totalAds == 0) {
                                                            percentage = "0";
                                                        }
                                                %>

                                                <tr>

                                                    <td class="hidden-xs"><%=thisMonth%> to <%=nextMonth%></td><td class="visible-xs"><%=thisMonth%></td>
                                                    <td><%=acount.get(i)%></td>
                                                    <td><%=percentage%>%</td>

                                                </tr>
                                                <%    }%>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md-5"><span class="badge">Ads for the past 12 Months:</span></div>
                                        <div class="col-md-1"><span class="badge badge-success"><%=Math.round(totalAds)%></span></div>
                                    </div><br>
                                    <div class="row">
                                        <div class="col-md-5"><span class="badge">Ads for the past 6 Years:</span></div>
                                        <div class="col-md-1"><span class="badge badge-success"><%=Math.round(totalAdsYear)%></span></div>
                                    </div>
                                </div>
                                <div class="col-md-6">

                                    <br><span class="badge">Custom Ads count</span>
                                    <br> <input id="firstdateads" type="text" placeholder="Ex-2015-01-31" >To<br class="visible-xs"><input type="text" placeholder="Ex-2015-01-31" id="seconddateads">

                                    <button onclick="customDataAds()" class="btn btn-blue btn-xs">Search</button>&nbsp;<button onclick="clr()" class="btn btn-danger btn-xs">clear</button>
                                    <br><br><div><span class="badge badge-success" id="CustomDataAdsJson"></span></div>
                                </div><br>    
                                <div class="col-md-6  ">
                                    <div class="table-responsive"><br>
                                        <table class="table table-bordered table-hover" id="sample-table-1">
                                            <thead>
                                                <tr>

                                                    <th class="hidden-xs">Time period(Year)</th><th class="visible-xs">By Year</th>
                                                    <th class="hidden-xs">Ads count</th><th class="visible-xs">Ads</th>
                                                    <th class="hidden-xs">Percentage</th><th class="visible-xs">%</th>


                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%for (int i = 0; i < 7; i++) {

                                                        DecimalFormat twoDForm = new DecimalFormat("#.#");
                                                        String percentage = twoDForm.format(Integer.parseInt((String) aycount.get(i)) / totalAdsYear * 100);
                                                        if (totalAdsYear == 0) {
                                                            percentage = "0";
                                                        }
                                                %>

                                                <tr>

                                                    <td class="hidden-xs"><%=ayear.get(i)%></td><td class="visible-xs"><%=String.valueOf(ayear.get(i)).substring(0, 10)%></td>
                                                    <td><%=aycount.get(i)%></td>
                                                    <td><%=percentage%>%</td>

                                                </tr>
                                                <%    }%>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>

                            </div>
                        </div>
                        <!-- end: FORM VALIDATION 1 PANEL -->
                    </div>
                </div>
            </div>

        </div>
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
        <script src="plugins/jquery-validation/dist/jquery.validate.min.js"></script>
        <script src="plugins/summernote/build/summernote.min.js"></script>
        <script src="plugins/ckeditor/ckeditor.js"></script>
        <script src="plugins/ckeditor/adapters/jquery.js"></script>
        <script src="plugins/bootstrap-modal/js/bootstrap-modal.js"></script>
        <script src="plugins/bootstrap-modal/js/bootstrap-modalmanager.js"></script>
        <script src="js/ui-modals.js"></script>
        <script src="plugins/bootstrap-switch/static/js/bootstrap-switch.js"></script>
        <!-- load Google AJAX API -->
        <script type="text/javascript" src="js/chart.js"></script>
        <script type="text/javascript" src="js/CapsLock.js"></script>
        <script type="text/javascript" src="js/data-refresh.js"></script>




        <script type="text/javascript">

                                        google.load("visualization", "1", {packages: ["corechart"]});
                                        google.setOnLoadCallback(drawChart);
                                        function drawChart() {

                                            var data = google.visualization.arrayToDataTable([
                                                ['Task', 'Hours per Day'],
                                                ["<%=(String) catname.get(0)%>", <%=(String) catval.get(0)%>],
                                                ["<%=(String) catname.get(1)%>", <%=(String) catval.get(1)%>],
                                                ["<%=(String) catname.get(2)%>", <%=(String) catval.get(2)%>],
                                                ["<%=(String) catname.get(3)%>", <%=(String) catval.get(3)%>],
                                                ["<%=(String) catname.get(4)%>", <%=(String) catval.get(4)%>],
                                                ["<%=(String) catname.get(5)%>", <%=(String) catval.get(5)%>],
                                                ["<%=(String) catname.get(6)%>", <%=(String) catval.get(6)%>],
                                                ["<%=(String) catname.get(7)%>", <%=(String) catval.get(7)%>],
                                                ["<%=(String) catname.get(8)%>", <%=(String) catval.get(8)%>],
                                                ["<%=(String) catname.get(9)%>", <%=(String) catval.get(9)%>],
                                                ["<%=(String) catname.get(10)%>",<%=(String) catval.get(10)%>],
                                                ["<%=(String) catname.get(11)%>",<%=(String) catval.get(11)%>]
                                            ]);
                                            var chart = new google.visualization.PieChart(document.getElementById('piechart'));
                                            chart.draw(data);
                                        }
        </script>


        <script type="text/javascript">//area chart

            google.load("visualization", "1", {packages: ["corechart"]});
            google.setOnLoadCallback(drawChart);
            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Month', 'Visits'],
                    ['<%=(String) pvmonth.get(0)%>', <%=(String) pvcount.get(0)%>],
                    ['<%=(String) pvmonth.get(1)%>', <%=(String) pvcount.get(1)%>],
                    ['<%=(String) pvmonth.get(2)%>', <%=(String) pvcount.get(2)%>],
                    ['<%=(String) pvmonth.get(3)%>', <%=(String) pvcount.get(3)%>],
                    ['<%=(String) pvmonth.get(4)%>', <%=(String) pvcount.get(4)%>],
                    ['<%=(String) pvmonth.get(5)%>', <%=(String) pvcount.get(5)%>],
                    ['<%=(String) pvmonth.get(6)%>', <%=(String) pvcount.get(6)%>],
                    ['<%=(String) pvmonth.get(7)%>', <%=(String) pvcount.get(7)%>],
                    ['<%=(String) pvmonth.get(8)%>', <%=(String) pvcount.get(8)%>],
                    ['<%=(String) pvmonth.get(9)%>', <%=(String) pvcount.get(9)%>],
                    ['<%=(String) pvmonth.get(10)%>', <%=(String) pvcount.get(10)%>],
                    ['<%=(String) pvmonth.get(11)%>', <%=(String) pvcount.get(11)%>],
                    ['<%=(String) pvmonth.get(12)%>', <%=(String) pvcount.get(12)%>]


                ]);
                var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
                chart.draw(data);
                var y = new Date().getFullYear();
                var m = new Date().getMonth() + 1;
                document.getElementById("date").innerHTML = '12months Sitevisits upto ' + m + "-" + y;
            }
        </script>


        <script type="text/javascript">
            google.load("visualization", "1", {packages: ["corechart"]});
            google.setOnLoadCallback(drawChart);
            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Month', 'Visits', {role: "style"}],
                    ['<%=(String) pvmonth.get(0)%>', <%=(String) pvcount.get(0)%>, "#3366CC"],
                    ['<%=(String) pvmonth.get(1)%>', <%=(String) pvcount.get(1)%>, "#3366CC"],
                    ['<%=(String) pvmonth.get(2)%>', <%=(String) pvcount.get(2)%>, "#3366CC"],
                    ['<%=(String) pvmonth.get(3)%>', <%=(String) pvcount.get(3)%>, "#3366CC"],
                    ['<%=(String) pvmonth.get(4)%>', <%=(String) pvcount.get(4)%>, "#3366CC"],
                    ['<%=(String) pvmonth.get(5)%>', <%=(String) pvcount.get(5)%>, "#3366CC"],
                    ['<%=(String) pvmonth.get(6)%>', <%=(String) pvcount.get(6)%>, "#3366CC"],
                    ['<%=(String) pvmonth.get(7)%>', <%=(String) pvcount.get(7)%>, "#3366CC"],
                    ['<%=(String) pvmonth.get(8)%>', <%=(String) pvcount.get(8)%>, "#3366CC"],
                    ['<%=(String) pvmonth.get(9)%>', <%=(String) pvcount.get(9)%>, "#3366CC"],
                    ['<%=(String) pvmonth.get(10)%>', <%=(String) pvcount.get(10)%>, "#3366CC"],
                    ['<%=(String) pvmonth.get(11)%>', <%=(String) pvcount.get(11)%>, "#3366CC"],
                    ['<%=(String) pvmonth.get(12)%>', <%=(String) pvcount.get(12)%>, "#3366CC"]
                ]);
                var view = new google.visualization.DataView(data);
                view.setColumns([0, 1,
                    {calc: "stringify",
                        sourceColumn: 1,
                        type: "string",
                        role: "annotation"},
                    2]);
                var y = new Date().getFullYear();
                var m = new Date().getMonth() + 1;

                var options = {
                    title: 'Site visits for 12 months upto ' + m + "-" + y,
                    legend: {position: "none"}
                };
                var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_sitevisit"));
                chart.draw(view, options);
            }
        </script>
        <script type="text/javascript">
            google.load("visualization", "1", {packages: ["corechart"]});
            google.setOnLoadCallback(drawChart);
            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Month', 'Users', {role: "style"}],
                    ['<%=(String) umonth.get(0)%>', <%=(String) ucount.get(0)%>, "#3366CC"],
                    ['<%=(String) umonth.get(1)%>', <%=(String) ucount.get(1)%>, "#3366CC"],
                    ['<%=(String) umonth.get(2)%>', <%=(String) ucount.get(2)%>, "#3366CC"],
                    ['<%=(String) umonth.get(3)%>', <%=(String) ucount.get(3)%>, "#3366CC"],
                    ['<%=(String) umonth.get(4)%>', <%=(String) ucount.get(4)%>, "#3366CC"],
                    ['<%=(String) umonth.get(5)%>', <%=(String) ucount.get(5)%>, "#3366CC"],
                    ['<%=(String) umonth.get(6)%>', <%=(String) ucount.get(6)%>, "#3366CC"],
                    ['<%=(String) umonth.get(7)%>', <%=(String) ucount.get(7)%>, "#3366CC"],
                    ['<%=(String) umonth.get(8)%>', <%=(String) ucount.get(8)%>, "#3366CC"],
                    ['<%=(String) umonth.get(9)%>', <%=(String) ucount.get(9)%>, "#3366CC"],
                    ['<%=(String) umonth.get(10)%>', <%=(String) ucount.get(10)%>, "#3366CC"],
                    ['<%=(String) umonth.get(11)%>', <%=(String) ucount.get(11)%>, "#3366CC"],
                    ['<%=(String) umonth.get(12)%>', <%=(String) ucount.get(12)%>, "#3366CC"]
                ]);
                var view = new google.visualization.DataView(data);
                view.setColumns([0, 1,
                    {calc: "stringify",
                        sourceColumn: 1,
                        type: "string",
                        role: "annotation"},
                    2]);
                var y = new Date().getFullYear();
                var m = new Date().getMonth() + 1;

                var options = {
                    title: 'Active users for 12 months upto ' + m + "-" + y,
                    legend: {position: "none"}
                };
                var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_users"));
                chart.draw(view, options);
            }
        </script>
        <script type="text/javascript">
            google.load("visualization", "1", {packages: ["corechart"]});
            google.setOnLoadCallback(drawChart);
            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Month', 'Ads', {role: "style"}],
                    ['<%=(String) amonth.get(0)%>', <%=(String) acount.get(0)%>, "#3366CC"],
                    ['<%=(String) amonth.get(1)%>', <%=(String) acount.get(1)%>, "#3366CC"],
                    ['<%=(String) amonth.get(2)%>', <%=(String) acount.get(2)%>, "#3366CC"],
                    ['<%=(String) amonth.get(3)%>', <%=(String) acount.get(3)%>, "#3366CC"],
                    ['<%=(String) amonth.get(4)%>', <%=(String) acount.get(4)%>, "#3366CC"],
                    ['<%=(String) amonth.get(5)%>', <%=(String) acount.get(5)%>, "#3366CC"],
                    ['<%=(String) amonth.get(6)%>', <%=(String) acount.get(6)%>, "#3366CC"],
                    ['<%=(String) amonth.get(7)%>', <%=(String) acount.get(7)%>, "#3366CC"],
                    ['<%=(String) amonth.get(8)%>', <%=(String) acount.get(8)%>, "#3366CC"],
                    ['<%=(String) amonth.get(9)%>', <%=(String) acount.get(9)%>, "#3366CC"],
                    ['<%=(String) amonth.get(10)%>', <%=(String) acount.get(10)%>, "#3366CC"],
                    ['<%=(String) amonth.get(11)%>', <%=(String) acount.get(11)%>, "#3366CC"],
                    ['<%=(String) amonth.get(12)%>', <%=(String) acount.get(12)%>, "#3366CC"]
                ]);
                var view = new google.visualization.DataView(data);
                view.setColumns([0, 1,
                    {calc: "stringify",
                        sourceColumn: 1,
                        type: "string",
                        role: "annotation"},
                    2]);
                var y = new Date().getFullYear();
                var m = new Date().getMonth() + 1;

                var options = {
                    title: 'Active ads for 12 months upto ' + m + "-" + y,
                    legend: {position: "none"}
                };
                var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_ads"));
                chart.draw(view, options);
            }
        </script>
        <script type="text/javascript">
            google.load("visualization", "1", {packages: ["corechart"]});
            google.setOnLoadCallback(drawChart);
            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['District', 'Ads', {role: "style"}],
                    ['<%=(String) district.get(0)%>', <%=(String) ucount.get(0)%>, "#3366CC"],
                    ['<%=(String) district.get(1)%>', <%=(String) count.get(1)%>, "#3366CC"],
                    ['<%=(String) district.get(2)%>', <%=(String) count.get(2)%>, "#3366CC"],
                    ['<%=(String) district.get(3)%>', <%=(String) count.get(3)%>, "#3366CC"],
                    ['<%=(String) district.get(4)%>', <%=(String) count.get(4)%>, "#3366CC"],
                    ['<%=(String) district.get(5)%>', <%=(String) count.get(5)%>, "#3366CC"],
                    ['<%=(String) district.get(6)%>', <%=(String) count.get(6)%>, "#3366CC"],
                    ['<%=(String) district.get(7)%>', <%=(String) count.get(7)%>, "#3366CC"],
                    ['<%=(String) district.get(8)%>', <%=(String) count.get(8)%>, "#3366CC"],
                    ['<%=(String) district.get(9)%>', <%=(String) count.get(9)%>, "#3366CC"],
                    ['<%=(String) district.get(10)%>', <%=(String) count.get(10)%>, "#3366CC"],
                    ['<%=(String) district.get(11)%>', <%=(String) count.get(11)%>, "#3366CC"],
                    ['<%=(String) district.get(12)%>', <%=(String) count.get(12)%>, "#3366CC"],
                    ['<%=(String) district.get(13)%>', <%=(String) count.get(13)%>, "#3366CC"],
                    ['<%=(String) district.get(14)%>', <%=(String) count.get(14)%>, "#3366CC"],
                    ['<%=(String) district.get(15)%>', <%=(String) count.get(15)%>, "#3366CC"],
                    ['<%=(String) district.get(16)%>', <%=(String) count.get(16)%>, "#3366CC"],
                    ['<%=(String) district.get(17)%>', <%=(String) count.get(17)%>, "#3366CC"],
                    ['<%=(String) district.get(18)%>', <%=(String) count.get(18)%>, "#3366CC"],
                    ['<%=(String) district.get(19)%>', <%=(String) count.get(19)%>, "#3366CC"],
                    ['<%=(String) district.get(20)%>', <%=(String) count.get(20)%>, "#3366CC"],
                    ['<%=(String) district.get(21)%>', <%=(String) count.get(21)%>, "#3366CC"],
                    ['<%=(String) district.get(22)%>', <%=(String) count.get(22)%>, "#3366CC"],
                    ['<%=(String) district.get(23)%>', <%=(String) count.get(23)%>, "#3366CC"],
                    ['<%=(String) district.get(24)%>', <%=(String) count.get(24)%>, "#3366CC"]


                ]);
                var view = new google.visualization.DataView(data);
                view.setColumns([0, 1,
                    {calc: "stringify",
                        sourceColumn: 1,
                        type: "string",
                        role: "annotation"},
                    2]);
                var options = {
                    title: 'Active ads for Districts',
                    legend: {position: "none"}
                };
                var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_districts"));
                chart.draw(view, options);
            }

        </script>
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
                UIModals.init();
                
            });
        </script>
    </body>
    <!-- end: BODY -->
</html>
