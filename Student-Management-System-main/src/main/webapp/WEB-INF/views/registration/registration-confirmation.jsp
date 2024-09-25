<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Success Page</title>
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

        /* Content area styles */
        .content {
            margin-left: 220px;
            padding: 20px;
            width: calc(100% - 220px);
            overflow-y: auto;
            margin-top: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100% - 50px);
            color: #333;
            font-size: 24px;
            font-weight: bold;
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
                            <input type="submit" value="Logout">
                        </form>
                    </li>
                </ul>
            </li>
        </ul>
    </nav>
<input type="${_csrf.parameterName}" name="${_csrf.parameterName}" value="${_csrf.token}"/>
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
        Success!
    </div>
</body>

</html>
