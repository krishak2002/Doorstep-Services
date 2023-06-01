
<html>
    <head>
        <title> Admin Manage Services </title>
        <%@include file="header.jsp" %>

        
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        
        
        
        <script>
          function AddServices() {
                
                alert("Add Service Working");
               
                var services = document.getElementById("service_name").value;
              
                var description = document.getElementById("description").value;
               
                
                
                var f1 = document.getElementById("photo").files[0];

                 
                
                var formdata = new FormData();

              
                 formdata.append("service_name",services);
                
                 formdata.append("description",description);
                
                formdata.append("f1", f1);



                var url = "./addService";

                fetch(url, {method: "POST", body: formdata})
                        .then(response => response.text())
                        .then(ans => renderAsHtml(ans));
            }

            function renderAsHtml(ans) {
                       alert(ans);
                    if(ans==="success")
                    {
                       alert("service added successfully");
                    }
                    else{
                        alert("error occured");
                         //document.getElementById("d1").innerHTML = ans;
                    }
              

            }
            
            
            function showservices()
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

                        for (var i = 0; i < arr.length; i++)
                        {
                            var st = arr[i];

                            ans = ans + "<div class=\"row\" >";
                                
                                ans = ans + "<div class=\"col-sm-3\" >";
                                ans = ans + "<img class=\"img-thumbnail\" style=\"border: 2px solid black; border-radius: 10px;\" src=\'"+st.photo+"\' >";
                                ans = ans + "</div>";
                                
                                ans = ans + "<div class= \"col-sm-6\" >";
                                ans = ans + "<div class=\"card-body\">";
                                ans = ans + "<label class=\"card-text\" style=\"font-size: 25px\" >Service : " + st.categoryname + "</label><br><br>";
                                ans = ans + "<label class=\"card-text\" style=\"font-size: 25px\" >Description : " + st.description + "</label>";
                                ans = ans + "</div>";
                                ans = ans + "</div>";
                                
                                ans = ans + "<div class= \"col-sm-3\" >";
                                ans = ans + "<input type=\"button\" value=\"Delete Service\" class=\"btn btn-dark\" onclick=\"deleteservice('"+st.id+"')\" ><br><br>";
                                ans = ans + "<input type=\"button\" value=\"Manage Sub Service\" class=\"btn btn-dark\" onclick=\"addsubservices('"+st.id+"')\" >";
                                ans = ans + "</div>";
                                
                            ans = ans + "</div>";
                            ans = ans + "<br>";
                            ans = ans + "<hr>";
                        }
                        document.getElementById("showservice").innerHTML = ans ;
                    }
                };
                //2. Prepare request (Define target --> servlet)
                xhttp.open("POST", "./show_services_servlet", true);

                //3. Send Request
                xhttp.send();
            }
            
            function deleteservice(serviceid)
            {
                //1. Make object of XMLHttpRequest
                    var xhttp = new XMLHttpRequest();

                    //4. Receive XMLHttpResponse from server & use ans

                    xhttp.onreadystatechange = function () {
                        if (this.readyState == 4 && this.status == 200) {
                            var res = this.responseText;
                            res = res.trim();

                            if (res == "success")
                            {
                                alert("deleted successfully");
                                showservices();
                            } else
                            {
                                alert(res);
                            }
                        }
                    };
                    //2. Prepare request (Define target --> servlet)
                    xhttp.open("POST", "./delete_services_servlet?serviceid="+serviceid, true);

                    //3. Send Request
                    xhttp.send();
            }
            
            function addsubservices(serviceid)
            {
                window.location.href="admin_manage_sub_services.jsp?serviceid="+serviceid;
            }

       
         
         
         
        </script>

    </head>

    <body onload="showservices()" >

        <section class="appointment" id="appointment">
            <div class="test_agile_info py-5">
                <div class="container py-lg-3">
                    <div class="heading text-center">
                        <i class="fas fa-cut"></i>
                        <h3 class="heading mb-sm-5 mb-3 text-uppercase">Admin Manage Booking</h3>
                    </div>
                    <div class="contact_grid_right">
                        <form action="#" method="post">
                            <div class="contact_left_grid">
                               
                                 <div class="form-group">
                                    <input class="form-control" type="text"  id="service_name" placeholder="Service Name" required="">
                                </div>
                                
                               <br><!-- comment -->
                               
                                <div class="form-group">
                                    <input class="form-control" type="text"  id="description" placeholder="Your description" required="">
                                </div>
                                 
                               <br>
                                <div  class="form-group">
                                    <input  class="form-control"  type="file"  id="photo"  required="">
                                </div>
                               
                               <div  class="form-group">
                                    <input  class="form-control"  type="button" value="AddService" onclick="AddServices()" >
                                </div>
                                     
                    </div>
                </div>
            </div>
                <hr>
                
           
        </section>

          <div id ="showservice">
                Answer shown here!
            </div>
        
    <%@include file ="footer.jsp"%>

    </body>
</html>



