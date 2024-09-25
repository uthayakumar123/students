<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student List</title>

    <!-- External CSS and Font Awesome for icons -->
    <link rel="stylesheet" href="<c:url value='/css/navbar.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/table.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/button.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/admin/course-student-list.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>

    <!-- Navigation bar -->
    <nav>
        <i class="fa fa-mortar-board"></i>
        <h1>STUDENT MANAGEMENT SYSTEM</h1>
        <ul>
            <li>
                <a><i class="fa fa-user-circle"></i> Admin</a>
                <ul class="dropdown">
                    <li>
                        <form action="<c:url value='/logout'/>" method="POST">
                            <input type="submit" value="Logout">
                        </form>
                    </li>
                </ul>
            </li>
        </ul>
    </nav>

    <!-- Sidebar -->
    <div class="vertical-navbar">
        <ul>
            <li><a href="<c:url value='/admin/adminPanel'/>"><i class="fa fa-home fa-navbar"></i><span>Dashboard</span></a></li>
            <li><a href="<c:url value='/admin/courses'/>"><i class="fa fa-pencil fa-navbar"></i><span>Courses</span></a></li>
            <li><a href="<c:url value='/admin/students'/>"><i class="fa fa-user fa-navbar"></i><span>Students</span></a></li>
            <li><a href="<c:url value='/admin/teachers'/>"><i class="fa fa-user-secret fa-navbar"></i><span>Teachers</span></a></li>
            <li><a href="<c:url value='/admin/calendar'/>"><i class="fa fa-calendar fa-navbar"></i><span>Calendar</span></a></li>
            <li><a href="<c:url value='/admin/announcements'/>"><i class="fa fa-bullhorn fa-navbar"></i><span>Announcements</span></a></li>
            <li><a href="<c:url value='/admin/adminInfo'/>"><i class="fa fa-info-circle fa-navbar"></i><span>Info</span></a></li>
        </ul>
    </div>

    <!-- Content -->
    <div class="content">
        <h3>${course.name} Course Student List</h3>
        <div class="container">
            <p>Course teacher: ${teacher.firstName} ${teacher.lastName}</p>

            <!-- Check if the course has students -->
            <c:if test="${empty students}">
                <div>There are no students. Please add new students by clicking on the button below.</div>
            </c:if>

            <c:if test="${not empty students}">
                <!-- Table of students -->
                <table>
                    <thead>
                        <tr>
                            <th class="short-col">ID</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th class="short-col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="student" items="${students}">
                            <tr>
                                <td class="short-col">${student.id}</td>
                                <td>${student.firstName}</td>
                                <td>${student.lastName}</td>
                                <td class="short-col">
                                    <a class="button delete-button" href="<c:url value='/admin/courses/${course.id}/students/delete/${student.id}'/>"
                                        onclick="return confirm('Are you sure you want to delete?');">
                                        <i class="fa fa-trash"></i> <span>Remove</span>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>

            <!-- Button to add new student -->
            <a class="button add-button" href="<c:url value='/admin/courses/${course.id}/students/addStudent'/>">Add Student</a>
        </div>
    </div>

</body>

</html>
