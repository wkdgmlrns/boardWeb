
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ page import="dao.loginDao"%>
<%
	request.setCharacterEncoding("uft-8");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");

	loginDao loDao = new loginDao();
	int check = loDao.userCheck(id, passwd);
	
	out.println(check);
%>