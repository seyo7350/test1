<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="css/style.css">

<script src="//code.jquery.com/jquery-1.12.4.js"></script>


</head>
<body>

	<div class="wrapper">
		<div class="main">
			<!-- 로고와 로그인창이 들어올 영역 -->
			<div class="logo">
				<!-- 로고 이미지 영역 -->

			</div>
			<div class="login_box">

				<div class="input_login1">

					<img src="image/icanlogo.jpg" />
					<form action="loginAF.jsp" method="post">
				</div>
				<div class="input_login">
					<input type="text" name="id" placeholder="사원번호">
				</div>
				<div class="input_login">
					<input type="password" name="password" placeholder="비밀번호">
				</div>

				<div class="login">
					<input type="submit" value="로그인">
				</div>
				</form>

				<div class="last">
					<div class="search">
						<a href="findPW.jsp " style="color: #f5f5f5;">사원/비밀번호 찾기</a>
					</div>
				</div>
			</div>
		</div>
		<p align="center">
			<img src="image/join_img.jpg">
		</p>
	</div>

</body>
</html>