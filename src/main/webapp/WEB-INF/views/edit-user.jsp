<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./layouts/header.jsp" %>

<div class="container">
<sec:authorize access="isAuthenticated()">
	<form class="form-horizontal" action="/edit-user-result" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<div class="form-group">
		    <label for="inputId3" class="col-sm-2 control-label">ID</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="inputid3" name="username" readonly="readonly" value="${user.username}">
		    </div>
		</div>
		<div class="form-group">
		    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
		    <div class="col-sm-8">
		      <input type="password" class="form-control" id="inputpassword3" name="password" value="${user.password}">
		    </div>
		</div>
		<div class="form-group">
		    <label for="inputName3" class="col-sm-2 control-label">Name</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="inputname3" name="name" value="${user.name}">
		    </div>
		</div>
		<div class="form-group">
		    <label for="inputAge3" class="col-sm-2 control-label">Age</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="inputage3" name="age" value="${user.age}">
		    </div>
		</div>
		<div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
		    <div class="col-sm-8">
		      <input type="email" class="form-control" id="inputemail3" name="email" value="${user.email}">
		    </div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2">
				<div class="col-sm-9"></div>
				<button type="submit" class="btn btn-success col-sm-1">Edit</button>
				<div class="col-sm-2"></div>
		    </div>
  		</div>
	</form>
</sec:authorize>
</div>

<%@ include file="./layouts/footer.jsp" %>