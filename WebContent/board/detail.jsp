<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Detail</title>
<!-- BootStrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous" />
<link rel="stylesheet" href="./css/detail.css" />
<!-- Google Fonts: Noto Sans Korean -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet" />
</head>
<body>
	<div id="wrapper">
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
					<a class="navbar-brand" href="./index.html"> SSAFIT <img
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
							data-bs-target="#loginModal">
							<img src="./img/login.png" alt="SSAFIT Logo" width="30"
								height="30" class="d-inline-block align-text-top" id="loginIcon" />
						</button>
					</div>
				</div>
			</nav>
		</header>

		<!-- 로그인 Modal -->
		<div class="modal fade" id="loginModal" tabindex="-1"
			aria-labelledby="loginModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="loginModalLabel">로그인</h5>
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

		<!-- 주요 내용 -->
		<main>
			<div class="cotainer">
				<div id="video-area">
					<iframe width="840" height="473" src="${video.url}"
						title="YouTube video player" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen class="rounded mx-auto d-block"></iframe>
				</div>
				<div class="detail d-flex justify-content-center">
					<div class="title-info">
						<p id="title"></p>
						<p id="date"></p>
					</div>
					<div class="icon d-flex justify-content-evenly align-items-center">
						<button id="zzim" class="btn">찜</button>
						<button type="button" class="btn" data-bs-toggle="modal"
							data-bs-target="#writeModal" data-bs-whatever="@mdo">글
							작성</button>
					</div>
				</div>
			</div>
			<hr />
			<div class="comment_wrap">
				<div class="comment">
				<c:forEach items="${ reviews }" var="review">
					<div class="reviewWrap">
						<div class='userInfo'>
							<div class='idAndDate'>
								<div id="userName_${review.no}">${review.userName}</div>
								<div id="reviewDate_${review.no}">${review.date}</div>
							</div>
							<div id="text_${review.no}">${review.text}</div>
						</div>
						<div class="btnWrap">
						<form name="question" method="get" action="review?reviewId=${review.no}">
						    <input type="hidden" name="videoId" value="${video.id}"/>
						    <input type="hidden" name="reviewId" value="${review.no}"/>
						    <button type="submit" class="btn removeReview">삭제</button>
						</form>
							<button type="button" class="btn editReview"
								data-bs-toggle="modal" data-bs-target="#editModal_${review.no }"
								data-bs-whatever="@mdo" name="${review.no}">수정</button>
								
									<!-- 수정 Modal 데이터 -->
									<div class="modal fade" id="editModal_${review.no }" tabindex="-1"
										aria-labelledby="editModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="editModalLabel">글 수정</h5>
													<button type="button" class="btn-close" data-bs-dismiss="modal"
														aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<form action="modifyReview" method="post" id="edit">
														<input type="hidden" name="videoId" value="${video.id}"/>
														<input type="hidden" name="MreviewId" value="${review.no}"/>													
														<div class="mb-3">
															<label for="recipient-name" class="col-form-label">${review.no}+아이디:</label>
															<input type="text" class="form-control" id="recipient-name" name="Mname"
																value="${ review.userName }" />
														</div>
														<div class="mb-3">
															<label for="message-text" class="col-form-label">글:</label>
															<textarea class="form-control" id="message-text" name="content">${ review.text }</textarea>
														</div>
														<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-bs-dismiss="modal">Close</button>
													<button form="edit" type="submit" class="btn btn-primary"
														data-bs-dismiss="modal" id="editSaveReview">수정하기</button>
												</div>
													</form>
												</div>
												
											</div>
										</div>
									</div>
								</div>
								<!-- 수정모달끝 -->						
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</main>
		<!-- Modal 데이터 -->
		<div class="modal fade" id="writeModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="writeModalLabel">글 작성</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form action="review" method="POST">
							<input type="hidden" name="videoId" value="${video.id}">
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">아이디:</label>
								<input type="text" class="form-control" id="recipient-name" name="userId" />
							</div>
							<div class="mb-3">
								<label for="message-text" class="col-form-label">글:</label>
								<textarea class="form-control" id="message-text" name="text"></textarea>
							</div>
					<!-- 	</form> -->
<!-- 					</div> -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
				<!-- 		<form action="review" method="POST"> -->
						<button type="submit" class="btn btn-primary"
							data-bs-dismiss="modal" id="saveReview">저장하기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- 수정 Modal 데이터 -->
		<div class="modal fade" id="editModal" tabindex="-1"
			aria-labelledby="editModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="editModalLabel">글 수정</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form action="put" method="post">
							<input type="hidden" name="no" value="${ videoId }}">
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">아이디:</label>
								<input type="text" class="form-control" id="recipient-name"
									value="${ review.userName }" />
							</div>
							<div class="mb-3">
								<label for="message-text" class="col-form-label">글:</label>
								<textarea class="form-control" id="message-text"
									value="${ review.text }"></textarea>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary"
							data-bs-dismiss="modal" id="editSaveReview">수정하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Footer -->
	<footer
		class="d-flex flex-wrap justify-content-between align-items-center py-2 border-top"
		style="background-color: #DEDEDC; margin-bottom: 0; bottom: 0;">
		<div class="col-md-5 d-flex align-items-center"
			style="margin-left: 30px;">
			<span class="text-muted">© 2022 웬만해선 그들을 막을 수 없다, Inc</span>
		</div>

		<ul class="nav col-md-3 justify-content-end list-unstyled d-flex">
			<li class="ms-3"><a class="text-muted"
				href="https://github.com/ParkSunA"><img class="bi" width="24"
					height="24" src="./img/github.png"> </img></a></li>
			<li class="ms-3"><a class="text-muted"
				href="https://github.com/minoarchive" style="margin-right: 30px;"><img
					class="bi" width="24" height="24" src="./img/github.png"> </img></a></li>
		</ul>
	</footer>
	<script src="./js/detail.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>