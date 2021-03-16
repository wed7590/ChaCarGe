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

<title>ChaCarGe - 차카게 관리자 페이지</title>

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
							<a class="dropdown-item" href="chacarge_admin_deal.do">매물 관리</a>
							<a class="dropdown-item" href="chacarge_admin_user.do">유저 관리</a>
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
		<h1 class="mt-4 mb-3">Sidebar Page <small>Subheading</small></h1>

	<!-- 페이지 경로 표시 -->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="chacarge_home.do">Home</a></li>
			<li class="breadcrumb-item"><a>관리자 페이지</a></li>
			<li class="breadcrumb-item active">매물 관리</li>
		</ol>

	<!-- 매물 관리 내용 부분 -->
		<!-- Content Row -->
		<div class="row">
		
		<!-- 사이드바 설정 -->
			<!-- Sidebar Column -->
			<div class="col-lg-3 mb-4">
				<div class="list-group">
					<a href="chacarge_admin_deal.do" class="list-group-item">매물 관리</a>
					<a href="chacarge_admin_user.do" class="list-group-item">유저 관리</a>
<!-- 					<a href="resources/index.html" class="list-group-item">Home</a>
					<a href="resources/about.html" class="list-group-item">About</a>
					<a href="resources/services.html" class="list-group-item">Services</a>
					<a href="resources/contact.html" class="list-group-item">Contact</a>
					<a href="resources/portfolio-1-col.html" class="list-group-item">1 Column	Portfolio</a>
					<a href="resources/portfolio-2-col.html" class="list-group-item">2 Column Portfolio</a>
					<a href="resources/portfolio-3-col.html" class="list-group-item">3 Column Portfolio</a>
					<a href="resources/portfolio-4-col.html" class="list-group-item">4 Column Portfolio</a>
					<a href="resources/portfolio-item.html" class="list-group-item">Single Portfolio Item</a>
					<a href="resources/blog-home-1.html" class="list-group-item">Blog Home 1</a>
					<a href="resources/blog-home-2.html" class="list-group-item">Blog Home 2</a>
					<a href="resources/blog-post.html" class="list-group-item">Blog Post</a>
					<a href="resources/full-width.html" class="list-group-item">Full Width Page</a>
					<a href="resources/sidebar.html" class="list-group-item active">Sidebar Page</a>
					<a href="resources/faq.html" class="list-group-item">FAQ</a>
					<a href="resources/404.html" class="list-group-item">404</a>
					<a href="resources/pricing.html" class="list-group-item">Pricing Table</a> -->
				</div>
			</div>
			
		<!-- 내용 설정 -->
			<!-- Content Column -->
			<div class="col-lg-9 mb-4">
				<h2>Section Heading</h2>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
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
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
