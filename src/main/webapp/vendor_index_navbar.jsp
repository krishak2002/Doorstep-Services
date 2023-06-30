



<header>
    <div class="top-bar_sub container-fluid">
        <div class="top-forms text-left mt-3">
            <!--/nav-->
            <div class="header_top">
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <button class="navbar-toggler navbar-toggler-right mx-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mx-auto">

                            <%
                                   String vendoruseremail=(String)session.getAttribute("vendor_user_email");
                                   if(vendoruseremail != null){
                                                       
                            %>


                            <li class="nav-item">
                                <a class="nav-link scroll" href="#about">Welcome <%=vendoruseremail%></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link scroll" href="#services">Services</a>
                            </li>
                            
                            <li class="nav-item" >
                                <a  href="vendor_logout.jsp" >Logout</a>
                            </li>

                            <%
                                }
                            
                            %>

                           

                        </ul>
                    </div>

                </nav>
            </div>
            <!--//nav-->
        </div>
<!--        <div class="logo text-center">
            <a class="navbar-brand" href="index.html">
                <i class="fas fa-home"></i> Barber <span> Best Hair Salon</span></a> 
        </div>-->
    </div>
</header>