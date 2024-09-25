<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Access Denied</title>
    <style>
        /* Basic styling for the access denied page */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8d7da;
            color: #721c24;
            text-align: center;
            padding: 50px;
        }

        h3 {
            font-size: 2em;
        }

        div {
            font-size: 1.2em;
        }
    </style>
</head>

<body>
    <h3>Access Denied</h3>
    <div>You do not have permission to view this page.</div>
    <br>
    <a href="<c:url value='/' />">Return to Home</a>
</body>

</html>
