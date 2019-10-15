<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="veiwport" content="device-width,initial-scale=1.0" />
<script src="http://code.jquery.com/jqeury-3.4.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id=request.getParameter("id");
		String password = request.getParameter("pass");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String tel = request.getParameter("tel");
		Timestamp date = new Timestamp(System.currentTimeMillis());
		
		
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs;
		String drv="oracle.jdbc.OracleDriver";
		String url="jdbc:oracle:thin:@dalma.dongguk.ac.kr:1521:stud1";
		String user="wkd123", pass="wkd123";
		try{
			Class.forName(drv);
		}catch(ClassNotFoundException e){e.printStackTrace();}
		try{
			con = DriverManager.getConnection(url,user,pass);
			pstmt= con.prepareStatement("insert into member values (?,?,?,?,?,?)");
			pstmt.setString(1,id);
			pstmt.setString(2,password);
			pstmt.setString(3,name);
			pstmt.setTimestamp(4, date);
			pstmt.setString(5,address);
			pstmt.setString(6, tel);
			pstmt.executeUpdate();
			out.println("저장완료");
		}catch(SQLException e){e.printStackTrace(); out.println("err1");}
		finally{
			if(pstmt !=null){
				try{pstmt.close();}catch(SQLException e){}
			}
			if(con !=null){
				try{con.close();}catch(SQLException e){}
			}
		}
	%>
</body>
</html>