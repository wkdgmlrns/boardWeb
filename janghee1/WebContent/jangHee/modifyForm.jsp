<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.loginDao"%>
<%@ page import="bean.LoginBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<link rel="stylesheet" href="../css/style.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="modify.js?var=2"></script>
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("uft-8");
		String id = (String)session.getAttribute("id");
		String passwd = request.getParameter("passwd");
		loginDao loDao= new loginDao();
		LoginBean loBean = loDao.getMember(id, passwd);
		try{
	%>
	<div id="regForm">
		<ul>
			<li><label for="id">아이디</label> <input type="email" id="id"
				name="id" size="20" maxlength="50" placeholder="aaaa@aa.com">
			<li><label for="passwd">비밀번호</label> <input type="password"
				name="passwd" id="passwd" size="20" maxlength="30"
				placeholder="8~16자리 숫자/문자">
			<li><label for="repasswd">비밀번호재입력</label> <input type="password"
				name="repasswd" id="repasswd" size="20" placeholder="8~16자리 숫자/문자">
			<li><label for="name">이름</label> <input type="text" name="name"
				id="name" size="20" placeholder="니이름">
			<li><label for="address">주소</label> <input type="text"
				name="address" id="address" size="20" placeholder="니주소">
			<li><label for="tel">전봐번호</label> <input type="tel" name="tel"
				id="tel" size="20" placeholder="tel">
			<li class="label2"><button id="modifyProcess">가입하기</button>
				<button id="cancle">취소</button></li>
		</ul>
	</div>
	<%} catch(Exception e){e.printStackTrace();} %>
</body>
</html>