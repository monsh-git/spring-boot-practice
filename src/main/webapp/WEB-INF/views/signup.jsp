<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./layouts/header.jsp" %>

<h1>Sign-up</h1>
<hr>

<form action="/signup" method="post">
<!-- csrf -->
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<input type="text" name="username" placeholder="Type ID">
	<input type="text" name="name" placeholder="Type name">
	<input type="password" name="password" placeholder="Type password">
	<button type="submit">Sign-up</button>
</form>

<%@ include file="./layouts/footer.jsp" %>