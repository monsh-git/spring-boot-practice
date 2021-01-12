<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Home Page</h1>
<hr>
<div>
	<sec:authorize access="isAnonymous()">
		<a href="/login">Login</a>
		<a href="/beforeSignUp">Sign-up</a>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<a href="/logout">Logout</a>
		<sec:authentication property="principal" var="principal"/>
		<h2>${principal}</h2>
	</sec:authorize>
</div>
<div>
	<sec:authorize access="isAuthenticated()">
		<a href="/user/info">My Info</a>
		<a href="/admin">Manage</a>
	</sec:authorize>
</div>
</body>
</html>