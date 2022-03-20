<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>SSAFIT</title>
<!-- BootStrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />
<link rel="stylesheet" href="./css/main.css" />
<!-- Google Fonts: Noto Sans Korean -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet" />
</head>
<body>
	<div id="wrapper">
		<!-- Header -->
		<header>
			<!-- 상단 메뉴 -->
			<nav class="navbar sticky-top navbar-dark">
				<div class="container-fluid">
					<button class="navbar-toggler" type="button"
						data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
						aria-controls="offcanvasNavbar">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="offcanvas offcanvas-start" tabindex="-1"
						id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
						<div class="offcanvas-header">
							<h5 class="offcanvas-title" id="offcanvasNavbarLabel">메뉴</h5>
							<button type="button" class="btn-close text-reset"
								data-bs-dismiss="offcanvas" aria-label="Close"></button>
						</div>
						<div class="offcanvas-body">
							<ul class="sideMenu justify-content-end flex-grow-1 pe-3">
								<li class="nav-item" id="zzimTitle">찜영상</li>
								<li class="nav-item">
									<div id="zzimVideo"></div>
								</li>
							</ul>
						</div>
					</div>
					<a class="navbar-brand" href="./main"> SSAFIT <img
						src="./img/weight-loss.png" alt="SSAFIT Logo" width="40"
						height="40" class="d-inline-block align-text-top" />
					</a>
					<form class="d-flex" method="GET" action="./search">
						<input class="form-control me-lg-2" type="search"
							placeholder="Search" aria-label="Search" style="width: 500px"
							id="search-input" name="keyword" />
						<button class="btn btn-outline-light" type="submit" id="search" onclick="location.href='/seach?keyword=${keyword}'">Search</button>
					</form>
					<!-- 로그인시 팝업 -->
					<div class="loginWrapper">
						<p id="curUser"></p>
						<button class="btn" data-bs-toggle="modal"
							data-bs-target="#exampleModal">
							<img src="./img/login.png" alt="SSAFIT Logo" width="30"
								height="30" class="d-inline-block align-text-top" id="loginIcon" />
						</button>
					</div>
				</div>
			</nav>
		</header>

		<!-- 로그인 Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">로그인</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form>
							<div class="mb-3">
								<label for="userID" class="col-form-label">아이디</label> <input
									type="text" class="form-control" id="userID"
									placeholder="아이디를 입력하세요.">
							</div>
							<div class="mb-3">
								<label for="password" class="col-form-label">비밀번호</label> <input
									type="password" class="form-control" id="password"
									placeholder="비밀번호를 입력하세요.">
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" id="login">로그인</button>
					</div>
					<hr>
					<p>
						SSAFIT이 처음이신가요? <a href="./signup.html">회원가입</a>
					</p>
				</div>
			</div>
		</div>

		<!-- Main -->
		<main>
			<!-- 주요 내용 -->
			<div class="container">
				<!-- 버튼 -->
				<div class="d-flex justify-content-evenly" id="category-area">
					<button type="button" class="btn btn-outline-secondary category"
						id="all" onclick="location.href='main?id=all'">전체</button>
					<button type="button" class="btn btn-outline-secondary category"
						id="body" onclick="location.href='main?id=body'">전신</button>
					<button type="button" class="btn btn-outline-secondary category"
						id="top" onclick="location.href='main?id=top'">상체</button>
					<button type="button" class="btn btn-outline-secondary category"
						id="bottom" onclick="location.href='main?id=bottom'">하체</button>
					<button type="button" class="btn btn-outline-secondary category"
						id="stomach" onclick="location.href='main?id=stomach'">복부</button>
				</div>
				

				<!-- 비디오 구역 -->
				<div class="d-flex flex-wrap justify-content-lg-evenly">
				<c:forEach items="${ videos }" var="video">
				<div id="video-area"
					class="d-flex flex-wrap justify-content-lg-evenly">
					<a href="detail?id=${video.id}">
					<div class="card">
					<iframe width="560" height="315" src="${video.url}" title="YouTube video player" 
		                frameborder="0" 
		                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
		                allowfullscreen></iframe>
		            <div>${video.title}</div>
					</div>
					</a>
				</div>
				</c:forEach>
				</div>
			</div>
		</main>
	</div>


	<!-- Footer -->
	<footer
		class="d-flex flex-wrap justify-content-between align-items-center py-2 border-top"
		style="background-color: #DEDEDC; margin-bottom: 0;">
		<div class="col-md-5 d-flex align-items-center"
			style="margin-left: 30px;">
			<span class="text-muted">© 2022 웬만해선 그들을 막을 수 없다, Inc</span>
		</div>

		<ul class="nav col-md-3 justify-content-end list-unstyled d-flex">
			<li class="ms-3"><a class="text-muted"
				href="https://github.com/ParkSunA"><img class="bi"
					width="24" height="24" src="./img/github.png"> </img></a></li>
			<li class="ms-3"><a class="text-muted"
				href="https://github.com/minoarchive" style="margin-right: 30px;"><img
					class="bi" width="24" height="24" src="./img/github.png"> </img></a></li>
		</ul>
	</footer>
	<!-- <script src="./js/main.js"></script> -->
	<!-- BootStrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>