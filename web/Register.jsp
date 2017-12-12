<%-- 
    Document   : Register
    Created on : Apr 22, 2017, 2:32:57 AM
    Author     : armha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Register</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.0/css/materialize.min.css">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.0/js/materialize.min.js"></script>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.5/angular.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css&js/Register_Style.css">
        <script type="text/javascript" src="css&js/Register_Script.js"></script>
    </head>
    <body ng-controller="RegisterCtrl" ng-app="myApp">
        <div class="container">
            <div id="signup">
                <div class="signup-screen">
                    <div class="space-bot text-center">
                        <h1>Sign up</h1>
                        <div class="divider"></div>
                    </div>
                    <form class="form-register" method="POST" name="register" action="RegisterServlet" novalidate>
                        
                        <div class="input-field col s6">
                            <input id="first-name" name="firstname" type="text" ng-model="fname" class="validate" required>
                            <label for="first-name">First Name</label>
                        </div>

                        <div class="input-field col s6">
                            <input id="last-name" name="lastname" type="text" ng-model="lname" class="validate" required>
                            <label for="last-name">Last Name</label>
                        </div>

                        <div class="input-field col s6">
                            <input id="citizen-id" name="citizenID" type="text" ng-model="c_id" class="validate" required>
                            <label for="citizen-id">Citizen ID</label>
                        </div>
                        <% String notice = (String) request.getAttribute("notice");
                            if (notice != null && notice.equals("citizenID")) { %>
                            <p class="alert alert-danger"> Your Citizen ID has been used.</p>
                        <% } %> 
                        <div class="input-field col s6">
                            <input id="date" name="birthDay" type="date" ng-model="date" class="validate" required>
                        </div>

                        <div class="input-field col s6">
                            <input id="phone" name="phone" type="text" ng-model="phone" class="validate" required>
                            <label for="phone">Phone Number</label>
                        </div>

                        <div class="input-field col s6">
                            <input id="email" type="email" name="email" ng-model="email" class="validate" required>
                            <label for="email">Email</label>
                        </div>
                        <p class="alert alert-danger" ng-show="form - register.email.$error.email">Your email is invalid.</p>
                        
                        <% if (notice != null && notice.equals("email")) { %>
                            <p class="alert alert-danger"> Your email has been used.</p>
                        <% } %>

                        <div class="input-field col s6">
                            <input id="address" name="address" type="text" ng-model="address" class="validate" required>
                            <label for="address">Address</label>
                        </div>

                        <div class="input-field col s6">
                            <input id="username" name="username" ng-model="username" ng-pattern="username" type="text" class="validate" required>
                            <label for="username">Username</label>
                        </div>
                        
                        <% if (notice != null && notice.equals("username")) { %>
                            <p class="alert alert-danger"> Your username is invalid.</p>
                        <% } %>
                        
                        <div class="input-field col s6">
                            <input id="password" type="password" name="password" ng-model="password" ng-minlength='8' class="validate" required>
                            <label for="password">Password</label>
                        </div>
                        <p class="alert alert-danger" ng-show="form - register.password.$error.minlength || form.password.$invalid">Your password must be at least 8 characters.</p>


                        <div class="input-field col s6">
                            <input id="re-password" name="re-password" ng-model="repassword" type="password" class="validate" required>
                            <label for="re-pass">Re-Password</label>
                        </div>
                        
                        <% if (notice != null && notice.equals("username")) { %>
                            <p class="alert alert-danger"> Your password is not match.</p>
                        <% }%>

                        <div class="space-top text-center">
                            <button ng-disabled="form - register.$invalid" class="waves-light btn done">
                                <i class="material-icons left">done</i> Done
                            </button>

                            <button type="button" class="waves-light btn cancel">
                                <i class="material-icons left">clear</i><a href="Home.jsp">Cancel</a>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
