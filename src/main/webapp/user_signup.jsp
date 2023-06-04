
<html>
    <head>
        <title>User Sign Up</title>
        <%@include file="header.jsp" %>
        
        <script>
            function userSignup(){
             var username=document.getElementById("Name").value;
             var email=document.getElementById("Email").value;
              var password=document.getElementById("password").value;
               var confirmpassword=document.getElementById("confirmpassword").value;
                var phone=document.getElementById("phone").value;
                 var f1 = document.getElementById("photo").files[0];
                
               
             if(password!==confirmpassword){
                 alert("password and confirmpassword not matching");
             }
            var formdata = new FormData();
                
                formdata.append("username", username);
                formdata.append("password", password);
                formdata.append("email", email);
                formdata.append("phone", phone);
                formdata.append("f1", f1);
                
              
                
                var url = "./userSignup";
                  
                fetch(url, {method: "POST", body: formdata} )
                          .then(response => response.text())
                          .then(ans => renderAsHtml(ans) );
            }
                
            function renderAsHtml(ans)
            { 
                alert(ans);
                if(ans==="success"){
                       window.location.href = "login.jsp";
                }
                 //document.getElementById("d1").innerHTML = ans;
                
            }
        
                  
            </script>
        
    </head>

    <body>

        <section class="appointment" id="appointment">
            <div class="test_agile_info py-5">
                <div class="container py-lg-3">
                    <div class="heading text-center">
                        <i class="fas fa-cut"></i>
                        <h3 class="heading mb-sm-5 mb-3 text-uppercase">User Sign Up</h3>
                    </div>
                    <div class="contact_grid_right">
                        <form action="#" method="post">
                            <div class="contact_left_grid">
                                <div class="form-group">
                                    <input class="form-control" type="text"  id="Name" placeholder="Username" required="">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" type="email"  id="Email" placeholder="Email" required="">
                                </div>

                                <div  class="form-group">
                                    <input  class="form-control" type="password"  id="password" placeholder="Password" required="">
                                </div>

                                <div  class="form-group">
                                    <input  class="form-control"  type="password"  id="confirmpassword" placeholder="Confirm Password" required="">
                                </div>
                                
                                 <div  class="form-group">
                                    <input  class="form-control"  type="file"  id="photo"  required="">
                                </div>

                                <div class="form-group">
                                    <input class="form-control" type="text"  id="phone" placeholder="Phone Number" required="">
                                </div>
                               
                            </div>
                            <input class="form-control" type="button" value="SIGN UP" onclick="userSignup()">
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



