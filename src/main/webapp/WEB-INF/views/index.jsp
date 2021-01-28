<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./layouts/header.jsp" %>

<div class="container">
	<sec:authorize access="isAnonymous()">
		<div class="col-md-10"></div>
		<a class="btn btn-default col-md-1" href="/login">Login</a>
		<a class="btn btn-default col-md-1" href="/before-sign-up">Sign up</a>
	</sec:authorize>
	<table class="table table-striped">
	<tr>
		<th>Name</th>
		<th>Image</th>
		<th>Description</th>
		<th>Price</th>

	</tr>
	<c:forEach items="${itemList}" var="item">
		<tr>
			<td><a href="item?itemId=${item.itemId}">${item.name}</a></td>
			<td align="center"><img src="/images/${item.thumbnail}" height="200"></td>
			<td>${item.description}</td>
			<td>${item.price}</td>
		</tr>
	</c:forEach>
	</table>
	<sec:authorize access="isAuthenticated()">
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<a class="btn btn-default" href="/user-list">User List</a>
		</sec:authorize>
		<a class="btn btn-default" href="/item-list">Item List</a>
	</sec:authorize>
</div>

<%@ include file="./layouts/footer.jsp" %>