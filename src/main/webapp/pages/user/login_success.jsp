<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MiTao Login Success Page</title>
	<%@ include file="/pages/common/head.jsp" %>
	<style type="text/css">
		h1, h2{
			text-align: center;
			margin-top: 200px;
		}

		h1 a {
			color:red;
		}
	</style>
</head>
<body>
		<%@ include file="/pages/common/login_success_menu.jsp"%>

		<div class="container" id="main">

			<c:if test="${requestScope.isManager eq false}">
				<h2>You do not have administrative privilege!</h2>
			</c:if>
		
<%--			<h1>Welcome Back! <a href="index.jsp">Back To The Main Page</a></h1>--%>
			<h1>Welcome <span class="um_span">${sessionScope.user.username}</span> To MiTao BookStore!! <a href="index.jsp">Main Page</a></h1>
	
		</div>

		<%@include file="/pages/common/footer.jsp"%>
</body>
</html>