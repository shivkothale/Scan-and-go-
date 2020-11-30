<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Checkout</title>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
					href="/home">Add to Cart</a> <a type="button"
					class="btn btn-outline-light my-2 my-sm-0" href="/cart">Edit
					Cart</a> <a type="button" class="btn btn-outline-danger my-2 my-sm-0"
					href="/thankyou">Logout</a>
			</div>
		</div>

	</nav>

	<div class="container">

		<h4 style="text-align: right;">
			Wallet Amount is Rs. <label>${wallet}</label>
		</h4>
		<h1 align="center">Your Cart</h1>
		<table class="table table-dark table-hover">
			<thead class="thead-dark">
				<tr>
					<th>Product Id</th>
					<th>Product Name</th>
					<th>Product Type</th>
					<th>Product Price</th>
					<th>Quantity</th>
					<th>Net Total</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="productlist" items="${list}">

					<tr class="success">
						<td>${productlist.p_id}</td>
						<td>${productlist.p_name}</td>
						<td>${productlist.p_category}</td>
						<td>${productlist.p_price}</td>
						<td>${productlist.quantity}</td>
						<td>${productlist.total}</td>
					</tr>
				</c:forEach>
			</tbody>
			<tr class="active">

				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td><h3>
						<strong>Total:</strong>
					</h3></td>
				<td><h3>
						<strong>${totalPrice}</strong>
					</h3></td>
			</tr>
		</table>
		<c:if test="${total>0}">
			<div align="right">
				<form method="post" action="/checkout">
					<input type="submit" class="btn btn-primary"
						value="Pay From Wallet">
				</form>
			</div>
		</c:if>

	</div>
	<div class="footer">© 2020 Copyright: ScanAndGo</div>
</body>
</html>