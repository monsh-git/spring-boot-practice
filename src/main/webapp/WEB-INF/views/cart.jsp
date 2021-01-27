<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./layouts/header.jsp" %>

<div class="container">
<sec:authorize access="isAuthenticated()">
	<table class="table">
		<c:forEach items="${orderDetailList}" var="orderDetail">
	        <tr>
	            <td class="col-md-8" align="center">
	                <img src="/images/${orderDetail.item.image}" width="auto" height="200">
	            </td>
	            <td class="col-md-4">
	                <table style="height: 200px; width: auto;">
	                    <tr align="center">
	                        <td><h3>${orderDetail.item.name}</h3></td>
	                    </tr>
	                    <tr align="center">
	                        <td><h5><fmt:formatNumber value="${orderDetail.item.price}" pattern="###,###,###"/></h5></td>
	                    </tr>
	                    <tr align="center">
	                        <td><h5>${orderDetail.item.description}</h5></td>
	                    </tr>
	                    <tr align="center">
							<td><h5>${orderDetail.quantity}</h5></td>
	                    </tr>
	                </table>
	            </td>
	        </tr>
		</c:forEach>
		<tr>
			<td class="col-md-8" align="right">
				<h3>Total Amount</h3>
			</td>
			<td class="col-md-4" style="vertical-align: middle;">
				<h5>${order.totalAmount}</h5>
			</td>
		</tr>
		<tr>
			<td>
			</td>
			<td>
				<h5>Purchase</h5>
			</td>
		</tr>
    </table>
</sec:authorize>
</div>

<%@ include file="./layouts/footer.jsp" %>