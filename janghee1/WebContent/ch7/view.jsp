<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Enumeration <String> attr = session.getAttributeNames();
	while(attr.hasMoreElements()){
		String attrName = attr.nextElement();
		String attrValue = (String)session.getAttribute(attrName);
		out.println(attrName);
		out.println(attrValue);
	}
%>
</body>
</html>