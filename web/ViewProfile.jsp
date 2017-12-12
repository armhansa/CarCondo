<%-- 
    Document   : ViewProfile
    Created on : Apr 22, 2017, 3:57:13 AM
    Author     : armha
--%>

<%@page import="model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Profile</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css&js/Edit_Style.css">
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
                        <li class="active"><a href="Home.jsp">Home</a></li>
                        <li class="dropdown"><a href="Service.html" class="dropdown-toggle" data-toggle="dropdown">Services</a>
                            <ul class="dropdown-menu">
                                <li><a href="Cust_Menu.jsp">Manage My Cars</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                            </ul>
                        </li>
                        <li><a href="#">About us</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">


                        <% String username = (String) session.getAttribute("username");
                        if (username != null) {%>
                        <li class="dropdown">
                            <button class="btn btn-primaryc dropdown-toggle" type="button" data-toggle="dropdown"><%= username.substring(0, 1).toUpperCase() + username.substring(1)%>
                                <span class="caret"></span></button>
                            <ul class="dropdown-menu">
                                <li><a href="ViewProfile.jsp">View Profile</a></li>
                                <li><a href="EditProfile.jsp">Edit Profile</a></li>
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

        <div class ="container text-center">
            <br><h1>VIEW YOUR PROFILE</h1><br>
            <% Customer user = (Customer) session.getAttribute("custDetail"); %>
            <h4>Username : <input class="size-box" type="text" value="<%= session.getAttribute("username") %>" name="user" disabled></h4>
            <h4>First Name : <input class="size-box" type="text"value="<%= user.getFirstname() %>" name="fname" disabled></h4>
            <h4>Last Name : <input class="size-box" type="text" value="<%= user.getLastname() %>" name="lname" disabled></h4>
            <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Phone : <input class="size-box" type="text" value="<%= user.getPhone() %>" name="phone" disabled></h4>
            <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; E-mail : <input class="size-box" type="text" value="<%= user.getEmail() %>" name="email" disabled></h4>

            <a href="EditProfile.jsp"><button type="submit" class="btn">Edit</button></a>

        </div>
    </body>
</html>
