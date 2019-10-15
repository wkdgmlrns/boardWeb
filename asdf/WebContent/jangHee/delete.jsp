<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.loginDao"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String passwd= request.getParameter("passwd");
	loginDao loDao = new loginDao();
	int check = loDao.deleteMember(id, passwd);
	if(check==1)
		session.invalidate();
	out.println(check);
%>