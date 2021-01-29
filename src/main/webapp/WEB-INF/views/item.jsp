<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ include file="./layouts/header.jsp" %>

<div class="container">

	<table class="table">
        <tr>
            <td style="width: 1024px;" align="center">
                <img src="/images/${item.image}" width="auto" height="600">
            </td>
            <td>
                <table style="height: 600px; width: 400px;">
                    <tr align="center">
                        <td><h3>${item.name}</h3></td>
                    </tr>
                    <tr align="center">
                        <td><h5><fmt:formatNumber value="${item.price}" pattern="###,###,###"/></h5></td>
                    </tr>
                    <tr align="center">
                        <td><h5>${item.description}</h5></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <form name="form1" method="post" action="/add-to-cart">
                                <input type="hidden" name="itemId" value="${item.itemId}">
                                <select name="quantity">
                                    <c:forEach begin="1" end="${item.stock}" var="i">
                                        <option value="${i}">${i}</option>
                                    </c:forEach>
                                </select>
                                <input class="btn btn-default" type="submit" value="Add to Cart">
	                            </form>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div class="col-md-12">
	    <div class="col-md-3"></div>
	    <input type="hidden" name="b_idx" value="${item.itemId}">
		<input class="col-md-5" type="text" name="content" id="content">
		<sec:authorize access="hasRole('ROLE_USER')">
		<input class="col-md-1" type="button" value="Reply" id="btn">
		</sec:authorize>
		<div class="col-md-3"></div>
	</div>
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
	<!-- Bottom button area -->
	<sec:authorize access="hasRole('ROLE_USER')">
		<a class="btn btn-default col-md-1" href="/item-list">Item List</a>
	</sec:authorize>
	<div class="col-md-9"></div>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<a class="btn btn-primary col-md-2" href="/edit-item?itemId=${item.itemId}">Edit This Item</a>
	</sec:authorize>

	<script>
	// Create a review
	$(document).on('click', '#btn', function () {
		let b_idx = $('input[name="b_idx"]').val();
		let content = $('input[name="content"]').val();	
		console.log(b_idx);
		console.log(content);
		
		$.ajax({
			  method: "POST",
			  url: "/create-review",
			  data: { itemId: b_idx, content: content },
			  dateType: "html"
			})
			.done(function(data) {
		 		console.log("Creating a review completed");
		 		$("#reviewList").html(data);	
		 		$("#cont").val('');
			});
	});
	
	// Update a review
	$(document).on('click', '.btn-edit', function() {
		let r_idx = $(this).attr('data-e_r_idx');
		let checkBtn = $(this);	
		let tr = checkBtn.parent().parent();
		let td = tr.children();
		console.log(r_idx);
		console.log(td.eq(1).text());
		
		$.ajax({
			method: "POST",
			url: "/update-review",
			data: {boardId: r_idx},
			dateType: "html"
		})
		.done(function(data) {
			console.log(data);
			if(data == 'false') {
				console.log("false");
				$("#body").html('<h1>You have no admin authority.</h1>');
				setTimeout(function() {
					window.location.href = "/";
				}, 2000);
			} else {
				td.eq(1).html(data);			
			}
		});
	});
	
	// Complete updating a review
	$(document).on('click', '#btn-edit-comp', function() {
		let content = $('input[name="edit-content"]').val();
		let r_idx = $('input[name="r_idx"]').val();
		let b_idx = $('input[name="b_idx"]').val();
		console.log(content);
		
		$.ajax({
			method: "POST",
			url: "/update-review-result",
			data: {boardId:r_idx, content:content, itemId:b_idx},
			dateType: "html"
		})
		.done(function(data) {
			console.log("Updating a review completed");
			$("#reviewList").html(data);	
		});
	});
	
	// Delete a review
	$(document).on('click', '.btn-del', function () {
		let r_idx = $(this).attr('data-d_r_idx');	
		console.log(r_idx);
		
		$.ajax({
			  method: "POST",
			  url: "/delete-review",
			  data: { boardId: r_idx },
			  dateType: "html"
			})
			.done(function(data) {
				console.log(data);
				if(data == 'false') {
					console.log("false");
					$("#body").html('<h1>You have no admin authority.</h1>');
					setTimeout(function() {
						window.location.href = "/";
					}, 2000);
				} else {
			 		$("#reviewList").html(data);			
				}
			});
	});
	</script>

</div>

<%@ include file="./layouts/footer.jsp" %>