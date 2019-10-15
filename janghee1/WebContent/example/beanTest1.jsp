<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="beanTest2.jsp">
		<table>
			<tr>
			<td>아이디</td><td><input type="text" id="id" name="id"></td>
			</tr>
			<tr>
			<td>비밀번호</td><td><input type="password" id="password" name="password"></td>
			</tr>
			<tr>
			<td>이름</td><td><input type="text" id="name" name="name"></td>
			</tr>
			<tr>
			<td collspan="2"><input type="submit" value="작성완료"><input type="reset" value="다시작성"></td>
			</tr>
		</table>
	</form>
</body>
</html>