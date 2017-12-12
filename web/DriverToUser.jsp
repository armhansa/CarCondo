<%-- 
    Document   : DriverToUser
    Created on : Apr 24, 2017, 5:29:09 AM
    Author     : windows 10
--%>

<%@page import="model.Location"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Driver</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css&js/styleuser.css">
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="#">Logo</a>
                </div>

                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="home.html">Home</a></li>
                        <li class="dropdown"><a href="service.html" class="dropdown-toggle" data-toggle="dropdown">Services</a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Manage</a></li>
                        <li><a href="#">About us</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">


                        <li class="dropdown">
                            <button class="btn btn-primaryc dropdown-toggle" type="button" data-toggle="dropdown">Firstname Lastname
                                <span class="caret"></span></button>
                            <ul class="dropdown-menu">
                                <li><a href="#">View profile</a></li>
                                <li><a href="#">Edit profile</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Log out</a></li>
                            </ul>
                        </li>


                        <li><a href="login.html"><span class="glyphicon"></span> Login</a></li>
                        <li><a href="signup.html"><span class="glyphicon"></span> register</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <br>
        <div class="container text-center">
            <% Location loc = (Location) session.getAttribute("loc");%>
            <h3 class="text-center">please fill your password</h3><br>

            <div class="pad">
                <div class="lc" style="background:url('https://maps.googleapis.com/maps/api/staticmap?center=<%= loc.getLoc_lat()%>,<%= loc.getLoc_longt()%>&zoom=14&size=400x300&sensor=false&key=AIzaSyBu-916DdpKAjTmJNIgngS6HL_kDIKU0aU')">
                    <div  class="lb">
                        <img id="sizeim" src="img/marker.png">
                    </div>
                </div>
            </div>
            <br><br>
            <form action="UserConfirmServlet" method="POST" >
                <input type="password" name="password" placeholder="password"><br><br><br>
                <button type="submit" class="btn btn-success">confirm password</button><br><br>
            </form>
        </div>
    </body>
</html>
