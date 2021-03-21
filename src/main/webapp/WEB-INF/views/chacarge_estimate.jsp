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

<title>ChaCarGe - 차카게 차량 견적</title>

<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/modern-business.css" rel="stylesheet">
<style>
.grid-container {
  display: grid;
  grid-template-columns: auto auto auto auto;
  grid-gap: 10px;
  background-color: #f2f2f2;
  padding: 10px;
}

.grid-container > div {
  background-color: rgba(255, 255, 255, 0.8);
  border: 1px solid black;
  text-align: center;
  font-size: 30px;
  
}
.img-fluid rounded mb-4 {
  padding: 15px;
  border: 1px solid red;
  width: 30%;
  float: right;
  padding: 15px;
  border: 1px solid red;

}
.select_list {
  padding: 15px;
  border: 1px solid red;
  width: 70%;
  float: right;
  padding: 15px;
  border: 1px solid red;
}

</style>
</head>

<body>

<%@ include file="header.jsp" %>

	<!-- 페이지 내용 -->
	<!-- Page Content -->
	<div class="container">

		<!-- 페이지 제목 -->
		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">
			차량 견적 <small>Subheading</small>
		</h1>

		<!-- 페이지 경로 표시 -->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="chacarge_home.do">Home</a></li>
			<li class="breadcrumb-item active">차량 견적</li>
		</ol>

		<!-- 이미지 입력 부분 -->
		<!-- Image Header -->

						<div class="grid-container">

						<li><label><input type="checkbox"
								class="segment segment_C" name="segment[]" id="" value="C"><span><a
									href="#" class="eFincPopup" kind="dictionary" subject="용어 설명"
									val="402" onclick="return false;">아반테</a></span></label></li>
						<li><label><input type="checkbox"
								class="segment segment_PC1" name="segment[]" id="" value="PC1"><span><a
									href="#" class="eFincPopup" kind="dictionary" subject="용어 설명"
									val="403" onclick="return false;">소나타</a></span></label></li>
						<li><label><input type="checkbox"
								class="segment segment_PC2" name="segment[]" id="" value="PC2"><span><a
									href="#" class="eFincPopup" kind="dictionary" subject="용어 설명"
									val="404" onclick="return false;">그랜져</a></span></label></li>
						<li><label><input type="checkbox"
								class="segment segment_PC3" name="segment[]" id="" value="PC3"><span><a
									href="#" class="eFincPopup" kind="dictionary" subject="용어 설명"
									val="405" onclick="return false;">벨로스터</a></span></label></li>
						<li><label><input type="checkbox"
								class="segment segment_PC4" name="segment[]" id="" value="PC4"><span><a
									href="#" class="eFincPopup" kind="dictionary" subject="용어 설명"
									val="406" onclick="return false;">베뉴</a></span></label></li>
						<li><label><input type="checkbox"
								class="segment segment_PC5" name="segment[]" id="" value="PC5"><span><a
									href="#" class="eFincPopup" kind="dictionary" subject="용어 설명"
									val="407" onclick="return false;">코나</a></span></label></li>
						<li><label><input type="checkbox"
								class="segment segment_PC5" name="segment[]" id="" value="PC6"><span><a
									href="#" class="eFincPopup" kind="dictionary" subject="용어 설명"
									val="407" onclick="return false;">투싼</a></span></label></li>
						<li><label><input type="checkbox"
								class="segment segment_PC2" name="segment[]" id="" value="PC7"><span><a
									href="#" class="eFincPopup" kind="dictionary" subject="용어 설명"
									val="404" onclick="return false;">싼타페</a></span></label></li>
						<li><label><input type="checkbox"
								class="segment segment_PC3" name="segment[]" id="" value="PC8"><span><a
									href="#" class="eFincPopup" kind="dictionary" subject="용어 설명"
									val="405" onclick="return false;">펠리세이드</a></span></label></li>
						<li><label><input type="checkbox"
								class="segment segment_PC4" name="segment[]" id="" value="PC9"><span><a
									href="#" class="eFincPopup" kind="dictionary" subject="용어 설명"
									val="406" onclick="return false;">스타렉스</a></span></label></li>
						<li><label><input type="checkbox"
								class="segment segment_PC5" name="segment[]" id="" value="PC10"><span><a
									href="#" class="eFincPopup" kind="dictionary" subject="용어 설명"
									val="407" onclick="return false;">i30</a></span></label></li>
						<li><label><input type="checkbox"
								class="segment segment_PC5" name="segment[]" id="" value="PC11"><span><a
									href="#" class="eFincPopup" kind="dictionary" subject="용어 설명"
									val="407" onclick="return false;">i40</a></span></label></li>
						<li><label><input type="checkbox"
								class="segment segment_PC2" name="segment[]" id="" value="PC12"><span><a
									href="#" class="eFincPopup" kind="dictionary" subject="용어 설명"
									val="404" onclick="return false;">제네시스 g70</a></span></label></li>
						<li><label><input type="checkbox"
								class="segment segment_PC3" name="segment[]" id="" value="PC13"><span><a
									href="#" class="eFincPopup" kind="dictionary" subject="용어 설명"
									val="405" onclick="return false;">제네시스 g80</a></span></label></li>
						<li><label><input type="checkbox"
								class="segment segment_PC4" name="segment[]" id="" value="PC14"><span><a
									href="#" class="eFincPopup" kind="dictionary" subject="용어 설명"
									val="406" onclick="return false;">제네시스 g90</a></span></label></li>

