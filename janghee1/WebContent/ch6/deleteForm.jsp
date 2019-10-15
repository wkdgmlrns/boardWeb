<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="veiwport" content="device-width,initial-scale=1.0" />
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="deleteDo.jsp">
		<table>
			<tr>
			<td class="label"><label for="id">아이디</label></td>
			<td class="content"><input type="text" id="id" name="id" size="10" maxlenght="20"></td>
			</tr>
			<tr>
			<td class="label"><label for="password">비밀번호</label></td>
			<td class="content"><input type="text" id="password" name="password" size="10" maxlenght="20"></td>
			</tr>
			<tr>
			<td colspan="2" align="center"><input type="submit" value="삭제"><input type="reset" value="다시작성"></td>
			</tr>
		</table>
	</form>
</body>
</html>