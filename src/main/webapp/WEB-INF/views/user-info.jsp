<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./layouts/header.jsp" %>

<div class="container">
<sec:authorize access="isAuthenticated()">
	<table class="table table-striped">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Age</th>
			<th>Email</th>
			<th>Joined</th>
			<th>Updated</th>
			<th>Expired</th>
			<th>Locked</th>
			<th>Credential</th>
			<th>Enable</th>
		</tr>
		<tr>
			<td>${user.username}</td>
			<td>${user.name}</td>
			<td>${user.age}</td>
			<td>${user.email}</td>
			<td>${user.createDate}</td>
			<td>${user.lastUpdate}</td>
			<td>${user.isAccountNonExpired}</td>
			<td>${user.isAccountNonLocked}</td>
			<td>${user.isCredentialsNonExpired}</td>
			<td>${user.isEnabled}</td>
		</tr>
	</table>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<a class="btn btn-default col-md-1" href="/user-list">User List</a>
	</sec:authorize>
	<div class="col-md-10"></div>
	<sec:authorize access="hasRole('ROLE_USER')">
		<a class="btn btn-primary col-md-1" href="/edit-user?username=${user.username}">Edit</a>
	</sec:authorize>
</sec:authorize>
</div>

<%@ include file="./layouts/footer.jsp" %>