<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Course List</title>
    
    <!-- External CSS Links -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/button.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/student-course-list.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
    <!-- Navigation Bar -->
    <nav>
        <i class="fa fa-mortar-board"></i>
        <h1>SCHOOL MANAGEMENT SYSTEM</h1>
        <ul>
            <li>
                <a><i class="fa fa-user-circle"></i>Admin</a>
                <ul class="dropdown">
                    <li>
                        <form action="${pageContext.request.contextPath}/logout" method="POST">
                        
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        
                            <input type="submit" value="Logout"></input>
                        </form>
                    </li>
                </ul>
            </li>
        </ul>
    </nav>

    <!-- Sidebar -->
    <div class="vertical-navbar">
        <ul>
            <li><a href="${pageContext.request.contextPath}/admin/adminPanel"><i class="fa fa-home fa-navbar"></i><span>Dashboard</span></a></li>
            <li><a href="${pageContext.request.contextPath}/admin/courses"><i class="fa fa-pencil fa-navbar"></i><span>Courses</span></a></li>
            <li><a href="${pageContext.request.contextPath}/admin/students"><i class="fa fa-user fa-navbar"></i><span>Students</span></a></li>
            <li><a href="${pageContext.request.contextPath}/admin/teachers"><i class="fa fa-user-secret fa-navbar"></i><span>Teachers</span></a></li>
            <li><a href="${pageContext.request.contextPath}/admin/adminPanel"><i class="fa fa-calendar fa-navbar"></i><span>Calendar</span></a></li>
            <li><a href="${pageContext.request.contextPath}/admin/adminPanel"><i class="fa fa-bullhorn fa-navbar"></i><span>Announcements</span></a></li>
            <li><a href="${pageContext.request.contextPath}/admin/adminInfo"><i class="fa fa-info-circle fa-navbar"></i><span>Info</span></a></li>
        </ul>
    </div>

    <!-- Page Title -->
    <h3>${student.firstName} ${student.lastName} Course List</h3>

    <!-- Main Content -->
    <div class="content">
        <c:choose>
            <c:when test="${fn:length(courses) == 0}">
                <p>There are no courses. Please add new courses by clicking on the button below.</p>
            </c:when>
            <c:otherwise>
                <table>
                    <thead>
                        <tr>
                            <th id="table-top-left">Course Code</th>
                            <th>Course Name</th>
                            <th>Teacher</th>
                            <th id="table-top-right" class="short-col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="course" items="${courses}">
                            <tr>
                                <td>${course.code}</td>
                                <td>${course.name}</td>
                                <td>${course.teacher.firstName} ${course.teacher.lastName}</td>
                                <td class="short-col">
                                    <a class="button delete-button" href="${pageContext.request.contextPath}/admin/students/${student.id}/courses/delete/${course.id}"
                                        onclick="return confirm('Are you sure you want to unroll the student from this course?')">
                                        <i class="fa fa-trash"></i><span>Remove</span>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>

        <!-- Add New Course Button -->
        <a class="button add-button" href="${pageContext.request.contextPath}/admin/students/${student.id}/addCourse">Add New Course to Student</a>
    </div>
</body>
</html>
