
<html>
    <head>
        <title>Vendor Sign Up</title>
        <%@include file="header.jsp" %>

        
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> 
        
        
        <script>
          
            <%
                String serid=(String)request.getParameter("serviceid");
                %>
                    
                        var sid="<%=serid%>";
          
            function showsubservices()
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
                                ans = ans + "<label class=\"card-text\" style=\"font-size: 25px\" >Service : " + st.name + "</label><br><br>";
                                ans = ans + "<label class=\"card-text\" style=\"font-size: 25px\" >Description : " + st.description + "</label>";
                                ans = ans + "</div>";
                                ans = ans + "</div>";
                                
                                ans = ans + "<div class= \"col-sm-3\" >";
                                ans = ans + "<input type=\"button\" value=\"Delete Service\" class=\"btn btn-dark\" onclick=\"deletesubservice('"+st.name+"')\" ><br><br>";
                               // ans = ans + "<input type=\"button\" value=\"Add Sub Service\" class=\"btn btn-dark\" onclick=\"addsubservices('"+st.id+"')\" >";
                                ans = ans + "</div>";
                                
                            ans = ans + "</div>";
                            ans = ans + "<br>";
                            ans = ans + "<hr>";
                        }
                        document.getElementById("showsubservice").innerHTML = ans ;
                    }
                };
                //2. Prepare request (Define target --> servlet)
                xhttp.open("GET", "./userShowAllSubService?serviceid="+sid, true);

                //3. Send Request
                xhttp.send();
            
            }
            
            function addsubservice()
            {
                var sub_service_name=document.getElementById("sub_service_name").value;
                var description=document.getElementById("description").value;
                 
                  var f1 = document.getElementById("photo").files[0];

                 
                
                var formdata = new FormData();

               var serviceid=parseInt(sid);
                 formdata.append("subservicename",sub_service_name);
                 formdata.append("serviceid",serviceid);
                
                 formdata.append("description",description);
                
                formdata.append("f1", f1);

                 alert(sub_service_name+" "+serviceid+" "+description);
                     
                var url = "./addSubService";

                fetch(url, {method: "POST", body: formdata})
                        .then(response => response.text())
                        .then(ans => renderAddedsubservice(ans));
            }

            function renderAddedsubservice(ans) {
                      // alert(ans);
                    if(ans==="success")
                    {
                       Swal.fire({
                                icon: 'success',
                                title: 'Done...',
                                text: ans
                            });
                             showsubservices();
                }
                      
                    
                    else{
                           Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: ans
                    });
                   
                         //document.getElementById("d1").innerHTML = ans;
                    }
              

            }
            
            function deletesubservice(subservicename)
            {
                sid=parseInt(sid);
                var url = "./delete_sub_services_servlet?subservicename="+subservicename;

                fetch(url, {method: "POST"})
                        .then(response => response.text())
                        .then(ans => renderdeletedsubservice(ans));
            }
            
            function renderdeletedsubservice(ans)
            {
//                alert(ans);
                  
                   if(ans==="success")
                    {
                       Swal.fire({
                                icon: 'success',
                                title: 'Done...',
                                text: ans
                            });
                            showsubservices();
                }
                       
                    
                    else{
                           Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: ans
                    });
                   
                         //document.getElementById("d1").innerHTML = ans;
                    }
               
            }
            
         
        </script>

    </head>

    <body onload="showsubservices()">

        <section class="appointment" id="appointment">
            <div class="test_agile_info py-5">
                <div class="container py-lg-3">
                    <div class="heading text-center">
                        <i class="fas fa-home"></i>
                        <h3 class="heading mb-sm-5 mb-3 text-uppercase">Admin Manage Sub-Service</h3>
                    </div>
                    <div class="contact_grid_right">
                        <form action="#" method="post">
                            <div class="contact_left_grid">
                              

                               <br><!-- comment -->
                               
                                 <div class="form-group">
                                    <input class="form-control" type="text"  id="sub_service_name" placeholder="Sub Service Name " required="">
                                </div>

                                
                              
                                <div class="form-group">
                                    <input class="form-control" type="text"  id="description" placeholder="Your description" required="">
                                </div>

                             <div  class="form-group">
                                    <input  class="form-control"  type="file"  id="photo"  required="">
                                </div>

                            
                            <input class="form-control" type="button" value="Add SubService" onclick="addsubservice()">
                            
                          
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div id ="d1">
                Answer shown here!
            </div>
            
           
            
        </section>

         <div id="showsubservice">
                Sub Services are Shown Here
            </div>
    <%@include file ="footer.jsp"%>

    </body>
</html>



