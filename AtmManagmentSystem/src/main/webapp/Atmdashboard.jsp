<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String accountNo = (String) session.getAttribute("account_no");
    if (accountNo == null) {
        response.sendRedirect("index.jsp"); 
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ATM Dashboard</title>
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
            background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
        }

        .dashboard-container {
            background: #ffffff;
            color: #2c3e50;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.3);
            width: 90%;
            max-width: 500px;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .dashboard-container:hover {
            transform: scale(1.01);
        }

        h2 {
            margin-bottom: 15px;
            font-size: 28px;
            color: #34495e;
        }

        .account-info {
            margin-bottom: 30px;
            font-size: 18px;
            font-weight: 500;
        }

        .actions form {
            margin: 10px 0;
        }

        .actions input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin: 6px 0;
            font-size: 16px;
            background-color: #3498db;
            color: #fff;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .actions input[type="submit"]:hover {
            background-color: #2980b9;
        }

        .logout {
            margin-top: 20px;
        }

        .logout a {
            color: #e74c3c;
            text-decoration: none;
            font-weight: 600;
            font-size: 15px;
            transition: color 0.3s ease-in-out;
        }

        .logout a:hover {
            color: #c0392b;
        }

        @media (max-width: 500px) {
            .dashboard-container {
                padding: 25px;
            }

            h2 {
                font-size: 22px;
            }

            .actions input[type="submit"] {
                font-size: 15px;
            }
        }
    </style>
</head>
<body>

<div class="dashboard-container">
    <h2>Welcome to Your ATM Dashboard</h2>
    <div class="account-info">
        Account Number: <strong><%= accountNo %></strong>
    </div>

    <div class="actions">
        <form action="view_balance.jsp">
            <input type="submit" value="View Balance">
        </form>
        <form action="withdraw.jsp">
            <input type="submit" value="Withdraw Funds">
        </form>
        <form action="transfer.jsp">
            <input type="submit" value="Transfer Funds">
        </form>
        <form action="change_pin.jsp">
            <input type="submit" value="Change PIN">
        </form>
        <form action="transaction_history.jsp">
            <input type="submit" value="Transaction History">
        </form>
    </div>

    <div class="logout">
        <a href="logout.jsp">Logout</a>
    </div>
</div>

</body>
</html>
