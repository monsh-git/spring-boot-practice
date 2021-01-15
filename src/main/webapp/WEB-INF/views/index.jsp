<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./layouts/header.jsp" %>

<div class="container">
	<sec:authorize access="isAnonymous()">
		<a class="btn btn-default" href="/login">Login</a>
		<a class="btn btn-default" href="/before-sign-up">Sign up</a>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal" var="principal"/>
		<h2>${principal}</h2>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<a class="btn btn-default" href="/user/info">My Info</a>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<a class="btn btn-default" href="/before-add-item">Add Item</a>
		</sec:authorize>
	</sec:authorize>
</div>

<%@ include file="./layouts/footer.jsp" %>