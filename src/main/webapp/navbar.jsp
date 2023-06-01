
<style>
.dropdown-menu
{
     background-color: gray;
}
.dropdown-item{
    color: white;
}
.dropbtn {
  font-size: 17px;
  border: none;
  outline: none;
  color: white;
  padding: 6px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0; /* Important for vertical align on mobile phones */
}


/* Add a red background color to navbar links on hover */
.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: graytext;
}



/* Add a grey background color to dropdown links on hover */
.dropdown-content a:hover {
  background-color: #ddd;
}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
  display: block;
}
        </style>
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
                                   String useremail=(String)session.getAttribute("useremail");
                                   if(useremail != null){
                                                        
                            %>

                            <li class="nav-item">
                                <a class="nav-link scroll" href="#about">Welcome <%=useremail%></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link scroll" href="#services">Services</a>
                            </li>
                             <li class="nav-item">
                                <a class="nav-link " href="edit_user_profile.jsp">Edit Profile</a>
                            </li>
                            
                             <li class="nav-item">
                                <a class="nav-link " href="user_change_password.jsp">Change Password</a>
                            </li>
                            
                             <li class="nav-item">
                                <a class="nav-link " href="user_bookings.jsp">View Bookings</a>
                            </li>

                            <li class="nav-item">
                                <a  href="user_logout.jsp" >Logout</a>
                            </li>

                            <%
                                }
                            else{
                            %>

                            <!--                            <li class="nav-item active">
                                                            <a class="nav-link" href="login.jsp">UserLogin
                                                                <span class="sr-only">(current)</span>
                                                            </a>
                                                        </li>
                            
                                                        <li class="nav-item active">
                                                            <a class="nav-link" href="USER_SIGN_UP.jsp">UserSignUp
                                                                <span class="sr-only">(current)</span>
                                                            </a>
                                                        </li>
                            
                                                        <li class="nav-item active">
                                                            <a class="nav-link" href="vendor_login.jsp">VendorLogin
                                                                <span class="sr-only">(current)</span>
                                                            </a>
                                                        </li>
                            
                                                        <li class="nav-item active">
                                                            <a class="nav-link" href="vendor_signup.jsp">Vendor SignUp
                                                                <span class="sr-only">(current)</span>
                                                            </a>
                                                        </li>-->

                            <li class="nav-item">
                                <div class="dropdown">
                                    <button class="dropbtn " type="button"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        User  <i class="fa fa-caret-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <a class="dropdown-item" href="user_signup.jsp">UserSignUp</a>
                                        <a class="dropdown-item" href="login.jsp">UserLogin</a>

                                    </div>
                                </div>

                            </li>
                            <li>
                                <div class="dropdown">
                                    <button class="dropbtn " type="button"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Vendor  <i class="fa fa-caret-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <a class="dropdown-item" href="vendor_signup.jsp">VendorSignUp</a>
                                        <a class="dropdown-item" href="vendor_login.jsp">VendorLogin</a>

                                    </div>
                                </div>
                            </li>

                            <li>
                                <div class="dropdown">
                                    <button class="dropbtn " type="button"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Admin  <i class="fa fa-caret-down"></i>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <a class="dropdown-item" href="admin_login.jsp">AdminLogin</a>


                                    </div>
                                </div>
                            </li>





                            <li class="nav-item">
                                <a class="nav-link scroll" href="#about">About</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link scroll" href="#services">Services</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link scroll" href="#team">Team</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link scroll" href="#testimonials">Testimonials</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link scroll" href="#pricing">Pricing</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link scroll" href="#appointment">Appointment</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link scroll" href="#contact">Contact</a>
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
        <div class="logo text-center">
            <a class="navbar-brand" href="index.html">
                <i class="fas fa-cut"></i> Barber <span> Best Hair Salon</span></a> 
        </div>
    </div>
</header>