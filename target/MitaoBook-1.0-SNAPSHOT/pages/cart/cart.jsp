<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
	<%@ include file="/pages/common/head.jsp" %>
</head>
<body>
		<%@ include file="/pages/common/login_success_menu.jsp"%>


	<script type="text/javascript">
		$(function () {
			$("a.deleteItem").click(function () {
				return confirm("Are you sure to delete【" + $(this).parent().parent().find("td:first").text() + "】?");
			});

			$("#clearCart").click(function () {
				return confirm("Are you sure to empty the cart?");
			});

			$(".updateCount").change(function () {
				var id = $(this).attr("bookId");
				var name = $(this).parent().parent().find("td:first").text();
				var count= this.value;

				var flag = confirm("Are you sure to change the quantity of 【" + name + "】 to " + count + "?");

				if(flag){
					location.href = "http://localhost:8080/MitaoBook/cartServlet?action=updateCount&count=" + count + "&id=" + id;
				}else{
					this.value = this.defaultValue;
				}
			})
		});


	</script>
	
	<div class="container" id="main">
		<h2 style="text-align: center">Shopping Cart</h2>
		<table>
			<tr>
				<td>Product Name</td>
				<td>Quantity</td>
				<td>Price</td>
				<td>Total</td>
				<td>Action</td>
			</tr>
			<c:if test="${empty sessionScope.cart.items}">
				<tr>
					<td colspan="5"><a href="index.jsp">Current Shopping Cart is Empty. Browse the BookStore Now!!</a></td>
				</tr>

			</c:if>
			<c:if test="${not empty sessionScope.cart.items}">
				<c:forEach items="${sessionScope.cart.items}" var="entry">
					<tr>
						<td>${entry.value.name}</td>
						<td>
							<input class="updateCount" bookId="${entry.value.id}" style="width: 60px" type="text" value="${entry.value.count}">
						</td>
						<td>${entry.value.price}</td>
						<td>${entry.value.totalPrice}</td>
						<td><a class ="deleteItem" href="cartServlet?action=deleteItem&id=${entry.value.id}">Delete</a></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>

		<c:if test="${not empty sessionScope.cart.items}">
			<div class="cart_info">
				<span class="cart_span">Total<span class="b_count">${sessionScope.cart.totalCount}</span> items in your cart.</span>
				<span class="cart_span">Subtotal $<span class="b_price">${sessionScope.cart.totalPrice}</span></span>
				<span class="cart_span"><a id="clearCart" href="cartServlet?action=clear">Empty The Cart</a></span>
				<span class="cart_span"><a href="orderServlet?action=createOrder">CheckOut</a></span>
			</div>

		</c:if>
		

	</div>

	<%@include file="/pages/common/footer.jsp"%>
</body>
</html>