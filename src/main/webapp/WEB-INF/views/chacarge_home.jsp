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

<title>ChaCarGe</title>

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


<!-- header 부분 : 사진 이동 기능 포함된 곳 -->
	<header>
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<!-- Slide One - Set the background image for this slide in the line below -->
				<div class="carousel-item active" style="background-image: url('https://www.hyundai.com/static/images/model/tucson/20lc/tucson_highlights_side_and_walking_woman.jpg')">
					<div class="carousel-caption d-none d-md-block">
						<h3>First Slide</h3>
						<p>This is a description for the first slide.</p>
					</div>
				</div>
				<!-- Slide Two - Set the background image for this slide in the line below -->
				<div class="carousel-item" style="background-image: url('https://www.hyundai.com/static/images/model/tucson/20lc/tucson_highlights_interior_and_reading_books_man.jpg')">
					<div class="carousel-caption d-none d-md-block">
						<h3>Second Slide</h3>
						<p>This is a description for the second slide.</p>
					</div>
				</div>
				<!-- Slide Three - Set the background image for this slide in the line below -->
				<div class="carousel-item" style="background-image: url('https://www.hyundai.com/static/images/model/tucson/20lc/tucson_highlights_interior_and_writing_woman.jpg')">
					<div class="carousel-caption d-none d-md-block">
						<h3>Third Slide</h3>
						<p>This is a description for the third slide.</p>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</header>


<!-- 페이지 내용 -->
	<!-- Page Content -->
	<div class="container">
		<h1 class="my-4">Welcome to ChaCarGe</h1>

	<!-- Marketing Icons Section -->
		<div class="row">
			<div class="col-lg-4 mb-4">
				<div class="card h-100">
					<h4 class="card-header">유진영 팀장</h4>
					<div class="card-body">
						<p class="card-text">9501**-1******</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Learn More</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 mb-4">
				<div class="card h-100">
					<h4 class="card-header">장진동 차장</h4>
					<div class="card-body">
						<p class="card-text">9507**-1******</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Learn More</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 mb-4">
				<div class="card h-100">
					<h4 class="card-header">전환호 인턴</h4>
					<div class="card-body">
						<p class="card-text">9408**-1******</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Learn More</a>
					</div>
				</div>
			</div>
		</div>
	<!-- /.row -->

<%--
	<!-- Portfolio Section -->
		<h2>Portfolio Heading</h2>

		<div class="row">
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#">Project One</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#">Project Two</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#">Project Three</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#">Project Four</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#">Project Five</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#">Project Six</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
					</div>
				</div>
			</div>
		</div>
	<!-- /.row -->

	<!-- Features Section -->
		<div class="row">
			<div class="col-lg-6">
				<h2>Modern Business Features</h2>
				<p>The Modern Business template by Start Bootstrap includes:</p>
				<ul>
					<li><strong>Bootstrap v4</strong></li>
					<li>jQuery</li>
					<li>Font Awesome</li>
					<li>Working contact form with validation</li>
					<li>Unstyled page elements for easy customization</li>
				</ul>
				<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
			</div>
			<div class="col-lg-6">
				<img class="img-fluid rounded" src="http://placehold.it/700x450" alt="">
			</div>
		</div>
	<!-- /.row -->

		<hr>

--%>


	<!-- 이 부분 빠지면  Footer 설정이 이상해짐 -->
	<!-- Call to Action Section -->
		<div class="row mb-4">
			<div class="col-md-8">
				<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
			</div>
			<div class="col-md-4">
				<a class="btn btn-lg btn-secondary btn-block" href="#">Call to Action</a>
			</div>
		</div>

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
