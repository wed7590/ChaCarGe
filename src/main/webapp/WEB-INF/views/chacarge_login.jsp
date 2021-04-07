<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">

<link rel="apple-touch-icon" type="image/png" href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png">
<meta name="apple-mobile-web-app-title" content="CodePen">

<link rel="shortcut icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico">

<link rel="mask-icon" type="" href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111">

<title>Chacarge_login</title>

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans">

<!-- login_form CSS - 표 양식 부분 -->
<link href="resources/css/login_form.css" rel="stylesheet">

<!-- 카카오 js -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

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
	<p class="tip"></p>
	<div class="cont">
		<div class="form sign-in">
			<h2>Welcome back,</h2>
			<form action="chacarge_login_ok.do" method="post" name="lfrm">
				<label>
					<span>ID</span>
					<input type="text" name="user_id">
				</label>
				<label>
					<span>Password</span>
					<input type="password" name="user_password">
				</label>
			</form>
			<button type="button" id="login" class="submit">Sign In</button>
			<div align="center">
				<a id="custom-login-btn" 
				href="https://kauth.kakao.com/oauth/authorize?client_id=cf6e51d95242afa1c0b94902ec143974&redirect_uri=http://27.96.131.8:8080/ChaCarGe/kakao.do&response_type=code" 
				style="left: 50px;" >
					<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222" style="border-radius: 20px;" }/>
				</a>
			</div>
			
			<!-- <button type="button"  class="fb-btn">Connect with <span>kakao</span></button> -->
		</div>
		<div class="sub-cont">
			<div class="img">
				<div class="img__text m--up">
					<h2>New here?</h2>
					<p>Sign up and discover great amount of new opportunities!</p>
				</div>
				<div class="img__text m--in">
					<h2>One of us?</h2>
					<p>If you already has an account, just sign in. We've missed you!</p>
				</div>
				<div class="img__btn">
					<span class="m--up">Sign Up</span>
					<span class="m--in">Sign In</span>
				</div>
			</div>
			<div class="form sign-up">
				<h2>Time to feel like home,</h2>
				<form action="chacarge_join_ok.do" method="post" name="jfrm">
					<label>
						<span>ID</span>
						<input type="text" name="user_join_id">
					</label>
					<label>
						<span>Password</span>
						<input type="password" name="user_join_password">
					</label>
					<label>
						<span>Name</span>
						<input type="text" name="user_join_name">
					</label>
					<label>
						<span>Email</span>
						<input type="text" name="user_join_email">
					</label>
				</form>	
				<button type="button" id="join" class="submit">Sign Up</button>
			</div>
		</div>
	</div>

	<script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>

	<script id="rendered-js">
		document.querySelector('.img__btn').addEventListener(
			'click',
			function() {
				document.querySelector('.cont').classList.toggle('s--signup');
			});
		//# sourceURL=pen.js
	</script>
	
	<script>
		var msg = "${msg}";
		if( msg === "join_ok" ) {
			alert( "회원가입이 완료되었습니다. 로그인해주세요~" );
		} else if( msg == "FAILURE" ) {
			alert( "아이디와 비밀번호를 확인해주세요." );
		}
	</script>

</body>
</html>