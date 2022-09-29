<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 9/29/2022
  Time: 2:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Customer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <style>
        table{
            height: 100vh;
            border: 2px solid white;
        }
        img{
            width: 200px;
            height: auto;
        }
    </style>
</head>
<body>
<table class="table table-dark table-hover table-bordered align-middle">
    <tr>
        <th>No.</th>
        <th>Id</th>
        <th>Name</th>
        <th>Date of birth</th>
        <th>Address</th>
        <th>Image</th>
    </tr>
    <c:forEach var="customer" items="${customerList}" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${customer.getId()}</td>
            <td>${customer.getName()}</td>
            <td>${customer.getDateOfBirth()}</td>
            <td>${customer.getAddress()}</td>
            <td><img class="img-thumbnail" src="${customer.getImage()}"></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

