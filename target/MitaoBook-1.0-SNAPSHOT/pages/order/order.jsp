<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>My Orders</title>
	<%@ include file="/pages/common/head.jsp" %>
	<style type="text/css">
		h1 {
			text-align: center;
			margin-top: 200px;
		}
	</style>
</head>
<body>
		<%@ include file="/pages/common/login_success_menu.jsp"%>

	<div class="container" id="main">
		<h2 style="text-align: center">My Orders</h2>
		<table>
			<tr>
				<td>Order Date</td>
				<td>Total</td>
				<td>Status</td>
				<td>Details</td>
				<td>Action</td>
			</tr>
			<c:forEach items="${requestScope.page.items}" var="order">
				<tr>
					<td>${order.createTime}</td>
					<td>${order.price}</td>

					<c:if test="${order.status == 0}">
						<td>Unshipped</td>
					</c:if>
					<c:if test="${order.status == 1}">
						<td>Shipped</td>
					</c:if>
					<c:if test="${order.status == 2}">
						<td>Delivered</td>
					</c:if>
					<td><a href="orderServlet?action=showOrderDetail&orderId=${order.orderId}&pageNo=${requestScope.page.pageNo}">Details</a></td>
					<c:if test="${order.status == 1}">
						<td><button><a href="orderServlet?action=receiveOrder&orderId=${order.orderId}">Received</a></button></td>
					</c:if>
					<c:if test="${order.status == 0}">
						<td>Waiting</td>
					</c:if>
					<c:if test="${order.status == 2}">
						<td>:)</td>
					</c:if>

				</tr>
			</c:forEach>
			

		</table>

		<%@include file="/pages/common/page_nav.jsp"%>
		
	
	</div>

	<%@include file="/pages/common/footer.jsp"%>
</body>
</html>