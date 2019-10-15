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
	%>
	<h3>암호화 전 내용</h3>
	<jsp:include page="crypt1.jsp" flush="false" />
	<%
		encryptionDao eDao = new encryptionDao();
		eDao.updateMember();
	%>
	<h3>암호화가 적용된 후 내용</h3>
	<jsp:include page="crypt1.jsp" flush="false" />
</body>
</html>