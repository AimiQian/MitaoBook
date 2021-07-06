<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MiTao Register Success Page</title>
	<%@ include file="/pages/common/head.jsp" %>
	<style type="text/css">
		h1 {
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
			<h1>Successfully Registered! <a href="index.jsp">Main Page</a></h1>
		</div>

		<%@include file="/pages/common/footer.jsp"%>
</body>
</html>