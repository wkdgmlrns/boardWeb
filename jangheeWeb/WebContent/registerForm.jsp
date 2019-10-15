<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,inital-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.css">
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<link rel="stylesheet" href="css/style.css">
<title>AnsanExchange</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="contatiner-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">메뉴</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="index.jsp">소개<span class="sr-only"></span></a></li>
					<li><a href="board.jsp">게시판</a>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="fasle">강의<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="ExchangeList.jsp?ExchangeListName=list">c언어</a>
							<li><a href="ExchangeList.jsp?ExchangeListName=list">java언어</a>
							<li><a href="ExchangeList.jsp?ExchangeListName=list">안드로이드</a>
						</ul>
				</ul>
				<form class="navbar-form navbar-left">
					<div class="form-gorup">
						<input type="text" class="form-control"> <input
							type="submit" class="btn btn-default" value="검색">
					</div>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="fasle">접속하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="loginForm.jsp">로그인</a>
							<li><a href="googleLoginForm.jsp">구글 로그인</a>
							<li><a href="fbLoginForm.jsp">페이스북 로그인</a>
							<li><a href="register.jsp">회원가입</a>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<footer style="background-color: #000000; color: #ffffff">
		<div class="container">
			<br>
			<div class="row">
				<div class="col-sm-12" style="text-align: center;">
					<h5>Copyright &copy; 2019</h5>
					<h5>이장희</h5>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>