<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="dao.loginDao"%>
<%@ page import="bean.LoginBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,inital-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="../css/style.css">
<title>register</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="memberBean" class="bean.LoginBean">
		<jsp:setProperty name="memberBean" property="*" />
	</jsp:useBean>
	<%
		memberBean.setReg_date(new Timestamp(System.currentTimeMillis()));
		loginDao lDao = new loginDao();
		lDao.insetMember(memberBean);
	%>

	
</body>
</html>