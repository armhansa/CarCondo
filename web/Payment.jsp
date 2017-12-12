<%-- 
    Document   : Payment
    Created on : Apr 24, 2017, 11:43:35 AM
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
        <title>Payment</title>

        <!-- Bootstrap -->
        <link href="jquery.datetimepicker.css" rel="stylesheet">
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
        <script src="http://thecodeplayer.com/uploads/js/jquery-1.9.1.min.js" type="text/javascript"></script>
        <!-- jQuery easing plugin -->
        <script src="http://thecodeplayer.com/uploads/js/jquery.easing.min.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="css&js/payment_style.css">
    </head>
    <body>
        <!-- multistep form -->
        <form id="msform">
            <!-- progressbar -->
            <ul id="progressbar">
                <li class="active">Step 1</li>
                <li>Step 2</li>
            </ul>
            <!-- fieldsets -->
            <fieldset>
                <h2 class="fs-title">รับรถยนต์</h2>
                <h3 class="fs-subtitle">คลิ๊กปุ่มเพื่อส่ง location</h3>

                <input type="checkbox" class="slectOne" id="box-3" data-id="1 selected">
                <label for="box-3">ขับมาเอง</label>

                <input type="checkbox" onclick="getLocation()" class="slectOne" id="box-4" data-id="2 selected"/">
                       <label for="box-4">รับบริการรับรถ</label><br>

                <div id="map"></div>
                <a href="bank.html"><button type="button" name="submit" class="submit action-button" value="Cancle" >Cancle</button></a>
                <input type="button" name="next" class="next action-button" value="Next" />
            </fieldset>
            
            <fieldset>
                <h2 class="fs-title">ชำระค่าบริการ</h2>
                <h2 class="fs-subtitle">ค่าบริการทั้งหมด   บาท</h2>
                <input type="text" name="cardName" placeholder="ชื่อที่ปรากฏบนบัตร*" />
                <input type="text" name="cardNo" placeholder="หมายเลขบัตร*" />
                <input type="text" name="expDate" placeholder="วันหมดอายุ(ดด/ปป)*" />
                <input type="button" name="previous" class="previous action-button" value="Previous" />
                <input type="submit" name="submit" class="submit action-button" value="Finish" />
            </fieldset>

        </form>







        <!-- ....................................................................................................................... -->
        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDCi3IR4lJjXjchnz_STxQEtIuQGr1-UYY&callback=initMap"></script>
        <script src="css&js/payment_script.js"></script>
        <!-- ............................................................................................................................ -->
    </body>
</html>
