<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="device-width,inital-scale=1.0" />
<title>Insert title here</title>
</head>
<body>
	<%
		String id="";
	try{
		id=(String)session.getAttribute("id");
		if(id==null || id.equals("")){
	%>
	<form method="post" action="LoginDo.jsp">
		<tr>
		<td><label for="id">아이디</label></td><td><input type="text" id="id" name="id"></td>
		</tr>
		<tr>
		<td><label for="passwd">비밀번호</label></td><td><input type="passwd" name="passwd"></td>
		</tr>
		<tr colspan=2 align="center">
		<td><input type="submit" value="로그인"></td>
		</tr>
	</form>
	<% 	
		}else{
	%>
	<b><%=id %></b>님이 로글인했어요
	<form method="post" action="Logout.jsp">
	<input type="submit" value="로그아웃">
	</form>
	<% 
		}
	}catch(Exception e){e.printStackTrace();}
	%>
</body>
</html>