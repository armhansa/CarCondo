<%-- 
    Document   : Login
    Created on : Apr 21, 2017, 11:33:13 PM
    Author     : armha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>LogIn</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.0/css/materialize.min.css">
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.0/js/materialize.min.js"></script>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.5/angular.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css&js/Login_Style.css">
        <script type="text/javascript" src="css&js/Register_Script.js"></script>
    </head>
    
    <body class="body" ng-controller="RegisterCtrl" ng-app="myApp">
        <div class="container">
            <div id="signup">
                <div class="signup-screen">
                    <div class="space-bot text-center">
                        <h1>Log in</h1>
                        <div class="divider"></div>
                    </div>
                    <form class="form-register" action="LoginServlet" method="POST" name="register" novalidate>

                        <div class="input-field col s6">
                            <input id="username" name="username" ng-model="username" ng-pattern="username" type="text" class="validate" required>
                            <label for="username">Username</label>
                        </div>

                        <div class="input-field col s6">
                            <input id="password" type="password" name="password" ng-model="password" ng-minlength='8' class="validate" required>
                            <label for="password">Password</label>
                        </div>
                        <% String notice = (String) request.getAttribute("notice");
                        if (notice != null && notice.equals("username")) out.println("<p class='alert alert-danger'>Username cannot found. </p>");
                        else if(notice != null && notice.equals("password")) out.println("<p class='alert alert-danger'>Password is wrong. </p>"); %>
                        

                        <p class="alert alert-danger" ng-show="form - register.password.$error.minlength || form.password.$invalid">Your password must be at least 8 characters.</p>

                        <div class="space-top text-center">
                            <button ng-disabled="form - register.$invalid" class="waves-light btn done">
                                <i class="material-icons left">done</i>Login
                            </button>

                    </form>
                </div>
            </div>
        </div>

    </body>
</html>
