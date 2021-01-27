<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- The latest CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- An Additional Theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- The combined and minimized latest JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${page_title}</title>
</head>
<body>
<div class="container">
	<a class="btn btn-default col-md-1" href="/">Homepage</a>
	<div class="col-md-8"></div>
	<sec:authorize access="isAuthenticated()">
		<a class="btn btn-primary col-md-1" href="/cart">Cart</a>
		<a class="btn btn-default col-md-1" href="/my-account">My Account</a>
		<a class="btn btn-default col-md-1 text-center" href="/logout">Logout</a>
	</sec:authorize>
</div>
<hr>