<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="device-width,initial-scale=1.0" />
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>가입일자</td>
			<td>주소</td>
			<td>전화번호</td>
		</tr>
		<%
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String drv = "oracle.jdbc.OracleDriver";
			String url = "jdbc:oracle:thin:@dalma.dongguk.ac.kr:1521:stud1";
			String user = "wkd123", pass = "wkd123";
			try {
				Class.forName(drv);
				con = DriverManager.getConnection(url, user, pass);
				String sql = "select * from member";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				rs.next();
				String id = rs.getString("id");
				String password = rs.getString("password");
				String name = rs.getString("name");
				Timestamp date = rs.getTimestamp("m_date");
				String address = rs.getString("address");
				String tel = rs.getString("tel");
		%>
				<tr>
				<td><%=id%></td>
				<td><%=password%></td>
				<td><%=name%></td>
				<td><%=date%></td>
				<td><%=address%></td>
				<td><%=tel%></td>
				</tr>
		<%
			} catch (ClassNotFoundException e) {
			} catch (SQLException e) {
			}
		%>
	</table>
</body>
</html>