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
</div>

<%@ include file="./layouts/footer.jsp" %>