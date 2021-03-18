<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>ChaCarGe - 차카게 차량 매물</title>

<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/modern-business.css" rel="stylesheet">

</head>

<body>

<!-- 최상단 Navigation 메뉴 부분  -  모든 페이지 공통 -->
	<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
	<!-- 왼쪽의 페이지 이름 : 클릭시 시작 페이지로 이동 -->
			<a class="navbar-brand" href="chacarge_home.do">ChaCarGe</a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
	<!-- 오른쪽의 이동 메뉴 : 클릭시 해당 페이지로 이동 -->
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="chacarge_estimate.do">차량 견적</a></li>
					<li class="nav-item"><a>&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
					<li class="nav-item"><a class="nav-link" href="chacarge_deal_list.do">차량 매물</a></li>
					<li class="nav-item"><a>&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">관리자 페이지</a>
						<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="chacarge_admin_user.do">유저 관리</a>
							<a class="dropdown-item" href="chacarge_admin_deal.do">매물 관리</a>
							<a class="dropdown-item" href="chacarge_admin_statistics.do">통계</a>
						</div>
					</li>
					<li class="nav-item"><a>&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
					<li class="nav-item"><a class="nav-link" href="chacarge_login.do">로그인</a></li>
				</ul>
			</div>
		</div>
	</nav>


<!-- 페이지 내용 -->
	<!-- Page Content -->
	<div class="container">

	<!-- 페이지 제목 -->
		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">Portfolio Item <small>Subheading</small></h1>

	<!-- 페이지 경로 표시 -->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="chacarge_home.do">Home</a></li>
			<li class="breadcrumb-item"><a href="chacarge_deal_list.do">차량 매물</a></li>
			<li class="breadcrumb-item active">현대 Tucson 2016</li>
		</ol>

	<!-- 매물 설명 부분 -->
		<!-- Portfolio Item Row -->
		<div class="row">

		<!-- 사진 부분 -->
			<div class="col-md-8"><img class="img-fluid" src="http://www.autoherald.co.kr/news/photo/201910/36137_59995_61.jpg" weight="300" height="400" alt=""></div>

		<!-- 설명 부분 -->
			<div class="col-md-4">
				<h3 class="my-3">현대 Tucson 2016</h3>
				<p>이 차는 영국에서 최초로 시작되어 일년에 한 바퀴 돌면서 받는 사람에게 행운을 주었고 지금은 당신에게로 옮겨진 이 차는 4일 안에 당신 곁을 떠나야 합니다. 이 차를 포함해서...(더보기)</p>
				<h3 class="my-3">Project Details</h3>
				<ul>
					<li>Lorem Ipsum</li>
					<li>Dolor Sit Amet</li>
					<li>Consectetur</li>
					<li>Adipiscing Elit</li>
				</ul>
			</div>

		</div>
		<!-- /.row -->


<!-- 관련 매물 표시 부분 -->
		<!-- Related Projects Row -->
		<h3 class="my-4">관련 매물</h3>
		<div class="row">
			<div class="col-md-3 col-sm-6 mb-4">
				<a href="#"> <img class="img-fluid"	src="http://placehold.it/500x300" alt=""></a>
			</div>
			<div class="col-md-3 col-sm-6 mb-4">
				<a href="#"> <img class="img-fluid"	src="http://placehold.it/500x300" alt=""></a>
			</div>
			<div class="col-md-3 col-sm-6 mb-4">
				<a href="#"> <img class="img-fluid"	src="http://placehold.it/500x300" alt=""></a>
			</div>
			<div class="col-md-3 col-sm-6 mb-4">
				<a href="#"> <img class="img-fluid"	src="http://placehold.it/500x300" alt=""></a>
			</div>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->


<!-- 하단부 Footer 부분 -->
	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; ChaCarGe 2021</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
