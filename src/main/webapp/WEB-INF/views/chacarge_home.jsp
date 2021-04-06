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

<%@ include file="header.jsp" %>

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
					</div>
				</div>
				<!-- Slide Two - Set the background image for this slide in the line below -->
				<div class="carousel-item" style="background-image: url('https://www.hyundai.com/static/images/model/tucson/20lc/tucson_highlights_interior_and_reading_books_man.jpg')">
					<div class="carousel-caption d-none d-md-block">
					</div>
				</div>
				<!-- Slide Three - Set the background image for this slide in the line below -->
				<div class="carousel-item" style="background-image: url('https://www.hyundai.com/static/images/model/tucson/20lc/tucson_highlights_interior_and_writing_woman.jpg')">
					<div class="carousel-caption d-none d-md-block">
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
			<div class="col-lg-3 mb-3">
				<div class="card h-100">
					<h4 class="card-header">유진영 팀장</h4>
					<div class="card-body">
						<p class="card-text">9501**-1******</p>
					</div>
					<div class="card-footer">
						<a href="https://github.com/wed7590" class="btn btn-primary">GitHub</a>
					</div>
				</div>
			</div>
			<div class="col-lg-3 mb-3">
				<div class="card h-100">
					<h4 class="card-header">윤동하 부장</h4>
					<div class="card-body">
						<p class="card-text">8806**-1******</p>
					</div>
					<div class="card-footer">
						<a href="https://github.com/yeastriver" class="btn btn-primary">GitHub</a>
					</div>
				</div>
			</div>
			<div class="col-lg-3 mb-3">
				<div class="card h-100">
					<h4 class="card-header">장진동 차장</h4>
					<div class="card-body">
						<p class="card-text">9507**-1******</p>
					</div>
					<div class="card-footer">
						<a href="https://github.com/Jindong-Jang" class="btn btn-primary">GitHub</a>
					</div>
				</div>
			</div>
			<div class="col-lg-3 mb-3">
				<div class="card h-100">
					<h4 class="card-header">전환호 인턴</h4>
					<div class="card-body">
						<p class="card-text">9408**-1******</p>
					</div>
					<div class="card-footer">
						<a href="https://github.com/shinytiger94" class="btn btn-primary">GitHub</a>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- /.container -->

<%@ include file="footer.jsp" %>

	<!-- Bootstrap core JavaScript -->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
