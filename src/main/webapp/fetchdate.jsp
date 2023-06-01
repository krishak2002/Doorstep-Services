
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>JSP Page</title>
            
            <%@include file="header.jsp" %>
           
            
            
             <%
            String email= (String) request.getParameter("email");
            String date=(String)request.getParameter("date");
        %>
            
            <script>
                var grandtotal=0;
                var slotamount=0;
                var count=0;
                
                 var em = "<%=email%>";
                 var date="<%=date%>";
             function sendDate()
        {
           
            alert(em+" "+date);
            
             var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    // Typical action to be performed when the document is ready:

                    var ans = xhttp.responseText;
                    alert(ans);
                    renderslots(ans);

                }
            };

            //prepare request Step2
             xhttp.open("GET", "./fetchdate?date="+date+"&email="+em+" ", true);

            //step3
            xhttp.send();
            
        }
                
              function renderslots(ans)
        {  
            var mainobj = JSON.parse(ans);
            console.log(mainobj);
            var arr = mainobj.ans;
            var count = 1;
            var output = '<table class="table table-hover">';
            output += ' <tr>';
            output += ' <th>Choose your Slots</th>';
            output += '<th>start slot</th>';
            output += '<th>end slot</th>';

            output += '<th>status</th>';
            output += '</tr>';
            for (var i = 0; i < arr.length; i++) {
                var obj = arr[i];
                output += '<tr>';
                if (obj.status === "Booked") 
                {
                    output += '<td><input type="checkbox" disabled name="r2" /></td>';
                } 
                else {
                    output += '<td><input type="checkbox" name="r2" value='+obj.start_slot+' onchange="slot(this)"/></td>';
                    //Active checkbox  value=\"+obj.starttime+"\;
                }
                output += '<td>' + obj.start_slot + '</td>';
                output += '<td>' + obj.end_slot + '</td>';
                output += '<td>' + obj.status + '</td>';
                slotamount=obj.slot_amount;

                output += '</tr>';
                count++;
            }
            output += '</table>';
            document.getElementById("d2").innerHTML = output;

        }
        
        function slot(checkbox){
    
      if(checkbox.checked){
         
          count++;
           // alert(count+" "+grandtotal);
      }else{
          count--;
      }
      
      grandtotal = count * slotamount;
       var ans="";
       
          ans+=" <h3> Grand Total ="+grandtotal+"</h3>";
      document.getElementById("d3").innerHTML=ans;
      
          }
        
        
      function bookslot(){
          alert("bookslots function initialized");
     
          var allslots="";
      var name=document.getElementsByName("r2");
      console.log(name);
      alert(name);
      
      for(var i=0;i<name.length;i++){
          
          if(name[i].checked){
              allslots += name[i].value + ",";
               alert(name[i].value);
          }
      }
      alert(allslots);
      console.log(allslots);
      
      window.location.href="modeofpayment.jsp?date="+date+"&email="+em+"&total="+grandtotal+"&allslots="+allslots;
        
        
      }
        
                </script>
            
            
        </head>
        <body onload="sendDate()">
         
             <div id="d2">
                
                
            </div>
            
            
            
            <div id="d3">
                
                
            </div>
            
            <input type="button" value="bookslots" onclick="bookslot()" />
            
             <%@include file="footer.jsp" %>
        </body>
    </html>

