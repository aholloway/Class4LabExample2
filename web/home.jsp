<%-- 
    Document   : homeEx1
    Created on : Jan 30, 2013, 5:50:27 PM
    Author     : Drew
--%>

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
            function validateForm()
            {
            var x=document.forms["RectangleCalculatorForm"]["x"].value;
            var y=document.forms["RectangleCalculatorForm"]["y"].value;
            if (x==null || x=="")
              {
              alert("x must be filled out");
              return false;
              }
            if (y==null || y=="")
              {
              alert("y must be filled out");
              return false;
              }
            }
            function isNumber(n) {
                return !isNaN(parseFloat(n)) && isFinite(n);
            }
        </script>
    </head>
    <body>
        <h1>Example 2 Home</h1>
        <h2>Choose a form!</h2>
        <hr>
        </br>
        <img border="0" src="images/rectangle.jpg" alt="Rectangle" width="304" height="228">
        
        <p>Enter x and y to get the area of a rectangle!</p>
        
        <form name="RectangleCalculatorForm" action="RectangleAreaCalculatorServlet" 
              onsubmit="return validateForm()" method="POST">
            <p class="tab">x: <input type="text" name="x" size="10"></p>
            <p class="tab">y: <input type="text" name="y" size="10"></p>
            <br />
            <br />
            <input type="submit" value="Submit">
        </form>
        
        </br>
        <hr>
        <img border="0" src="images/circle.jpg" alt="Circle" width="228" height="228">
        
        <p>Enter r to get the area of a circle!</p>
        
        <form action="CircleAreaCalculatorServlet" method="POST">
            <p class="tab">r: <input type="text" name="r" size="5"></p>
            <br />
            <br />
            <input type="submit" value="Submit">
        </form>
        
        </br>
        <hr>
        <img border="0" src="images/Rt Triangle.PNG" alt="Rt Triangle" width="304" height="228">
        
        <p>Enter 2 of the below to get the value of the third side!</p>
        
        <form action="RtAngleSideCalculatorServlet" method="POST">
            <p class="tab">a: <input type="text" name="a" size="5"></p>
            <p class="tab">b: <input type="text" name="b" size="5"></p>
            <p class="tab">c: <input type="text" name="c" size="5"></p>
            <br />
            <br />
            <input type="submit" value="Submit">
        </form>
        
        <br />
        <br />
        <br />
        <br />
    </body>
</html>
