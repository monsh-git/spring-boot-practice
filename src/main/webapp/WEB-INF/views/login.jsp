<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Login</h1>
<form action="/loginPro" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<input type="text" name="username" placeholder="Type ID">
	<input type="password" name="password" placeholder="Type password">
	<input id="remember_me" name="remember-me" type="checkbox"/>Remember Me
	<button type="submit">Login</button>
</form>
</body>
</html>