<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>JSP Page</title>
        <link href="bootstrap-5.3.0-alpha1-dist/bootstrap-5.3.0-alpha1-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        
         <%@include file="navbar.jsp" %>
    </head>
    
    <%
            String email= (String) request.getParameter("email");
            String user=(String)session.getAttribute("useremail");
           
        %>
    
        <script>
        var user="<%=user%>";
        function review1()
            {
                $("#myModal1").modal("show");
            }
            var xhr = new XMLHttpRequest();
            var n = 0;
            function fill(obj)
            {
                var img = obj.src;
                var id = obj.id;
                var val = parseInt(id.substring(id.indexOf("_") + 1));
                var i;
                if (n === 0)
                {
                    i = 1;
                } else
                {
                    i = n + 1;
                }
                for (; i <= 5; i++)
                {
                    if (i <= val)
                    {
                        document.getElementById("rating_" + i).src = "rating/filled_star.png";

                    } else
                    {
                        document.getElementById("rating_" + i).src = "rating/empty_star.png";
                    }
                }

            }
            function selected(obj)
            {
                var id = obj.id;
                var val = parseInt(id.substring(id.indexOf("_") + 1));
                n = val;
            }
            function unfill(obj)
            {
                var i;
                if (n === 0)
                {
                    i = 1;
                } else
                {
                    i = n + 1;
                }
                for (; i <= 5; i++)
                {
                    document.getElementById("rating_" + i).src = "rating/empty_star.png";
                }
            }

            function addreview(vendoremail)
            {
                
                var comment = document.getElementById("comment").value;
//            var all = document.getElementById("all").value;

                if (n === 0)
                {
                    document.getElementById("label1").style.display = "block";

                } else
                {

                    //1. Make object of XMLHttpRequest
                    var xhttp = new XMLHttpRequest();

                    //4. Receive XMLHttpResponse from server & use ans
                    xhttp.onreadystatechange = function () {
                        if (this.readyState == 4 && this.status == 200) {
                            res = this.responseText;
                            res = res.trim();
                            alert(res);
                            console.log(res);

                            if (res == "success")
                            {
                                alert("Ratting Added successfully");
                                userShowRatings();
                            } else
                            {
                                alert("An Error occured");
                            }
                        }
                    };

                    //2. Prepare request (Define target --> servlet)
                    xhttp.open("GET", "./userAddReview_Servlet?comment=" + comment + "&vendoremail=" + '<%=email%>' + "&rating=" + n +"&useremail=" +user, true);

                    //3. Send Request
                    xhttp.send();

                }
            }

            function userShowRatings() {
                //1. Make object of XMLHttpRequest
                var xhttp = new XMLHttpRequest();

                //4. Receive XMLHttpResponse from server & use ans

                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var res = this.responseText;
                        res = res.trim();
                        var mainobj = JSON.parse(res);
                        var arr = mainobj["ans"];

                        var ren = "";

                        for (var i = 0; i < arr.length; i++)
                        {
                            var st = arr[i];
                            ren += "<div class=\"row\" >";

                            ren += "<div class= \"col-sm-4\" style=\"text-align: center\" >";
                            ren += "<div class=\"card-body\">";
                            for (var j = 0; j < st.rating; j++) {
                                ren += "<img class=\"img-thumbnail\" style=\"border: 2px solid black; border-radius: 10px;width: 20px; height: 20px\" src=\"rating/filled_star.png\" >";
                            }
                            for (var j = st.rating; j < 5; j++) {
                                ren += "<img class=\"img-thumbnail\" style=\"border: 2px solid black; border-radius: 10px;width: 20px; height: 20px\" src=\"rating/empty_star.png\" >";
                            }
                            ren += "</div>";
                            ren += "</div>";

                            ren += "<div class= \"col-sm-4\" style=\"text-align: center\" >";
                            ren += "<div class=\"card-body\">";
                            ren += "<label class=\"card-text text-alli\" style=\"font-size: 16px;text-align: center;color: #005b9a\" ><b>Comment : </b><br>" + st.comment + "</label><br><br>";
                            ren += "</div>";
                            ren += "</div>";

                            ren += "<div class= \"col-sm-4\" style=\"text-align: center\" >";
                            ren += "<div class=\"card-body\">";
                            ren += "<label class=\"card-text text-alli\" style=\"font-size: 16px;text-align: center;color: #005b9a\" ><b>User Email : </b><br>" + st.useremail + "</label><br><br>";
                            ren += "</div>";
                            ren += "</div>";
                            ren += "</div>";

                        }

                        document.getElementById("showratings").innerHTML = ren;
                        averageRating();
                    }
                };
                //2. Prepare request (Define target --> servlet)
                xhttp.open("GET", "./userShowRatingsServlet?vendoremail=" +'<%=email%>', true);

                //3. Send Request
                xhttp.send();
            }

            function averageRating() {
                //1. Make object of XMLHttpRequest
                var xhttp = new XMLHttpRequest();

                //4. Receive XMLHttpResponse from server & use ans
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var res = this.responseText;
                        res = res.trim();
                        var mainobj = JSON.parse(res);
                        var arr = mainobj["ans"];

                        var ren = "";

                        var st = arr[0];
                        var rating2 = st.r1;
                        var getdecimal = rating2.toString().split(".")[1];
                        if(parseInt(getdecimal) == 0){
                        ren += "<div class= \"col-sm-12\" style=\"text-align: center\" >";
                        ren += "<div class=\"card-body\">";
                        for (var j = 0; j < st.r1; j++) {
                            ren += "<img class=\"img-thumbnail\" style=\"border: 2px solid black; border-radius: 10px;width: 20px; height: 20px\" src=\"rating/filled_star.png\" >";
                        }
                        for (var j = st.r1; j < 5; j++) {
                            ren += "<img class=\"img-thumbnail\" style=\"border: 2px solid black; border-radius: 10px;width: 20px; height: 20px\" src=\"rating/empty_star.png\" >";
                        }
                        ren += "</div>";
                        ren += "</div>";
                    }else{
                        ren += "<div class= \"col-sm-12\" style=\"text-align: center\" >";
                        ren += "<div class=\"card-body\">";
                        for (var j = 0; j < st.r1-1; j++) {
                            ren += "<img class=\"img-thumbnail\" style=\"border: 2px solid black; border-radius: 10px;width: 20px; height: 20px\" src=\"rating/filled_star.png\" >";
                        }
                        ren += "<img class=\"img-thumbnail\" style=\"border: 2px solid black; border-radius: 10px;width: 20px; height: 20px\" src=\"rating/download.jpg\" >";
                        for (var j = st.r1; j < 4; j++) {
                            ren += "<img class=\"img-thumbnail\" style=\"border: 2px solid black; border-radius: 10px;width: 20px; height: 20px\" src=\"rating/empty_star.png\" >";
                        }
                        ren += "</div>";
                        ren += "</div>";
                    }

                        document.getElementById("averagerating").innerHTML = ren;
                    }
                };
                //2. Prepare request (Define target --> servlet)
                xhttp.open("GET", "./userShowAverageRatingsServlet?vendoremail=" + '<%=email%>', true);

                //3. Send Request
                xhttp.send();
            }
        
        
        var em = "<%=email%>";



        function sendDate()
        {
            var date = document.getElementById("datepicker").value;
            alert(date);



            //prepare request Step2
            window.location.href = "fetchdate.jsp?date=" + date + "&email=" + em;

            //step3


        }




        function infoaboutsinglevendor() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    // Typical action to be performed when the document is ready:

                    var ans = xhttp.responseText;
