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
			<th>Last Updat</th>
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
</div>

<%@ include file="./layouts/footer.jsp" %>