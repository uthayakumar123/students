<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Student</title>
    
    <!-- External CSS Links -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/add-course.css">
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

    <!-- Page Content -->
    <div class="content">
        <h3>Add Student to the Course</h3>
        
        <!-- Check if students are available -->
        <c:choose>
            <c:when test="${listSize != 0}">
                <form action="${pageContext.request.contextPath}/admin/courses/${course.id}/students/addStudent/save" method="POST">
                    <select name="studentId">
                        <c:forEach var="student" items="${students}">
                            <option value="${student.id}">${student.firstName} ${student.lastName}</option>
                        </c:forEach>
                    </select>
                    <button type="submit">Add</button>
                </form>
            </c:when>
            
            <!-- Message when no students are available -->
            <c:otherwise>
                <p>There is no student available to add.</p>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
