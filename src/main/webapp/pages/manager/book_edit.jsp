<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Edit</title>
	<%@ include file="/pages/common/head.jsp" %>
<style type="text/css">
	input {
		text-align: center;
		width: 100%;
	}
</style>
</head>
<body>
	<%@ include file="/pages/common/managermenu.jsp"%>

		<div class="container" id="main">
			<h2 style="text-align: center">Book Editor</h2>
			<form action="manager/bookServlet" method="get">
				<input type="hidden" name="pageNo" value="${param.pageNo}">
				<input type="hidden" name="action" value="${param.method}">
				<input type="hidden" name="id" value="${requestScope.book.id}">
				<table>
					<tr>
						<td>Name</td>
						<td>Price</td>
						<td>Author</td>
						<td>Sales</td>
						<td>Stock</td>
						<td colspan="2">Action</td>
					</tr>		
					<tr>
						<td><input name="name" type="text" value="${requestScope.book.name}"/></td>
						<td><input name="price" type="text" value="${requestScope.book.price}"/></td>
						<td><input name="author" type="text" value="${requestScope.book.author}"/></td>
						<td><input name="sales" type="text" value="${requestScope.book.sales}"/></td>
						<td><input name="stock" type="text" value="${requestScope.book.stock}"/></td>
						<td><input type="submit" value="Edit"/></td>
					</tr>	
				</table>
			</form>
		</div>
		<%@include file="/pages/common/footer.jsp"%>
</body>
</html>