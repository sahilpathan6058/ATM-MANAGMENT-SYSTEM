<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="Dao.*"%>
<%@ page import="connection.*"%>

<%
    String acc = (String) session.getAttribute("account_no");
    if (acc == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    double balance = 0.0;
    try {
        Connection con = DBCon.getConnection();
        AtmDao dao = new AtmDao(con);
        balance = dao.getBalance(acc);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Balance</title>
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

        p {
            font-size: 20px;
            margin-bottom: 20px;
        }

        .balance-info {
            background-color: #ecf0f1;
            border-radius: 8px;
            padding: 20px;
            margin: 15px 0;
            font-size: 22px;
            font-weight: bold;
            color: #2980b9;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
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

            p {
                font-size: 18px;
            }

            .balance-info {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Account Balance</h2>
        <p><strong>Account Number:</strong> <%= acc %></p>
        
        <div class="balance-info">
            <strong>Available Balance:</strong> ₹<%= balance %>
        </div>

        <div class="back-btn">
            <a href="Atmdashboard.jsp">← Back to Dashboard</a>
        </div>
    </div>

</body>
</html>