//                    alert(ans);
                    renderAsHTML(ans);

                }
            };

            //prepare request Step2
            xhttp.open("GET", "./showVendorDescription?email=" + em, true);

            //step3
            xhttp.send();
        }

        function renderAsHTML(t) {
            var ans = "";
            var obj = JSON.parse(t);
            var arr = obj["ans"];
            console.log(arr);
            var obj = arr[0];
            var output = "<div class=\"card\" style=\"height:70rem width:20rem\">";
            output += "<img class=\"card-img-top\" src=\"myuploads/" + obj.photo + "\" alt=\"card1IMAGE\"/>";
            output += "<div class=\"card-body\">";
            output += "<h2 class=\"card-title\">" + obj.Vendorname + "</h2>";
            output += "<p class=\"card-text\">" + obj.Description + "</p>";

            output += "</div>";
            output += "</div>";
            
            var latitude = obj.latitute;
var longitute = obj.longitute;
document.getElementById("gmap_canvas").src = "https://maps.google.com/maps?q=" + latitude + "," + longitute + "&ie=UTF8&iwloc=&output=embed";
            
            document.getElementById("d1").innerHTML = output;

            rendering_gallery();
        }

        function rendering_gallery()
        {

            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    // Typical action to be performed when the document is ready:

                    var ans = xhttp.responseText;
//                    alert(ans);
                    rendervendorphotos(ans);

                }
            };

            //prepare request Step2
            xhttp.open("GET", "./rendering_gallery?vendoremail=" + em, true);

            //step3
            xhttp.send();

        }

        function rendervendorphotos(t)
        {
            //alert("rendering gallery now");
            var output = "";
            var obj = JSON.parse(t);
            var arr = obj["ans"];
            console.log(arr);
           
             for(var i=0;i<arr.length;i++){
                 
            output += "<figure class=\"col-md-4\">";
            output += "   <a href='"+arr[i].photo+"' data-size=\"100x100\">";
            output += "     <img alt=\"picture\" src='"+arr[i].photo+"'class=\"img-fluid\">";
            output += "   </a>";
            output += "  </figure>";
            
        }
        
        document.getElementById("rendering_gallery").innerHTML=output;
        userShowRatings();
        }



    </script>
    
    
    <body onload="infoaboutsinglevendor()">
        
        
      
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <h1>Information</h1>    
                    <div id="d1">

                    </div>
                </div>
                <div class="col-sm-6">
                    <h1>Gallery</h1>
                    <div class="mdb-lightbox" id="rendering_gallery">



                          </div>

                </div>
            </div>
            Date: <input type="text" id="datepicker">



            <input type="button" value="Fetch Data" onclick="sendDate()"/>
        </div>
        
        
        
        <div class="text-center" >

                            <div class="col-sm-12" style="text-align: center">
                                <input type="button" class="btn btn-success btn-lg" value="ADD REVIEW"
                                       style="border-radius: 10px;text-shadow: 2px 2px 5px black;" onclick="review1()" />

                            </div><br><br><br>
                            <hr>
                            <h2>Average Rating</h2>
                            <div id="averagerating" >

                            </div><br><br><br>
                            <hr>
                            <h2>All Ratings</h2>
                            <div id="showratings" >

                            </div>

                            <div class="modal" id="myModal1" >
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header " style="background: yellowgreen;" >
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title" style="color: white;"> Add Review</h4>
                                        </div>
                                        <div class="modal-body " >
                                            <div>



                                                <div id="all">

                                                    <form action="" method="post" id="form1">
                                                        <table>
                                                            <tr> <label class="form-group"> Give Ratings..</label>
                                                            <td>
                                                                <img id="rating_1" src="rating/empty_star.png" onmouseover="fill(this);" onmouseout="unfill(this);" onclick="selected(this);" width="50px;" height="50px;">
                                                            </td>
                                                            <td>
                                                                <img id="rating_2" src="rating/empty_star.png" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)" width="50px;" height="50px;">
                                                            </td>
                                                            <td>
                                                                <img id="rating_3" src="rating/empty_star.png" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)" width="50px;" height="50px;">
                                                            </td>
                                                            <td>
                                                                <img id="rating_4" src="rating/empty_star.png" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)" width="50px;" height="50px;">
                                                            </td>
                                                            <td>
                                                                <img  id="rating_5" src="rating/empty_star.png" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)" width="50px;" height="50px;">
                                                            </td>
                                                            </tr>
                                                        </table>
                                                        <br>
                                                        <label> Write Comment : </label> <input style="border-radius: 20px;" type="text" id="comment"  class="form-group"/>
                                                        <input type="button" value="Submit" class="btn btn-primary"
                                                               style="border-radius: 10px;text-shadow: 2px 2px 5px black" onclick="addreview('<%=email%>')" />
                                                        <label style="display: none;color: tomato;" id="label1">Please Select Any Rating</label>

                                                    </form>
                                                </div>

                                            </div>   
                                        </div>
                                        <!--</div>-->
                                        <div class="modal-footer " style="background: yellowgreen;" >
                                            <button type="button" class="btn btn-default" style="border-radius: 10px;" data-dismiss="modal" style="" >Close</button>
                                        </div>


                                    </div>
                                </div>
                            </div>

                        </div>
<!--
        Date: <input type="text" id="my_date_picker" class="mt-lg-3">
        <input type="submit" value="Fetch Data" onclick="fetchdetails()"/>-->
        <br>
        <br>
        <div id="d2">

        </div>
        <h1 class="h2-title" id="gymname2">Find Us on Google Maps :</h1>

                    <div class="main-contact-map-in">
                        <div class="mapouter"><div class="gmap_canvas">
                                <iframe width="100%" height="400px" id="gmap_canvas" src="https://maps.google.com/maps?q=31.636694035778973,74.87413616805217&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe><a href="https://2yu.co">2yu</a><br><style>.mapouter{
                                        position:relative;
                                        text-align:right;
                                        height:100%;
                                        width:100%;
                                        }</style><a href="https://embedgooglemap.2yu.co/">html embed google map</a><style>.gmap_canvas {
                                        overflow:hidden;
                                        background:none!important;
                                        height:100%;
                                        width:100%;
                                        }</style></div></div>
                    </div>
        
        
        
        
        
        
        
        
        
        
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
        
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


        
        <br><!-- comment -->

        <div id="d3">



        </div>

        <script>
                $(function () {
                    $("#datepicker").datepicker();
                });
        </script>
    </body>
</html>