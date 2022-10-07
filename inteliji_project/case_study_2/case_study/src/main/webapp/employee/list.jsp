<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 10/5/2022
  Time: 4:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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

</head>
<style>
    #logo{
        margin: 30px 0 20px 300px;
        float: left;
    }
    #login-name{
        margin-top: 30px;
        margin-right: 300px;
        float: right;
    }

    .navbar{
        background-color: #126c66;
        padding-left: 320px;

    }


    footer, li .nav-item .footer, a.footer {
        background-color: #046056;
        text-decoration: none;
        font-size: medium;
        color: #bee3d9;
        padding-right: 20px;
        margin-left: 10px;
    }
    footer {
        margin: 0 20px 0 20px;
        padding: 0;
    }
    p.footer{
        background-color: #046056;
        font-size: medium;
        padding: 0;
        color: #bee3d9;
        margin-left: 50px;
    }
    .main{
        padding-left: 30px;
        padding-right: 30px;
    }
    table {
        background-color: #126c66;
        border: 1px solid white;

    }
    table thead, th, td{
        color: white;
        padding-left: 20px !important;
    }
    tr:hover{
        background-color: darkcyan;

    }
    h1{
        text-align: center;
    }
    #add{
        background-color: #046056;
        color: white;
        font-weight: bold;
        margin-bottom: 50px;
        margin-left: 20px;
    }
    #add:hover{
        background-color: darkcyan;
    }
    h4{
        margin-left: 20px;
        color: red;
        margin-bottom: 20px;
    }

</style>
<body>
<div class="container-fluid px-0">
    <div class="row">
        <div class="col-12" >

            <img id="logo" src="../image/FURAMA.png" height="150px" width="100px"/>
            <h2 id="login-name">Nguyen Van A</h2>

        </div>
    </div>
    <div class="row">
        <h1>
            List
        </h1>
        <c:if test= "${mess!=null}">
            <h4> ${mess} </h4>
        </c:if>
    </div>

    <div class="row">
        <form action="/employee" method="get">
            <input type="hidden" name="action" value="add">
            <button class="btn" type="submit"  id="add"> Add employee </button>
        </form>
        <div class="main">
            <table class="table">
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
                <c:forEach var="employeeDto" items="${employeeDtoList}">
                    <tr>
                        <td><c:out value="${employeeDto.id}"/></td>
                        <td><c:out value="${employeeDto.name}"/></td>
                        <td><c:out value="${employeeDto.dateOfBirth}"/></td>
                        <td><c:out value="${employeeDto.idCard}"/></td>
                        <td><c:out value="${employeeDto.salary}"/></td>
                        <td><c:out value="${employeeDto.phoneNumber}"/></td>
                        <td><c:out value="${employeeDto.email}"/></td>
                        <td><c:out value="${employeeDto.address}"/></td>
                        <td><c:out value="${employeeDto.position}"/></td>
                        <td><c:out value="${employeeDto.educationDegree}"/></td>
                        <td><c:out value="${employeeDto.division}"/></td>
                        <td> <a class="btn btn-primary" href="/employee?action=edit&id=${employeeDto.id}">Edit</a> </td>
                        <td>
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                    data-bs-target="#delete${employeeDto.id}">
                                Delete
                            </button>
                            <div class="modal fade " id="delete${employeeDto.id}" tabindex="-1"
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
                                            Bạn có muốn xóa <strong class="text-danger">${employeeDto.name}</strong>?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
                                            </button>
                                            <a href="employee?action=delete&id=${employeeDto.id}"
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
</div>
    <footer class="footer mt-auto d-flex flex-wrap justify-content-between align-items-center">
        <p class="footer">&copy; 2021 Company, Inc</p>
        <a href="/" class="col-md-4 d-flex align-items-center justify-content-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
            <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
        </a>

        <ul class="nav col-md-4 justify-content-end">
            <li class="footer"><a href="#" class="footer">Home</a></li>
            <li class=" footer"><a href="#" class="footer">Features</a></li>
            <li class=" footer"><a href="#" class="footer">Pricing</a></li>
            <li class="footer"><a href="#" class="footer">FAQs</a></li>
            <li class="footer"><a href="#" class="footer">About</a></li>
        </ul>
    </footer>
</body>
</html>
