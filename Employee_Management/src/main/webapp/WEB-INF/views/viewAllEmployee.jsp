<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Employees</title>
    <style>
        body {
            background-color: #111;
            color: #fff;
            font-family: 'Segoe UI', sans-serif;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #00FFFF;
            text-shadow: 2px 2px 8px cyan;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #222;
            margin-top: 30px;
        }

        th, td {
            border: 1px solid #444;
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #000;
            color: #00FFFF;
        }

        td {
            color: #eee;
        }

        .btn {
            display: block;
            margin: 30px auto;
            padding: 12px 24px;
            background-color: #00FFFF;
            color: #000;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #00dddd;
        }
    </style>
</head>
<body>
<h1>Employee Management System - All Employees</h1>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Address</th>
        <th>Department</th>
        <th>Designation</th>
        <th>Salary</th>
        <th>Date of Joining</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="emp" items="${employees}">
        <tr>
            <td>${emp.id}</td>
            <td>${emp.name}</td>
            <td>${emp.email}</td>
            <td>${emp.phone}</td>
            <td>${emp.address}</td>
            <td>${emp.department}</td>
            <td>${emp.designation}</td>
            <td>${emp.salary}</td>
            <td>${emp.dateOfJoining}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<a href="/Employee_Management/employee/mainpage" class="btn">Back to Home</a>
</body>
</html>
