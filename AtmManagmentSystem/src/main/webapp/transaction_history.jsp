<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.*" %>
<%@ page import="Dao.*" %>
<%@ page import="java.util.*" %>
<%@ page import="connection.*" %>

<%
    String acc = (String) session.getAttribute("account_no");
    if (acc == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    Dao.AtmDao dao = new Dao.AtmDao(null);
    List<Transaction> history = dao.getTransactionHistory(acc);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transaction History</title>
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
            max-width: 1000px;
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

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 16px;
        }

        th, td {
            padding: 14px 12px;
            text-align: center;
            border-bottom: 1px solid #ccc;
        }

        th {
            background-color: #4CAF50;
            color: white;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .back-btn {
            display: block;
            text-align: center;
            margin-top: 25px;
        }

        .back-btn a {
            background-color: #2980b9;
            padding: 10px 20px;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: background 0.3s;
        }

        .back-btn a:hover {
            background-color: #1c6ca8;
        }

        @media (max-width: 600px) {
            table, th, td {
                font-size: 14px;
            }

            .container {
                padding: 25px 15px;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Transaction History</h2>
        <table>
            <tr>
                <th>Date & Time</th>
                <th>Type</th>
                <th>Amount</th>
                <th>Balance After</th>
            </tr>
            <% for (Transaction t : history) { %>
                <tr>
                    <td><%= t.getDateTime() %></td>
                    <td><%= t.getType() %></td>
                    <td>₹<%= t.getAmount() %></td>
                    <td>₹<%= t.getBalanceAfter() %></td>
                </tr>
            <% } %>
        </table>

        <div class="back-btn">
            <a href="Atmdashboard.jsp">← Back to Dashboard</a>
        </div>
    </div>

</body>
</html>
