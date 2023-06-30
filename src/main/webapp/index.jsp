
<!DOCTYPE html>
<html lang="en">

    <head>
        <!--        <style>
                    .imagesettings
                    {
                      background-repeat: no-repeat;
                background-size: cover;
             position: relative;
                    }
                </style>-->
        <%@include file="header.jsp"  %>
         <%@include file="navbar.jsp"%>

        <% 
            String uemail=(String)session.getAttribute("useremail");
        %>
        
        
        
        <script>
           
           var em="<%=uemail%>";
           
            function checkuserlogin(serviceid, categoryname)
            {
               // alert(serviceid + " " + categoryname);
            }

             function check(id,servicename)
            {
//                alert(id);
//                alert(servicename);
                if(em != "null"){
                   window.location.href="userShowAllSubServices.jsp?serviceid="+id+"&servicename="+servicename;
               }
               else{
                   window.location.href="login.jsp";
               }
            }
             
             
             
             
             
            function userShowService()
            {
                
//                var url = "/userShowService";
//                fetch(url)
//                          .then(response => response.text())
//                          .then(ans => renderAHtml(ans) );
//                  
//            }
//
//            function renderAHtml(ans) {
//                console.log(ans);
//                      alert("rendering");
//              
//            }

                //  var rn=document.getElementById("rn").value;
                //fetch data from server
                //step 1
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
                xhttp.open("GET", "./userShowService", true);
                //step3
                xhttp.send();
            }

            function renderAsHTML(t) {

               
                var obj = JSON.parse(t);
                var arr = obj.ans;
                var count = 0;
                var flag = true;
                var res="";
               for (var i = 0; i < arr.length; i++)
                 {
                        var idx=i%6+1;
                        var st = arr[i];
                        if(idx===1 || idx===2 || idx===3 || idx===7|| idx===9)
                        {
                        
                        res+="<div class=\"col-lg-2 col-sm-6 col-12 serviceimage1\" style=\"background: url('"+st.photo+"')\"background-size: cover, position: relative, background: no-repeat center;"+idx+""+"\"> </div>";
                        res+="<div class=\"col-lg-2 col-sm-6 col-12 py-5 px-4 servicetext\">";
                        res+="<h4 style=\"text-align: center\">"+st.categoryname+"</h4>";
                        res+="<p class=\"my-3\" >"+st.description+"</p>";
                        //res+= "<a class=\"bt text-capitalize\" href=\"userShowAllSubServices.jsp?serviceid=" + st.id + "&servicename=" + arr[i].servicename +"\""+ "role=\"button\"> read more <i class=\"fas fa-home\"></i></a>";
                        res += "<a onMouseOver=\"this.style.color='white'\" onMouseOut=\"this.style.color='CYAN'\" style=\"color:#00FFFF\" class=\"bt text-capitalize \" onclick=\"check('"+st.id+"','"+st.categoryname+"')\" role=\"button\"> read more <i class=\"fas fa-home\"></i></a>";
                        res+="</div>";
                        
                    }
                    else
                    {
                       res+="<div class=\"col-lg-2 col-sm-6 col-12 py-5 px-4 servicetext\">";
                        res+="<h4>"+st.categoryname+"</h4>";
                        res+="<p class=\"my-3\">"+st.description+"</p>";
                        //res+= "<a class=\"bt text-capitalize\" href=\"userShowAllSubServices.jsp?serviceid=" + st.id + "&servicename=" + arr[i].servicename +"\""+ "role=\"button\"> read more <i class=\"fas fa-home\"></i></a>";
                         res += "<a onMouseOver=\"this.style.color='white'\" onMouseOut=\"this.style.color='CYAN'\" style=\"color:#00FFFF\" class=\"bt text-capitalize \" onclick=\"check('"+st.id+"','"+st.categoryname+"')\" role=\"button\"> read more <i class=\"fas fa-home\"></i></a>";
                        res+="</div>";
                        
                        res+="<div class=\"col-lg-2 col-sm-6 col-12 serviceimage1\" style=\"background: url('"+st.photo+"')\""+idx+""+"\"> </div>";
                    }
                  
                    
                }

          document.getElementById("servicesRendered").innerHTML=res;

            }


        </script>


    </head>

    <body onload="userShowService()">

        <!--/header-->
       

        <!-- banner -->
        <section class="banner" id="home">
            <div class="callbacks_container">
                <ul class="rslides" id="slider3">
                    <li>
                        <div class="slider-info bg1">
                            <div class="bs-slider-overlay">
                                <div class="banner-text container">
                                    <h5 class="tag text-left mb-3 text-uppercase">We are professional </h5>
                                    <h1 class="movetxt text-left agile-title text-uppercase">The Best Place For </h1>
                                    <h2 class="movetxt text-left mb-3 agile-title text-uppercase">Door To Door Services </h2>							
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
                                    <h4 class="movetxt text-left agile-title text-uppercase">Your Services </h4>
                                    <h4 class="movetxt text-left mb-3 agile-title text-uppercase">Our Duty </h4>
                                    <a class="bt mt-4 text-capitalize scroll" href="#about" role="button"> read more
                                        <i class="fas fa-home"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="slider-info bg3">
                            <div class="bs-slider-overlay">
                                <div class="banner-text container">
                                    <h5 class="tag text-left mb-3 text-uppercase">We our Convenient</h5>
                                    <h4 class="movetxt text-left agile-title text-uppercase">We Make Your Home </h4>
                                    <h4 class="movetxt text-left mb-3 agile-title text-uppercase">Look Perfect </h4>

                                    <a class="bt mt-4 text-capitalize scroll" href="#about" role="button"> read more
                                        <i class="fas fa-home"></i>
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
                                        <i class="fas fa-home"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </section>
        <!-- //banner -->

        <!-- About -->
        <section class="about py-5" id="about">
            <div class="container py-lg-3 py-2">
                <div class="heading text-center">
                    <i class="fas fa-home"></i>
                    <h3 class="heading mb-sm-5 mb-3 text-uppercase">About us</h3>
                </div>
                <div class="row about-grids">
                    <div class="col-lg-4 about-grid1 mb-lg-0 mb-5">
                        <h3 class="text-uppercase">Welcome to our  shop</h3>
                        <p class="my-lg-4 my-3">Nam sed ullamcorper elit, sit amet libero in imperdiet dolor. Maecenas non commodo libero. Suspendisse sit amet arcu augue efficitur luctus a nec ipsum dolor sit amet.</p>
                        <a class="bt text-capitalize" href="#" role="button"> read more
                            <i class="fas fa-home"></i>
                        </a>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="about-grid2 p-5">
                            <h3>Expert in our Services</h3>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="about-grid3 p-5">
                            <h3>25 years experience</h3>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- //About -->

        <!-- services -->
        <section class="services py-5" id="services">
            <div class="container-fluid">
                <div class="heading text-center">
                    <i class="fas fa-home"></i>
                    <h3 class="heading mb-sm-5 mb-3 text-uppercase">What We Do</h3>
                </div>
                <div id="servicesRendered" class="row service-grids">
                    <!--                    <div class="col-lg-2 col-sm-6 col-12 serviceimage1">
                    
                                        </div>
                                        <div class="col-lg-2 col-sm-6 col-12 py-5 px-4 servicetext">
                                            <h4>Classic Hair cut</h4>
                                            <p class="my-3">Nam sed ullamcorper elit, sit amet libero in imperdiet dolor. Maecenas non commodo libero.</p>
                                            <a class="bt text-capitalize" href="#" role="button"> read more
                                                <i class="fas fa-cut"></i>
                                            </a>
                                        </div>
                               <div class="col-lg-2 col-sm-6 col-12 serviceimage2">
                    
                    <!--                    </div>
                                        <div class="col-lg-2 col-sm-6 col-12 py-5 px-4 servicetext">
                                            <h4>Beard Waxing</h4>
                                            <p class="my-3">Nam sed ullamcorper elit, sit amet libero in imperdiet dolor. Maecenas non commodo libero.</p>
                                            <a class="bt text-capitalize" href="#" role="button"> read more
                                                <i class="fas fa-cut"></i>
                                            </a>
                                        </div>
                                        <div class="col-lg-2 col-sm-6 col-12 serviceimage3">
                    
                                        </div>
                                        <div class="col-lg-2 col-sm-6 col-12 py-5 px-4 servicetext">
                                            <h4>Hair Coloring</h4>
                                            <p class="my-3">Nam sed ullamcorper elit, sit amet libero in imperdiet dolor. Maecenas non commodo libero.</p>
                                            <a class="bt text-capitalize" href="#" role="button"> read more
                                                <i class="fas fa-cut"></i>
                                            </a>
                                        </div>
                                        <div class="col-lg-2 col-sm-6 col-12 py-5 px-4 servicetext">
                                            <h4>Straightening</h4>
                                            <p class="my-3">Nam sed ullamcorper elit, sit amet libero in imperdiet dolor. Maecenas non commodo libero.</p>
                                            <a class="bt text-capitalize" href="#" role="button"> read more
                                                <i class="fas fa-cut"></i>
                                            </a>
                                        </div>
                                        <div class="col-lg-2 col-sm-6 col-12 serviceimage3">
                    
                                        </div>
                                        <div class="col-lg-2 col-sm-6 col-12 py-5 px-4 servicetext">
                                            <h4>Beard Trim</h4>
                                            <p class="my-3">Nam sed ullamcorper elit, sit amet libero in imperdiet dolor. Maecenas non commodo libero.</p>
                                            <a class="bt text-capitalize" href="#" role="button"> read more
                                                <i class="fas fa-cut"></i>
                                            </a>
                                        </div>
                                        <div class="col-lg-2 col-sm-6 col-12 serviceimage1">
                    
                                        </div>
                                        <div class="col-lg-2 col-sm-6 col-12 py-5 px-4 servicetext">
                                            <h4>Clean Shave</h4>
                                            <p class="my-3">Nam sed ullamcorper elit, sit amet libero in imperdiet dolor. Maecenas non commodo libero.</p>
                                            <a class="bt text-capitalize" href="#" role="button"> read more
                                                <i class="fas fa-cut"></i>
                                            </a>
                                        </div>
                                        <div class="col-lg-2 col-sm-6 col-12 serviceimage2">
                    
                                        </div>-->
                </div>
            </div>
        </section>
        <!-- //services -->

        <!-- Team -->
        <section class="barbers py-5" id="team">
            <div class="container py-lg-3 py-2">
                <div class="heading text-center">
                    <i class="fas fa-home"></i>
                    <h3 class="heading mb-sm-5 mb-3 text-uppercase">Our Vendors</h3>
                </div>
                <div class="row barber-grids">
                    <div class="col-lg-3 col-sm-6 mb-lg-0 mb-5 text-center">
                        <div class="barber-grid1">
                            <img src="images/barber1.jpg" class="img-fluid" alt=""/>
                        </div>
                        <h4 class="mt-3">David Alison</h4>
                        <p>Plumber</p>
                        <div class="social mt-2">
                            <ul class="d-flex justify-content-center">
                                <li class="mr-1"><a href="#"><span class="fab fa-facebook-f"></span></a></li>
                                <li class="mr-1"><a href="#"><span class="fab fa-twitter"></span></a></li>
                                <li class=""><a href="#"><span class="fab fa-linkedin-in"></span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6 mb-lg-0 mb-5 text-center">
                        <div class="barber-grid1">
                            <img src="images/barber2.jpg" class="img-fluid" alt=""/>
                        </div>
                        <h4 class="mt-3">David Alison</h4>
                        <p>Electrician</p>
                        <div class="social mt-2">
                            <ul class="d-flex justify-content-center">
                                <li class="mr-1"><a href="#"><span class="fab fa-facebook-f"></span></a></li>
                                <li class="mr-1"><a href="#"><span class="fab fa-twitter"></span></a></li>
                                <li class=""><a href="#"><span class="fab fa-linkedin-in"></span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6 mb-md-0 mb-5 text-center">
                        <div class="barber-grid1">
                            <img src="images/barber3.jpg" class="img-fluid" alt=""/>
                        </div>
                        <h4 class="mt-3">David Alison</h4>
                        <p>Carpenter</p>
                        <div class="social mt-2">
                            <ul class="d-flex justify-content-center">
                                <li class="mr-1"><a href="#"><span class="fab fa-facebook-f"></span></a></li>
                                <li class="mr-1"><a href="#"><span class="fab fa-twitter"></span></a></li>
                                <li class=""><a href="#"><span class="fab fa-linkedin-in"></span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6 text-center">
                        <div class="barber-grid1">
                            <img src="images/barber4.jpg" class="img-fluid" alt=""/>
                        </div>
                        <h4 class="mt-3">David Alison</h4>
                        <p>Barber</p>
                        <div class="social mt-2">
                            <ul class="d-flex justify-content-center">
                                <li class="mr-1"><a href="#"><span class="fab fa-facebook-f"></span></a></li>
                                <li class="mr-1"><a href="#"><span class="fab fa-twitter"></span></a></li>
                                <li class=""><a href="#"><span class="fab fa-linkedin-in"></span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- //Team -->

        <!-- testimonials -->
        <div class="testimonials" id="testimonials">
            <div class="test_agile_info py-5">
                <div class="container py-lg-3">
                    <div class="heading text-center">
                        <i class="fas fa-cut"></i>
                        <h3 class="heading mb-sm-5 mb-3 text-uppercase">Customers Words</h3>
                    </div>
                    <ul id="flexiselDemo1">			
                        <li>
                            <div class="wthree_testimonials_grid_main">
                                <div class="wthree_testimonials_grid">
                                    <p>Donec laoreet eu purus eu viverra. Vestibulum sed convallis massa,
                                        eu aliquet massa init. Suspendisse lacinia rutrum tincidunt. Integer id erat porta, 
                                        convallis tortor Vestibulum sedconvallis massa purus eu viverra.</p>
                                    <h5>Mark Henry</h5>
                                    <div class="wthree_testimonials_grid_pos">
                                        <img src="images/t1.jpg" alt=" " class="img-responsive" />
                                    </div>
                                </div>

                            </div>
                        </li>
                        <li>
                            <div class="wthree_testimonials_grid_main">
                                <div class="wthree_testimonials_grid">
                                    <p>Lorem laoreet eu purus eu viverra. Vestibulum sed convallis massa,
                                        eu aliquet massa init. Suspendisse lacinia rutrum tincidunt. Integer id erat porta, 
                                        convallis tortor Vestibulum sedconvallis massa purus eu viverra.</p>
                                    <h5>Linda Carl</h5>
                                    <div class="wthree_testimonials_grid_pos">
                                        <img src="images/t2.jpg" alt=" " class="img-responsive" />
                                    </div>
                                </div>

                            </div>
                        </li>
                        <li>
                            <div class="wthree_testimonials_grid_main">
                                <div class="wthree_testimonials_grid">
                                    <p>Donec laoreet eu purus eu viverra. Vestibulum sed convallis massa,
                                        eu aliquet massa init. Suspendisse lacinia rutrum tincidunt. Integer id erat porta, 
                                        convallis tortor Vestibulum sedconvallis massa purus eu viverra.</p>
                                    <h5>Michael Paul</h5>
                                    <div class="wthree_testimonials_grid_pos">
                                        <img src="images/t3.jpg" alt=" " class="img-responsive" />
                                    </div>
                                </div>

                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- //testimonials -->

        <!-- pricing -->
        <section class="py-5" id="pricing">
            <div class="container">
                <div class="heading text-center">
                    <i class="fas fa-cut"></i>
                    <h3 class="heading mb-sm-5 mb-3 text-uppercase">Our Pricing</h3>
                </div>
                <!--/tabs-->
                <div class="responsive_tabs">
                    <div id="horizontalTab">
                        <ul class="resp-tabs-list">
                            <li>Water leakage</li>
                            <li>Cleaning</li>
                            <li>Spa- Services</li>
                            <li>Beard Style</li>
                        </ul>
                        <div class="resp-tabs-container">
                            <!--/tab_one-->
                            <div class="tab1">
                                <div class="tab-info">
                                    <div class="row tab-grids">
                                        <div class="col-md-6">
                                            <h3>House Cleaning <span class="price"> 12$</span></h3>
                                            <p class="mt-3">Nam sed ullamcorper elit, sit amet libero in imperdiet dolor. Maecenas non commodo libero. Suspendisse sit amet</p>
                                        </div>
                                        <div class="col-md-6 mt-md-0 mt-3">
                                            <h3> SPA Services <span class="price"> 06$</span></h3>
                                            <p class="mt-3">Nam sed ullamcorper elit, sit amet libero in imperdiet dolor. Maecenas non commodo libero. Suspendisse sit amet</p>
                                        </div>
                                        <div class="col-md-6 mt-md-5 mt-3">
                                            <h3> Plumbing  <span class="price"> 11$</span></h3>
                                            <p class="mt-3">Nam sed ullamcorper elit, sit amet libero in imperdiet dolor. Maecenas non commodo libero. Suspendisse sit amet</p>
                                        </div>
                                        <div class="col-md-6 mt-md-5 mt-3">
                                            <h3> Furniture <span class="price"> 09$</span></h3>
                                            <p class="mt-3">Nam sed ullamcorper elit, sit amet libero in imperdiet dolor. Maecenas non commodo libero. Suspendisse sit amet</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--//tab_one-->
                            <!--/tab_two-->
                            <div class="tab2">

                                <div class="tab-info">
                                    <div class="row tab-grids">
                                        <div class="col-md-6">
                                            <h3>Facial & clean-ups<span class="price"> 25$</span></h3>
                                            <p class="mt-3">Nam sed ullamcorper elit, sit amet libero in imperdiet dolor. Maecenas non commodo libero. Suspendisse sit amet</p>
                                        </div>
                                        <div class="col-md-6 mt-md-0 mt-3">
                                            <h3>Hair Straightening <span class="price"> 21$</span></h3>
                                            <p class="mt-3">Nam sed ullamcorper elit, sit amet libero in imperdiet dolor. Maecenas non commodo libero. Suspendisse sit amet</p>
                                        </div>
                                        <div class="col-md-6 mt-md-5 mt-3">
                                            <h3>Facial Make up <span class="price"> 18$</span></h3>
                                            <p class="mt-3">Nam sed ullamcorper elit, sit amet libero in imperdiet dolor. Maecenas non commodo libero. Suspendisse sit amet</p>
                                        </div>
                                        <div class="col-md-6 mt-md-5 mt-3">
                                            <h3>Hair Grooming <span class="price"> 09$</span></h3>
                                            <p class="mt-3">Nam sed ullamcorper elit, sit amet libero in imperdiet dolor. Maecenas non commodo libero. Suspendisse sit amet</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--//tab_two-->
                            <!--/tab_three-->
                            <div class="tab3">

                                <div class="tab-info">
                                    <div class="row tab-grids">
                                        <div class="col-md-6">
                                            <h3>Manicure<span class="price">17$</span></h3>
                                            <p class="mt-3">Nam sed ullamcorper elit, sit amet libero in imperdiet dolor. Maecenas non commodo libero. Suspendisse sit amet</p>
                                        </div>
                                        <div class="col-md-6 mt-md-0 mt-3">
                                            <h3>Body Polish <span class="price"> 22$</span></h3>
                                            <p class="mt-3">Nam sed ullamcorper elit, sit amet libero in imperdiet dolor. Maecenas non commodo libero. Suspendisse sit amet</p>
                                        </div>
                                        <div class="col-md-6 mt-md-5 mt-3">
                                            <h3>Threading<span class="price"> 29$</span></h3>
                                            <p class="mt-3">Nam sed ullamcorper elit, sit amet libero in imperdiet dolor. Maecenas non commodo libero. Suspendisse sit amet</p>
                                        </div>
                                        <div class="col-md-6 mt-md-5 mt-3">
                                            <h3>Seasoul Body Spa <span class="price"> 32$</span></h3>
                                            <p class="mt-3">Nam sed ullamcorper elit, sit amet libero in imperdiet dolor. Maecenas non commodo libero. Suspendisse sit amet</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--//tab_three-->
                            <!--/tab_four-->
                            <div class="tab4">

                                <div class="tab-info">
                                    <div class="row tab-grids">
                                        <div class="col-md-6">
                                            <h3>Beard Trimming<span class="price"> 21$</span></h3>
                                            <p class="mt-3">Nam sed ullamcorper elit, sit amet libero in imperdiet dolor. Maecenas non commodo libero. Suspendisse sit amet</p>
                                        </div>
                                        <div class="col-md-6 mt-md-0 mt-3">
                                            <h3>Beard Grooming <span class="price"> 15$</span></h3>
                                            <p class="mt-3">Nam sed ullamcorper elit, sit amet libero in imperdiet dolor. Maecenas non commodo libero. Suspendisse sit amet</p>
                                        </div>
                                        <div class="col-md-6 mt-md-5 mt-3">
                                            <h3>Razor Shave<span class="price"> 11$</span></h3>
                                            <p class="mt-3">Nam sed ullamcorper elit, sit amet libero in imperdiet dolor. Maecenas non commodo libero. Suspendisse sit amet</p>
                                        </div>
                                        <div class="col-md-6 mt-md-5 mt-3">
                                            <h3> Beard Softening <span class="price"> 25$</span></h3>
                                            <p class="mt-3">Nam sed ullamcorper elit, sit amet libero in imperdiet dolor. Maecenas non commodo libero. Suspendisse sit amet</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--//tab_four-->
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                </div>
                <!--//tabs-->
                <div class="clearfix"> </div>
            </div>
        </section>
        <!-- //pricing -->

        <!-- contact map and address -->
        <section class="contact py-5" id="contact">
            <div class="container">
                <div class="heading text-center">
                    <i class="fas fa-cut"></i>
                    <h3 class="heading mb-sm-5 mb-3 text-uppercase">Locate Us</h3>
                </div>
                <div class="contact-main-grid">
                    <div class="contact-map">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d83998.94722638946!2d2.277020320550042!3d48.85883773941345!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e66e1f06e2b70f%3A0x40b82c3688c9460!2sParis%2C+France!5e0!3m2!1sen!2sin!4v1524720355592"></iframe>
                    </div>
                    <div class="contact-info">
                        <div class="mb-5">
                            <h4 class="mb-3">Address</h4>
                            <p><span class="fas fa-map mr-2"></span> 123 Street W, Seattle WA 99999</p>
                            <p>Paris, France.</p>
                            <p><span class="fas fa-phone mr-2"></span> +12 345 567 7890</p>
                            <p><span class="fas fa-envelope mr-2"></span> <a href="mailto:name@example.com"> mail@example.com</a> </p>
                        </div>
                        <div class="">
                            <h4 class="mb-3">Opening Hours</h4>
                            <p><span class="fas fa-clock mr-2"></span> Monday ? Friday : 9am - 6pm</p>
                            <p><span class="fas fa-clock mr-2"></span> Saturday and Sunday : 10am - 4pm</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- contact map and address -->

        <!-- Appointment -->
        <%@include file="user_signup.jsp" %>
        <!-- //Appointment -->

        <!-- footer section -->
        <%@include file="footer.jsp" %>
        <!-- //footer section -->

        <!-- js-scripts -->		

        <!-- js -->
        <script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script> <!-- Necessary-JavaScript-File-For-Bootstrap --> 
        <!-- //js -->

        <!-- script for responsive tabs -->
        <script src="js/easy-responsive-tabs.js"></script>
        <script>
        $(document).rea        dy(function ()
        {
            $('#horizontalTab').easyResponsiveTabs({
                type: 'default', //Types: default, vertical, accordion           
                width: 'auto', //auto or any width like 600px
                fit: true, // 100% fit in a container
                closed: 'accordion', // Start closed if in accordion view
                activate: function (event) { // Callback function if tab is switched
                    var $tab = $(this);
                    var $info = $('#tabInfo');
                    var $name = $('span', $info);
                    $name.text($tab.text());
                    $info.show();
                }
            });
            $('#verticalTab').easyResponsiveTabs({
                type: 'vertical',
                width: 'auto',
                fit: true
            });
        }
        );
        </script>
        <!--//        script for responsive tabs -->

        <!-- Flexisel-js for-testimonials -->
        <script type="text/javascript">
            $(window).load(function ()
            {
                $("#flexiselDemo1").flexisel({
                    visibleItems: 1,
                    animationSpeed: 1000,
                    autoPlay: false,
                    autoPlaySpeed: 3000,
                    pauseOnHover: true,
                    enableResponsiveBreakpoints: true,
                    responsiveBreakpoints: {
                        portrait: {
                            changePoint: 480,
                            visibleItems: 1
                        },
                        landscape: {
                            changePoint: 640,
                            visibleItems: 1
                        },
                        tablet: {
                            changePoint: 768,
                            visibletems: 1
                        }
                    }
                });
            });
        </script>
        <script type="text/javascript" src="js/jquery.flexisel.js"></script>
        <!-- Flexisel-js for-testimonials -->

        <!-- Calendar js for date picker-->
        <script src="js/jquery-ui.js"></script>
        <script>
            $(function () {
                $("#datepicker,#datepicker1,#datepicker2,#datepicker3").datepicker();
            });
        </script>
        <!-- //Calendar -->

        <!-- Banner Responsiveslides                                                                         -->
        <script src="js/responsiveslides.min.js"></script>
        <script>
            // You can also use "$(window).load(function() {"
            $(function () {
                // Slideshow 4
                $("#slider3").responsiveSlides({
                    auto: true,
                    pager: true,
                    nav: false,
                    speed: 500,
                    namespace: "callbacks",
                    before: function () {
                        $('.events').append("<li>before event fired.</li>");
                    },
                    after: function () {
                        $('.events').append("<li>after event fired.</li>");
                    }
                });
            });
        </script>
        <!--// Banner Responsiveslides -->

        <!-- start-smoth-scrolling -->
        <script src="js/SmoothScroll.min.js"></script>
        <script type="text/javascript" src="js/move-top.js"></script>
        <script type="text/javascript" src="js/easing.js"></script>
        <script type="text/javascript">
            jQuery(document).ready(function ($) {
                $(".scroll").click(function (event) {
                    event.preventDefault();
                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
                });
            });
        </script>
        <!-- here stars scrolling icon -->
        <script type="text/javascript">
            $(document).ready(function () {
                /*
                 var defaults = {
                 containerID: 'toTop', // fading element id
                 containerHoverID: 'toTopHover', // fading element hover id
                 scrollSpeed: 1200,
                 easingType: 'linear' 
                 };
                 */

                $().UItoTop({easingType: 'easeOutQuart'});
            });
        </script>
        <!-- //here ends scrolling icon -->
        <!-- start-smoth-scrolling -->

        <!-- //js-scripts -->

    </body>
</html>