<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Signin</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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
/* set entire body that is webpage */
body{
	background: #383a3d;
		
}
/* set form background colour*/
form{
	background: #fff;
	
}
/* set padding and size of th form */
.form-container{
	border-radius: 10px;
	padding: 30px;
	margin-top:20%;
}
</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-dark bg-dark">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="/firstpage">Scan And Go</a>
			</div>
			<div class="navbar-header">
				<a typr="button" class="btn btn-outline-light my-2 my-sm-0"
					href="/signup">New User</a> 
			</div>
		</div>

	</nav>


	<!-- Login form creation starts-->
	<section class="container-fluid">
		<!-- row and justify-content-center class is used to place the form in center -->
		<section class="row justify-content-center">
			<section class="col-12 col-sm-6 col-md-4">
				<form class="form-container" method="post" action="/signin">
					<div class="form-group">
						<h4 class="text-center font-weight-bold">Login</h4>
						<h5>${error}</h5>
						<label for="InputEmail1">Username</label> <input type="text"
							class="form-control" name="username" id="InputEmail1" aria-describeby="emailHelp"
							placeholder="username" required>
					</div>
					<div class="form-group">
						<label for="InputPassword1">Password</label> <input
							type="password" class="form-control" name="password" id="InputPassword1"
							placeholder="password" required>
					</div>
					<button type="submit" class="btn btn-primary btn-block">Login</button>
					
				</form>
			</section>
		</section>
	</section>
	<!-- Login form creation ends -->

	<div class="footer">© 2020 Copyright: ScanAndGo</div>
</body>
</html>


