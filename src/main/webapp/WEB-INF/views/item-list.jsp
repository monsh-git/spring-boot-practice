<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./layouts/header.jsp" %>

<div class="container">
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
	<c:forEach items="${item_list }" var="item">
		<tr>
			<td><a href="item?itemId=${item.itemId}">${item.itemId}</a></td>
			<td><a href="item?itemId=${item.itemId}">${item.name}</a></td>
			<td>${item.image}</td>
			<td>${item.description}</td>
			<td>${item.price}</td>
			<td>${item.costPrice}</td>
			<td>${item.stock}</td>
			<td>${item.onSale}</td>
			<td>${item.soldOut}</td>
		</tr>
	</c:forEach>
</table>
<div class="col-md-11"></div>
<sec:authorize access="isAuthenticated()">
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<a class="btn btn-primary col-md-1" href="/add-item">Add Item</a>
	</sec:authorize>
</sec:authorize>
</div>

<%@ include file="./layouts/footer.jsp" %>