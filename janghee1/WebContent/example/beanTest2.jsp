<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="testBean" class="bean.beantest">
		<jsp:setProperty name="testBean" property="*"/>
	</jsp:useBean>
	<table>
		<tr>
			<td>아이디 : </td><td><jsp:getProperty name="testBean" property="id"/></td>
		</tr>
		<tr>
			<td>비밀번호 : </td><td><jsp:getProperty name="testBean" property="password"/></td>	
		</tr>
		<tr>
			<td>이름 : </td><td><jsp:getProperty name="testBean" property="name"/></td>
		</tr>
	</table>
</body>
</html>