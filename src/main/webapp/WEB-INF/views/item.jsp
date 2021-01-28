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
    <div class="col-md-2"></div>
    <div class="col-md-8">
	    <table class="table">
			<tr>
				<th class="text-center">ID</th>
				<th class="text-center">Content</th>
				<th class="text-center">Date</th>
			</tr>
			<c:forEach items="${boardList}" var="board" varStatus="status">
			<tr>
				<td class="text-center">${board.userId}</td>
				<td class="text-center">${board.content}</td>
				<td class="text-center">${board.datetime}</td>
			</tr>
			</c:forEach>
		</table>
    </div>
    <div class="col-md-2"></div>
    
	<!-- Bottom button area -->
	<sec:authorize access="hasRole('ROLE_USER')">
		<a class="btn btn-default col-md-1" href="/item-list">Item List</a>
	</sec:authorize>
	<div class="col-md-9"></div>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<a class="btn btn-primary col-md-2" href="/edit-item?itemId=${item.itemId}">Edit This Item</a>
	</sec:authorize>

</div>

<%@ include file="./layouts/footer.jsp" %>