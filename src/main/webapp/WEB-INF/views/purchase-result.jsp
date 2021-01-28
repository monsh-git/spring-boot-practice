<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./layouts/header.jsp" %>

<div class="container">
Purchase completed
</div>

<script>
	function window_onload(){
		setTimeout('go_url()',5000)	// after 5 secs, call 'go_url'
	}

	function go_url(){
		location.href="/"			// go to the homepage
	}
</script>

<%@ include file="./layouts/footer.jsp" %>