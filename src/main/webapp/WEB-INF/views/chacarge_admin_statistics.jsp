<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="net.chacarge.model1.AdminTO" %>
<%@ page import="java.util.ArrayList" %>

<%
	ArrayList<AdminTO> visitor_statistics = (ArrayList)request.getAttribute("visitor_statistics");
	ArrayList<AdminTO> member_statistics = (ArrayList)request.getAttribute("member_statistics");
	ArrayList<AdminTO> post_statistics = (ArrayList)request.getAttribute("post_statistics");
	
	// sbHtmlManagement 안에 방문자 수 데이터 담아서 html 양식으로 출력
	StringBuffer sbHtmlVisitor = new StringBuffer();
	
	for (AdminTO to : visitor_statistics) {
		String visit_date = to.getVisit_date();
		int visit_count = to.getVisit_count();
		int visit_sum_count = to.getVisit_sum_count();
		
		sbHtmlVisitor.append("<tr>");
		sbHtmlVisitor.append("	<td width='33%'>" + visit_date.substring(0, 10) + "</td>");
		sbHtmlVisitor.append("	<td width='33%'>" + visit_count + "</td>");
		sbHtmlVisitor.append("	<td width='34%'>" + visit_sum_count + "</td>");
		sbHtmlVisitor.append("</tr>");
	}

	// sbHtmlManagement 안에 회원 가입자 수 데이터 담아서 html 양식으로 출력
	StringBuffer sbHtmlMember = new StringBuffer();
	
	for (AdminTO to : member_statistics) {
		String user_join_date = to.getUser_join_date();
		int user_count = to.getUser_count();
		int user_sum_count = to.getUser_sum_count();
		
		sbHtmlMember.append("<tr>");
		sbHtmlMember.append("	<td width='33%'>" + user_join_date.substring(0, 10) + "</td>");
		sbHtmlMember.append("	<td width='33%'>" + user_count + "</td>");
		sbHtmlMember.append("	<td width='34%'>" + user_sum_count + "</td>");
		sbHtmlMember.append("</tr>");
	}
		
	// sbHtmlPost 안에 게시물 수 데이터 담아서 html 양식으로 출력
	StringBuffer sbHtmlPost = new StringBuffer();
	
	for (AdminTO to : post_statistics) {
		String board_wdate = to.getBoard_wdate();
		int post_count = to.getPost_count();
		int post_sum_count = to.getPost_sum_count();
		
		sbHtmlPost.append("<tr>");
		sbHtmlPost.append("	<td width='33%'>" + board_wdate.substring(0, 10) + "</td>");
		sbHtmlPost.append("	<td width='33%'>" + post_count + "</td>");
		sbHtmlPost.append("	<td width='34%'>" + post_sum_count + "</td>");
		sbHtmlPost.append("</tr>");
	}
	
%>

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

<style type="text/css">
	.board_top {
		width: 100%;
		overflow: hidden;
	}
	
	.board_top .f_search {
		float: right;
		width: 380px;
		text-align: right;
	}
	
	.board_top .bold {
		float: left;
		width: 200px;
		margin: 10px 0;
	}
	
	.board_title {
		font-size: 14px;
		font-weight: bold;
		color: #000;
	}
	
	.coment_number {
		font: bold 10px verdana;
		color: #6fa800;
	}
	
	.board {
		width: 100%;
	}
	
	.board th {
		font-size: 12px;
		height: 41px;
		background-color: #f9f9fb;
		color: #464646;
		font-weight: 600;
		word-wrap: break-word;
		border: 1px solid #464646;
		word-break: break-all;
		text-align: center;
	}
	
	.board td {
		font-size: 12px;
		height: 30px;
		border: 1px solid #dadada;
		color: #797979;
		text-align: center;
		padding: 5px;
		word-wrap: break-word;
		word-break: break-all;
	}
	
	.board td.left {
		text-align: left;
	}
	
	.board td.category {
		font-weight: bold;
	}
	
	.board_input {
		border: 1px solid #cecece;
		height: 24px;
		width: 160px;
	}
</style>

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
		<h1 class="mt-4 mb-3">관리자 페이지</h1>

	<!-- 페이지 경로 표시 -->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="chacarge_home.do">Home</a></li>
			<li class="breadcrumb-item"><a>관리자 페이지</a></li>
			<li class="breadcrumb-item active">통계</li>
		</ol>

	<!-- 매물 관리 내용 부분 -->
		<!-- Content Row -->
		<div class="row">
		
		<!-- 사이드바 설정 -->
			<!-- Sidebar Column -->
			<div class="col-lg-3 mb-4">
				<div class="list-group">
					<a href="chacarge_admin_user.do" class="list-group-item">유저 관리</a>
					<a href="chacarge_admin_deal.do" class="list-group-item">매물 관리</a>
					<a href="chacarge_admin_statistics.do" class="list-group-item">통계</a>
				</div>
			</div>
			
		<!-- 내용 설정 -->
			<!-- Content Column -->
			<div class="col-lg-9 mb-4">
				<h2>통계</h2>
				<p>ChaCarGe.net 의 통계를 확인할 수 있습니다.</p>
				<hr/>
			    <div class="docs-wrapper">
				    <div class="docs-content">
					    <div class="container">
						    <article class="docs-article" id="section-1">
								<section class="docs-section" id="item-1-1">
									<h4 class="section-heading">방문자 수 통계</h4>
									<div class="board">
										<table>
											<tr>
												<th width="33%">연월일</th>
												<th width="33%">방문자 수</th>
												<th width="34%">누적 방문자 수</th>
											</tr>
											<%=sbHtmlVisitor %>
											
										</table>
									</div>
									<hr/>
									<h4 class="section-heading">회원 가입자 수 통계</h4>
									<div class="board">
										<table>
											<tr>
												<th width="33%">연월일</th>
												<th width="33%">가입자 수</th>
												<th width="34%">누적 가입자 수</th>
											</tr>
											<%=sbHtmlMember %>
											
										</table>
									</div>
									<hr/>
									<h4 class="section-heading">게시물 수 통계</h4>
									<div class="board">
										<table>
											<tr>
												<th width="33%">연월일</th>
												<th width="33%">게시물 수</th>
												<th width="34%">누적 게시물 수</th>
											</tr>
											<%=sbHtmlPost %>
											
										</table>
									</div>
								</section>
							</article>
					    </div> 
				    </div>  
			    </div><!--//docs-wrapper-->
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
