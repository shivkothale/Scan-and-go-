<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Cart</title>
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
					href="/home">Add to cart</a> <a type="button"
					class="btn btn-outline-danger my-2 my-sm-0" href="/thankyou">Logout</a>
			</div>
		</div>

	</nav>


	<div class="container">
		<h1 align="center">Cart</h1>

		<h4 style="text-align: right;">
			Wallet Amount is Rs. <label>${wallet}</label>
		</h4>
		<h3>${exceed}</h3>
		<h3>${removed}</h3>
		<table class="table table-dark table-hover">
			<thead class="thead-dark">
				<tr>
					<th>Product Id</th>
					<th>Product Name</th>
					<th>Product Type</th>
					<th>Product Price</th>
					<th>Quantity</th>
					<th>Net Total</th>
					<th></th>

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
						<td><a type="button" class="btn btn-danger"
							href="/cart/remove?id=${productlist.p_id}">X</a> 


					</tr>
				</c:forEach>
			</tbody>
			<tr class="active">

				<td><strong>Total:</strong></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td>${totalPrice}</td>
			</tr>

		</table>

		<c:set var="wallet" scope="session" value="${wallet}" />
		<c:set var="total" scope="session" value="${totalPrice}" />
		<c:if test="${wallet >= total}">
			<c:if test="${total>0}">
				<div align="right">
					<a type="button"  class="btn btn-success" href="/checkout">Checkout</a>
				</div>
			</c:if>
		</c:if>

	</div>

	<div class="footer">© 2020 Copyright: ScanAndGo</div>
</body>
</html>
