<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Teacher List</title>
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

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f4f4f4;
        }

        .button {
            display: inline-block;
            padding: 10px 15px;
            color: #fff;
            background-color: #4CAF50;
            text-decoration: none;
            border-radius: 4px;
            text-align: center;
            font-size: 14px;
            margin-right: 5px;
        }

        .button:hover {
            background-color: #45a049;
        }

        .delete-button {
            background-color: #e74c3c;
        }

        .delete-button:hover {
            background-color: #c0392b;
        }

        /* Alert message style */
        #alert {
            background-color: #ffcc00;
            color: #333;
            padding: 10px;
            border-radius: 4px;
            margin-top: 20px;
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
        <h3>Teacher List</h3>

        <div class="container">
            <c:choose>
                <c:when test="${fn:length(teachers) == 0}">
                    <p>There are no teachers.</p>
                </c:when>
                <c:otherwise>
                    <table>
                        <thead>
                            <tr>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Email</th>
                                <th>Courses</th>
                                <th class="short-col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="teacher" items="${teachers}">
                                <tr>
                                    <td>${teacher.firstName}</td>
                                    <td>${teacher.lastName}</td>
                                    <td>${teacher.email}</td>
                                    <td>
                                        <c:choose>
    <c:when test="${not empty teacher.courses}">
        <ul>
            <c:forEach var="course" items="${teacher.courses}">
                <li>${course.name}</li> <!-- You can replace this with a link if needed -->
            </c:forEach>
        </ul>
    </c:when>
    <c:otherwise>
        <span>No Courses</span>
    </c:otherwise>
</c:choose>
                                    </td>
                                    <td class="short-col">
                                        <a class="button delete-button" href="<c:url value='/admin/teachers/delete/${teacher.id}' />"
                                           onclick="return confirm('Are you sure you want to delete this teacher?');">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>

        <%-- <a class="button" href="<c:url value='/admin/teachers/add' />">Add New Teacher</a>  --%>
        
        <c:if test="${not empty successMessage}">
            <div id="alert">${successMessage}</div>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div id="alert" style="background-color: #e74c3c; color: #fff;">${errorMessage}</div>
        </c:if>
    </div>
</body>

</html>
