<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ page import="net.chacarge.model1.AdminTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="header.jsp" %>

<%
	ArrayList<AdminTO> member_management = (ArrayList)request.getAttribute("member_management");
	ArrayList<AdminTO> member_count = (ArrayList)request.getAttribute("member_count");
	
	// sbHtmlManagement 안에 회원 목록 데이터 담아서 html 양식으로 출력
	StringBuffer sbHtmlManagement = new StringBuffer();
	
	for (AdminTO to : member_management) {
		int user_seq = to.getUser_seq();
		String user_id = to.getUser_id();
		String user_token = to.getUser_token();
		String user_name = to.getUser_name();
		String user_email = to.getUser_email();
		String user_join_date = to.getUser_join_date();
		String user_grade = to.getUser_grade();
		String visit_date = to.getVisit_date();
		
		sbHtmlManagement.append("<tr>");
		sbHtmlManagement.append("	<td width='8%'>" + user_seq + "</td>");
		sbHtmlManagement.append("	<td width='12%'>" + user_id + "</td>");
		sbHtmlManagement.append("	<td width='12%'>" + user_token + "</td>");
		sbHtmlManagement.append("	<td width='8%'>" + user_name + "</td>");
		sbHtmlManagement.append("	<td width='28%'>" + user_email + "</td>");
		sbHtmlManagement.append("	<td width='12%'>" + user_join_date.substring(0, 10) + "</td>");
		sbHtmlManagement.append("	<td width='8%'>" + user_grade + "</td>");
		sbHtmlManagement.append("	<td width='12%'>" + visit_date.substring(0, 10) + "</td>");
		sbHtmlManagement.append("</tr>");
	}

	// sbHtmlCount 안에 회원 수 데이터 담아서 html 양식으로 출력
	StringBuffer sbHtmlCount = new StringBuffer();
	
	for (AdminTO to : member_count) {
		int user_count = to.getUser_count();
		
		sbHtmlCount.append("<tr>");
		sbHtmlCount.append("	<td width='100%'>" + user_count + "</td>");
		sbHtmlCount.append("</tr>");
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

<%@ include file="header.jsp" %>
	
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
			<li class="breadcrumb-item active">유저 관리</li>
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
				<h2>회원 관리</h2>
				<p>ChaCarGe.net 의 회원을 관리할 수 있습니다.</p>
				<hr/>
			    <div class="docs-wrapper">
				    <div class="docs-content">
					    <div class="container">
						    <article class="docs-article" id="section-1">
								<section class="docs-section" id="item-1-1">
									<h4 class="section-heading">회원목록</h4>
									<div class="board">
										<table>
											<tr>
 												<th width="8%">번호</th>
												<th width="12%">ID</th>
												<th width="12%">소셜토큰</th>
												<th width="8%">이름</th>
												<th width="28%">이메일</th>
												<th width="12%">가입일</th>
												<th width="8%">등급</th>
												<th width="12%">최종방문일</th>
											</tr>
											<%=sbHtmlManagement %>
										</table>
									</div>
									<hr/>
									<h4 class="section-heading">현재 회원 수</h4>
									<div class="board">
										<table>
											<tr>
 												<th width="100%">현재 회원 수</th>
											</tr>
											<%=sbHtmlCount %>
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