</div>
<div class="grid-container">

		<li>
			<select class="slct_detail" name="srchMaker" title="제조사 선택">
				<option value="">연식</option>
				<option value="3156">2020</option>
				<option value="3132">2019</option>
                <option value="3156">2018</option>
				<option value="3132">2017</option>
                <option value="3156">2016</option>
				<option value="3132">2015</option>
                <option value="3156">2014</option>
				<option value="3132">2013</option>
                <option value="3156">2012</option>
				<option value="3132">2011</option>
			</select>
		</li>
        
		<li>
			<select class="slct_detail" name="srchMaker" title="제조사 선택">
				<option value="">사고이력</option>
				<option value="3156">경미</option>
				<option value="3132">보통</option>
                <option value="3132">심각</option>
                
			</select>
		</li>
		<li>
			<select class="slct_detail" name="srchMaker" title="제조사 선택">
				<option value="">주행거리</option>
				<option value="3156">10000km</option>
				<option value="3132">20000km</option>
                <option value="3156">30000km</option>
				<option value="3132">40000km</option>
                <option value="3156">50000km</option>
				<option value="3132">60000km</option>
                <option value="3156">70000km</option>
				<option value="3132">80000km</option>
                <option value="3156">90000km</option>
				<option value="3132">100000km</option>
                <option value="3156">110000km</option>
				<option value="3132">120000km</option>
                <option value="3132">130000km</option>
                <option value="3156">140000km</option>
				<option value="3132">150000km이상</option>
                
			</select>
		</li>			
</div>
   			<img class="img-fluid rounded mb-4" src="http://autoimg.danawa.com/photo/3602/model_360.png" width="600" height="auto"
			alt="">
</div>

</div>
					<td id="Photo_2" code="" segment="" series="" useestm=""><div
							class="buttonAddComp"></div></td>
					<td id="Photo_3" code="" segment="" series="" useestm=""><div
							class="buttonAddComp"></div></td>
					<td id="Photo_4" code="" segment="" series="" useestm=""><div
							class="buttonAddComp"></div></td>
					<td id="Photo_5" code="" segment="" series="" useestm=""><div
							class="buttonAddComp"></div></td>




		<!-- 내용 입력 부분 -->
		<!-- Marketing Icons Section 
		<div class="row">
			<div class="col-lg-4 mb-4">
				<div class="card h-100">
					<h4 class="card-header">Card Title</h4>
					<div class="card-body">
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Learn More</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 mb-4">
				<div class="card h-100">
					<h4 class="card-header">Card Title</h4>
					<div class="card-body">
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Learn More</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 mb-4">
				<div class="card h-100">
					<h4 class="card-header">Card Title</h4>
					<div class="card-body">
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Learn More</a>
					</div>
				</div>
			</div>
						<div class="col-lg-4 mb-4">
				<div class="card h-100">
					<h4 class="card-header">Card Title</h4>
					<div class="card-body">
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Learn More</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 mb-4">
				<div class="card h-100">
					<h4 class="card-header">Card Title</h4>
					<div class="card-body">
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Learn More</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 mb-4">
				<div class="card h-100">
					<h4 class="card-header">Card Title</h4>
					<div class="card-body">
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Learn More</a>
					</div>
				</div>
			</div>
		</div>-->
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
