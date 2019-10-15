<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.LoginBean,dao.loginDao"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="memberBean" class="bean.LoginBean">
	<jsp:setProperty name="memberBean" property="*" />
</jsp:useBean>
<%
	loginDao loDao = new loginDao();
	int check = loDao.updateMember(memberBean);
	out.println(check);
%>