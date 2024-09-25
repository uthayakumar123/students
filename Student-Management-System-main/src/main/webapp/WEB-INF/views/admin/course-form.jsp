<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add New Course</title>
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

        /* Sidebar styles */
        .vertical-navbar {
            width: 200px;
            background-color: #f4f4f4;
            border-right: 1px solid #ddd;
            padding: 20px;
            height: calc(100vh - 50px); /* Adjust to account for fixed nav */
            position: fixed;
            top: 50px; /* Adjust to account for fixed nav */
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

        /* Content area styles */
        .content {
            margin-left: 220px; /* Adjust based on the width of your sidebar */
            padding: 20px;
            width: calc(100% - 220px);
            overflow-y: auto;
            margin-top: 50px; /* Adjust to account for fixed nav */
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

        .form-input-item div {
            margin-bottom: 5px;
        }

        .error {
            color: red;
            font-size: 12px;
        }

        button {
            padding: 10px 15px;
            color: #fff;
            background-color: #4CAF50;
            border: none;
            border-radius: 4px;
            cursor: pointer;
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
        <h1>SCHOOL MANAGEMENT SYSTEM</h1>
        <ul>
            <li>
                <a href="#"><i class="fa fa-user-circle"></i>Admin</a>
                <ul class="dropdown">
                    <li>
                        <form action="<c:url value='/logout' />" method="POST">
                        
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        
                            <input type="submit" value="Logout">
                        </form>
                    </li>
                </ul>
            </li>
        </ul>
    </nav>

    <div class="vertical-navbar">
        <ul>
            <li><a href="<c:url value='/admin/adminPanel' />"><i class="fa fa-home"></i><span>Dashboard</span></a></li>
            <li><a href="<c:url value='/admin/courses' />"><i class="fa fa-pencil"></i><span>Courses</span></a></li>
            <li><a href="<c:url value='/admin/students' />"><i class="fa fa-user"></i><span>Students</span></a></li>
            <li><a href="<c:url value='/admin/teachers' />"><i class="fa fa-user-secret"></i><span>Teachers</span></a></li>
            <li><a href="<c:url value='/admin/calendar' />"><i class="fa fa-calendar"></i><span>Calendar</span></a></li>
            <li><a href="<c:url value='/admin/announcements' />"><i class="fa fa-bullhorn"></i><span>Announcements</span></a></li>
            <li><a href="<c:url value='/admin/adminInfo' />"><i class="fa fa-info-circle"></i><span>Info</span></a></li>
        </ul>
    </div>

    <div class="content">
        <div class="container">
            <h3>Add New Course</h3>

            <form action="<c:url value='/admin/saveCourse' />" method="POST">
                <input type="hidden" name="id" value="${course.id}">

                <div class="form-input-item">
                    <div>Course code:</div>
                    <input type="text" name="code" value="${course.code}">
                    <c:if test="${not empty errors['code']}">
                        <p class="error">Please enter the course code!</p>
                    </c:if>
                </div>

                <div class="form-input-item">
                    <div>Course name:</div>
                    <input type="text" name="name" value="${course.name}">
                    <c:if test="${not empty errors['name']}">
                        <p class="error">Please enter the name!</p>
                    </c:if>
                </div>

                <div class="form-input-item">
                    <div>Teacher:</div>
                    <select name="teacherId">
                        <option value="">Select a teacher</option>
                        <c:forEach var="t" items="${teachers}">
                            <option value="${t.id}">${t.firstName} ${t.lastName}</option>
                        </c:forEach>
                    </select>
                </div>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <button type="submit">Add</button>
            </form>
        </div>
    </div>
</body>

</html>
