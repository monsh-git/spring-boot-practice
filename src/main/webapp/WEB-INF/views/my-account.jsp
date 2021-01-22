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
			<th>Registration Date</th>
			<th>Last Update</th>
		</tr>
		<tr>
		<sec:authentication property="principal" var="principal"/>
			<td>${principal.username}</td>
			<td>${principal.name}</td>
			<td>${principal.age}</td>
			<td>${principal.email}</td>
			<td>${principal.createDate}</td>
			<td>${principal.lastUpdate}</td>
		</tr>
	</table>
</sec:authorize>
<div class="col-md-11"></div>
<sec:authorize access="isAuthenticated()">
	<sec:authorize access="hasRole('ROLE_USER')">
		<a class="btn btn-primary col-md-1" href="/edit-user?username=${principal.username}">Edit</a>
	</sec:authorize>
</sec:authorize>
</div>

<%@ include file="./layouts/footer.jsp" %>