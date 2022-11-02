<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Details</title>
    <%@ include file="/pages/common/head.jsp" %>
</head>
<body>

    <%@ include file="/pages/common/login_success_menu.jsp"%>

<div class="container" id="main">
        <div class="order_info">
            <span class="cart_span">Order Number<span class="b_count">${requestScope.order.orderId}</span></span>
            <span class="cart_span">Subtotal $<span class="b_price">${requestScope.order.price}</span></span>
        </div>
    <table>
        <tr>
            <td>Book Name</td>
            <td>Quantity</td>
            <td>Price</td>
            <td>Total</td>
        </tr>

        <c:forEach items="${requestScope.orderItems}" var="order">
        <tr>
            <td>${order.name}</td>
            <td>${order.count}</td>
            <td>${order.price}</td>
            <td>${order.totalPrice}</td>
        </tr>
        </c:forEach>
    </table>
    <span class="cart_span"><a href="${header.referer}">Back To My Orders</a></span>

</div>

<%@include file="/pages/common/footer.jsp"%>
</body>
</html>
