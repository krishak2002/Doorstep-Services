
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>


        <%@include file="header.jsp"  %>
        <% 
            
        String name=request.getParameter("name");
            
            
        %>
        <title><%=name%></title> 

        <script>

            function showAllVendors()
            {

                var xhttp = new XMLHttpRequest();

                //step 4
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        // Typical action to be performed when the document is ready:

                        var ans = xhttp.responseText;
                        renderAsHTML(ans);

                    }
                };

                //prepare request Step2
                    xhttp.open("GET", "./showAllVendors?name=<%=name%>", true);

                //step3
                xhttp.send();
            }

            function renderAsHTML(t) {

                var ans = "";
                var obj = JSON.parse(t);
                var arr = obj.ans;
                console.log(arr);


//             ans+= "<section class=\"services py-5\" id=\"services\">";
//              ans+= "  <div class=\"container-fluid\">";
//                ans+= "   <div class=\"heading text-center\">";
//                ans+= "    <i class=\"fas fa-home\"></i>";
//                ans+= "     <h3 class=\"heading mb-sm-5 mb-3 text-uppercase\"Vendors</h3>";
//                ans+= " </div>";

                for (var i = 0; i < arr.length; i++)
                {
                    var idx = i + 1;
                    var service = arr[i];
                    ans += "<div class=\"col-lg-2 col-sm-6 col-12 serviceimage" + idx + "" + "\"> </div>";
                    ans += "<div class=\"col-lg-2 col-sm-6 col-12 py-5 px-4 servicetext\">";
                    ans += "<h4>" + service.Vendorname + "</h4>";
                    ans += "<p class=\"my-3\">" + service.Description + "</p>";
                    ans += "<a href=\"/showVendorDescription.jsp?email="+service.Vendor_Email+"\"> Know More </a>";
                    ans += "</div>";

                }

//                    ans+=" </div>";
//                ans+="</section>";

//                for (var i = arr.length / 2; i < arr.length; i++)
//                {
//                    var idx = i + 1;
//                    var service = arr[i];
//                    ans += "<div class=\"col-lg-2 col-sm-6 col-12 py-5 px-4 servicetext\">";
//                    ans += "<h4>" + service.Vendorname +"</h4>";
//                    ans += "<p class=\"my-3\">" + service.Description + "</p>";
//                    ans += "</div>";
//                    ans += "<div class=\"col-lg-2 col-sm-6 col-12 serviceimage" + idx + "" + "\"> </div>";
//
//
//                }

                document.getElementById("servicesRendered").innerHTML = ans;
            }


        </script>



    </head>
    <body onload="showAllVendors()">
       





        <!-- banner -->
        <!-- <section class="banner" id="home">
                <div class="callbacks_container">
                        <ul class="rslides" id="slider3">
                                <li>
                                        <div class="slider-info bg1">
                                                <div class="bs-slider-overlay">
                                                <div class="banner-text container">
                                                        <h5 class="tag text-left mb-3 text-uppercase">We are professional </h5>
                                                        <h1 class="movetxt text-left agile-title text-uppercase">The Best Place For </h1>
                                                        <h2 class="movetxt text-left mb-3 agile-title text-uppercase">Hair Salon </h2>							
                                                        <a class="bt mt-4 text-capitalize scroll" href="#about" role="button"> read more
                                                                <i class="fas fa-cut"></i>
                                                        </a>
                                                </div>
                                                </div>
                                        </div>
                                </li>
                                <li>
                                        <div class="slider-info bg2">
                                                <div class="bs-slider-overlay">
                                                <div class="banner-text container">
                                                        <h5 class="tag text-left mb-3 text-uppercase">We are unique</h5>
                                                        <h4 class="movetxt text-left agile-title text-uppercase">Your Hair Beauty </h4>
                                                        <h4 class="movetxt text-left mb-3 agile-title text-uppercase">Our Duty </h4>
                                                        <a class="bt mt-4 text-capitalize scroll" href="#about" role="button"> read more
                                                                <i class="fas fa-cut"></i>
                                                        </a>
                                                </div>
                                                </div>
                                        </div>
                                </li>
                                <li>
                                        <div class="slider-info bg3">
                                                <div class="bs-slider-overlay">
                                                <div class="banner-text container">
                                                        <h5 class="tag text-left mb-3 text-uppercase">We make your hair</h5>
                                                        <h4 class="movetxt text-left agile-title text-uppercase">We Make Your Hair </h4>
                                                        <h4 class="movetxt text-left mb-3 agile-title text-uppercase">Look Perfect </h4>
                                                        
                                                        <a class="bt mt-4 text-capitalize scroll" href="#about" role="button"> read more
                                                                <i class="fas fa-cut"></i>
                                                        </a>
                                                </div>
                                                </div>
                                        </div>
                                </li>
                                <li>
                                        <div class="slider-info bg4">
                                                <div class="bs-slider-overlay">
                                                <div class="banner-text container">
                                                        <h5 class="tag text-left mb-3 text-uppercase">We make stylish hair</h5>
                                                        <h4 class="movetxt text-left agile-title text-uppercase">Rea Man's to go </h4>
                                                        <h4 class="movetxt text-left mb-3 agile-title text-uppercase">Real Beards </h4>
                                                        <a class="bt mt-4 text-capitalize scroll" href="#about" role="button"> read more
                                                                <i class="fas fa-cut"></i>
                                                        </a>
                                                </div>
                                                </div>
                                        </div>
                                </li>
                        </ul>
                </div>
        </section>-->
        <!-- //banner -->

        <section class="barbers py-5" id="team">
            <div class="container py-lg-3 py-2">
                <div class="heading text-center">
                    <i class="fas fa-home"></i>
                    <h3 class="heading mb-sm-5 mb-3 text-uppercase">vendors of <%=name%></h3>
                </div>
                <div class="row barber-grids" id="servicesRendered">


                </div>
            </div>
        </section>

<!--                    <div id="servicesRendered">
                        
                    </div>
        -->
        <%@include file="footer.jsp" %>
    </body>
</body>
</html>

