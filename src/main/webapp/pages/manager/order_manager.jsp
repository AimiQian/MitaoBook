<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>订单管理</title>
	<%@ include file="/pages/common/head.jsp" %>
</head>
<body>
	
	<div id="header">
			<img class="logo_img" alt="" src="static/img/logo.gif" >
			<span class="wel_word">订单管理系统</span>
			<%@ include file="/pages/common/managermenu.jsp"%>
	</div>
	
	<div id="main">
		<table>
			<tr>
				<td>日期</td>
				<td>金额</td>
				<td>详情</td>
				<td>发货</td>
			</tr>
			<c:forEach items="${requestScope.allOrders}" var="order">
				<tr>
					<td>${order.createTime}</td>
					<td>${order.price}</td>
					<td><a href="#">Details</a></td>
					<c:if test="${order.status == 0}">
						<td><a href="#">Click to ship</a></td>
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
	</div>

	<%@include file="/pages/common/footer.jsp"%>
</body>
</html>