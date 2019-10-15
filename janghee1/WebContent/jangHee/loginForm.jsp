<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="device-width,inital-scale=1.0/">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="login1.js"></script>
<link rel="stylesheet" href="../css/style.css">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = "";
	try{
		id = (String) session.getAttribute("id");
		if (id == null) {
	%>
	<div id="status">
		<ul>
			<li><label for="id">아이디</label> <input type="text" name="id"
				id="id" size="20" maxlength="50" placeholder="aaaaaa@aaaa.com">
			<li><label for="passwd">비밀번호</label> <input type="password"
				id="passwd" name="passwd" size="20" maxlength="16"
				placeholder="6~10자리 숫자/문자">
			<li class="label2">
				<button id="login">로그인</button>
				<button id="register">회원가입</button>
		</ul>
	</div>
	<%
		} else {
	%>
	<div id="status">
		<ul>
		<li><b><%=id %></b>님이 로그인했습니다
		<li class="label2"> <button id="logout">로그아웃</button>
			<button id="update">회원정보변경</button>
		</ul>
	</div>
	<%
		}}catch(Exception e){e.printStackTrace();}
	%>
</body>
</html>