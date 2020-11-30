<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<title>Payment</title>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<style>
.footer {
	position: fixed;
	left: 0;
	bottom: 0;
	width: 100%;
	background-color: #140000;
	color: white;
	text-align: center;
}
</style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-dark bg-dark">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Scan And Go</a>
			</div>
			<div class="navbar-header">
				<a type="button" class="btn btn-outline-light my-2 my-sm-0"
					href="/home">Continue Shopping</a> <a type="button" class="btn btn-outline-danger my-2 my-sm-0"
					href="/thankyou">Logout</a>
			</div>
		</div>

	</nav>
	<div class="container">

<h1 align="center">Payment Successful</h1>
<h2>Your wallet amount is Rs.${wallet}</h2>
</div>

<div class="footer">© 2020 Copyright: ScanAndGo</div>
</body>
</html>