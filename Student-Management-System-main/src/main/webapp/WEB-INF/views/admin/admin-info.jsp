<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">

<head>
    <title>Admin Info</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #4B0082;
            margin: 0;
            padding: 0;
        }

        /* Navbar Styling */
        nav {
            background-color: #4B0082;
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
        }

        nav i {
            font-size: 24px;
            margin-right: 10px;
        }

        nav h1 {
            font-size: 24px;
            font-weight: bold;
        }

        nav ul {
            list-style: none;
            margin: 0;
        }

        nav ul li {
            display: inline-block;
            position: relative;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
            padding: 10px;
            font-size: 18px;
        }

        nav ul li ul.dropdown {
            display: none;
            position: absolute;
            top: 30px;
            right: 0;
            background-color: #007bff;
            padding: 10px;
        }

        nav ul li:hover ul.dropdown {
            display: block;
        }

        /* Vertical Navbar Styling */
        .vertical-navbar {
            width: 80px;
            background-color: #4B0082;
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            padding-top: 60px;
            overflow-y: auto;
            transition: width 0.3s;
        }

        /* Sidebar hover effect */
        .vertical-navbar:hover {
            width: 250px;
        }

        .vertical-navbar ul {
            list-style: none;
            padding: 0;
        }

        .vertical-navbar ul li {
            padding: 15px;
        }

        .vertical-navbar ul li a {
            color: white;
            text-decoration: none;
            display: flex;
            align-items: center;
            white-space: nowrap;
            overflow: hidden;
            transition: padding-left 0.3s;
        }

        .vertical-navbar ul li a i {
            margin-right: 10px;
            font-size: 24px;
        }

        .vertical-navbar ul li a span {
            display: none;
            transition: opacity 0.3s;
        }

        /* Show the text when hovered */
        .vertical-navbar:hover ul li a span {
            display: inline;
            opacity: 1;
        }

        .vertical-navbar ul li:hover {
            background-color: #800080;
        }

        /* Main Content Styling */
        .content {
            margin-left: 100px;
            padding: 40px;
            background-color: #800080;
            min-height: 100vh;
            transition: margin-left 0.3s;
        }

        /* Shift content when sidebar expands */
        .vertical-navbar:hover ~ .content {
            margin-left: 270px;
        }

        h3 {
            font-size: 28px;
            font-weight: bold;
            color: #fff;
            margin-bottom: 20px;
        }

        /* Card Container Styling */
        .card-container {
            display: flex;
            gap: 20px;
        }

        .card {
            width: 250px;
            height: 150px;
            background-color: #32de84;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s, background-color 0.3s;
        }

        .card:hover {
            transform: translateY(-10px);
            background-color: #ADFF2F;
        }

        .card div {
            display: flex;
            flex-direction: column;
            align-items: center;
            color: black;
        }

        .card div i {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .card div span {
            font-size: 18px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .vertical-navbar {
                width: 60px;
            }

            .content {
                margin-left: 80px;
            }

            .vertical-navbar:hover ~ .content {
                margin-left: 250px;
            }

            .card {
                width: 100%;
            }
        }
    </style>
</head>

<body>

    <!-- Navigation Bar -->
    <nav>
        <i class="fa fa-mortar-board"></i>
        <h1>SCHOOL MANAGEMENT SYSTEM</h1>
        <ul>
            <li>
                <a><i class="fa fa-user-circle"></i> Admin</a>
                <ul class="dropdown">
                    <li>
                        <form th:action="@{/logout}" method="POST">
                        
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        
                            <input type="submit" value="Logout"></input>
                        </form>
                    </li>
                </ul>
            </li>
        </ul>
    </nav>

  <!-- Vertical Sidebar -->
<div class="vertical-navbar">
    <ul>
        <li><a href="${pageContext.request.contextPath}/admin/adminPanel"><i class="fa fa-home fa-navbar"></i> <span>Dashboard</span></a></li>
        <li><a href="${pageContext.request.contextPath}/admin/courses"><i class="fa fa-pencil fa-navbar"></i> <span>Courses</span></a></li>
        <li><a href="${pageContext.request.contextPath}/admin/students"><i class="fa fa-user fa-navbar"></i> <span>Students</span></a></li>
        <li><a href="${pageContext.request.contextPath}/admin/teachers"><i class="fa fa-user-secret fa-navbar"></i> <span>Teachers</span></a></li>
        <li><a href="${pageContext.request.contextPath}/admin/calendar"><i class="fa fa-calendar fa-navbar"></i> <span>Calendar</span></a></li>
        <li><a href="${pageContext.request.contextPath}/admin/announcements"><i class="fa fa-bullhorn fa-navbar"></i> <span>Announcements</span></a></li>
        <li><a href="${pageContext.request.contextPath}/admin/adminInfo"><i class="fa fa-info-circle fa-navbar"></i> <span>Info</span></a></li>
    </ul>
</div>

    <!-- Main Content Area -->
    <div class="content">
        <h3>Admin Info</h3>
        <div class="card-container">
            <div class="card">
                <div>
                    <i class="fa fa-pencil"></i>
                    <span>Courses:</span>
                    <span th:text="${courseSize}"></span>
                </div>
            </div>

            <div class="card" id="students">
                <div>
                    <i class="fa fa-user"></i>
                    <span>Students:</span>
                    <span th:text="${studentSize}"></span>
                </div>
            </div>

            <div class="card" id="teachers">
                <div>
                    <i class="fa fa-user-secret"></i>
                    <span>Teachers:</span>
                    <span th:text="${teacherSize}"></span>
                </div>
            </div>
        </div>
    </div>

</body>

</html>
