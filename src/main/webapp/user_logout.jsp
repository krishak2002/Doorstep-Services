
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>JSP Page</title>


        <script>

            <%
           session.removeAttribute("useremail");
            %>
                
            alert("user logout successfull");
            window.location.href = "index.jsp";

        </script>


    </head>
    <body>







    </body>
</html>

