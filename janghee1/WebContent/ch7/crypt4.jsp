<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.encryptionBean"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		ResultSet rs=null;
		encryptionBean eBean = new encryptionBean();
		String rid = request.getParameter("id");
		String password = request.getParameter("password");
		//select s1 = new select();
		//rs = s1.selectOne(password);
		try{
		rs.next();
		out.print(rs.getString("id"));
		out.print(rs.getString("password"));
		}
		catch(Exception e){e.printStackTrace();} 
	%>
</body>
</html>