<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="veiwport" content="device-width,initial-scale=1.0"/>
<script src = "http://code.jqeury.com/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<% 
	Connection con=null;
	Statement stmt=null;
	ResultSet rs=null;
	String url="jdbc:oracle:thin:@dalma.dongguk.ac.kr:1521:stud1";
	String drv = "oracle.jdbc.driver.OracleDriver";
	String user="wkd123", pass="wkd123";
	
	try{
		Class.forName(drv);
	}catch(ClassNotFoundException e){out.println("에러발생1");}
	try{
		con = DriverManager.getConnection(url,user,pass);
		out.println("연결이 되었습니다");
	}catch(SQLException e){out.println("에러발생2");}
%>
</body>
</html>