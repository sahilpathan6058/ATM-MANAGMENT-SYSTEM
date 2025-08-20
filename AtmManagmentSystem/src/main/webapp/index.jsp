<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ATM Login</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap')
	;

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
}

.login-container {
	background: #fff;
	padding: 40px 30px;
	width: 380px;
	border-radius: 15px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
	transition: transform 0.3s ease;
}

.login-container:hover {
	transform: scale(1.02);
}

.login-container h2 {
	color: #2c3e50;
	margin-bottom: 25px;
	font-weight: 600;
}

.form-group {
	margin-bottom: 20px;
	text-align: left;
}

label {
	display: block;
	font-weight: 500;
	margin-bottom: 6px;
	color: #333;
}

input[type="text"], input[type="password"] {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 8px;
	font-size: 16px;
	transition: border-color 0.3s;
}

input[type="text"]:focus, input[type="password"]:focus {
	border-color: #4CAF50;
	outline: none;
}

.btn {
	width: 100%;
	padding: 12px;
	font-size: 16px;
	font-weight: bold;
	background: #4CAF50;
	color: white;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	transition: background 0.3s ease-in-out;
}

.btn:hover {
	background: #43a047;
}

.footer {
	margin-top: 20px;
	font-size: 14px;
	color: #666;
}
</style>
</head>
<body>

	<div class="login-container">
		<h2>ATM System Login</h2>
		<form action="loginServlet" method="post">
			<div class="form-group">
				<label for="account_no">Account Number</label> <input type="text"
					id="account_no" name="account_no" required>
			</div>
			<div class="form-group">
				<label for="pin">PIN</label> <input type="password"
					id="pin" name="pin" required>
			</div>
			<input type="submit" class="btn" value="Login">
		</form>
		<div class="footer">Powered by Sahil's ATM System</div>
	</div>

</body>
</html>
