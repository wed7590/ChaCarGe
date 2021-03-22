<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="net.chacarge.model1.AdminTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="header.jsp" %>

<%
	ArrayList<AdminTO> statistics_deal = (ArrayList)request.getAttribute("statistics_deal");
	
	// sbHtmlPost 안에 게시물 수 데이터 담아서 html 양식으로 출력
	StringBuffer sbHtmlDeal = new StringBuffer();
	
	for (AdminTO to : statistics_deal) {
		String board_wdate = to.getBoard_wdate();
		int board_count = to.getBoard_count();
		int board_sum_count = to.getBoard_sum_count();
		
		sbHtmlDeal.append("<tr>");
		sbHtmlDeal.append("	<td width='33%'>" + board_wdate.substring(0, 10) + "</td>");
		sbHtmlDeal.append("	<td width='33%'>" + board_count + "</td>");
		sbHtmlDeal.append("	<td width='34%'>" + board_sum_count + "</td>");
		sbHtmlDeal.append("</tr>");
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

<!-- board_admin_table CSS - 표 양식 부분 -->
<link href="resources/css/admin_table.css" rel="stylesheet">

<style>
.board_input {border:1px solid #cecece; height:24px; width:160px;}
.clickable {cursor:pointer;}
.hover {text-decoration:underline;}
.active{width:10px;	height:10px; font-weight:bold; pointer-events:none;}
.page-number:hover{text-decoration:underline;}
#list_modal{float:left;}
#setting_modal{float:right;}
</style>

<!-- 테이블 페이징 처리 부분 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="resources/js/board_paging.js"></script>

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
			<li class="breadcrumb-item">게시물 통계</li>
		</ol>

<%@ include file="header_admin_side.jsp" %>
			
		<!-- 내용 설정 -->
			<!-- Content Column -->
			<div class="col-lg-9 mb-4">
				<h2>게시물 통계</h2>
				<p>ChaCarGe.net 의 통계를 확인할 수 있습니다.</p>
				<hr/>
			    <div class="docs-wrapper">
				    <div class="docs-content">
					    <div class="container">
						    <article class="docs-article" id="section-1">
								<section class="docs-section" id="item-1-1">
									<h4 class="section-heading">게시물 수 통계</h4>
									<div class="board">
										<table class="table paginated">
											<thead>
												<tr>
													<th width="33%">연월일</th>
													<th width="33%">게시물 수</th>
													<th width="34%">누적 게시물 수</th>
												</tr>
											</thead>
											<tbody>
												<%=sbHtmlDeal %>
											</tbody>
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

<%@ include file="footer.jsp" %>

	<!-- Bootstrap core JavaScript -->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
