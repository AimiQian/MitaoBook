<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Management</title>
	<%@ include file="/pages/common/head.jsp" %>
</head>
<body>

<%@ include file="/pages/common/managermenu.jsp"%>
	
	<div class="container" id="main">
		<h2 style="text-align: center">Order Management</h2>
		<table>
			<tr>
				<td>Order Date</td>
				<td>ToTal</td>
				<td>Details</td>
				<td>Action</td>
			</tr>
			<c:forEach items="${requestScope.page.items}" var="order">
				<tr>
					<td>${order.createTime}</td>
					<td>${order.price}</td>
					<td><a href="orderServlet?action=showOrderDetail&orderId=${order.orderId}&pageNo=${requestScope.page.pageNo}">Details</a></td>
					<c:if test="${order.status == 0}">
						<td><a href="orderServlet?action=sendOrder&orderId=${order.orderId}">Click to ship</a></td>
					</c:if>
					<c:if test="${order.status == 1}">
						<td>Shipped</td>
					</c:if>
					<c:if test="${order.status == 2}">
						<td>Delivered</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>

		<%@include file="/pages/common/page_nav.jsp"%>
	</div>

	<%@include file="/pages/common/footer.jsp"%>
</body>
</html>