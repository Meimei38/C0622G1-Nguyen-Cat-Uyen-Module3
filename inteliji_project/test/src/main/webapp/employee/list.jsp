<%@ page import="java.util.Set" %><%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 10/10/2022
  Time: 1:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <%--3 script phân trang--%>

    <script src="/jquery/jquery-3.5.1.min.js"></script>
    <script src="/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/datatables/js/dataTables.bootstrap5.min.js"></script>



</head>
<style>

    <%--    Chinh vi tri phan trang--%>
    div#list_info {
        width: 50%;
        float: left;
        box-sizing: border-box;
        margin-top: 20px;
    }

    div#list_paginate {
        box-sizing: border-box;
        width: 50%;
        float: left;
        display: flex;
        justify-content: end;
        margin-top: 20px;
    }

    div#list_paginate li a.page-link {
        background-color: #C1EFFF;
        text-decoration: none;
        color: white;
    }

    .page-item.active .page-link {
        border-color: #FFDBA4;
        background-color: #5584AC !important;

    }

    <%--   ket thuc Chinh vi tri phan trang--%>

    #logo {
        margin: 30px 0 20px 300px;
        float: left;
    }

    #login-name {
        margin-top: 30px;
        margin-right: 300px;
        float: right;
    }

    .navbar {
        background-color: #5584AC;
        padding-left: 320px;

    }


    footer, li .nav-item .footer, a.footer {
        background-color: #5584AC;
        text-decoration: none;
        font-size: medium;
        color: #C1EFFF;
        padding-right: 20px;
        margin-left: 10px;
    }

    footer {
        margin: 0 30px 0 30px;
        padding: 0;
        width: 97%;
    }

    p.footer {
        background-color: #5584AC;
        font-size: medium;
        padding: 0;
        color: #C1EFFF;
        margin-left: 50px;
    }

    body {
        background-image: url("kseniya-lapteva-kOajnscQxW8-unsplash.jpg") !important;
        background-repeat: no-repeat;
    }

    .main {
        padding-left: 30px;
        padding-right: 30px;
    }

    table {
        background-color: #5584AC;
        border: 1px solid #C1EFFF;

    }

    table thead, th, td {
        color: white;
        padding-left: 20px !important;
        text-align: center;
    }

    tr:hover {
        background-color: #97D2EC;

    }

    h1 {
        text-align: center;
        margin-bottom: 20px;
    }

    #add, #submit {
        background-color: #5584AC;
        color: white;
        font-weight: bold;
        margin-bottom: 20px;
    }

    #add:hover {
        background-color: #97D2EC;
    }

    h4 {
        margin-left: 20px;
        color: red;
        margin-bottom: 20px;
    }

    #submit {
        margin-right: 0;
        width: 100%;
    }


</style>
<body>
<div class="container-fluid px-0">
    <div class="row">
        <div class="col-12">

            <a href="/index.jsp"><img id="logo" src="../image/accountlogo.jpg" height="150px" width="150px"/></a>
            <h2 id="login-name">Nguyen Van A</h2>

        </div>
    </div>
    <div class="row">
        <h1>
            List
        </h1>
        <c:if test="${mess!=null}">
            <h4> ${mess} </h4>
        </c:if>
    </div>

    <div class="row d-flex" style="padding-left: 30px; padding-right: 30px">
        <form action="/employee" method="get" style="width: 50%; float: left">
            <input type="hidden" name="action" value="add">
            <button class="btn" type="submit" id="add"> Add employee</button>
        </form>
        <form action="/employee" method="post" style="width:50%; margin-right: 0; padding-left: 80px">
            <input type="hidden" name="action" value="search">
            <div class="row px-0 mx-0">
                <div class="col-3">
                    <input type="text" name="searchName" class="form-control" placeholder="Name">
                </div>
                <div class="col-3">
                    <input type="date" name="searchDateOfBirth" class="form-control" placeholder="Date Of Birth">
                </div>
                <div class="col-3">
                    <select class="form-select" name="searchPositionId">
                        <option value="">Position</option>
                        <c:forEach items="${positionMap}" var="position">
                            <option value="${position.key}">${position.value}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-3 px-0" style="right: 0">
                    <button type="submit" class="btn" id="submit">Search</button>
                </div>
            </div>

        </form>
    </div>
    <div class="main">
        <table id="list" class="table">
            <thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Date Of Birth</th>
                <th>Id Card</th>
                <th>Salary</th>
                <th>Phone Number</th>
                <th>Email</th>
                <th>Address</th>
                <th>Position</th>
                <th>Education Degree</th>
                <th>Division</th>
                <th> Edit</th>
                <th> Delete</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="employee" items="${employeeList}">
                <tr>
                    <td><c:out value="${employee.id}"/></td>
                    <td><c:out value="${employee.name}"/></td>
                    <td><c:out value="${employee.dateOfBirth}"/></td>
                    <td><c:out value="${employee.idCard}"/></td>
                    <td><c:out value="${employee.salary}"/></td>
                    <td><c:out value="${employee.phoneNumber}"/></td>
                    <td><c:out value="${employee.email}"/></td>
                    <td><c:out value="${employee.address}"/></td>

                    <c:if test="${!positionMap.containsKey(employee.positionId)}">
                        <td>
                            No Position
                        </td>
                    </c:if>

                    <td>${positionMap.get(employee.positionId)}</td>

                    <c:if test="${!educationDegreeMap.containsKey(employee.educationDegreeId)}">
                        <td>
                            No Education Degree
                        </td>
                    </c:if>

                    <td>${educationDegreeMap.get(employee.educationDegreeId)}</td>

                    <c:if test="${!divisionMap.containsKey(employee.divisionId)}">
                        <td>
                            No Division
                        </td>
                    </c:if>

                    <td>${divisionMap.get(employee.divisionId)}</td>

                    <td><a class="btn btn-primary" href="/employee?action=edit&id=${employee.id}">Edit</a></td>
                    <td>
                        <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                data-bs-target="#delete${employee.id}">
                            Delete
                        </button>
                        <div class="modal fade " id="delete${employee.id}" tabindex="-1"
                             aria-labelledby="exampleModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content bg-light">
                                    <div class="modal-header bg-danger">
                                        <h5 class="modal-title" id="exampleModalLabel_edit">Delete Employee</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body text-black">
                                        <p>Bạn có muốn xóa <strong class="text-danger">${employee.name}</strong>?</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                            Close
                                        </button>
                                        <a href="employee?action=delete&id=${employee.id}"
                                           class="btn btn-danger">Delete</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<footer class="footer mt-auto d-flex flex-wrap justify-content-between align-items-center">
    <p class="footer">&copy; 2021 Company, Inc</p>
    <a href="/"
       class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32">
            <use xlink:href="#bootstrap"/>
        </svg>
    </a>

    <ul class="nav col-md-4 justify-content-end">
        <li class="footer"><a href="#" class="footer">Home</a></li>
        <li class=" footer"><a href="#" class="footer">Features</a></li>
        <li class=" footer"><a href="#" class="footer">Pricing</a></li>
        <li class="footer"><a href="#" class="footer">FAQs</a></li>
        <li class="footer"><a href="#" class="footer">About</a></li>
    </ul>
</footer>

<script>
    $(document).ready(function () {
        $('#list').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
</link>
</body>
</html>
