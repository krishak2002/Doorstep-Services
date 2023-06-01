<!DOCTYPE html>
<html lang="en">
    <head>

        <title>Admin Side</title>


        <%@include file="header.jsp" %>

    </head>

    <body>



        <!--        <br><br><br><br><br><br>  <br><br>-->
        <section class="services py-5" id="services">
            <div class="container-fluid">
                <div class="heading text-center">
                    <i class="fas fa-home"></i>
                    <h3 class="heading mb-sm-5 mb-3 text-uppercase">Welcome Admin</h3>
                </div>
            </div> 
        </section>

        <section class="about py-5" id="about">
            <div class="container py-lg-3 py-2">
                <div class="heading text-center">


                </div>
                <div class="row about-grids">
                    <div class="col-lg-6 about-grid1 mb-lg-0 mb-5">
                        <div class="about-grid2 p-5" style="text-align:center">


                            <a href='admin_manage_services.jsp'><h3>Manage <br>  Service</h3></a>
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-6">
                        <div class="about-grid2 p-5" style="text-align:center">
                            <a href='admin_manage_vendors.jsp'> <h3>Manage <br> Vendors</h3></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>






    </body>
</html>