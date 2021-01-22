<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./layouts/header.jsp" %>

<div class="container">
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
	<c:forEach items="${userList}" var="user">
		<tr>
			<td><a href="user-info?username=${user.username}">${user.username}</a></td>
			<td><a href="user-info?username=${user.username}">${user.name}</a></td>
			<td>${user.age}</td>
			<td>${user.email}</td>
			<td>${user.createDate}</td>
			<td>${user.lastUpdate}</td>
			<td>${user.isAccountNonExpired}</td>
			<td>${user.isAccountNonLocked}</td>
			<td>${user.isCredentialsNonExpired}</td>
			<td>${user.isEnabled}</td>
		</tr>
	</c:forEach>
</table>
</div>

<%@ include file="./layouts/footer.jsp" %>