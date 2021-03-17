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

<!-- 게시글 작성 버튼 css -->
<style>

.styled {
    border: 0;
    line-height: 2.5;
    padding: 0 20px;
    font-size: 1rem;
    text-align: center;
    color: #fff;
    text-shadow: 1px 1px 1px #000;
    border-radius: 10px;
    background-color: rgba(220, 0, 0, 1);
    background-image: linear-gradient(to top left,
                                      rgba(0, 0, 0, .2),
                                      rgba(0, 0, 0, .2) 30%,
                                      rgba(0, 0, 0, 0));
    box-shadow: inset 2px 2px 3px rgba(255, 255, 255, .6),
                inset -2px -2px 3px rgba(0, 0, 0, .6);
}

.styled:hover {
    background-color: rgba(255, 0, 0, 1);
}

.styled:active {
    box-shadow: inset -2px -2px 3px rgba(255, 255, 255, .6),
                inset 2px 2px 3px rgba(0, 0, 0, .6);
}

</style>

<!-- 게시글 작성 버튼 -->
<a href="chacarge_deal_write.do"> 
<button class="favorite styled"
        type="button">
게시글 작성
</button>

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
		<h1 class="mt-4 mb-3"> 차량 매물 <small>Subheading</small></h1>
		
	<!-- 페이지 경로 표시 -->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="chacarge_home.do">Home</a></li>
			<li class="breadcrumb-item active">차량 매물</li>
		</ol>

	<!-- 매물 입력 부분 -->
		<div class="row">
			<div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="chacarge_deal_view.do"><img class="card-img-top" src="https://www.hyundai.com/static/images/model/tucson/20lc/tucson_highlights_usp_inspiration_back_side.jpg" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="chacarge_deal_view.do">현대 Tucson 2016</a>
						</h4>
						<p class="card-text">5억 정도 합니다. 당장 사세요. 안사면 죽임!!</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="chacarge_deal_view.do"><img class="card-img-top" src="https://www.hyundai.com/static/images/lineUp/SEDAN/IG08_EXT.jpg" object-fit: contain; alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="chacarge_deal_view.do">현대  Grandeur</a>
						</h4>
						<p class="card-text">성공을 새롭게 정의하다 기존의 룰을 깨고 새로운 성공의 방정식을 써 내려가는 당신에게, 그랜저는 새로운 성공의 기준을 제시합니다.</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top" src="https://w.namu.la/s/86bf41404adee6fd5433474abf91b9a0be3798ac896580763a411e0db216b953dc56a27a7bceb9dfdea60f4839d3279cf57f7e128105f3bbca6972fce46ae64a17beb9401662f9acaba86a2add057088eb78417f3f84882e10dfd4017352cfb2351e827223e89398414a65568702bfdc" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="chacarge_deal_view.do">도요타 going메리호 </a>
						</h4>
						<p class="card-text">가자 올블루로 </p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top" src="https://t1.daumcdn.net/cfile/tistory/220ED43A593C00B836" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="chacarge_deal_view.do">혼다  모비딕호</a>
						</h4>
						<p class="card-text">원피스는 ... 실존한다</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="chacarge_deal_view.do">현대 Tucson 2016</a>
						</h4>
						<p class="card-text">5억 정도 합니다. 당장 사세요. 안사면 죽임!!</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="chacarge_deal_view.do">현대 Tucson 2016</a>
						</h4>
						<p class="card-text">5억 정도 합니다. 당장 사세요. 안사면 죽임!!</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="chacarge_deal_view.do">현대 Tucson 2016</a>
						</h4>
						<p class="card-text">5억 정도 합니다. 당장 사세요. 안사면 죽임!!</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="chacarge_deal_view.do">현대 Tucson 2016</a>
						</h4>
						<p class="card-text">5억 정도 합니다. 당장 사세요. 안사면 죽임!!</p>
					</div>
				</div>
			</div>
		</div>


<!-- 페이징 부분 -->
		<!-- Pagination -->
		<ul class="pagination justify-content-center">
			<li class="page-item">
				<a class="page-link" href="#" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
					<span class="sr-only">Previous</span>
				</a>
			</li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item">
				<a class="page-link" href="#" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
					<span class="sr-only">Next</span>
				</a>
			</li>
		</ul>
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
