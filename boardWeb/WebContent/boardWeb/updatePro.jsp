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
	boardDao boDao = boardDao.getInstance();
	int check = boDao.updateAricle(article);
	out.println(check);
%>