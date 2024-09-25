<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Courses</title>
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

        .sections {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .section {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
            flex: 1 1 calc(30% - 20px);
            text-align: center;
        }

        .section a {
            text-decoration: none;
            color: #333;
            font-size: 18px;
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

            .section {
                flex: 1 1 100%;
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
                <a><i class="fa fa-user-circle"></i><span th:text="${teacher.firstName}"></span></a>
                <ul class="dropdown">
                    <li>
                        <form action="#" th:action="@{/logout}" method="POST">
                            <input type="submit" value="Logout"></input>
                        </form>
                    </li>
                </ul>
            </li>
        </ul>
    </nav>

    <div class="vertical-navbar">
        <ul>
            <c:forEach var="course" items="${courses}">
                <li><a th:href="@{/teacher/{teacherId}/courses/{courseId}(teacherId=${teacher.id}, courseId=${course.id})}">
                    <i class="fa fa-tag fa-navbar"></i><span th:text="${course.code}"></span></a></li>
            </c:forEach>
        </ul>
    </div>

    <div class="content">
        <h3>Courses</h3>

        <div th:if="${courses.size() == 0}">There are no courses assigned.</div>

        <div class="sections">
            <c:forEach var="course" items="${courses}">
                <div class="section">
                    <a th:href="@{/teacher/{teacherId}/courses/{courseId}(teacherId=${teacher.id}, courseId=${course.id})}">
                        <div th:text="${course.name}"></div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
</body>

</html>
