<%-- 
    Document   : CarValet
    Created on : Apr 24, 2017, 2:27:39 AM
    Author     : windows 10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Car Valet</title>

        <!-- Bootstrap -->
        <link href="css&js/jquery.datetimepicker.css" rel="stylesheet">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!-- jQuery -->
        <!-- <script src="http://thecodeplayer.com/uploads/js/jquery-1.9.1.min.js" type="text/javascript"></script> -->
        <!-- jQuery easing plugin -->
        <script src="http://thecodeplayer.com/uploads/js/jquery.easing.min.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="css&js/CarValet_Style.css">
    </head>
    <body>
        <% request.setCharacterEncoding("UTF-8");%>
        <!-- multistep form -->
        <form id="msform" action="CarValetServlet" method="POST">
            <!-- progressbar -->
            <ul id="progressbar">
                <li class="active">Step 1</li>
                <li>Step 2</li>
                <li>Finish</li>
            </ul>
            <!-- fieldsets -->
            <fieldset>
                <h1 class="fs-title">Service</h1>

                <!--                Entry Date : <input class="box-date" name="entryDate" type="text" id="datetimepicker"/>
                                Exit Date&nbsp; :&nbsp;&nbsp; <input class="box-date" name="exitDate" type="text" id="datetimepicker2"/>-->

                <input type="checkbox" id="box-1" name="service">
                <label for="box-1">บำรุงรักษารถ</label>

                <br>
                <a href="bank.html"><button type="button" name="submit" class="submit action-button" value="Cancle" >Cancle</button></a>
                <input type="button" name="next" class="next action-button" value="Next" />
            </fieldset>

            <fieldset>
                <h2 class="fs-title">รับรถยนต์</h2>
                <h3 class="fs-subtitle">คลิ๊กปุ่มเพื่อส่ง location</h3>

                <input type="checkbox" class="slectOne bank" id="box-3" data-id="1 selected" name="noDrive" />
                <label for="box-3">ขับมาเอง</label>

                <input type="checkbox" onclick="getLocation()" class="slectOne" id="box-4" data-id="2 selected" name="drive"/>
                <label for="box-4">รับบริการรับรถ</label><br>

                <div id="map"></div>
                <input type="button" name="previous" class="previous action-button" value="Previous" />
                <input type="button" name="next" class="next action-button" value="Next" />
            </fieldset>
            <fieldset>
                <h2 class="fs-title">Confirm</h2>
                <input type="hidden" name="carID" value="<%= request.getParameter("carID")%>" />
                <input type="hidden" name="lat" id="lat" value="" />
                <input type="hidden" name="lon" id="lon" value="" />
                <input type="button" name="previous" class="previous action-button" value="Previous" />
                <input type="submit" name="submit" class="action-button" value="Finish" />
            </fieldset>

            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title" id="myModalLabel">Log in</h4>
                        </div> <!-- /.modal-header -->

                        <div class="modal-body">
                            <form role="form">
                                <div class="form-group">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="uLogin" placeholder="Login" name="username">
                                        <label for="uLogin" class="input-group-addon glyphicon glyphicon-user"></label>
                                    </div>
                                </div> <!-- /.form-group -->

                                <div class="form-group">
                                    <div class="input-group">
                                        <input type="password" class="form-control" id="uPassword" placeholder="Password" name="password">
                                        <label for="uPassword" class="input-group-addon glyphicon glyphicon-lock"></label>
                                    </div> <!-- /.input-group -->
                                </div> <!-- /.form-group -->

                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Remember me
                                    </label>
                                </div> <!-- /.checkbox -->
                            </form>

                        </div> <!-- /.modal-body -->

                        <div class="modal-footer">
                            <button class="form-control btn btn-primary">Ok</button>

                            <div class="progress">
                                <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="1" aria-valuemin="1" aria-valuemax="100" style="width: 0%;">
                                    <span class="sr-only">progress</span>
                                </div>
                            </div>
                        </div> <!-- /.modal-footer -->

                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title" id="myModalLabel">Log in</h4>
                        </div> <!-- /.modal-header -->

                        <div class="modal-body">
                            <form role="form">
                                <div class="form-group">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="uLogin" placeholder="Login">
                                        <label for="uLogin" class="input-group-addon glyphicon glyphicon-user"></label>
                                    </div>
                                </div> <!-- /.form-group -->

                                <div class="form-group">
                                    <div class="input-group">
                                        <input type="password" class="form-control" id="uPassword" placeholder="Password">
                                        <label for="uPassword" class="input-group-addon glyphicon glyphicon-lock"></label>
                                    </div> <!-- /.input-group -->
                                </div> <!-- /.form-group -->

                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Remember me
                                    </label>
                                </div> <!-- /.checkbox -->
                            </form>

                        </div> <!-- /.modal-body -->

                        <div class="modal-footer">
                            <button class="form-control btn btn-primary">Ok</button>

                            <div class="progress">
                                <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="1" aria-valuemin="1" aria-valuemax="100" style="width: 0%;">
                                    <span class="sr-only">progress</span>
                                </div>
                            </div>
                        </div> <!-- /.modal-footer -->

                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
        </form>





        <!-- ....................................................................................................................... -->
        <script src="css&js/jquery.datetimepicker.full.js"></script>
        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDCi3IR4lJjXjchnz_STxQEtIuQGr1-UYY&callback=initMap"></script>
        <script src="css&js/CarValet_Script.js"></script>
        <!-- ............................................................................................................................ -->
    </body>
</html>
