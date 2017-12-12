<%-- 
    Document   : Service
    Created on : Apr 23, 2017, 1:59:31 AM
    Author     : windows 10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Service</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css&js/Service_Style.css">
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
                    <a class="navbar-brand" href="#"><img class="img-size" src="img/logo.png" /></a>
                </div>

                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class=""><a href="Home.jsp">Home</a></li>
                        <li class="active"><a href="Service.jsp">Services</a></li>
                        <li><a href="#">About us</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">


                        <% String username = (String) session.getAttribute("username");
                        String rolename = (String) session.getAttribute("rolename");
                        if (username != null && rolename != null) {%>
                        <li class="dropdown">
                            <button class="btn btn-primaryc dropdown-toggle" type="button" data-toggle="dropdown"><%= username.substring(0, 1).toUpperCase() + username.substring(1)%>
                                <span class="caret"></span></button>
                            <ul class="dropdown-menu">
                                <li><a href="ViewProfile.jsp">View Profile</a></li>
                                <li><a href="EditProfile.jsp">Edit Profile</a></li>
                                <% if(rolename.equals("cust")) { %>
                                <li><a href="UpdateMyCondoServlet">My Condo</a></li>
                                <% } else if(rolename.equals("driver")) { %>
                                <li><a href="DriverCondoServlet">Car Manage</a></li>
                                <% } else if(rolename.equals("mechanic")) { %>
                                <li><a href="#">Car Manage</a></li>
                                <% }%>
                                <li class="divider"></li>
                                <li><a href="LogoutServlet">Log Out</a></li>
                            </ul>
                        </li>
                        <% } else { %>

                        <li><a href="Login.jsp"><span class="glyphicon"></span> Login</a></li>
                        <li><a href="Register.jsp"><span class="glyphicon"></span> Register</a></li>
                        <% }%>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="services">
            <img src="img/service-1.jpg" width="100%" height="400px">
        </div>

        <div class="container-fluid">
            <div class="text-center">
                <br><br>
                <h1>Service</h1>
                <h4>Choose a payment plan that works for you</h4><br>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-xs-12">
                        <div class="panel panel-default text-center">
                            <div class="panel-heading">
                                <h1>ฝากรถ</h1>
                            </div>
                            <div class="panel-body">
                                <h3>รายละเอียด service</h3><br>
                                <p>บริการตาม service ที่ท่านเลือกใช้</p><br>
                                <p><b>มีประกันชั้นหนึ่ง</b> ในกรณีรถของท่านมีปัญหา</p><br>
                                <p>ช่างของเรามีประสบการ์ณในทุกๆด้าน</p><br>
                                <p>บริษัทเรามีการันตีมาตรฐานระดับโลก <b>ISO 9001</b></p><br>
                                <p></p><br><br>
                            </div>
                            <div class="panel-footer">

                                <button class="btn btn-lg">Confirm</button>
                            </div>
                        </div>      
                    </div>     

                    <div class="col-sm-6 col-xs-12">
                        <div class="panel panel-default text-center">
                            <div class="panel-heading">
                                <h1>บริการรับส่ง</h1>
                            </div>
                            <div class="panel-body">
                                <h3>รายละเอียด service</h3><br>
                                <p>บริการตาม service ที่ท่านเลือกใช้</p><br>
                                <p><b>มีบริการรับส่งรถ</b> สะดวกสบายไม่ต้องขับมาด้วยตัวเอง</p><br>
                                <p><b>มีประกันชั้นหนึ่ง</b> ในกรณีรถของท่านมีปัญหา</p><br>
                                <p>ช่างของเรามีประสบการ์ณในทุกๆด้าน</p><br>
                                <p>บริษัทเรามีการันตีมาตรฐานระดับโลก <b>ISO 9001</b></p><br>
                            </div>
                            <div class="panel-footer">

                                <button class="btn btn-lg">Confirm</button>
                            </div>
                        </div>      
                    </div>    
                </div>
            </div>
        </div>
    </body>
</html>
