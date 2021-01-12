<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Sign-up</h1>
<hr>

<form action="/signup" method="post">
<!-- csrf -->
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<input type="text" name="username" placeholder="Type ID">
	<input type="text" name="uName" placeholder="Type name">
	<input type="password" name="password" placeholder="Type password">
	<button type="submit">Sign-up</button>
</form>
</body>
</html>