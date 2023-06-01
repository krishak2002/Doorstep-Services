<%-- 
    Document   : admin_managevendors
    Created on : Feb 13, 2023, 11:57:16 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta name="viewport" content="width=device-width, initial-scale=1.0 user-scalable=no" />
        <title>Plomberie - A Plumber HTML Template</title>
        <meta name="author" content="Mannat Studio">
        <meta name="description" content="Plomberie is a Responsive HTML5 Template for plumbing company, repair, maintenance, roofing, handyman or any other type of plumbing service.">
        <meta name="keywords" content="Plomberie, responsive, html5, air condition, cleaning, handyman, hvac, maintenance, plumber, plumber service, plumbing, Plumbing Service, repair, repair service, roofing">

        <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">

        <link href="css/base.css" rel="stylesheet">

        <link rel="stylesheet" type="text/css" href="rev-slider/revolution/fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css">
        <link rel="stylesheet" type="text/css" href="rev-slider/revolution/fonts/font-awesome/css/font-awesome.css">
        <link rel="stylesheet" type="text/css" href="rev-slider/revolution/css/settings.css">
        <link rel="stylesheet" type="text/css" href="rev-slider/revolution/css/layers.css">
        <link rel="stylesheet" type="text/css" href="rev-slider/revolution/css/navigation.css">

        <link href="bootstrap-5.0.2-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>

        <script>

            function showvendors()
            {
                //1. Make object of XMLHttpRequest
                var xhttp = new XMLHttpRequest();

                //4. Receive XMLHttpResponse from server & use ans

                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var res = this.responseText;
                        res = res.trim();
                        alert(res);
                        var mainobj = JSON.parse(res);
                        var arr = mainobj["ans"];

                        var ans = "";

                        for (var i = 0; i < arr.length; i++)
                        {
                            var st = arr[i];

                            ans = ans + "<div class=\"row\" >";

                            ans = ans + "<div class=\"col-sm-3\" >";
                            ans = ans + "<img class=\"img-thumbnail\" style=\"border: 2px solid black; border-radius: 10px;\" src=\'" + st.photo + "\' >";
                            ans = ans + "</div>";

                            ans = ans + "<div class= \"col-sm-2\" >";
                            ans = ans + "<div class=\"card-body\">";
                            ans = ans + "<label class=\"card-text\" style=\"font-size: 15px\" >Name : <br>" + st.Vendorname + "</label><br><br>";
                            ans = ans + "</div>";
                            ans = ans + "</div>";

                            ans = ans + "<div class= \"col-sm-2\" >";
                            ans = ans + "<div class=\"card-body\">";
                            ans = ans + "<label class=\"card-text\" style=\"font-size: 15px\" >Email : " + st.Vendor_Email + "</label><br><br>";
                            ans = ans + "</div>";
                            ans = ans + "</div>";

                            ans = ans + "<div class= \"col-sm-2\" >";
                            ans = ans + "<div class=\"card-body\">";
                            ans = ans + "<label class=\"card-text\" style=\"font-size: 15px\" >It's Service : " + st.subservice + "</label><br><br>";
                            ans = ans + "</div>";
                            ans = ans + "</div>";

                            if (st.status == "Pending")
                            {
                                ans = ans + "<div id=\"status" + i + "\" class= \"col-sm-3\" >";
                                ans = ans + "<input type=\"button\" value=\'" + st.status + "\' class=\"btn btn-danger\" onclick=\"approvevendor( '" + st.Vendor_Email + "','" + i + "' ) \" ><br><br>";
                                ans = ans + "</div>";
                            } else if (st.status == "Approved")
                            {
                                ans = ans + "<div id=\"status" + i + "\" class= \"col-sm-3\" >";
                                ans = ans + "<input type=\"button\" value=\'" + st.status + "\' class=\"btn btn-success\" onclick=\"pendingvendor( '" + st.Vendor_Email + "','" + i + "' ) \" ><br><br>";
                                ans = ans + "</div>";
                            }

                            ans = ans + "</div>";
                            ans = ans + "<hr>";
                        }
                        document.getElementById("showvendors").innerHTML = ans;
                    }
                };
                //2. Prepare request (Define target --> servlet)
                xhttp.open("POST", "./showVendors", true);

                //3. Send Request
                xhttp.send();
            }

            function approvevendor(email, index)
            {
                //1. Make object of XMLHttpRequest
                var xhttp = new XMLHttpRequest();

                //4. Receive XMLHttpResponse from server & use ans

                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var res = this.responseText;
                        res = res.trim();
                 alert(res);
                        var ans = "";
                        ans = ans + "<input type=\"button\" value=\'Approved' class=\"btn btn-success\" onclick=\"pendingvendor( '" + email + "','" + index + "' )\" ><br><br>";
                        document.getElementById("status" + index).innerHTML = ans;
                    }
                };
                //2. Prepare request (Define target --> servlet)
                xhttp.open("POST", "./approve_vendors_servlet?email=" + email, true);

                //3. Send Request
                xhttp.send();
            }

            function pendingvendor(email, index)
            {
                //1. Make object of XMLHttpRequest
                var xhttp = new XMLHttpRequest();

                //4. Receive XMLHttpResponse from server & use ans

                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var res = this.responseText;
                        res = res.trim();
                        alert(res);
                        var ans = "";
                        ans = ans + "<input type=\"button\" value=\'Pending' class=\"btn btn-danger\" onclick=\"approvevendor( '" + email + "','" + index + "' )\" ><br><br>";
                        document.getElementById("status" + index).innerHTML = ans;

                    }
                };
                //2. Prepare request (Define target --> servlet)
                xhttp.open("POST", "./pending_vendors_servlet?email=" + email, true);

                //3. Send Request
                xhttp.send();
            }

        </script>

    </head>

    <body onload="showvendors()" style="background-color: #062c33" >

        <%@include file="header.jsp"%>
        <div class="container text-center text-success" >
            <div style="border: 2px solid black; border-radius: 10px;margin-top: 50px;margin-bottom: 50px ;background-color: white; padding: 10px" id="showvendors" >

            </div>
        </div>

        <%@include file="footer.jsp" %>%>

    </body>
</html>