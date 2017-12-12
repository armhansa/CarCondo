<%-- 
    Document   : DriverHome
    Created on : Apr 24, 2017, 5:21:38 AM
    Author     : windows 10
--%>

<%@page import="model.Location"%>
<%@page import="model.ListLocation"%>
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
        <link rel="stylesheet" type="text/css" href="css&js/styledriver.css">
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

        <div class="container">

            <h3 class="text-center">Choose Location</h3><br>
            <form action="SelectedCarServlet" method="POST">

                <% ListLocation listLoc = (ListLocation) session.getAttribute("listLoc");
                for (Location i : listLoc.getListLocation()) {%> 

                <div class="panel panel-primary">
                    <div class="panel-heading"><%= i.getCar_id()%> (<%= i.getCar_country()%>)</div>
                    <%= i.getLoc_lat() +""+ i.getLoc_longt()%>
                    <div class="panel-body">
                        <div>
                            <div class="lc" style="background:url('https://maps.googleapis.com/maps/api/staticmap?center=<%= i.getLoc_lat() +","+ i.getLoc_longt() %>&zoom=14&size=400x300&sensor=false&key=AIzaSyBu-916DdpKAjTmJNIgngS6HL_kDIKU0aU')">
                                <div  class="lb">
                                    <img id="sizeim" src="img/marker.png">
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-success" value="<%= i.getOrder_NO() %>" name="orderNo" >Select</button>
                        <br class="clear"/></div>
                </div>
                <% }%>
            </form>
        </div>

        <script>
            var x = document.getElementById("demo");

            function getLocation() {
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(showPosition, showError);
                } else {
                    x.innerHTML = "Geolocation is not supported by this browser.";
                }
            }
        </script>
    </body>
</html>
