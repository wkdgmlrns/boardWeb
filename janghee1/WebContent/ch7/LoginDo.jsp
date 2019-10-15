<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dbCon.DbCon,dao.loginDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
			String id = request.getParameter("id");
			String passwd = request.getParameter("passwd");

			loginDao lg = new loginDao();
			int check = lg.userCheck(id, passwd);
			if (check == 1) {
		session.setAttribute(id, "id");
		response.sendRedirect("LoginForm.jsp");
			} else if (check == 0) {
	%>
	<script>
		alert("비밀번호가 맞지않아요");
		history.go(-1);
	</script>
	<%
		} else {
	%>
	<script>
		alert("아이디 안맞음");
		history.go(-1);
	</script>
	<%
		}
	%>
</body>
</html>