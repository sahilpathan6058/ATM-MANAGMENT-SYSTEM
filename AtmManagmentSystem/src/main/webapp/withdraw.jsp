<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    String acc = (String) session.getAttribute("account_no");
    if (acc == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Withdraw Funds</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
            padding: 40px 20px;
            color: white;
        }

        .container {
            background: #fff;
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
            width: 95%;
            max-width: 450px;
            margin: auto;
            color: #2c3e50;
            animation: fadeIn 0.5s ease-in-out;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #34495e;
            font-size: 28px;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        input[type="number"] {
            padding: 15px;
            width: 80%;
            font-size: 18px;
            margin: 15px 0;
            border: 1px solid #ddd;
            border-radius: 8px;
            outline: none;
            background-color: #f9f9f9;
            box-shadow: 0px 6px 10px rgba(0, 0, 0, 0.1);
        }

        input[type="number"]:focus {
            border: 1px solid #4CAF50;
        }

        input[type="submit"] {
            padding: 14px 30px;
            font-size: 18px;
            font-weight: bold;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s ease-in-out;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .back-btn {
            display: block;
            text-align: center;
            margin-top: 30px;
        }

        .back-btn a {
            background-color: #34495e;
            padding: 12px 25px;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: background 0.3s;
        }

        .back-btn a:hover {
            background-color: #2c3e50;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 600px) {
            .container {
                padding: 25px 15px;
            }

            h2 {
                font-size: 24px;
            }

            input[type="number"] {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Withdraw Money</h2>
        <form action="withdrawServlet" method="post">
            <input type="number" name="amount" placeholder="Enter Amount" required>
            <input type="submit" value="Withdraw">
        </form>

        <div class="back-btn">
            <a href="Atmdashboard.jsp">← Back to Dashboard</a>
        </div>
    </div>

</body>
</html>
