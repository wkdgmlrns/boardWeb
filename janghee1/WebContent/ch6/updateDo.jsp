<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		out.print("update 시작");
		Connection con = null;
		PreparedStatement pstmt = null, pstmt2 = null;
		ResultSet rs = null;
		String drv = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@dalma.dongguk.ac.kr:1521:stud1";
		String user = "wkd123", pass = "wkd123";

		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String tel = request.getParameter("tel");

		try {
			Class.forName(drv);
			con = DriverManager.getConnection(url, user, pass);
			String sql = "select id from member where id =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			rs.next();
			String rid = rs.getString("id");

			if (rid.equals(id)) {
				String sql2 = "update member set password=?, name=?, address=?, tel=? where id=?";
				pstmt2 = con.prepareStatement(sql2);
				pstmt2.setString(1, password);
				pstmt2.setString(2, name);
				pstmt2.setString(3, address);
				pstmt2.setString(4, tel);
				pstmt2.setString(5, id);
				pstmt2.executeUpdate();
				out.println("수정완료");
			} else
				out.println("아이디 불일치");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
	%>
</body>
</html>