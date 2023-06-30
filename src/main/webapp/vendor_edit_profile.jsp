
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>JSP Page</title>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <%@include file="header.jsp"%>



        <script>

            <%
                String vendoremail=(String)session.getAttribute("vendor_user_email");
            %>
                 var vem="<%=vendoremail%>";
                 
            function getvendordata()

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
                xhttp.open("GET", "./getvendordata?email=" + vem, true);

                //step3
                xhttp.send();


            }

           function renderAsHTML(t)
            {
                var ans = "";
                var obj = JSON.parse(t);
                var arr = obj["ans"];
                console.log(arr);
                var obj = arr[0];

                document.getElementById("name").value = obj.Vendorname;
                document.getElementById("email").placeholder = obj.Vendor_Email;
                document.getElementById("description").value = obj.Description;
                document.getElementById("slot_amount").value = obj.slot_amount;
            }


          function vendor_edit_profile()
          {
              
//              alert("vendor_edit_profile working");
              var name=document.getElementById("name").value;
              var description =document.getElementById("description").value;
              var slot_amount=document.getElementById("slot_amount").value;
              
               var xhttp = new XMLHttpRequest();

                //step 4
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        // Typical action to be performed when the document is ready:

                        var ans = xhttp.responseText;
//                        alert(ans);
            if(ans==='edit successfull')
            {
                Swal.fire({
                                icon: 'success',
                                title: 'Done...',
                                text: 'Edit successful!'
                            }).then(function () {
                                window.location = "vendor_index.jsp";
                            });
                    
                     // window.location.href="vendor_index.jsp");
            }
            else
            {
                Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Edit Failed !'
                    });
                    alert(ans);
            }
                  
                      

                    }
                };

                //prepare request Step2
                xhttp.open("GET", "./vendor_edit_profile?email="+vem+"&name="+name+"&description="+description+"&slot_amount="+slot_amount+"", true);

                //step3
                xhttp.send();
              
              
              
              
          }
        </script>




    </head>
    <body onload="getvendordata()">


        <%@include file="vendor_index_navbar.jsp"%>


        <section class="appointment" id="appointment">
            <br><br><br><br><br>
            <div class="test_agile_info py-5">
                <div class="container py-lg-3">
                    <div class="heading text-center">
                        <i class="fas fa-home"></i>
                        <h3 class="heading mb-sm-5 mb-3 text-uppercase" >Edit your Profile</h3>
                    </div>
                    <div class="contact_grid_right">
                        <form action="#" method="post">
                            <div class="contact_left_grid">
                                
                                
                                
                                 <div class="form-group">
                                    <input class="form-control" type="email"  id="email" placeholder="Email" required="" readonly="" >
                                </div>
                                
                                <div class="form-group">
                                    <input class="form-control" type="text"  id="name" placeholder="Username" required="">
                                </div>
                               


                                <div class="form-group">
                                    <input class="form-control" type="text"  id="description" placeholder="Your description" required="">
                                </div>



                                <div class="form-group">
                                    <input class="form-control" type="text"  id="slot_amount" placeholder="slot_amount" required="">
                                </div>



                            </div>
                            <input class="form-control" type="button" value="Edit Profile" onclick="vendor_edit_profile()">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div id ="d1">
                Answer shown here!
            </div>
        </section>
    </body>
</html>

