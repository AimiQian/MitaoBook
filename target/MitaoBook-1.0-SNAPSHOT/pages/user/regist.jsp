<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MiTao Register Page</title>
	<%@ include file="/pages/common/head.jsp" %>

	<script type="text/javascript">
		$(function(){
			$("#username").blur(function () {
				var username = this.value;

				$.getJSON("${basePath}userServlet", "action=ajaxExitUsername&username=" + username, function(data){
					if(data.existsUsername){
						$("span.errorMsg").text("Username Exists!!");
					}
					else{
						$("span.errorMsg").text("Username Available");
					}
				});
			});

			$("#code_img").click(function () {
				this.src="${basePath}kaptcha.jpg?d=" + new Date();
			});

			$("#sub_btn").click(function (){
				//Validate username
				var usernameText = $("#username").val();
				var usernamePatt = /^\w{5,12}$/;
				if(!usernamePatt.test(usernameText)){
					$("span.errorMsg").text("Not Valid Username!!");
					return false;
				}

				//validate password
				var passwordText = $("#password").val();
				var passwordPatt = /^\w{5,12}$/;
				if(!passwordPatt.test(passwordText)){
					$("span.errorMsg").text("Not Valid Password!!");
					return false;
				}

				//confirm password
				var repwdText = $("#repwd").val();
				if(repwdText != passwordText){
					$("span.errorMsg").text("Confirmed password is wrong!!");
					return false;
				}

				//validate email
				var emailText = $("#email").val();
				var emailPatt = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
				if(!emailPatt.test(emailText)){
					$("span.errorMsg").text("Not valid email address!!");
					return false;
				}

				//validate code
				var codeText = $("#code").val();

				codeText = $.trim(codeText); //prevent multiple spaces

				if(codeText == null || codeText == ""){
					//remind the user
					$("span.errorMsg").text("Validation Code Error!!");
					return false;
				}

				$("span.errorMsg").text("");
			});
		});

	</script>
	<style type="text/css">
		.login_form{
			height:420px;
			margin-top: 25px;
		}

	</style>
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
				<div class="col-lg-6 col-md-12" id="l_content">
					<span class="login_word">REGISTER</span>
				</div>
				
				<div class="col-lg-6 col-md-12" id="content">
					<div class="login_form">
						<div class="login_box">
							<div class="tit">
								<h1>MiTao Account</h1>
								<span class="errorMsg">
									${requestScope.msg}
								</span>
							</div>
							<div class="form">
								<form action="userServlet" method="post">
									<input type="hidden" name="action" value="register" />
									<br />
									<br />
									<label>Username：</label>
									<input class="itxt" type="text" placeholder="Please Enter Username"
										   autocomplete="off" tabindex="1" name="username" id="username" value="${requestScope.username}"/>
									<br />
									<br />
									<label>Password：</label>
									<input class="itxt" type="password" placeholder="Please Enter Password"
										   autocomplete="off" tabindex="1" name="password" id="password" />
									<br />
									<br />
									<label>Confirm Password：</label>
									<input class="itxt" type="password" placeholder="Please Confirm Your Password"
										   autocomplete="off" tabindex="1" name="repwd" id="repwd" />
									<br />
									<br />
									<label>Email：</label>
									<input class="itxt" type="text" placeholder="Please Enter Your Email"
										   autocomplete="off" tabindex="1" name="email" id="email" value="${requestScope.email}"/>
									<br />
									<br />
									<label>Code：</label>
									<input class="itxt" type="text" style="width: 80px;" name="code" id="code"/>
									<img id="code_img" alt="" src="kaptcha.jpg" style="float: right; margin-right: 40px; width: 110px; height: 30px">
									<br />
									<br />
									<input type="submit" value="Register" id="sub_btn" />
									
								</form>
							</div>
							
						</div>
					</div>
				</div>
	</div>
</div>
		<%@include file="/pages/common/footer.jsp"%>
</body>
</html>