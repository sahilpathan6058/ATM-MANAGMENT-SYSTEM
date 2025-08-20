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
    <title>Transfer Funds</title>
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
            max-width: 500px;
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

        input[type="text"], input[type="number"] {
            padding: 12px 15px;
            width: 80%;
            font-size: 16px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 6px;
            outline: none;
            transition: border-color 0.3s ease-in-out;
        }

        input[type="text"]:focus, input[type="number"]:focus {
            border-color: #4CAF50;
        }

        input[type="submit"] {
            padding: 12px 30px;
            font-size: 18px;
            font-weight: bold;
            background-color: #2980b9;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s ease-in-out;
        }

        input[type="submit"]:hover {
            background-color: #1c6ca8;
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

            input[type="text"], input[type="number"] {
                width: 90%;
            }

            input[type="submit"] {
                width: 90%;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Transfer Money</h2>
        <c:if test="${not empty message}">
    <p>${message}</p>
</c:if>
        <form action="TransferServlet" method="post">
            <label for="recipient">Recipient Account No:</label>
            <input type="text" id="recipient" name="recipient" required placeholder="Enter recipient's account number">
            
            <label for="amount">Amount:</label>
            <input type="number" id="amount" name="amount" required placeholder="Enter amount to transfer">

            <input type="submit" value="Transfer">
        </form>

        <div class="back-btn">
            <a href="Atmdashboard.jsp">← Back to Dashboard</a>
        </div>
    </div>

</body>
</html>
