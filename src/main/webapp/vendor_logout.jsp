
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>JSP Page</title>
             <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> 
            <script>
//      var ans="success";
//          if(ans==="success")
//                    {
//                       Swal.fire({
//                                icon: 'success',
//                                title: 'Done...',
//                                text: 'Logout Successful!'
//                            });
//                           
//                }
   
        <%
        session.removeAttribute("vendor_user_email");
         %>
             
           
//                   Swal.fire({
//                                icon: 'success',
//                                title: 'Done...',
//                                text: 'Logout successful!'
//                            }).then(function () {
//                                window.location = "index.jsp";
//                            });
                  
                  alert('Logout Successful!');
                window.location.href="index.jsp";      
              
             
    
    </script>
            
            
        </head>
        <body>
           
        </body>
    </html>
