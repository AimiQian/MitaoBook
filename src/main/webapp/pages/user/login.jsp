<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MiTao Login Page</title>
	<%@ include file="/pages/common/head.jsp" %>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<a class="navbar-brand" href="#">MiTao BookStore</a>
			</div>
		</div><!-- /.container-fluid -->
	</nav>
		
			<div class="container login_banner">
				<div class="row">
					<div class="col-lg-6 col-md-12" id="l_content" >
						<span class="login_word">LOGIN</span>
					</div>
					<div class="col-lg-6 col-md-12" id="content" >
						<div class="login_form">
							<div class="login_box">
								<div class="tit">
									<h1>MiTao Account</h1>
									<a href="pages/user/regist.jsp">Register Now</a>
								</div>
								<div class="msg_cont">
									<b></b>
	<%--								<span class="errorMsg"><%=request.getAttribute("msg")==null?"Enter username and password":request.getAttribute("msg")%></span>--%>
									<span class="errorMsg">
										${ empty requestScope.msg ? "Enter username and password" : requestScope.msg}
	<%--									<c:choose>--%>
	<%--										<c:when test="${ empty requestScope.msg }">--%>
	<%--											Enter username and password--%>
	<%--										</c:when>--%>
	<%--										<c:otherwise>--%>
	<%--											${requestScope.msg}--%>
	<%--										</c:otherwise>--%>
	<%--									</c:choose>--%>
									</span>
								</div>
								<div class="form">
									<form action="userServlet" method="post">
										<input type="hidden" name="action" value="login" />
										<label>Username：</label>
										<input class="itxt" type="text" placeholder="Please Enter Your Username" autocomplete="off" tabindex="1" name="username"
											   value="${requestScope.username}"/>
										<br />
										<br />
										<label>Password：</label>
										<input class="itxt" type="password" placeholder="Please Enter Your Password" autocomplete="off" tabindex="1" name="password" />
										<br />
										<br />
										<input type="submit" value="Login" id="sub_btn" />
									</form>
								</div>

							</div>
						</div>
					</div>
				</div>   <%--row--%>
			</div>
		<%@include file="/pages/common/footer.jsp"%>
</body>
</html>