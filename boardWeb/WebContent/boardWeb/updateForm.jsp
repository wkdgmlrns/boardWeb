<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.boardDao, bean.boardBean"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<link rel="stylesheet" href="../css/style.css" />
<script src="../js/jquery-3.4.1.min.js"></script>
<script src="update.js"></script>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");

	boardDao boDao = boardDao.getInstance();
	boardBean article = boDao.updateGetArticle(num);
%>
<div di="editForm" class="box">
	<ul>
		<li><p class="center">글수정
		<li><label for="subject">제목</label> <input id="subject"
			name="subject" type="text" value=<%=article.getSubject()%>> <input
			type="hidden" id="num" value="<%=num%>">
		<li><label for="content">내용</label> <textarea id="content"
				rows="13" cols="50"><%=article.getContent()%></textarea>
		<li><label for="passwd">제목</label> <input id="passwd"
			name="passwd" type="password">
		<li class="label2">
			<button id="regist" value="<%=pageNum%>">수정</button>
			<button id="cancle" value="<%=pageNum%>">취소</button>
	</ul>
</div>