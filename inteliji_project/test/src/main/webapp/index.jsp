<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 10/10/2022
  Time: 11:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
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
        background-image: url("kseniya-lapteva-kOajnscQxW8-unsplash.jpg")!important;
        background-repeat: no-repeat;
    }

    li.nav-item a {
        background-color: #5584AC;
        color: white;
        font-size: large;
        margin-top: 2px;
        margin-right: 50px;
        text-decoration: none;
    }

    li.nav-item a:hover {
        text-decoration: underline;
    }

    .navbar {
        background-color: #5584AC;
        padding-left: 320px;

    }

    .dropdown-menu {
        background-color: #5584AC;
    }

    .dropdown-item:hover {
        background-color: lightskyblue;
    }

    .side-bar {
        background-color: #5584AC;
        margin-bottom: 0;
    }

    .side-bar ul li {
        list-style-type: none;
        width: 100%;
        margin-bottom: 10px;
        padding-left: 20px;
        color: white;
    }

    .side-bar ul li:hover {
        background-color: lightskyblue;
        color: black;
    }

    .side-bar ul {
        margin-left: 0;
        padding-left: 0;
    }

    footer, li .nav-item .footer, a.footer {
        background-color: #5584AC;
        text-decoration: none;
        font-size: medium;
        color: lightskyblue;
        padding-right: 20px;
        margin-left: 10px;
    }

    footer {
        margin: 0 0 0 0;
        padding: 0;
    }

    p.footer {
        background-color: #5584AC;
        font-size: medium;
        padding: 0;
        color: lightskyblue;
        margin-left: 50px;
    }

</style>
<body>
<div class="container-fluid px-0">
    <div class="row">
        <div class="col-12 ">
            <a href="/index.jsp"><img id="logo" src="../image/accountlogo.jpg" height="150px" width="150px"/></a>
            <h2 id="login-name">Nguyễn Cát Uyên</h2>

        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <nav class="navbar navbar-expand-lg ">
                <div class="container-fluid">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">

                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item" id="home">
                                <a aria-current="page" href="#">Home</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                   data-bs-toggle="dropdown" aria-expanded="false">
                                    Employee
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="/employee?action=list">Display employee list</a>
                                    </li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="/employee?action=add">Add employee</a></li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="dropdown-toggle" href="#" id="navbarDropdown1" role="button"
                                   data-bs-toggle="dropdown" aria-expanded="false">
                                    Customer
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#">Display customer list</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="#">Add customer</a></li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="dropdown-toggle" href="#" id="navbarDropdown2" role="button"
                                   data-bs-toggle="dropdown" aria-expanded="false">
                                    Service
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#">Display Service list</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="#">Add service</a></li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="dropdown-toggle" href="#" id="navbarDropdown3" role="button"
                                   data-bs-toggle="dropdown" aria-expanded="false">
                                    Contact
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#">Display contact list</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="#">Add contact</a></li>
                                </ul>
                            </li>
                        </ul>
                        <form class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success text-light" type="submit">Search</button>
                        </form>
                    </div>
                </div>
            </nav>

        </div>
    </div>
    <div class="row">
        <div class="col-2 side-bar vh-100 mx-0 ">
            <ul>
                <li> Item 1</li>
                <li> Item 2</li>
                <li> Item 3</li>
                <li> Item 4</li>
                <li> Item 5</li>
                <li> Item 6</li>
            </ul>
        </div>
        <div class="col-10 mx-0" >

        </div>
    </div>
    <div class="row mx-0 ">
        <div class="col-12 mx-0 px-0">
            <footer class="d-flex flex-wrap justify-content-between align-items-center">
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
        </div>
    </div>
</div>
</body>
</html>

