<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Book Manager</title>
	<%@ include file="/pages/common/head.jsp" %>
	<script type="text/javascript">
		$(function(){
			$("a.deleteClass").click(function () {

				return confirm("Are you sure to delete [" + $(this).parent().parent().find("td:first") + "] ?");
			})
		});
	</script>
</head>
<body>
			<%@ include file="/pages/common/managermenu.jsp"%>
	
	<div class="container" id="main">
		<h2 style="text-align: center">Book Management</h2>
		<table>
			<tr>
				<td>Name</td>
				<td>Price</td>
				<td>Author</td>
				<td>Sales</td>
				<td>Stock</td>
				<td colspan="2">Action</td>
			</tr>		
			<c:forEach items="${requestScope.page.items}" var="book">
					<tr>
						<td>${book.name}</td>
						<td>${book.price}</td>
						<td>${book.author}</td>
						<td>${book.sales}</td>
						<td>${book.stock}</td>
						<td><a href="manager/bookServlet?action=getBook&id=${book.id}&method=update&pageNo=${requestScope.page.pageNo}">Edit</a></td>
						<td><a class="deleteClass" href="manager/bookServlet?action=delete&id=${book.id}&pageNo=${requestScope.page.pageNo}">Delete</a></td>
					</tr>

			</c:forEach>

			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td><a href="pages/manager/book_edit.jsp?method=add&pageNo=${requestScope.page.pageTotal}">Add Book</a></td>
			</tr>
		</table>

		<%@include file="/pages/common/page_nav.jsp"%>
	</div>
	<%@include file="/pages/common/footer.jsp"%>
</body>
</html>