<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.boardBean,dbCon.dbCon"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		dbCon dbc = dbCon.getInstance();
		pstmt = dbc.getPstmt("select * from member where id=?");
		pstmt.setString(1, "janghee");
		rs = pstmt.executeQuery();
		if (rs.next()) {
			out.print("패스워드" + rs.getString("passwd") + "<br>");
			out.print("이름" + rs.getString("name"));
		} else {
			out.print("실행에러");
		}
	%>
</body>
</html>