<%-- 
    Document   : header
    Created on : Aug 15, 2015, 8:09:03 AM
    Author     : SithuDewmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <div class="navbar navbar-inverse navbar-fixed-top">
            <!-- start: TOP NAVIGATION CONTAINER -->
            <div class="container">
                <div class="navbar-header">
                    <!-- start: RESPONSIVE MENU TOGGLER -->

                    <button  data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle" type="button">
                        <span class="clip-list-2"></span>
                    </button>
                    <!-- end: RESPONSIVE MENU TOGGLER -->
                    <!-- start: LOGO -->
                    <a class="navbar-brand" href="Dashboard">
                        <img  src="images/logo.png" style="width: 100px;"/>

                    </a>
                    <!-- end: LOGO -->
                </div>
                <div class="navbar-tools">
                    <!-- start: TOP NAVIGATION MENU -->
                    <ul class="nav navbar-right">
                        <!-- start: MESSAGE DROPDOWN -->
                        <li class="dropdown">

                            <a class="dropdown-toggle"  href="">
                                <i class="clip-bubble-3"></i>
                                <span id="MC" class="badge"></span>
                            </a>

                        </li>
                        <li>
                            <div class="make-switch"  style="margin-top: 15px">
                                <input name="my-checkbox" class="form-control" type="checkbox" checked>
                            </div>
                            
                        </li>
                        <!-- end: MESSAGE DROPDOWN -->
                        <!-- start: USER DROPDOWN -->
                        <li class="dropdown current-user">
                            <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" data-close-others="true" href="#">
                                <img src="images/profile_img.jpg" class="circle-img" alt="">
                                <span class="username"><%=session.getAttribute("login")%></span>
                                <i class="clip-chevron-down"></i>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="#login-update" onclick="clr()" data-toggle="modal"><i class="clip-key"></i>
                                        &nbsp;Change your Log-in </a>
                                </li>
                                <li>
                                    <a href="CheckLogout">
                                        <i class="clip-exit"></i>
                                        &nbsp;Log Out
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <!-- end: USER DROPDOWN -->
                    </ul>
                    <!-- end: TOP NAVIGATION MENU -->
                </div>
            </div>
            <!-- end: TOP NAVIGATION CONTAINER -->
        </div>
    </body>
</html>
