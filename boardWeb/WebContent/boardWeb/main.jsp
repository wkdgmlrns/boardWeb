<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="main_user_cert" class="box2">
		<div id="main_image" class="box">
			<img class="noborder" id="logo" src="../images/mollahalf.png" />
		</div>
		<div id="main_auth" class="box"><jsp:include
				page="loginForm.jsp" /></div>
	</div>
	<div id="main_board" class="box2"><jsp:include
			page="main_board.jsp" /></div>
</body>
</html>