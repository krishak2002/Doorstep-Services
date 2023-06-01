<!DOCTYPE html>
<html lang="en">
    <head>

        <title>Vendor Side</title>


        <%@include file="header.jsp" %>

    </head>

    <body>

        <% 
            String vendoremail= (String)session.getAttribute("vendor_user_email");
        %>
        <%@include file="vendor_index_navbar.jsp" %>
        <!--        <br><br><br><br><br><br>  <br><br>-->
        <section class="services py-5" id="services">
            <div class="container-fluid">
                <div class="heading text-center">
                    <i class="fas fa-home"></i>
                    <h3 class="heading mb-sm-5 mb-3 text-uppercase">Welcome <%=vendoremail%></h3>
                </div>
            </div> 
        </section>

        <section class="about py-5" id="about">
            <div class="container py-lg-3 py-2">
                <div class="heading text-center">


                </div>
                <div class="row about-grids">
                    <div class="col-lg-4 about-grid1 mb-lg-0 mb-5">
                        <div class="about-grid2 p-5" style="text-align:center">


                            <a href='vendor_edit_profile.jsp'><h3>Edit <br> Profile</h3></a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="about-grid2 p-5" style="text-align:center">
                            <a href='add_photos.jsp'><h3>Add <br> Photo</h3></a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="about-grid2 p-5" style="text-align:center">
                       <a href='manage_booking.jsp'> <h3>Manage <br> Booking</h3></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <%@include file="footer.jsp" %>




    </body>
</html>