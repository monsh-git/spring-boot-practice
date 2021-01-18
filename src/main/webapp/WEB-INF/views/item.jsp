<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./layouts/header.jsp" %>

<div class="container">
<sec:authorize access="isAuthenticated()">
	<table class="table table-striped">
		<tr>
			<th>Item Code</th>
			<th>Name</th>
			<th>Image</th>
			<th>Description</th>
			<th>Price</th>
			<th>Production Price</th>
			<th>Stock</th>
			<th>On Sale</th>
			<th>Sold Out</th>
		</tr>
		<tr>
			<td>${item.itemId}</td>
			<td>${item.name}</td>
			<td>${item.image}</td>
			<td>${item.description}</td>
			<td>${item.price}</td>
			<td>${item.costPrice}</td>
			<td>${item.stock}</td>
			<td>${item.onSale}</td>
			<td>${item.soldOut}</td>
		</tr>
	</table>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<a class="btn btn-default col-md-1" href="/item-list">Item List</a>
	</sec:authorize>
</sec:authorize>
<div class="col-md-9"></div>
<sec:authorize access="isAuthenticated()">
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<a class="btn btn-primary col-md-2" href="/edit-item?itemId=${item.itemId}">Edit This Item</a>
	</sec:authorize>
</sec:authorize>
</div>

<%@ include file="./layouts/footer.jsp" %>