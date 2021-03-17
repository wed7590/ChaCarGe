<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">

<link rel="apple-touch-icon" type="image/png"
	href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png">
<meta name="apple-mobile-web-app-title" content="CodePen">

<link rel="shortcut icon" type="image/x-icon"
	href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico">

<link rel="mask-icon" type=""
	href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg"
	color="#111">

<title>Chacarge_login</title>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans">

<style>
*, *:before, *:after {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	font-family: "Open Sans", Helvetica, Arial, sans-serif;
	background: #ededed;
}

input, button {
	border: none;
	outline: none;
	background: none;
	font-family: "Open Sans", Helvetica, Arial, sans-serif;
}

.tip {
	font-size: 20px;
	margin: 40px auto 50px;
	text-align: center;
}

.cont {
	overflow: hidden;
	position: relative;
	width: 900px;
	height: 550px;
	margin: 0 auto 100px;
	background: #fff;
}

.form {
	position: relative;
	width: 640px;
	height: 100%;
	transition: transform 1.2s ease-in-out;
	padding: 50px 30px 0;
}

.sub-cont {
	overflow: hidden;
	position: absolute;
	left: 640px;
	top: 0;
	width: 900px;
	height: 100%;
	padding-left: 260px;
	background: #fff;
	transition: transform 1.2s ease-in-out;
}

.cont.s--signup .sub-cont {
	transform: translate3d(-640px, 0, 0);
}

button {
	display: block;
	margin: 0 auto;
	width: 260px;
	height: 36px;
	border-radius: 30px;
	color: #fff;
	font-size: 15px;
	cursor: pointer;
}

.img {
	overflow: hidden;
	z-index: 2;
	position: absolute;
	left: 0;
	top: 0;
	width: 260px;
	height: 100%;
	padding-top: 360px;
}

.img:before {
	content: "";
	position: absolute;
	right: 0;
	top: 0;
	width: 900px;
	height: 100%;
	background-image:
		url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/142996/sections-3.jpg");
	background-size: cover;
	transition: transform 1.2s ease-in-out;
}

.img:after {
	content: "";
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.6);
}

.cont.s--signup .img:before {
	transform: translate3d(640px, 0, 0);
}

.img__text {
	z-index: 2;
	position: absolute;
	left: 0;
	top: 50px;
	width: 100%;
	padding: 0 20px;
	text-align: center;
	color: #fff;
	transition: transform 1.2s ease-in-out;
}

.img__text h2 {
	margin-bottom: 10px;
	font-weight: normal;
}

.img__text p {
	font-size: 14px;
	line-height: 1.5;
}

.cont.s--signup .img__text.m--up {
	transform: translateX(520px);
}

.img__text.m--in {
	transform: translateX(-520px);
}

.cont.s--signup .img__text.m--in {
	transform: translateX(0);
}

.img__btn {
	overflow: hidden;
	z-index: 2;
	position: relative;
	width: 100px;
	height: 36px;
	margin: 0 auto;
	background: transparent;
	color: #fff;
	text-transform: uppercase;
	font-size: 15px;
	cursor: pointer;
}

.img__btn:after {
	content: "";
	z-index: 2;
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	border: 2px solid #fff;
	border-radius: 30px;
}

.img__btn span {
	position: absolute;
	left: 0;
	top: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	height: 100%;
	transition: transform 1.2s;
}

.img__btn span.m--in {
	transform: translateY(-72px);
}

.cont.s--signup .img__btn span.m--in {
	transform: translateY(0);
}

.cont.s--signup .img__btn span.m--up {
	transform: translateY(72px);
}

h2 {
	width: 100%;
	font-size: 26px;
	text-align: center;
}

label {
	display: block;
	width: 260px;
	margin: 25px auto 0;
	text-align: center;
}

label span {
	font-size: 12px;
	color: #cfcfcf;
	text-transform: uppercase;
}

input {
	display: block;
	width: 100%;
	margin-top: 5px;
	padding-bottom: 5px;
	font-size: 16px;
	border-bottom: 1px solid rgba(0, 0, 0, 0.4);
	text-align: center;
}

.forgot-pass {
	margin-top: 15px;
	text-align: center;
	font-size: 12px;
	color: #cfcfcf;
}

