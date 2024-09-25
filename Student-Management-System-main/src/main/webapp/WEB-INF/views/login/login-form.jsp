<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login Page</title>
    <link rel="stylesheet" href="<c:url value='/css/login/login-form.css' />">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        /* Basic styling for the login page */
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        .top {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .top i {
            font-size: 32px;
            margin-right: 10px;
        }

        .top h2 {
            font-size: 24px;
        }

        .container {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 300px;
            text-align: center;
        }

        .form-input-item {
            margin-bottom: 15px;
            text-align: left;
        }

        .form-input-item div {
            margin-bottom: 5px;
        }

        .error {
            color: #e74c3c;
            margin-bottom: 15px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }

        button:hover {
            background-color: #45a049;
        }

        hr {
            margin: 20px 0;
        }

        .bottom {
            margin-top: 20px;
        }

        .bottom a {
            color: #3498db;
            text-decoration: none;
            text-align : center;
        }

        .bottom a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

    <div class="top">
        <i class="fa fa-mortar-board"></i>
        <h2>School Management System</h2>
    </div>

    <div class="container">

        <h3>Login Form</h3>

        <form action="<c:url value='/authenticateTheUser'/>" method="POST">

            <c:if test="${not empty param.error}">
                <div class="error">Invalid username or password</div>
            </c:if>

            <c:if test="${not empty param.logout}">
                <div class="success">You have been logged out!</div>
            </c:if>

            <div class="form-input-item">
                <div>Username:</div>
                <input type="text" name="username" required>
            </div>

            <div class="form-input-item">
                <div>Password:</div>
                <input type="password" name="password" required>
            </div>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <button type="submit">Login</button>

        </form>

        <hr>

        <div class="bottom">
            <span>Haven't registered yet?</span>
            <br>
            <a href="<c:url value='/register/showRegistrationForm' />">Register</a>
        </div>
    </div>

</body>

</html>
