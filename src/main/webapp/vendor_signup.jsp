
<html>
    <head>
        <title>Vendor Sign Up</title>
        <%@include file="header.jsp" %>

        
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        
        
        
        <script>
            function vendorSignup() {
                
                alert("vendor_sign_up_working");
                var username = document.getElementById("Name").value;
                var email = document.getElementById("Email").value;
                var password = document.getElementById("password").value;
                var confirmpassword = document.getElementById("confirmpassword").value;
                var services = document.getElementById("chooseservice").value;
                var subservices = document.getElementById("choosesubservice").value;
                var description = document.getElementById("description").value;
                var start_slot = document.getElementById("start_time").value;
                 var end_slot = document.getElementById("end_time").value;
                 var slot_amount = document.getElementById("slot_amount").value;
                  var latitute = document.getElementById("latitute").value;
                   var longitute = document.getElementById("longitute").value;
                    var address = document.getElementById("address").value;
                
                var f1 = document.getElementById("photo").files[0];

                 
                if (password !== confirmpassword) {
                    alert("password and confirmpassword not matching");
                }
                 alert(username+" "+email+" "+password+" "+address+" "+services+" "+subservices+" "+description+" "+start_slot+" "+end_slot+" "+slot_amount+" "+latitute+" "+longitute );
                var formdata = new FormData();

                formdata.append("username", username);
                formdata.append("password", password);
                formdata.append("email", email);
                 formdata.append("services",services);
                 formdata.append("subservices",subservices);
                 formdata.append("description",description);
                 formdata.append("start_slot",start_slot);
                 formdata.append("end_slot",end_slot);
                 formdata.append("slot_amount",slot_amount);
                 formdata.append("latitute",latitute);
                 formdata.append("longitute",longitute);
                 formdata.append("address",address);
                formdata.append("f1", f1);



                var url = "./vendorSignup";

                fetch(url, {method: "POST", body: formdata})
                        .then(response => response.text())
                        .then(ans => renderAsHtml(ans));
            }

            function renderAsHtml(ans) {
                       alert(ans);
                    if(ans==="success")
                    {
                         window.location.href="vendor_index.jsp";
                    }
                    else{
                         document.getElementById("d1").innerHTML = ans;
                    }
              

            }

        function loginservice()
            {
                //1. Make object of XMLHttpRequest
                var xhttp = new XMLHttpRequest();

                //4. Receive XMLHttpResponse from server & use ans

                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var res = this.responseText;
                        res = res.trim();
                        var mainobj = JSON.parse(res);
                        var arr = mainobj["ans"];

                        var ans = "";
//                        ans = ans + "<button type=\"button\" class=\"btn btn-primary dropdown-toggle\" id=\"servicebutton\" data-bs-toggle=\"dropdown\"> Enter Service you want to provide: ";
//                        ans = ans + "</button>";

                        ans = ans + "<select id=\"chooseservice\" onchange=\"loginsubservice(this.value)\" style=\"width: 100%;\" >  ";
                        ans = ans + "<option value=\"\" ></option><br>";
                        for (var i = 0; i < arr.length; i++)
                        {
                            var st = arr[i];
                            ans = ans + "<option value=\'" + st.id + "\' >" + st.categoryname + "</option><br>";
                        }
                        ans = ans + "</select>";
                        document.getElementById("loginservice").innerHTML = ans;
                    }
                };
                //2. Prepare request (Define target --> servlet)
                xhttp.open("POST", "./login_service_servlet", true);

                //3. Send Request
                xhttp.send();
            }
         
         function loginsubservice(serviceid)
            {
                //1. Make object of XMLHttpRequest
                
                alert(serviceid);
                var xhttp = new XMLHttpRequest();

                //4. Receive XMLHttpResponse from server & use ans

                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        var res = this.responseText;
                        res = res.trim();
                        var mainobj = JSON.parse(res);
                        var arr = mainobj["ans"];

                        var ans = "";
                             console.log(res);
//                        ans = ans + "<button type=\"button\" class=\"btn btn-primary dropdown-toggle\" id=\"servicebutton\" data-bs-toggle=\"dropdown\"> Its Subservices: ";
//                        ans = ans + "</button>";
 
                        ans = ans + "<lable style=\"font-size: 25px;\" >Choose Subservice : </lable><br>";
                        ans = ans + "<select id=\"choosesubservice\" style=\"width: 100%;\" >";
                        ans = ans + "<option value=\"\" ></option><br>";
                        for (var i = 0; i < arr.length; i++)
                        {
                            var st = arr[i];
                            ans = ans + "<option value=\'" + st.name + "\' >" + st.name + "</option><br>";
                        }
                        ans = ans + "</select>";
                        document.getElementById("loginsubservices").innerHTML = ans;
                    }
                };
                //2. Prepare request (Define target --> servlet)
                xhttp.open("POST", "./login_subservice_servlet?serviceid=" + serviceid, true);

                //3. Send Request
                xhttp.send();
            }
         
         
        </script>

    </head>

    <body onload="loginservice()">

        <section class="appointment" id="appointment">
            <div class="test_agile_info py-5">
                <div class="container py-lg-3">
                    <div class="heading text-center">
                        <i class="fas fa-cut"></i>
                        <h3 class="heading mb-sm-5 mb-3 text-uppercase">Vendor Sign Up</h3>
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
                                    <input  class="form-control"  type="text"  id="address" placeholder="address" required="">
                                </div>

                                <div  class="form-group">
                                    <input  class="form-control"  type="file"  id="photo"  required="">
                                </div>
                               <lable style="font-size: 25px;" >Choose a service : </lable><br>
                                 <div  id="loginservice" >
                                    
                                </div>
                               <br><!-- comment -->
                               
                                 <lable style="font-size: 25px;" >Choose a Sub-service : </lable><br>
                                <div  id="loginsubservices">
                                   
                                </div>
                                
                              
                                <div class="form-group">
                                    <input class="form-control" type="text"  id="description" placeholder="Your description" required="">
                                </div>

                             

                                <div class="form-group">
                                    <input class="form-control" type="text"  id="start_time" placeholder="start time" required="">
                                </div>

                                <div class="form-group">
                                    <input class="form-control" type="text"  id="end_time" placeholder="end_time" required="">
                                </div>

                                <div class="form-group">
                                    <input class="form-control" type="text"  id="slot_amount" placeholder="slot_amount" required="">
                                </div>

                                <div class="form-group">
                                    <input class="form-control" type="text"  id="latitute" placeholder="latitute" required="">
                                </div>

                                <div class="form-group">
                                    <input class="form-control" type="text"  id="longitute" placeholder="longitute" required="">
                                </div>


                            </div>
                            <input class="form-control" type="button" value="SIGN UP" onclick="vendorSignup()">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div id ="d1">
                Answer shown here!
            </div>
        </section>

    <%@include file ="footer.jsp"%>

    </body>
</html>



