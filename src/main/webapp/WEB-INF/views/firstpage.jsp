<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Scan And Go</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
body {
	background-image: src("../images/bruno-kelzer-LvySG1hvuzI-unsplash.jpg");
}

.navbar-nav {
	margin-left: auto;
}
img{
height:60%;
width:100%;

}

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
					href="/signup">New User</a> <a type="button"
					class="btn btn-outline-light my-2 my-sm-0" href="/signin">Already
					a user</a>
			</div>
		</div>
		
	</nav>
	<div>
		<img src="../images/bruno-kelzer-LvySG1hvuzI-unsplash.jpg">
		</div>
	<div class="footer">© 2020 Copyright: ScanAndGo</div>
</body>
</html>