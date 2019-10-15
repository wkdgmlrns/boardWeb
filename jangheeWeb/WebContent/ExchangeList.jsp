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
<style type="text/css">
	blockquote{
		bockground:#f9f9f9;
		border-left:10px solid #cccccc;
		margin: 1.5em 10px;
		padding: 0.5em 10px;
		quotes:"\201C""\201D""\2018""\2019";
	}
	blockquote:before{
	color:#cccccc;
	content:open-quote;
	font-size:3em;
	line-height:0.1em;
	margin-left:0.25em;
	vertical-align:-0.4em;
	}
	blockquote:after{
	color:#cccccc;
	content:close-quote;
	font-size:3em;
	line-height:0.1em;
	margin-left:0.25em;
	vertical-align:-0.4em;
	}
</style>
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
					<li class="active"><a href="index.jsp">소개<span
							class="sr-only"></span></a></li>
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
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">
							<span class="glyphicon glyphicon-tags"></span>&nbsp;&nbsp; 이장희
						</h3>
					</div>
					<div class="panel-body">
						<div class="media">
							<div class="media-left">
								<a href="#"> <img class="media-object"
									src="images/minion.PNG" alt="미니언 이미지">
								</a>
							</div>
							<div class="media-body">
								<h4 class="media-heading">이장희</h4>
								<br> 내 사이트에염
							</div>
						</div>
					</div>
					<table class="table">
						<thead>
							<tr>
								<th>강사명</th>
								<th>강의 제목</th>
								<th>강의 날짜</th>
								<th>강의 번호</th>
							</tr>
						</thead>
						<tbody>
							<tr>
							<td> 이장희</td>
							<td>1</td>
							<td><a href="board.jsp?boardName=board">보드게시판</a></td>
							</tr>
						</tbody>
					</table>
					<div class="panel-footer">
					<blockquote>&nbsp;&nbsp;천천히 가도 거꾸로 가지만 말자</blockquote>
					</div>
				</div>
			</div>
		</div>
	</div>
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