<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Sign Up</title>
<!-- CSS -->
<link rel="stylesheet" href="../css/signup.css" />
<!-- Google Fonts: Noto Sans Korean -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet" />
</head>
<body>
	<div class="container">
		<div class="title">
			<h1>회원가입</h1>
		</div>
		<img src="./img/weight-loss.png" alt="SSAFIT Icon" class="icon" />
		<div class="userId">
			<input type="text" id="userId" placeholder="🖊 아이디를 입력해주세요." required />
			<div id="idError" class="error"></div>
		</div>
		<div class="name">
			<input type="text" id="name" placeholder="🖊 이름을 입력해주세요." required />
			<div id="nameError" class="error"></div>
		</div>
		<div class="email">
			<input type="email" id="email" placeholder="📧 이메일을 입력해주세요." required />
			<div id="emailError" class="error"></div>
		</div>
		<div class="password">
			<input type="password" id="password" placeholder="🔒 비밀번호를 입력해주세요."
				required />
			<div id="passwordError" class="error"></div>
		</div>
		<div class="passwordCheck">
			<input type="password" id="passwordCheck"
				placeholder="🔐 비밀번호를 다시 입력해주세요." required />
			<div id="passwordCheckError" class="error"></div>
		</div>
		<div class="signUp">
			<button id="signUpBtn">가입</button>
			<button id="cancelBtn">취소</button>
		</div>
	</div>
	<script src="./js/sign.js"></script>
</body>
</html>