.submit {
	margin-top: 40px;
	margin-bottom: 20px;
	background: #d4af7a;
	text-transform: uppercase;
}

.fb-btn {
	border: 2px solid #d3dae9;
	color: #8fa1c7;
}

.fb-btn span {
	font-weight: bold;
	color: #455a81;
}

.sign-in {
	transition-timing-function: ease-out;
}

.cont.s--signup .sign-in {
	transition-timing-function: ease-in-out;
	transition-duration: 1.2s;
	transform: translate3d(640px, 0, 0);
}

.sign-up {
	transform: translate3d(-900px, 0, 0);
}

.cont.s--signup .sign-up {
	transform: translate3d(0, 0, 0);
}

.icon-link {
	position: absolute;
	left: 5px;
	bottom: 5px;
	width: 32px;
}

.icon-link img {
	width: 100%;
	vertical-align: top;
}

.icon-link--twitter {
	left: auto;
	right: 5px;
}
</style>

<script>
	window.console = window.console || function(t) {
	};
</script>

<script>
	if (document.location.search.match(/type=embed/gi)) {
		window.parent.postMessage("resize", "*");
	}
</script>

<script type="text/javascript">
	window.onload = function() {
		document.getElementById('login').onclick = function() {
			if( document.lfrm.user_id.value.trim() == '' ) {
				alert('아이디를 입력 하셔야 합니다.');
				return false;
			}

			if( document.lfrm.user_password.value.trim() == '' ) {
				alert('비밀번호를 입력하셔야 합니다.');
				return false;
			}

			document.lfrm.submit();
		};
		
		document.getElementById('join').onclick = function() {
			if( document.jfrm.user_join_id.value.trim() == '' ) {
				alert('아이디를 입력 하셔야 합니다.');
				return false;
			}

			if( document.jfrm.user_join_password.value.trim() == '' ) {
				alert('비밀번호를 입력하셔야 합니다.');
				return false;
			}
			
			if( document.jfrm.user_join_name.value.trim() == '' ) {
				alert('이름을 입력하셔야 합니다.');
				return false;
			}
			
			if( document.jfrm.user_join_email.value.trim() == '' ) {
				alert('이메일을 입력하셔야 합니다.');
				return false;
			}

			document.jfrm.submit();
		};
		
	};
</script>

</head>

<body translate="no">
	<p class="tip">Click on button in image container</p>
	<div class="cont">
		<div class="form sign-in">
			<h2>Welcome back,</h2>
			<form action="chacarge_login_ok.do" method="get" name="lfrm">
				<label> <span>ID</span> <input type="text" name="user_id"> </label>
				<label> <span>Password</span> <input type="password" name="user_password"> </label>
			</form>
			<p class="forgot-pass">Forgot password?</p>
			<button type="button" id="login" class="submit">Sign In</button>
			<button type="button" class="fb-btn">
				Connect with <span>kakao</span>
			</button>
		</div>
		<div class="sub-cont">
			<div class="img">
				<div class="img__text m--up">
					<h2>New here?</h2>
					<p>Sign up and discover great amount of new opportunities!</p>
				</div>
				<div class="img__text m--in">
					<h2>One of us?</h2>
					<p>If you already has an account, just sign in. We've missed
						you!</p>
				</div>
				<div class="img__btn">
					<span class="m--up">Sign Up</span> <span class="m--in">Sign
						In</span>
				</div>
			</div>
			<div class="form sign-up">
				<h2>Time to feel like home,</h2>
				<form action="chacarge_join_ok.do" method="get" name="jfrm">
					<label> <span>ID</span> <input type="text" name="user_join_id"> </label>
					<label> <span>Password</span> <input type="password" name="user_join_password"> </label>
					<label> <span>Name</span> <input type="text" name="user_join_name"> </label>
					<label> <span>Email</span> <input type="text" name="user_join_email"> </label>
				</form>	
				<button type="button" id="join" class="submit">Sign Up</button>
				<button type="button" class="fb-btn">
					Join with <span>kakao</span>
				</button>
			</div>
		</div>
	</div>

	<script
		src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>

	<script id="rendered-js">
		document.querySelector('.img__btn').addEventListener(
				'click',
				function() {
					document.querySelector('.cont').classList
							.toggle('s--signup');
				});
		//# sourceURL=pen.js
	</script>

</body>
</html>