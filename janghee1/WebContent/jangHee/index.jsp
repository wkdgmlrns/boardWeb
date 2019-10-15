<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,inital-scale=1.0" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/style.css">
<title>main</title>
</head>
<body>
	<div id="main_image" class="box">
		<img class="noborder" id="logo" src="../image/logo.png">
		<div id="main_auth" class="box"><jsp:include
				page="loginForm.jsp" /></div>
	</div>
</body>
</html>