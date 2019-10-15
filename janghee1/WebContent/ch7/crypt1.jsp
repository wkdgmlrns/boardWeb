<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="bean.encryptionBean"%>
<%@ page import="dao.encryptionDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="device-width,initial-scale=1.0" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		List<encryptionBean> memberList = null;
		encryptionDao eDao = new encryptionDao();
		memberList = eDao.getMember();
	%>
	<table>
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
		</tr>
		<%
			for (int i = 0; i < memberList.size(); i++) {
				encryptionBean member = (encryptionBean) memberList.get(i);
				String id = member.getId();
				String password = member.getPassword();
		%>
		<tr>
			<td><%=id%></td>
			<td><%=password%></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>