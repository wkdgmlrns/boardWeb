<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>select One</title>
</head>
<body>
	<%
		String id = "janghee";
		String password = "1234";
		session.setAttribute("id", id);
		session.setAttribute("passwd", password);
		out.println("세션 id와 passwd설정완료");
	%>
	<form method="post" action="view.jsp">
		<table>
			<tr>
			<td><input type="submit" value="세션 속성 확인"></td>
			</tr>
		</table>
	</form>
</body>
</html>