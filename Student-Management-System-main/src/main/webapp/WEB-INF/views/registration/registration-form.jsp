<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registration Form</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        /* Basic reset and styling */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            display: flex;
            height: 100vh;
            overflow: hidden;
            flex-direction: column;
        }

        /* Navigation bar styles */
        nav {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }

        nav h1 {
            font-size: 24px;
        }

        nav i {
            font-size: 24px;
            margin-right: 10px;
        }

        nav ul {
            list-style: none;
            display: flex;
            margin: 0;
            padding: 0;
        }

        nav ul li {
            position: relative;
            margin-left: 20px;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
            font-size: 16px;
        }

        nav ul li .dropdown {
            display: none;
            position: absolute;
            top: 100%;
            left: 0;
            background-color: #333;
            padding: 10px;
            border-radius: 4px;
            list-style: none;
            margin: 0;
            width: 120px;
        }

        nav ul li:hover .dropdown {
            display: block;
        }

        nav ul li .dropdown li {
            margin: 0;
        }

        nav ul li .dropdown li form input[type="submit"] {
            background-color: #e74c3c;
            border: none;
            color: white;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }

        nav ul li .dropdown li form input[type="submit"]:hover {
            background-color: #c0392b;
        }

        /* Sidebar styles */
        .vertical-navbar {
            width: 200px;
            background-color: #f4f4f4;
            border-right: 1px solid #ddd;
            padding: 20px;
            height: calc(100vh - 50px);
            position: fixed;
            top: 50px;
            left: 0;
            overflow-y: auto;
        }

        .vertical-navbar ul {
            list-style: none;
            padding: 0;
        }

        .vertical-navbar ul li {
            margin-bottom: 10px;
        }

        .vertical-navbar ul li a {
            text-decoration: none;
            color: #333;
            font-size: 16px;
            display: block;
            padding: 10px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .vertical-navbar ul li a:hover {
            background-color: #ddd;
        }

        .vertical-navbar ul li a i {
            margin-right: 10px;
        }

        /* Content area styles */
        .content {
            margin-left: 220px;
            padding: 20px;
            width: calc(100% - 220px);
            overflow-y: auto;
            margin-top: 50px;
        }

        .content h3 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }

        .container {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
        }

        .form-input-item {
            margin-bottom: 15px;
        }

        .form-input-item span {
            display: block;
            margin-bottom: 5px;
        }

        .form-input-item input,
        .form-input-item select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .form-input-item .error {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #45a049;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .vertical-navbar {
                width: 100%;
                height: auto;
                position: relative;
                border-right: none;
                border-bottom: 1px solid #ddd;
            }

            .content {
                margin-left: 0;
                width: 100%;
            }
        }
    </style>
</head>

<body>
    <nav>
        <i class="fa fa-mortar-board"></i>
        <h1>STUDENT MANAGEMENT SYSTEM</h1>
        <ul>
            <li>
                <a href="#"><i class="fa fa-user-circle"></i>Admin</a>
                <ul class="dropdown">
                    <li>
                        <form action="<c:url value='/logout' />" method="POST">
                            <input type="submit" value="Logout">
                        </form>
                    </li>
                </ul>
            </li>
        </ul>
    </nav>

    <div class="vertical-navbar">
        <ul>
            <li><a href="<c:url value='/admin/adminDash' />"><i class="fa fa-home"></i><span>Dashboard</span></a></li>
            <li><a href="<c:url value='/admin/courses' />"><i class="fa fa-pencil"></i><span>Courses</span></a></li>
            <li><a href="<c:url value='/admin/students' />"><i class="fa fa-user"></i><span>Students</span></a></li>
            <li><a href="<c:url value='/admin/teachers' />"><i class="fa fa-user-secret"></i><span>Teachers</span></a></li>
            <li><a href="<c:url value='/admin/calendar' />"><i class="fa fa-calendar"></i><span>Calendar</span></a></li>
            <li><a href="<c:url value='/admin/announcements' />"><i class="fa fa-bullhorn"></i><span>Announcements</span></a></li>
            <li><a href="<c:url value='/admin/info' />"><i class="fa fa-info-circle"></i><span>Info</span></a></li>
        </ul>
    </div>

    <div class="content">
        <h3>Registration Form</h3>

       <div class="container">
    <form action="<c:url value='/register/processRegistrationForm' />" method="POST">

        <div class="form-input-item">
            <span>User name:</span>
            <input type="text" name="userName" value="${userDto.userName}">
            <c:if test="${not empty errors['userName']}">
                <p class="error">Invalid user name!</p>
            </c:if>
        </div>

        <div class="form-input-item">
            <span>Password:</span>
            <input type="password" name="password">
            <c:if test="${not empty errors['password']}">
                <p class="error">Invalid password!</p>
            </c:if>
        </div>

        <div class="form-input-item">
            <span>First name:</span>
            <input type="text" name="firstName" value="${userDto.firstName}">
            <c:if test="${not empty errors['firstName']}">
                <p class="error">Invalid first name!</p>
            </c:if>
        </div>

        <div class="form-input-item">
            <span>Last name:</span>
            <input type="text" name="lastName" value="${userDto.lastName}">
            <c:if test="${not empty errors['lastName']}">
                <p class="error">Invalid last name!</p>
            </c:if>
        </div>

        <div class="form-input-item">
            <span>Email:</span>
            <input type="text" name="email" value="${userDto.email}">
            <c:if test="${not empty errors['email']}">
                <p class="error">Invalid email!</p>
            </c:if>
        </div>

       <%--  <div class="form-input-item">
            <span>Phone:</span>
            <input type="text" name="phone" value="${userDto.phone}">
            <c:if test="${not empty errors['phone']}">
                <p class="error">Invalid phone number!</p>
            </c:if>
        </div> --%>

        <div class="form-input-item">
            <span>Role:</span>
            <select name="role">
                <option value="ROLE_STUDENT">Student</option>
                <option value="ROLE_TEACHER">Teacher</option>
            </select>
        </div>
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <button type="submit">Register</button>
    </form>
</div>
       
    </div>
</body>

</html>
