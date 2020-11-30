<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
  <title>Homepage</title>
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
					href="/cart">View Cart</a> <a type="button"
					class="btn btn-outline-danger my-2 my-sm-0" href="/thankyou">Logout</a>
			</div>
		</div>
		
	</nav>
<div class="container">
  	<h1>
		<center>Welcome to Scan and Go</center>
	</h1><div>
	<form method="get" action="/home/add">
			
				<div>
				<h4 style="text-align:right;">Wallet Amount is Rs. <label>${wallet}</label></h4>
				Enter product_id:<input type="text" name="product_id" required>


				Enter quantity:<input type="text" name="quantity" required>

				<button class="btn btn-primary" type="submit">Add</button> 
			</div>
		</form>
	</div><br>
	 <h3><center>${added}</center></h3>
	<table class="table">
    <thead class="thead-dark">
      	<tr>
					<th>Product Id</th>
					<th>Product Name</th>
					<th>Product Type</th>
					<th>Product Price</th>
					<th>Product Description</th>
				</tr>
    </thead>
    <tbody>
     <c:forEach var="productlist" items="${menuList}">
				
				<tr class="success">
					<tr class="success">
						<td>${productlist.p_id}</td>
						<td>${productlist.p_name}</td>
						<td>${productlist.p_category}</td>
						<td>${productlist.p_price}</td>
						<td>${productlist.p_desc}</td>
						
					
					
				</tr>


			</c:forEach>
    </tbody>
  </table>
</div>
<div class="footer">© 2020 Copyright: ScanAndGo</div>
 
</body>
</html>