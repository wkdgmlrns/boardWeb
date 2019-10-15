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
		String id = request.getParameter("id");
		Connection con = null;
		PreparedStatement pstmt = null,pstmt2=null;
		ResultSet rs = null;
		String drv = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@dalma.dongguk.ac.kr:1521:stud1";
		String user = "wkd123", pass = "wkd123";
		try {
			Class.forName(drv);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			out.println("클레스에러");
		}
		try {
			con.setAutoCommit(false);//setAutoCommint을 false로 두면 자동으로 커밋이 일어나지 않느다
			con = DriverManager.getConnection(url, user, pass);
			String sql = "select id from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			String rid = rs.getString("id");
			if (rid.equals(id)) {
				String sql2 = "delete from member where id=?";
				pstmt2 = con.prepareStatement(sql2);
				pstmt2.setString(1, id);
				pstmt2.executeUpdate();
				out.println("삭제완료");
			}else
				out.println("아이디 불일치");
			con.commit();
			con.setAutoCommit(true);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(con!=null)
				con.close();
		}
	%>
</body>
</html>