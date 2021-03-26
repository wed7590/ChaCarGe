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
/* 		sbHtmlManagement.append("	<td width='12%'>" + user_token + "</td>"); */
		sbHtmlManagement.append("	<td width='8%'>" + user_name + "</td>");
		sbHtmlManagement.append("	<td width='28%'>" + user_email + "</td>");
		sbHtmlManagement.append("	<td width='12%'>" + user_join_date.substring(0, 10) + "</td>");
		sbHtmlManagement.append("	<td width='8%'>" + user_grade + "</td>");
		sbHtmlManagement.append("	<td width='12%'>" + visit_date.substring(0, 10) + "</td>");
		sbHtmlManagement.append("	<td width='12%'>");
		sbHtmlManagement.append("		<input type='button' value='삭제' id='" + user_seq + "' onclick='button_delete()'>");
		sbHtmlManagement.append("	</td>");
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

<!-- 삭제용 확인창 부분 -->
<script type="text/javascript">
	function button_delete(){
		if (confirm("정말 삭제하시겠습니까?")==true) {
			// 확인
			document.form.submit();
		} else {
			// 취소
			return;
		}
	}
	
	
	
	
</script>

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
			<li class="breadcrumb-item">회원 관리</li>
		</ol>

<%@ include file="header_admin_side.jsp" %>

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
									<span id="list_modal">
										<h4 class="section-heading">회원 목록</h4>
									</span>
									<span id="setting_modal">
										<form action="chacarge_admin_member.do" method="get">
											<input type="text" name="user_search" id="user_search" placeholder="회원 ID 검색" value="${user_search }"/>
											<button type="submit">검색</button>
										</form>
									</span>
									<div class="board">
										<table class="table paginated">
											<thead>
												<tr>
	 												<th width="8%">번호</th>
													<th width="12%">ID</th>
													<th width="8%">이름</th>
													<th width="28%">이메일</th>
													<th width="12%">가입일</th>
													<th width="8%">등급</th>
													<th width="12%">최종방문일</th>
													<th width="12%"></th>
												</tr>
											</thead>
											<tbody>
												<%=sbHtmlManagement %>
											</tbody>
										</table>
									</div>
									<hr/>
									<h4 class="section-heading">현재 회원 수</h4>
									<div class="board">
										<table class="table">
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

<%@ include file="footer.jsp" %>

	<!-- Bootstrap core JavaScript -->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
