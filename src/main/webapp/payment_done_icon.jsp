<%-- 
    Document   : payment_done_icon
    Created on : Feb 10, 2023, 1:15:46 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <style>

            body {
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                flex-direction: column;
            }

            h2 {
                font-family: Helvetica;
                font-size: 36px;
                margin-top: 40px;
                color: #333;
                opacity: 0;
            }

            input[type="checkbox"]:checked ~ h2 {
                animation: .6s title ease-in-out;
                animation-delay: 1.2s;
                animation-fill-mode: forwards;
            }

            .circle {
                stroke-dasharray: 1194;
                stroke-dashoffset: 1194;
            }

            input[type="checkbox"]:checked + svg .circle {
                animation: circle 1s ease-in-out;
                animation-fill-mode: forwards;
            }

            .tick {
                stroke-dasharray: 350;
                stroke-dashoffset: 350;
            }

            input[type="checkbox"]:checked + svg .tick {
                animation: tick .8s ease-out;
                animation-fill-mode: forwards;
                animation-delay: .95s;
            }

            @keyframes circle {
                from {
                    stroke-dashoffset: 1194;
                }
                to {
                    stroke-dashoffset: 2388;
                }
            }

            @keyframes tick {
                from {
                    stroke-dashoffset: 350;
                }
                to {
                    stroke-dashoffset: 0;
                }
            }

            @keyframes title {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
            }

        </style>

        <script>
            //   setTimeout("window.location.href='login.html';",time);
            //example:

            setTimeout("window.location.href='index.jsp';", 3000); // after 2 minutes
        </script>

    </head>
    <body>

        <input type="checkbox" checked="true" hidden>

        <svg width="400" height="400">
        <circle fill="none" stroke="#68E534" stroke-width="20" cx="200" cy="200" r="190" class="circle" stroke-linecap="round" transform="rotate(-90 200 200) "/>
        <polyline fill="none" stroke="#68E534" stroke-width="24" points="88,214 173,284 304,138" stroke-linecap="round" stroke-linejoin="round" class="tick" />
        </svg>

        <h2>Payment Success</h2><br>
        <h4>Redirecting to home page in some seconds.....</h4>
    </body>
</html>
