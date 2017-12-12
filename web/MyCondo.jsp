<%-- 
    Document   : ManageCar
    Created on : Apr 23, 2017, 3:42:45 AM
    Author     : windows 10
--%>

<%@page import="model.Car"%>
<%@page import="model.ListCar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css&js/Mycondo_Style.css" rel="stylesheet">
        <title>My Condo</title>
    </head>
    <body>
        <div class="container">

            <div class="row">

                <div class="col-lg-12">
                    <h1 class="page-header">My Condo
                        <small>All your car in here</small>
                        <p class="add">Add Car : &nbsp;<a href="AddCar.jsp"><img src="img/plus.png"> </a></p>
                    </h1>
                </div>
            </div>
            <!-- .................................................................................. -->
            <div class="container-fluid">
                <div class="row">

                    <% ListCar inStock = (ListCar) session.getAttribute("inStock");
                        for (Car i : inStock.getListCar()) {%>
                    <form action="CalTotalPrice" method="POST" >
                        <div class="col-sm-4">
                            <div class="panel panel-default text-center">
                                <div class="panel-heading">
                                    <h4><%= i.getId()%></h4>
                                    <p><%= i.getCountry()%></p>
                                </div>
                                <div class="panel-body">
                                    <img src="carImg/<%= i.getId()%>-<%= i.getCountry()%>.png" width="250px" height="150px">
                                </div>
                                <div class="panel-footer">
                                    <p>Brand : <%= i.getBrand()%> </p>
                                    <p>Color : <%= i.getColor()%></p>
                                    <p>Status Car : อยู่ในคอนโด </p>
                                    <p>ตั้งแต่วันที่ 03/24/2017 00:00:00</p>
                                    <p>Washing : ล้างแล้ว x ครั้ง </p>
                                    <p>ล่าสุดเมื่อ 03/24/2017 00:00:00 </p>
                                    <p>Repair : เช็คสภาพรถแล้ว x ครั้ง </p>
                                    <p>ล่าสุดเมื่อ 03/24/2017 00:00:00</p>
                                    <button class="btn btn-lg" value="<%= i.getId() + " " + i.getCountry() %>" name="carID" >รับรถ</button>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </form>
                    <form action="CarValet.jsp" method="POST">
                        <% ListCar outStock = (ListCar) session.getAttribute("outStock");
                            for (Car i : outStock.getListCar()) {%>
                        <div class="col-sm-4">
                            <div class="panel panel-default text-center">
                                <div class="panel-heading">
                                    <h4><%= i.getId()%></h4>
                                    <p><%= i.getCountry()%></p>
                                </div>
                                <div class="panel-body">
                                    <img src="carImg/<%= i.getId() + "-" + i.getCountry()%>.png" width="250px" height="150px">
                                </div>
                                <div class="panel-footer">
                                    <p>Brand : <%= i.getBrand()%> </p>
                                    <p>Color : <%= i.getColor()%></p>
                                    <p>Status Car : อยู่นอกคลัง</p>
                                    <p>Washing : -</p>
                                    <p>Repair : -</p>
                                    <p>-*-</p>
                                    <p>-*-</p>
                                    <p>-*-</p>

                                    <button class="btn btn-lg" value="<%= i.getId() + " " + i.getCountry()%>" name="carID" >ฝากรถ</button>
                                </div>
                            </div>
                        </div>
                        <% }%>
                    </form>
                </div>
            </div>
        </div>


        <div class="row text-center">

            <div class="col-lg-12">
                <ul class="pagination">
                    <li><a href="#">&laquo;</a>
                    </li>
                    <li class="active"><a href="#">1</a>
                    </li>
                    <li><a href="#">2</a>
                    </li>
                    <li><a href="#">3</a>
                    </li>
                    <li><a href="#">4</a>
                    </li>
                    <li><a href="#">5</a>
                    </li>
                    <li><a href="#">&raquo;</a>
                    </li>
                </ul>
            </div>
        </div>

        <!-- JavaScript -->
        <script src="js/jquery-1.10.2.js"></script>
        <script src="js/bootstrap.js"></script>
    </body>
</html>
