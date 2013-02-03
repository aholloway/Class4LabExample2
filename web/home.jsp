<%-- 
    Document   : homeEx1
    Created on : Jan 30, 2013, 5:50:27 PM
    Author     : Drew
--%>

<%@page import="example2.CalculationType"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Example 2</title>
        <style>
            <!--
            .tab { margin-left: 40px; }
            -->
        </style>
        <script>
            function validateRectangleInputs(){
                var validInputs=false;
                var x=document.forms["RectangleCalculatorForm"]["x"].value;
                var y=document.forms["RectangleCalculatorForm"]["y"].value;
                var isXValid=isValid(x,"x");
                var isYValid=isValid(y,"y");
                if(isXValid & isYValid){
                    validInputs=true;
                }
                return validInputs;
            }
            function validateCircleInput(){
                var r=document.forms["CircleCalculatorForm"]["r"].value;
                return isValid(r,"r");
            }
            function validateRtAngleInput(){
                var validInputs=true;
                var a=document.forms["RtAngleCalculatorForm"]["a"].value;
                var b=document.forms["RtAngleCalculatorForm"]["b"].value;
                var c=document.forms["RtAngleCalculatorForm"]["c"].value;
                var isAValid=isNotNegative(a,"a");
                var isBValid=isNotNegative(b,"b");
                var isCValid=isNotNegative(c,"c");
                if(!(isAValid & isBValid & isCValid)){
                    validInputs=false;
                }
                var isANull=isNull(a);
                var isBNull=isNull(b);
                var isCNull=isNull(c);
                
                //one and only one can be null or empty
                var valueCount=0;
                
                if (!isANull){
                    valueCount++
                    if(!isNumeric(a,"a")){
                        validInputs=false;
                    }
                }
                if (!isBNull){
                    valueCount++
                    if(!isNumeric(b,"b")){
                        validInputs=false;
                    }
                }
                if (!isCNull){
                    valueCount++
                    if(!isNumeric(c,"c")){
                        validInputs=false;
                    }
                }
                
                if (valueCount!=2){
                    alert("One and only one of these fields must be empty")
                    validInputs=false;
                }
                
                //hypoteneuse cannot exceed length of either other side
                if (valueCount==2 && !isCNull && !isANull && c<a){
                    alert("c cannot be less than a")
                    validInputs=false;
                }
                
                if (valueCount==2 && !isCNull && !isBNull && c<b){
                    alert("c cannot be less than b")
                    validInputs=false;
                }
                
                return validInputs;
                
            }
            function isValid(number,name) {
                var validInputs=false;
                if(isNotNull(number,name) && isNumeric(number,name)
                    & isNotNegative(number,name)){
                    validInputs=true;
                }
                return validInputs;
            }
            function isNotNull(number,name) {
                var validInputs=true;
                if (isNull(number)){
                    alert(name+" must be filled out");
                    validInputs=false;
                }
                return validInputs;
            }
            function isNumeric(number,name) {
                var validInputs=true;
                if (!isNumber(number)){
                    alert(name+" must be numeric")
                    validInputs=false;
                }  
                return validInputs;
            }
            function isNotNegative(number,name) {
                var validInputs=true;
                if (number<0){
                    alert(name+" may not be negative")
                    validInputs=false;
                }
                return validInputs;
            }
            function isNull(value){
                return value==null || value=="";
            }
            function isNumber(number) {
                return !isNaN(parseFloat(number)) && isFinite(number);
            }
        </script>
    </head>
    <body>
        <h1><a name="top">Example 2 Home</a></h1>
        <h2>Choose a form!</h2>
        <hr>
        <%
            CalculationType calculationType =
                    (CalculationType) request.getAttribute("calculationType");
        %>
        <br />
        <img border="0" src="images/rectangle.jpg" alt="Rectangle" width="304" height="228">

        <p>Enter x and y to get the area of a rectangle!</p>

        <form name="RectangleCalculatorForm" action="RectangleAreaCalculatorServlet" 
              onsubmit="return validateRectangleInputs()" method="POST">
            <p class="tab">x: <input type="text" name="x" size="10"></p>
            <p class="tab">y: <input type="text" name="y" size="10"></p>
            <br />
            <%
                if (calculationType == CalculationType.RECTANGLE_AREA) {

                    Object x = request.getParameter("x");
                    Object y = request.getParameter("y");

                    Object rectangleArea = request.getAttribute("rectangleArea");

                    out.println("<p>A rectangle with side lengths " + x + " and " + y
                            + " will have an area of " + rectangleArea + "</p>");
                }
            %>
            <br />
            <input type="submit" value="Submit">
        </form>
        <br />



        <hr>
        <img border="0" src="images/circle.jpg" alt="Circle" width="228" height="228">

        <p>Enter r to get the area of a circle!</p>

        <form name="CircleCalculatorForm" action="CircleAreaCalculatorServlet" 
              onsubmit="return validateCircleInput()" method="POST">
            <p class="tab">r: <input type="text" name="r" size="5"></p>
            <br />
            <%
                if (calculationType == CalculationType.CIRCLE_AREA) {

                    Object r = request.getParameter("r");
                    Object circleArea = request.getAttribute("circleArea");
                    out.println("<p>A circle with radius " + r
                            + " will have an area of " + circleArea + "</p>");
                }
            %>
            <br />
            <input type="submit" value="Submit">
        </form>

        <br />

        <hr>

        <img border="0" src="images/Rt Triangle.PNG" alt="Rt Triangle" width="304" height="228">

        <p>Enter 2 of the below to get the value of the third side!</p>

        <form name="RtAngleCalculatorForm" action="RtAngleSideCalculatorServlet" 
              onsubmit="return validateRtAngleInput()" method="POST">
            <p class="tab">a: <input type="text" name="a" size="5"></p>
            <p class="tab">b: <input type="text" name="b" size="5"></p>
            <p class="tab">c: <input type="text" name="c" size="5"></p>
            <br />
            <%
                if (calculationType == CalculationType.RT_ANGLE_SIDE) {
                    Object sideLength = request.getAttribute("sideLength");
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
            %>
            <br />
            <input type="submit" value="Submit">
        </form>

        <br />
        <a href="#top">Back to the top.</a> 
        <br />
        <br />
        <br />
        <br />
    </body>
</html>
