
<!DOCTYPE html>
<html lang="en">

    <head>

        <%@include file="header.jsp"  %>


        <% 
            String  serviceid=(String)request.getParameter("serviceid");
            String servicename=(String)request.getParameter("servicename");
            
             %>

        <script>

            function userShowAllSubService()
            {
//               
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
//                console.log(serviceid);
            xhttp.open("GET","./userShowAllSubService?serviceid="+<%=serviceid%>, true);
            //step3
            xhttp.send();
            }

            function renderAsHTML(t) {
                alert(t);
                 
            var ans = "";
            var obj = JSON.parse(t);
            var arr = obj.ans;
             console.log(arr);
            for (var i = 0; i < arr.length; i++)
            {
           
            var service = arr[i];
            ans += "<div class=\"col-lg-3 col-sm-6 mb-lg-0 mb-5 text-center\">";
            ans += "<div class=\"barber-grid1\">";
            ans+= "<img src=\""+service.photo+"\"class=\"img-fluid\" alt=\"\"/>"; 
            ans += "</div>";
            ans += "<a href=\"showAllVendors.jsp?name="+service.name+"\"><h4 class=\"mt-3\">"+service.name+"</h4>";
            ans += "<p>"+service.description+"</p>";
            ans += "<div class=\"social mt-2\">";
            ans += "<ul class=\"d - flex justify - content - center\">";
            ans += "<li class=\"mr-1\"><a href=\"#\"><span class=\"fab fa-facebook-f\"></span></a></li>";
            ans += "<li class=\"mr-1\"><a href=\"#\"><span class=\"fab fa-twitter\"></span></a></li>";
            ans += "<li class=\"\"><a href=\"#\"><span class=\"fab fa-linkedin-in\"></span></a></li>";
            ans += "</ul>";
            ans += "</div>";
            ans += "</div>";
            }


            document.getElementById("subservicesrendering").innerHTML = ans;
            }



        </script>


    </head>

          <body onload="userShowAllSubService()">


        <!-- Team -->
        <section class="barbers py-5" id="team">
            <div class="container py-lg-3 py-2">
                <div class="heading text-center">
                    <i class="fas fa-home"></i>
                    <h3 class="heading mb-sm-5 mb-3 text-uppercase">Sub Services Of <%=servicename%></h3>
                </div>
                <div class="row barber-grids" id="subservicesrendering">


                </div>
            </div>
        </section>
        <!-- //Team -->


        <%@include file="footer.jsp" %>

    </body>
</html>