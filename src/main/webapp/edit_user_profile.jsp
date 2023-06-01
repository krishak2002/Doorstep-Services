
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>JSP Page</title>
        <%@include file="header.jsp"%>



        <script>

            <%
                String email=(String)session.getAttribute("useremail");
            %>
                 var em="<%=email%>";
            function getuserdata()

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
                xhttp.open("GET", "./getuserdata?email=" + em, true);

                //step3
                xhttp.send();


            }
             
           function renderAsHTML(t)
            {
                alert(t);
                var ans = "";
                var obj = JSON.parse(t);
                var arr = obj["ans"];
                console.log(arr);
                var obj = arr[0];

                document.getElementById("name").value = obj.username;
                document.getElementById("email").placeholder = obj.email;
                document.getElementById("phoneno").value = obj.phoneno;
               
            }


          function user_edit_profile()
          {
              
              alert("user_edit_profile working");
              var name=document.getElementById("name").value;
             
              var phoneno=document.getElementById("phoneno").value;
              
               var xhttp = new XMLHttpRequest();

                //step 4
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        // Typical action to be performed when the document is ready:

                        var ans = xhttp.responseText;
                        alert(ans);

                    }
                };

                //prepare request Step2
                xhttp.open("GET", "./user_edit_profile?email="+em+"&username="+name+"&phoneno="+phoneno, true);

                //step3
                xhttp.send();
              
              
              
              
          }
        </script>




    </head>
    <body onload="getuserdata()">


        <%@include file="navbar.jsp"%>


        <section class="appointment" id="appointment">
            <br><br><br><br><br>
            <div class="test_agile_info py-5">
                <div class="container py-lg-3">
                    <div class="heading text-center">
                        <i class="fas fa-cut"></i>
                        <h3 class="heading mb-sm-5 mb-3 text-uppercase" >Edit your Profile</h3>
                    </div>
                    <div class="contact_grid_right">
                        <form action="#" method="post">
                            <div class="contact_left_grid">
                                
                                
                                
                                 <div class="form-group">
                                     <input class="form-control" type="email"  id="email" placeholder="Email" required="" readonly="">
                                </div>
                                
                                <div class="form-group">
                                    <input class="form-control" type="text"  id="name" placeholder="Username" required="">
                                </div>
                               


                                <div class="form-group">
                                    <input class="form-control" type="text"  id="phoneno" placeholder="Your PhoneNo." required="">
                                </div>



                               



                            </div>
                            <input class="form-control" type="button" value="Edit Profile" onclick="user_edit_profile()">
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

