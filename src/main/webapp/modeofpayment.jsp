<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       
        <%@include file="header.jsp" %>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="js/Razorpay.js" type="text/javascript"></script>
        <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
   
        <%
            String date= (String) request.getParameter("date");
            String vendoremail= (String) request.getParameter("email");
            String grandtotal= (String) request.getParameter("total");
            String allslots= (String) request.getParameter("allslots");
            %>
       
        <script>
            
             var date="<%=date%>";
               var vendoremail="<%=vendoremail%>";
               var grandtotal="<%=grandtotal%>";
               var allslots="<%=allslots%>";
            
           
            
            
            function COD()
            {
               
               alert(vendoremail);
               
            alert("sending");
            
             var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    // Typical action to be performed when the document is ready:

                    var ans = xhttp.responseText;
                    alert(ans);
                     window.location.href="index.jsp";

                }
            };

            //prepare request Step2
            alert(date+" "+vendoremail);
             xhttp.open("GET", "./COD?date="+date+"&email="+vendoremail+"&grandtotal="+grandtotal+"&allslots="+allslots+" ", true);

            //step3
            xhttp.send();
            }
            
            function onlinepayment()
            {
               
            alert("sending");
            
             var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    // Typical action to be performed when the document is ready:

                    var ans = xhttp.responseText;
                    alert(ans);
                    window.location.href="payment_done_icon.jsp";
//                    renderslots(ans);

                }
            };

            //prepare request Step2
             xhttp.open("GET", "./onlinepayment?date="+date+"&email="+vendoremail+"&grandtotal="+grandtotal+"&allslots="+allslots+" ", true);

            //step3
            xhttp.send();
            }
            
            
            
            
            
            </script>
            
        
        <script>


            function paymentlogic()
            {

                var options = {
                    "key": "rzp_test_96HeaVmgRvbrfT",
                    "amount": grandtotal + "00",
                    "name": "Project Name",
                    "description": "",
                    "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOmghn1er2yRA0yXfMRmroSSpWEdAGNV5KHg&usqp=CAU",
                    "handler": function (response) {

                        if (response.razorpay_payment_id == "" || response.razorpay_payment_id == undefined) {

                            window.location.href = "payment_action?status=failed";
                            // paymentfail(authormobile,"Payment failed!");

                            alert("Payment Failed")

                        } else {
//success
                 onlinepayment();
                            //payment success
                            //call your book payment function here
                        }
                    },
                    "prefill": {
                        "name": "",
                        "email": ""
                    },
                    "notes": {
                        "address": ""
                    },
                    "theme": {
                        "color": "#F37254"
                    },
                    "modal": {
                        "ondismiss": function () {
                            $("#statusmodal").modal("show");
                            document.getElementById("status").innerHTML = "Payment failed ! Try again";
                        }
                    }
                };



                var rzp1 = new Razorpay(options);
                rzp1.on('payment.failed', function (response) {
                    console.log("a2");
                    console.log(response.error.code);

                    alert("Payment Failed");


                    // paymentfail(authormobile,"Payment failed!");
                    // rzp1.close();
                    // alert(response.error.code);
                    // alert(response.error.description);
                    // alert(response.error.source);
                    // alert(response.error.step);
                    // alert(response.error.reason);
                    // alert(response.error.metadata.order_id);
                    // alert(response.error.metadata.payment_id);

                });
                rzp1.open();
            }

        </script>
        
    </head>
    <body>
        
        
        
        
        
        
        <section class="appointment" id="appointment">
            <div class="test_agile_info py-5" style="height:100vh">
                <div class="container py-lg-3">
                    <div class="heading text-center">
                        <i class="fas fa-home"></i>
                        <h3 class="heading mb-sm-5 mb-3 text-uppercase">Payment</h3>
                    </div>
                    
                    <div class="contact_grid_right">
                        <div style="text-align: center">
           
         <br>
         <input class="btn btn-success"   type="button"  value="Cash  Payment" onclick="COD()" >
         <br> <br>
         <input class="btn btn-success"   type="button"  value="Online Payment" onclick="paymentlogic()"  >
        
        </div>
                    </div>

                </div>
            </div>
        </section>
    </body>
</html>