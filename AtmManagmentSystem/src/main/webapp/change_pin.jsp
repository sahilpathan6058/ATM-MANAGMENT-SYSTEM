<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    String acc = (String) session.getAttribute("account_no");
    if (acc == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    String message = request.getParameter("msg");
%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Change PIN</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            height: 100vh;
            background: linear-gradient(to right, #141e30, #243b55);
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
        }

        .container {
            background: #fff;
            padding: 40px 30px;
            border-radius: 15px;
            width: 90%;
            max-width: 400px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
            color: #2c3e50;
            transition: transform 0.3s ease;
        }

        .container:hover {
            transform: scale(1.01);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #34495e;
            font-size: 26px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        input[type="password"] {
            padding: 12px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 10px;
            outline: none;
            transition: border-color 0.3s;
        }

        input[type="password"]:focus {
            border-color: #3498db;
        }

        input[type="submit"] {
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #43a047;
        }
        .back-btn {
            display: block;
            text-align: center;
            margin-top: 25px;
        }

        .back-btn a {
            background-color: #34495e;
            padding: 10px 20px;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: background 0.3s;
        }

        .back-btn a:hover {
            background-color: #2c3e50;
        }
        

        @media (max-width: 500px) {
            .container {
                padding: 30px 20px;
            }

            h2 {
                font-size: 22px;
            }

            input[type="submit"] {
                font-size: 15px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Change Your PIN</h2>
      <% if (message != null) { %>
            <p style="color: red;"><%= message %></p>
        <% } %>
    <form action="ChangePinServlet" method="post">
        <input type="password" name="old_pin" placeholder="Enter Old PIN" required>
        <input type="password" name="new_pin" placeholder="Enter New PIN" required>
        <input type="submit" value="Change PIN">
         <div class="back-btn">
            <a href="Atmdashboard.jsp">← Back to Dashboard</a>
        </div>
    </form>
    
</div>

</body>
</html>
