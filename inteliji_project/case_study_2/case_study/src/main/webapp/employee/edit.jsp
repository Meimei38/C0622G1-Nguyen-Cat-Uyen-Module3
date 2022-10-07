<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 10/6/2022
  Time: 10:32 AM
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

    .navbar {
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
        margin: 30px 0 0 0;
        padding: 50px 0 0 50px;
    }

    p.footer {
        background-color: #046056;
        font-size: medium;
        padding: 0;
        color: #bee3d9;
        margin-left: 50px;
    }

    .main {
        padding-left: 30px;
        padding-right: 30px;
    }

    h1 {
        text-align: center;
    }

    form {
        background-color: #bee3d9;
    }

    /*    button {
            background-color: #046056 !important;
        }*/
    button:hover {
        background-color: #046056 !important;
        color: white !important;
        font-weight: bold;

    }


</style>
<body>
<div class="container-fluid px-0">
    <div class="row">
        <div class="col-12">

            <img id="logo" src="../image/FURAMA.png" height="150px" width="100px"/>
            <h2 id="login-name">Nguyen Van A</h2>

        </div>
    </div>
    <div class="row">
        <h1>
            List
        </h1>
    </div>

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
                                   required pattern=^\\p{Lu}\\p{Ll}+(\\s\\p{Lu}\\p{Ll}+)*$"
                                   title="Tên nhân viên không được chứa số và các kí tự đầu tiên của mỗi từ phải viết hoa.">
                            <span class="input-group-text"><i class="fa-solid fa-person-circle-question"></i></span>
                        </div>
                    </div>

                    <div class="mt-3 form-group">
                        <label for="dateOfBirth" class="h6">Date of Birth:</label>
                        <input type="date" id="dateOfBirth" class="form-control" name="dateOfBirth"
                               value="<c:out value='${employee.dateOfBirth}' />">
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
                                   required pattern="^09[01]\d{7}|[(]84[)][+]9[01]\d{7}$"
                                   value="<c:out value='${employee.phoneNumber}' />"
                                   title="Số điện thoại phải đúng định dạng 090xxxxxxx hoặc 091xxxxxxx hoặc (84)+90xxxxxxx hoặc (84)+91xxxxxxx.">
                            <span class="input-group-text"><i class="fa-solid fa-square-phone"></i></span>
                        </div>
                    </div>

                    <div class="mt-3 form-group">
                        <label for="email" class="h6">Email:</label>
                        <div class="input-group">
                            <input type="text" id="email" class="form-control" placeholder="Input Email" name="email"
                                   required
                                   value="<c:out value='${employee.email}' />"
                                   pattern="^[_A-Za-z0-9-]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]{2,}(\.[A-Za-z0-9]{2,}){1,2}$"
                                   title="Địa chỉ email phải đúng định dạng.">
                            <span class="input-group-text"><i class="fa-solid fa-envelope-circle-check"></i></span>
                        </div>
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
                               <option value=1 ${employee.positionId == 1? "selected":""}> Lễ tân</option>
                                <option value=2 ${employee.positionId == 2? "selected":""}> Phục vụ</option>
                                <option value=3 ${employee.positionId == 3? "selected":""}> Chuyên viên</option>
                                <option value=4 ${employee.positionId == 4? "selected":""}> Giám sát</option>
                                <option value=5 ${employee.positionId == 5? "selected":""}> Quản lý</option>
                                <option value=6 ${employee.positionId == 6? "selected":""}> Giám đốc</option>
--%>
                            </select>
                            <span class="input-group-text"><i class="fa-solid fa-map"></i></span>
                        </div>
                    </div>

                    <div class="mt-3 form-group">
                        <label class="h6" for="educationDegree">Education degree:</label>
                        <div class="input-group">
                            <select id="educationDegree" class="form-control" name="educationDegree">
                                <option value="1" ${employee.educationDegreeId == 1? "selected":""}> Trung cấp</option>
                                <option value="2" ${employee.educationDegreeId == 2? "selected":""}> Cao đẳng</option>
                                <option value="3" ${employee.educationDegreeId == 3? "selected":""}> Đại học</option>
                                <option value="4" ${employee.educationDegreeId == 4? "selected":""}> Sau đại học</option>
                            </select>
                            <span class="input-group-text"><i class="fa-solid fa-graduation-cap"></i></span>
                        </div>
                    </div>

                    <div class="mt-3 form-group">
                        <label class="h6" for="division">Division:</label>
                        <div class="input-group">
                            <select id="division" class="form-control" name="division">
                                <option value="1" ${employee.divisionId == 1? "selected":""}> Sale-Marketing </option>
                                <option value="2"${employee.divisionId == 2? "selected":""}> Hành chính</option>
                                <option value="3"${employee.divisionId == 3? "selected":""}> Phục vụ</option>
                                <option value="4"${employee.divisionId == 4? "selected":""}> Quản lý </option>
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

<%--        <footer class="d-flex flex-wrap justify-content-between align-items-center">
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
        </footer>--%>


</body>
</html>
