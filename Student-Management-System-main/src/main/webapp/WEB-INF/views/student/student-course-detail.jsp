<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student Course Detail</title>
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

        /* Assignments card styles */
        .card-container {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }

        .card {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 15px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            flex: 1 1 calc(33% - 15px); /* Adjust the width of cards */
            text-align: center;
            position: relative;
        }

        .card a {
            text-decoration: none;
            color: #333;
        }

        /* Grades table styles */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f4f4f4;
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

            .card {
                flex: 1 1 100%; /* Make cards full width on small screens */
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
                <a><i class="fa fa-user-circle"></i><span>${student.firstName}</span></a>
                <ul class="dropdown">
                    <li>
                        <form action="#" th:action="@{/logout}" method="POST">
                            <input type="submit" value="Logout">
                        </form>
                    </li>
                </ul>
            </li>
        </ul>
    </nav>

    <div class="vertical-navbar">
        <ul th:each="course : ${courses}">
            <li>
                <a th:href="@{/student/{studentId}/courses/{courseId}(studentId=${student.id}, courseId=${course.id})}">
                    <i class="fa fa-tag fa-navbar"></i><span th:text="${course.code}"></span>
                </a>
            </li>
        </ul>
    </div>

    <div class="content">
        <h3>Assignments</h3>

        <div th:if="${assignments.size() == 0}">There are no assignments.</div>

        <div th:if="${assignments.size() != 0}">
            <div class="card-container">
                <div class="card" th:each="assignment : ${assignments}">
                    <a th:href="@{/student/{studentId}/courses/{courseId}/assignment/{assignmentId}(studentId=${student.id}, courseId=${course.id}, assignmentId=${assignment.id})}">
                        <i class="fas fa-clipboard-list"></i>
                        <span id="card-name" th:text="${assignment.name}"></span>
                        <span id="card-day" th:if="${assignment.daysRemaining >= 0}" th:text="${assignment.daysRemaining + ' days'}"></span>
                        <span id="card-day" th:if="${assignment.daysRemaining < 0}">Overdue</span>
                    </a>
                </div>
            </div>
        </div>

        <h3>Grades</h3>

        <table>
            <thead>
                <tr>
                    <th id="table-top-left">Grade 1</th>
                    <th>Grade 2</th>
                    <th id="table-top-right">Grade 3</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td th:if="${gradeDetails.getGradeOne() == -1}">-</td>
                    <td th:if="${gradeDetails.getGradeOne() != -1}" th:text="${gradeDetails.gradeOne}"></td>
                    <td th:if="${gradeDetails.getGradeTwo() == -1}">-</td>
                    <td th:if="${gradeDetails.getGradeTwo() != -1}" th:text="${gradeDetails.gradeTwo}"></td>
                    <td th:if="${gradeDetails.getGradeThree() == -1}">-</td>
                    <td th:if="${gradeDetails.getGradeThree() != -1}" th:text="${gradeDetails.gradeThree}"></td>
                </tr>
            </tbody>
        </table>
    </div>
</body>

</html>
