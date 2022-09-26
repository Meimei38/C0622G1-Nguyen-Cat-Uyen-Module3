<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 9/26/2022
  Time: 1:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Discount Calculator</title>
  <link rel="stylesheet" type="text/css" href="input_form.css">

</head>
<body>
<h1> Product Discount Calculator</h1>
<form action="/discount" method="post">
    <label>Product description </label> <br>
    <input type="text" placeholder="Enter product description"> <br>
    <label>List price </label> <br>
    <input name="price" type="number" placeholder="Enter list price"> <br>
    <label>Discount percent </label> <br>
    <input name="percent" type="number" placeholder="Enter discount percent"> <br>
  <button type="submit">Click me</button>

</form>

<%--<% if (request.getAttribute("discount_amount") != null)%>
${discount_amount}
<%
%>--%>
<h1>
${discount_amount == null ? "" :discount_amount }
</h1>
</body>
</html>
