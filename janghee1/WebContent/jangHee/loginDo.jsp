<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dao.loginDao" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	loginDao inDao = new loginDao();
	int check = inDao.userCheck(id, passwd);
	if(check==1)
		session.setAttribute("id", id);
	out.println(check);
%>