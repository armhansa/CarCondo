<%-- 
    Document   : Home
    Created on : Apr 21, 2017, 8:53:17 PM
    Author     : armha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css&js/Home_Style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
                        <li class="active"><a href="Home.jsp">Home</a></li>
                        <li class="dropdown"><a href="Service.jsp">Services</a></li>
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

        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="img/david-cohen-134973.jpg" alt="Image" width="100%" height="400px">
                    <div class="carousel-caption">
                        <h3>Car</h3>
                        <p>Money Money.</p>
                    </div>      
                </div>

                <div class="item">
                    <img src="img/mason-jones-39738.jpg" alt="Image" width="100%" height="400px">
                    <div class="carousel-caption">
                        <h3>More Sell $</h3>
                        <p>Lorem ipsum...</p>
                    </div>      
                </div>

                <div class="item">
                    <img src="img/samuele-errico-piccarini-196259.jpg" alt="Image" width="100%" height="400px">
                    <div class="carousel-caption">
                        <h3>More Sell $</h3>
                        <p>Lorem ipsum...</p>
                    </div>      
                </div>
            </div>



            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <div class="container text-center">    
            <h3>What We Do</h3><br>
            <div class="row">
                <div class="col-sm-4">
                    <div class="washing"></div>
                    <h3>Washing</h3>
                    <div class="midcol">
                        <p>บริการทำความสะอาดรถยนต์ของท่าน ซึ่งรวมอยู่ในบริการรับฝากดูแลรถยนต์ ไม่มีค่าบริการเพิ่มเติม เพื่อให้รถยนต์ของคุณดูใหม่ และสวยสะอาดอยู่เสมอ</p>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="carcare"></div>
                    <h3>Car Care</h3>
                    <div class="midcol">
                        <p>บริการตรวจสอบสภาพรถยนต์ที่นำมาฝาก ประกอบไปด้วยการตรวจลมยาง ตรวจระดับน้ำมันเครื่อง สภาพรถยนต์ต่างๆอย่างละเอียด รวมไปถึงอายุการใช้งานแบตเตอร์รี่อีกด้วย</p>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="transport"></div>
                    <h3>Transport</h3>
                    <div class="midcol">
                        <p>บริการสุดสะดวก สำหรับผู้ที่มีความต้องการเคลื่อนย้าย ขนส่งรถยนต์ของตนไปยังสถานที่ต่างๆ ในกรณีที่ไม่สะดวกเคลื่อนย้ายด้วยตนเอง ทั้งภายในและ ภายนอกประเทศ</p>
                    </div>
                </div>
            </div>
        </div><br>

        </script>
    </body>
</html>
