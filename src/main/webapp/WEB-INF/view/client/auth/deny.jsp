<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Access Denied</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            color: #333;
        }
        .container {
            text-align: center;
            background: #fff;
            padding: 30px 50px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            font-size: 2.5rem;
            color: #e74c3c;
        }
        p {
            margin: 15px 0;
            font-size: 1.2rem;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 1rem;
            color: #fff;
            background: #3498db;
            text-decoration: none;
            border-radius: 5px;
            transition: background 0.3s ease;
        }
        a:hover {
            background: #2980b9;
        }
        .icon {
            font-size: 5rem;
            color: #e74c3c;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="icon">🚫</div>
    <h1>Access Denied</h1>
    <p>You do not have permission to access this page.</p>
    <p>Please <a href="/login">login</a> with an authorized account.</p>
</div>
</body>
</html>
