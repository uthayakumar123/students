<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Course Details</title>
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

        .content h2, .content h3 {
            color: #333;
            margin-bottom: 20px;
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

        .new-button {
            background-color: #3498db;
        }

        .new-button:hover {
            background-color: #2980b9;
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
                <a><i class="fa fa-user-circle"></i><span th:text="${teacher.firstName}"></span></a>
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
                <a th:href="@{/teacher/{teacherId}/courses/{courseId}(teacherId=${teacher.id}, courseId=${course.id})}">
                    <i class="fa fa-tag fa-navbar"></i><span th:text="${course.code}"></span>
                </a>
            </li>
        </ul>
    </div>

    <div class="content">
        <h2 th:text="${course.name + ' Course Details'}"></h2>

        <div th:if="${students.size() == 0}">
            There are no students in this course. At least 1 student needed to view course detail.
        </div>

        <div th:if="${students.size() != 0}">
            <h3>Student List</h3>
            <div th:text="${'Students enrolled: ' + course.studentListSize()}"></div>
            <table id="table-one">
                <thead>
                    <tr>
                        <th id="table-top-left" class="short-cell">Id</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th id="table-top-right">Email</th>
                    </tr>
                </thead>
                <tbody>
                    <tr th:each="student : ${students}">
                        <td class="short-cell" th:text="${student.id}"></td>
                        <td th:text="${student.firstName}"></td>
                        <td th:text="${student.lastName}"></td>
                        <td th:text="${student.email}"></td>
                    </tr>
                </tbody>
            </table>

            <h3>Assignment List</h3>
            <div th:if="${assignments == null}">There are no assignments</div>
            <table id="table-two" th:if="${assignments != null}">
                <thead>
                    <tr>
                        <th id="table-top-left">Name</th>
                        <th class="longer-cell">Description</th>
                        <th>Due Date</th>
                        <th>Days Remaining</th>
                        <th id="table-top-right">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr th:each="assignment : ${assignments}">
                        <td th:text="${assignment.name}"></td>
                        <td class="longer-cell" th:text="${assignment.description}"></td>
                        <td th:text="${assignment.dueDate}"></td>
                        <td th:if="${assignment.daysRemaining >= 0}" th:text="${assignment.daysRemaining}"></td>
                        <td th:if="${assignment.daysRemaining < 0}">Overdue</td>
                        <td>
                            <a class="button courses-button"
                               th:href="@{/teacher/{teacherId}/courses/{courseId}/assignments/{assignmentId}(teacherId=${teacher.id}, courseId=${course.id}, assignmentId=${assignment.id})}">View</a>
                            <a class="button delete-button"
                               th:href="@{/teacher/{teacherId}/courses/{courseId}/assignments/{assignmentId}/delete(teacherId=${teacher.id}, courseId=${course.id}, assignmentId=${assignment.id})}">Delete</a>
                        </td>
                    </tr>
                </tbody>
            </table>
            <a class="button new-button" th:href="@{/teacher/{teacherId}/courses/{courseId}/assignments/new(teacherId=${teacher.id}, courseId=${course.id})}">Create Assignment</a>
        </div>
    </div>
</body>
</html>
