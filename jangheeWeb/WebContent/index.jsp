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
<style type="text/css">
.jumbotron {
	background-image: url('images/local.jpeg');
	background: cover text-shadow: black 0.2em 0.2em 0.2em;
	color: white;
	background: cover text-shadow: black 0.2em 0.2em 0.2em;
}
</style>
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
							<li><a href="registerForm.jsp">회원가입</a>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="jumbotron">
			<h1 class="text-center">지역화폐사용처를 알려드립니다</h1>
			<p class="text-center">aaaaaaa</p>
			<p class="text-center">
				<a class="btn btn-primary btn-lg" href="ExchangeList.jsp?ExchangeListName=list" role="button">검색하러ㄱㄱ</a>
			</p>
		</div>
		<div class="row">
			<div class="col-md-4">
				<h4>안녕하세요</h4>
				<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
				<p>
					<a class="btn btn-default" data-target="#modal" data-toggle="modal">자세히알아보기1</a>
				</p>
			</div>
			<div class="col-md-4">
				<h4>안녕하세요</h4>
				<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
				<p>
					<a class="btn btn-default" href="ExchangeList.jsp?ExchangeListName=list">자세히알아보기2</a>
				</p>
			</div>
			<div class="col-md-4">
				<h4>안녕하세요</h4>
				<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
				<p>
					<a class="btn btn-default" href="ExchangeList.jsp?ExchangeListName=list">자세히알아보기3</a>
				</p>
			</div>
		</div>
		<hr>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">
					<span class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp; 최신목록
				</h3>
			</div>
			<div class="media">
				<div class="media-left">
				<a href="#"><img class="media-object" src="images/minion.PNG" alt="미니언 이미지"></a>
				</div>
				<div class="media-body">
					<h4 class="media-heading"><a href="#">미니언 기본 이미지</a>&nbsp;<span class="badge">new</span></h4>
					aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
				</div>
			</div>
			<hr style="border: solid 2px black;">
			<div class="media">
				<div class="media-left">
				<a href="#"><img class="media-object" src="images/minion.PNG" alt="미니언 이미지"></a>
				</div>
				<div class="media-body">
					<h4 class="media-heading"><a href="ExchangeList.jsp?ExchangeListName=list">미니언 기본 이미지</a>&nbsp;<span class="badge">new</span></h4>
					aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
				</div>
			<hr>
			</div>
			<hr style="border: solid 2px black;">
			<div class="media">
				<div class="media-left">
				<a href="ExchangeList.jsp?ExchangeListName=list"><img class="media-object" src="images/minion.PNG" alt="미니언 이미지"></a>
				</div>
				<div class="media-body">
					<h4 class="media-heading"><a href="ExchangeList.jsp?ExchangeListName=list">미니언 기본 이미지</a>&nbsp;<span class="badge">new</span></h4>
					aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
				</div>
			</div>
		</div>
	</div>
	<hr>
	<footer style="background-color: #000000; color: #ffffff">
		<div class="container">
			<br>
			<div class="row">
				<div class="col-sm-2" style="text-align: center;">
					<h5>Copyright &copy; 2019</h5>
					<h5>이장희</h5>
				</div>
				<div class="col-sm-4">
					<p>gdgdgdgdgdgdgdgdgdg</p>
				</div>
			</div>
		</div>
	</footer>
	<div class="row">
		<!-- 모달은 한페이지에 나한의 클래스만 생성가능, 다른 모달 생성시 클래스 및 아이디 값을 다르게 해줘야됨 -->
		<div class="modal" id="modal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						내거특징
						<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body" style="text-align: center;">
						하이여ㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎ</div>
					<img src="images/minion.PNG" id="imagepreview"
						style="width: 256px; height: 256px;">
				</div>
			</div>
		</div>
	</div>
</body>
</html>