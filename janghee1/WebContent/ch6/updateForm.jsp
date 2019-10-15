<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="veiwport" content="device-width,initial-scale=1.0"/>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="updateDo.jsp">
		<table width="90%" cellpadding="5" cellspacing="0" border="1" align="center" style="border-collapse:collapse; border:1px gray solid;">
		<tr> 
			<td class="label"><label for="id">아이디</label></td>
			<td class="content"><input type="text" name="id" id="id" autofocus
			placeholder="aaaa@aaa.com" size="10" maxlength="20"></td>
		</tr>
		<tr>
		<td class="label"><label for="password">비밀번호</label></td>
		<td class="content"><input type="text" name="password" id="password" size="10" maxlength="20" requierd>
		</td>
		</tr>
		<tr>
		<td class="label"><label for="name">이름</label></td>
		<td class="content"><input type="text" name="name" id="name" size="10"></td>
		</tr>
		<tr>
		<td class="label"><label for="tel">전화번호</label></td>
		<td class="content"><input type="tel" name="tel" id="tel" size="10"></td>
		</tr>
		<tr>
		<td class="label"><label for="address">주소</label></td>
		<td class="content"><input type="text" name="address" id="address" size="10"></td>
		</tr>
		<tr>
		<td colspan="2" align="center"><input type="submit" value="수정완료"><input type="reset" value="다시작성"></td>
		</tr>
		</table>
	</form>
</body>
</html>