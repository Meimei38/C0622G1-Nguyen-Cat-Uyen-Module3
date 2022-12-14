<%--
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
    <title>Edit</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>

</head>
<style>
    #logo {
        margin: 30px 0 20px 300px;
        float: left;
    }

    #login-name {
        margin-top: 30px;
        margin-right: 300px;
        float: right;
    }

    body {
        background-image: url("kseniya-lapteva-kOajnscQxW8-unsplash.jpg") !important;
        background-repeat: no-repeat;
    }

    .main {
        padding-left: 30px;
        padding-right: 30px;
    }

    h1 {
        text-align: center;
    }

    form {
        background-color: #97D2EC;
        border-color: #5584AC;
    }

    button:hover {
        background-color: #5584AC !important;
        color: white !important;
        font-weight: bold;

    }

    h4 {
        margin-left: 26%;
        color: red;
        margin-bottom: 20px;
    }


</style>
<body>
<div class="container-fluid px-0">
    <div class="row">
        <div class="col-12">

            <a href="/employee?action="><img id="logo" src="../image/accountlogo.jpg" height="150px" width="150px"/></a>
            <h2 id="login-name">Nguyễn Cát Uyên</h2>

        </div>
    </div>
    <div class="row">
        <h1>
            Edit Employee
        </h1>
    </div>
    <c:if test="${mess!=null}">
        <h4> ${mess} </h4>
    </c:if>

    <div class="row">
        <div class="main">
            <div class="d-flex justify-content-center">

                <form class="w-50 border border-2 border-success p-3  rounded"
                      method="post">
                    <div class="form-group">
                        <label for="name" class="h6">Name:</label>
                        <div class="input-group">
                            <input type="text" id="name" class="form-control" placeholder="Input name" name="name"
                                   value="<c:out value='${employee.name}' />"
                                   required
                                   title="Tên nhân viên không được chứa số và các kí tự đầu tiên của mỗi từ phải viết hoa.">
                            <span class="input-group-text"><i class="fa-solid fa-person-circle-question"></i></span>
                        </div>
                        <c:if test="${map.get('name')!=null}">
                            <p style="color:red;">${map.get('name')}</p>
                        </c:if>
                    </div>

                    <div class="mt-3 form-group">
                        <label for="dateOfBirth" class="h6">Date of Birth:</label>
                        <input type="date" id="dateOfBirth" class="form-control" name="dateOfBirth"
                               value="<c:out value='${employee.dateOfBirth}' />">
                        <c:if test="${map.get('dateOfBirth')!=null}">
                            <p><span style="color:red;">${map.get('dateOfBirth')}</span></p>
                        </c:if>
                    </div>

                    <div class="mt-3 form-group">
                        <label for="idCard" class="h6">Id card:</label>
                        <div class="input-group">
                            <input type="text" id="idCard" class="form-control" placeholder="Input Id card"
                                   name="idCard"
                                   value="<c:out value='${employee.idCard}' />"
                                   required pattern="^\d{9}|\d{12}$"
                                   title="Số CMND phải đúng định dạng XXXXXXXXX hoặc XXXXXXXXXXXX (X là số 0-9).">
                            <span class="input-group-text"><i class="fa-solid fa-id-card"></i></span>
                        </div>
                    </div>

                    <div class="mt-3 form-group">
                        <label for="salary" class="h6">Salary:</label>
                        <div class="input-group">
                            <input type="text" id="salary" class="form-control" placeholder="Input Salary" name="salary"
                                   value="<c:out value='${employee.salary}' />"
                                   required pattern="^[1-9]\d*[.]?\d+$"
                                   title="Lương, Giá, Tiền đặt cọc phải là số dương.">
                            <span class="input-group-text"><i class="fa-solid fa-money-bill-wave"></i></span>
                        </div>
                    </div>

                    <div class="mt-3 form-group">
                        <label for="phoneNumber" class="h6">Phone number:</label>
                        <div class="input-group">
                            <input type="text" id="phoneNumber" class="form-control" placeholder="Input Phone number"
                                   name="phoneNumber"
                                   required
                                   value="<c:out value='${employee.phoneNumber}' />">

                            <span class="input-group-text"><i class="fa-solid fa-square-phone"></i></span>
                        </div>
                        <c:if test="${map.get('phoneNumber')!=null}">
                            <p style="color:red;">${map.get('phoneNumber')}</p>
                        </c:if>
                    </div>

                    <div class="mt-3 form-group">
                        <label for="email" class="h6">Email:</label>
                        <div class="input-group">
                            <input type="text" id="email" class="form-control" placeholder="Input Email" name="email"
                                   required
                                   value="<c:out value='${employee.email}' />">

                            <span class="input-group-text"><i class="fa-solid fa-envelope-circle-check"></i></span>
                        </div>
                        <c:if test="${map.get('email')!=null}">
                            <p style="color:red;">${map.get('email')}</p>
                        </c:if>
                    </div>

                    <div class="mt-3 form-group">
                        <label for="address" class="h6">Address:</label>
                        <div class="input-group">
                            <input type="text" id="address" class="form-control" placeholder="Input Address"
                                   name="address"
                                   value="<c:out value='${employee.address}' />"
                                   required pattern="^.+$" title="Vui lòng không để trống địa chỉ.">
                            <span class="input-group-text"><i class="fa-solid fa-map-location-dot"></i></span>
                        </div>
                    </div>

                    <div class="mt-3 form-group">
                        <label class="h6" for="position">Position:</label>
                        <div class="input-group">
                            <select id="position" class="form-control" name="position">
                                <c:forEach items="${positionMap}" var="position">
                                    <option value="${position.key}" ${employee.positionId == position.key? "selected":""}>${position.value}</option>
                                </c:forEach>
                                <%--  <option value=1 ${employee.positionId == 1? "selected":""}> Lễ tân</option>
                                  <option value=2 ${employee.positionId == 2? "selected":""}> Phục vụ</option>
                                  <option value=3 ${employee.positionId == 3? "selected":""}> Chuyên viên</option>
                                  <option value=4 ${employee.positionId == 4? "selected":""}> Giám sát</option>
                                  <option value=5 ${employee.positionId == 5? "selected":""}> Quản lý</option>
                                  <option value=6 ${employee.positionId == 6? "selected":""}> Giám đốc</option>
                                  &ndash;%&gt;--%>
                            </select>
                            <span class="input-group-text"><i class="fa-solid fa-map"></i></span>
                        </div>
                    </div>

                    <div class="mt-3 form-group">
                        <label class="h6" for="educationDegree">Education degree:</label>
                        <div class="input-group">
                            <select id="educationDegree" class="form-control" name="educationDegree">

                                <c:forEach items="${educationDegreeMap}" var="educationDegree">
                                    <option value="${educationDegree.key}" ${employee.educationDegreeId == educationDegree.key? "selected":""}>${educationDegree.value}</option>
                                </c:forEach>

                                <%--<option value="1" ${employee.educationDegreeId == 1? "selected":""}> Trung cấp</option>
                                <option value="2" ${employee.educationDegreeId == 2? "selected":""}> Cao đẳng</option>
                                <option value="3" ${employee.educationDegreeId == 3? "selected":""}> Đại học</option>
                                <option value="4" ${employee.educationDegreeId == 4? "selected":""}> Sau đại học</option>--%>
                            </select>
                            <span class="input-group-text"><i class="fa-solid fa-graduation-cap"></i></span>
                        </div>
                    </div>

                    <div class="mt-3 form-group">
                        <label class="h6" for="division">Division:</label>
                        <div class="input-group">
                            <select id="division" class="form-control" name="division">

                                <c:forEach items="${divisionMap}" var="division">
                                    <option value="${division.key}" ${employee.divisionId == division.key? "selected":""}>${division.value}</option>
                                </c:forEach>

                                <%--   <option value="1" ${employee.divisionId == 1? "selected":""}> Sale-Marketing </option>
                                   <option value="2"${employee.divisionId == 2? "selected":""}> Hành chính</option>
                                   <option value="3"${employee.divisionId == 3? "selected":""}> Phục vụ</option>
                                   <option value="4"${employee.divisionId == 4? "selected":""}> Quản lý </option>--%>
                            </select>
                            <span class="input-group-text"><i class="fa-brands fa-creative-commons-nd"></i></span>
                        </div>
                    </div>

                    <div class="mt-3 text-center">
                        <button type="submit" class="btn btn-sm border border-light  text-dark">
                            -- Save --
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>

