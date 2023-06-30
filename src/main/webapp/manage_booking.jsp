
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>JSP Page</title>
    <%@include file="header.jsp"%>
    
    <script>



     <% 
         String vem=(String)session.getAttribute("vendor_user_email");
     %>
         
             var vendoremail= "<%=vem%>";
             
             
             function pendingslot(bookingid)
             {
                  alert(" pendingslot working");
     
            //1. Make object of XMLHttpRequest
            var xhttp = new XMLHttpRequest();

            //4. Receive XMLHttpResponse from server & use ans

            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    var res = this.responseText;
                    res = res.trim();
                   alert(res);
                    if(res==="success")
                    {
                        showslots();
                    }
                    else{
                        alert("error occured");
                    }
                }
            };
            //2. Prepare request (Define target --> servlet)
            xhttp.open("GET","./pendingslot?bookingid="+bookingid, true);

            //3. Send Request
            xhttp.send();
        
             }
             
             
          function approveslot(bookingid)
          {
               
           // alert("approves slots working");
     
            //1. Make object of XMLHttpRequest
            var xhttp = new XMLHttpRequest();

            //4. Receive XMLHttpResponse from server & use ans

            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    var res = this.responseText;
                    res = res.trim();
                   alert(res);
                    if(res==="success")
                    {
                        showslots();
                    }
                    else{
                        alert("error occured");
                    }
                }
            };
            //2. Prepare request (Define target --> servlet)
            xhttp.open("GET","./slotApproval?bookingid="+bookingid, true);

            //3. Send Request
            xhttp.send();
        
          }
             
             
             
        function showslots()
        {
           // alert("show slots working");
     
            //1. Make object of XMLHttpRequest
            var xhttp = new XMLHttpRequest();

            //4. Receive XMLHttpResponse from server & use ans

            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    var res = this.responseText;
                    res = res.trim();
                    console.log(res);
                    var arr = JSON.parse(res).ans;
                    var ans = "";
                    var ans2 = "";
                         console.log(arr);
                    for (var i = 0; i < arr.length; i++)
                    {
                        var singleobj = arr[i];
                        if (singleobj.status === "pending")
                        {
                            ans += "<div  style=\"text-align: center\"  class=\"row\" >";

                            ans += "<div class=\"col-sm-4\" style=\"text-align: center\" >";
                            ans += "<div class=\"row\"><lable style=\"font-size: 15px;\" >Vendor Email: " + singleobj.vendoremail + "</lable></div><br>";
                            ans += "<div class=\"row\" ><lable style=\"font-size: 15px;\" >Booked Slot Date : " + singleobj.date + "</lable></div>";
                            ans += "</div>";

                            ans += "<div class=\"col-sm-5\" style=\"text-align: center\" >";
                            ans += "<div class=\"row\"><lable style=\"font-size: 15px;\" >Total Price : " + singleobj.totalprice + "</lable></div><br>";
                            ans += "<div class=\"row\" ><lable style=\"font-size: 15px;\" >Mode of payment : " + singleobj.paymenttype + "</lable></div>";
                            ans += "</div>";

                            ans += "<div class=\"col-sm-3\" style=\"text-align: center\" >";
                            ans += "<input type=\"button\" value=\"Approve\" class=\"btn btn-success\" onclick=\"approveslot(" + singleobj.bookingid + ")\" >";
                            ans += "</div>";

                            ans += "</div><br><hr>";
                        } 
                        else
                        {
                            ans2 += "<div  style=\"text-align: center\" class=\"row\" >";

                            ans2 += "<div class=\"col-sm-4\" style=\"text-align: center\" >";
                            ans2 += "<div class=\"row\"><lable style=\"font-size: 15px;\" >Customer Email : " + singleobj.vendoremail + "</lable></div><br>";
                            ans2 += "<div class=\"row\" ><lable style=\"font-size: 15px;\" >Booked Slot Date : " + singleobj.date + "</lable></div>";
                            ans2 += "</div>";

                            ans2 += "<div class=\"col-sm-5\" style=\"text-align: center\" >";
                            ans2 += "<div class=\"row\"><lable style=\"font-size: 15px;\" >Total Price : " + singleobj.totalprice + "</lable></div><br>";
                            ans2 += "<div class=\"row\" ><lable style=\"font-size: 15px;\" >Mode of payment : " + singleobj.paymenttype + "</lable></div>";
                            ans2 += "</div>";

                            ans2 += "<div class=\"col-sm-3\" style=\"text-align: center\" >";
                            ans2 += "<input type=\"button\" value=\"Cancle\" class=\"btn btn-danger\" onclick=\"pendingslot(" + singleobj.bookingid + ")\" >";
                            ans2 += "</div>";

                            ans2 += "</div><br><br><br><hr>";
                        }
                    }
                    document.getElementById("approved").innerHTML = ans;
                    document.getElementById("pending").innerHTML = ans2;
                }
            };
            //2. Prepare request (Define target --> servlet)
            xhttp.open("GET","./show_vendorslots_status?vendoremail="+vendoremail, true);

            //3. Send Request
            xhttp.send();
        }
    </script>




</head>
<body onload="showslots()">


   

    <div class="container text-center text-success" ><br>
        <div style="border: 2px solid black; border-radius: 10px;margin: 40px;margin-left: 50px;margin-right: 50px ;background-color: white; padding: 5px" >
            <h1>Pending Slots</h1><br>

            <div id="approved" >

            </div>

        </div>

        <br>

        <div style="border: 2px solid black; border-radius: 10px;margin: 40px;margin-left: 50px;margin-right: 50px ;background-color: white; padding: 5px" >
            <h1>Approved Slots</h1><br>

            <div id="pending" >

            </div>

        </div>
    </div>

    <%@include file="footer.jsp" %>%>



</body>
</html>

