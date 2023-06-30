
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>JSP Page</title>
        <%
       String email= (String) request.getParameter("email");
        %>
        <script>
            var slotamount = 0;
            function sendDate()
            {
                var date = document.getElementById("datepicker").value;
                alert(date);

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
                xhttp.open("GET", "./fetchdate?date='" + date + "'&email=" + em + " ", true);

                //step3
                xhttp.send();

            }
            var slotamount = 0;
            function renderslots(ans)
            {


                var mainobj = JSON.parse(ans);
                console.log(mainobj);
                var arr = mainobj.ans;
                var count = 1;
                var output = '<table class="table table-hover" width=500 border=1>';
                output += ' <tr>';
                output += ' <th>index number</th>';
                output += '<th>start slot</th>';
                output += '<th>end slot</th>';

                output += '<th>status</th>';
                output += '</tr>';
                for (var i = 0; i < arr.length; i++) {
                    var obj = arr[i];
                    output += '<tr>';
                    if (obj.status === "Booked") {
                        output += '<td><input type="checkbox" disabled name="r2" /></td>';
                    } else {
                        output += '<td><input type="checkbox" name="r2" value=' + obj.start_slot + '  onchange="slot(this)"/></td>';
                    }
                    output += '<td>' + obj.start_slot + '</td>';
                    output += '<td>' + obj.end_slot + '</td>';
                    output += '<td>' + obj.status + '</td>';
                    slotamount = obj.slot_amount;
                    output += '</tr>';
                    count++;
                }
                output += '</table>';
                document.getElementById("d2").innerHTML = output;


            }


        </script>




    </head>
    <body onload="sendDate()">

        <div id="d2">

        </div>



    </body>
</html>

