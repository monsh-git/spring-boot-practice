<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- An Additional Theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- The combined and minimized latest JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<div class="col-md-12">
    <div class="col-md-2"></div>    
	    <div id="reviewList" class="col-md-8">
		    <table class="table">
				<tr>
					<th class="text-center">ID</th>
					<th class="text-center">Content</th>
					<th class="text-center">Date</th>
					<th class="text-center">Edit</th>
					<th class="text-center">Delete</th>
				</tr>
				<c:forEach items="${boardList}" var="board" varStatus="status">
				<tr>
					<td class="text-center">${board.userId}</td>
					<td class="text-center">${board.content}</td>
					<td class="text-center">${board.datetime}</td>
					<sec:authorize access="hasRole('ROLE_USER')">
					<td><input type="button" class="btn-edit" data-e_r_idx="${board.boardId}"></td>
					<td><input type="button" class="btn-del" data-d_r_idx="${board.boardId}"></td>
					</sec:authorize>
				</tr>
				</c:forEach>
			</table>
	    </div>
	<div class="col-md-2"></div>
</div>