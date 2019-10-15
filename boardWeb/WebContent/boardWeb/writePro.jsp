<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.boardDao,bean.boardBean" %>
<%@ page import="java.sql.Timestamp" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="article" class="bean.boardBean">
	<jsp:setProperty name="article" property="*"/>
</jsp:useBean>
<%
	String id="";
	try{
		id=(String)session.getAttribute("id");
	}catch(Exception e){e.printStackTrace();}
	article.setWriter(id);
	article.setReg_date(new Timestamp(System.currentTimeMillis()));
	article.setIp(request.getRemoteAddr());
	
	boardDao boDao = boardDao.getInstance();
	int check = boDao.insertAricle(article);
	out.println(check);
%>
<script>
	alert(<%=check%>);
</script>