<%-- 
    Document   : answerPage
    Created on : 2/2/2013
    Author     : aholloway
--%>

<%@page import="example2.CalculationType"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Answer Page</title>
        <style>
            <!--
            .red { color: red; }
            -->
        </style>
    </head>
    <body>
        <h1>Answer Page</h1>
        <hr>
        <%
            CalculationType calculationType =
                    (CalculationType) request.getAttribute("calculationType");

            switch (calculationType) {
                case RECTANGLE_AREA:
                    out.println("<h2>Rectangle Area Calculation</h2>");
                    out.println("<img border=\"0\" src=\"images/rectangle.jpg\" "
                            + "alt=\"Rectangle\" width=\"304\" height=\"228\">");
                    Object x = request.getParameter("x");
                    Object y = request.getParameter("y");

                    Object rectangleArea = request.getAttribute("rectangleArea");

                    out.println("<p>A rectangle with side lengths " + x + " and " + y
                            + " will have an area of " + rectangleArea + "</p>");

                    break;
                case CIRCLE_AREA:
                    out.println("<h2>Circle Area Calculation</h2>");
                    out.println("<img border=\"0\" src=\"images/circle.jpg\""
                            + " alt=\"Circle\" width=\"228\" height=\"228\">");
                    Object r = request.getParameter("r");
                    Object circleArea = request.getAttribute("circleArea");
                    out.println("<p>A circle with radius " + r
                            + " will have an area of " + circleArea + "</p>");
                    break;
                case RT_ANGLE_SIDE:
                    out.println("<h2>Right Angle Side Calculation</h2>");
                    out.println("<img border=\"0\" src=\"images/Rt "
                            + "Triangle.PNG\" alt=\"Rt Triangle\" width=\"304\" "
                            + "height=\"228\">");
                    Object sideLength = request.getAttribute("sideLength");
                    if (sideLength == null) {
                        out.println("<p class=\"red\"><b>Please select only "
                                + "two sides and I "
                                + "will solve for the third</b></p>");
                    } else {
                        String missingSideName =
                                (String) request.getAttribute("missingSideName");
                        if (missingSideName == "a") {
                            out.println("<p>If side b is length " + request.getParameter("b")
                                    + " and side c is length " + request.getParameter("c")
                                    + " then side a will be length " + sideLength + "</p>");
                        }
                        if (missingSideName == "b") {
                            out.println("<p>If side a is length " + request.getParameter("a")
                                    + " and side c is length " + request.getParameter("c")
                                    + " then side b will be length " + sideLength + "</p>");
                        }
                        if (missingSideName == "c") {
                            out.println("<p>If side a is length " + request.getParameter("a")
                                    + " and side b is length " + request.getParameter("b")
                                    + " then side c will be length " + sideLength + "</p>");
                        }

                    }

                    break;

            }
        %>

        <p><a href="home.jsp">Return to Home</a></p>
    </body>
</html>
