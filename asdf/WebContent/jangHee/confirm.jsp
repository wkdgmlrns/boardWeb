<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.loginDao"%>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		loginDao lDao = new loginDao();
		
		int check = lDao.confirmId(id);
		out.print(check);
	%>