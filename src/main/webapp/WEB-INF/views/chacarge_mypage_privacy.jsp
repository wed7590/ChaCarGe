<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="net.chacarge.model1.AdminTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>ChaCarGe - 차카게 마이 페이지</title>

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

<script type="text/javascript">
	$(document).ready(function(){
		// 제출시
		$("#submit").on("click", function(){
			if(confirm("정말 수정하시겠습니까?") == true) {
				document.mfrm.submit();
			} else {
				return false;
			}
		});
	})
</script>

</head>

<body>

<%@ include file="header.jsp" %>

<!-- 페이지 내용 -->
	<!-- Page Content -->
	<div class="container">

	<!-- 페이지 제목 -->
		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">마이 페이지</h1>

	<!-- 페이지 경로 표시 -->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="chacarge_home.do">Home</a></li>
			<li class="breadcrumb-item"><a>마이 페이지</a></li>
			<li class="breadcrumb-item">내 정보 관리</li>
		</ol>

<%@ include file="header_mypage_side.jsp" %>

		<!-- 내용 설정 -->
			<!-- Content Column -->
			<div class="col-lg-9 mb-4">
				<h2>내 정보 관리</h2>
				<hr/>
			    <div class="docs-wrapper">
				    <div class="docs-content">
					    <div class="container">
					    	<form action="chacarge_mypage_modify_ok.do?user_seq=${login.user_seq}" method="get" name="mfrm">
								<div class="form-group has-feedback">
									<label class="control-label" for="user_id">아이디</label>
									<input class="form-control" type="text" id="user_id" name="user_id" value="${login.user_id}" readonly="readonly"/>
								</div>
								<div class="form-group has-feedback">
									<label class="control-label" for="user_name">이름</label>
									<input class="form-control" type="text" id="user_name" name="user_name" value="${login.user_name}" />
								</div>
								<div class="form-group has-feedback">
									<label class="control-label" for="user_email">e-mail</label>
									<input class="form-control" type="text" id="user_email" name="user_email" value="${login.user_email}" />
								</div>
								<div class="form-group has-feedback">
									<label class="control-label" for="user_join_date">가입일</label>
									<input class="form-control" type="text" id="user_join_date" name="user_join_date" value="${fn:substring(login.user_join_date, 0, 10)}" readonly="readonly"/>
								</div>
								<c:choose>
									<c:when test="${login.user_grade == 1}">
										<div class="form-group has-feedback">
											<label class="control-label" for="user_grade">등급</label>
											<input class="form-control" type="text" id="user_grade" name="user_grade" value="일반 회원" readonly="readonly"/>
										</div>
									</c:when>
									<c:when test="${login.user_grade == 2}">
										<div class="form-group has-feedback">
											<label class="control-label" for="user_grade">등급</label>
											<input class="form-control" type="text" id="user_grade" name="user_grade" value="관리자" readonly="readonly"/>
										</div>
									</c:when>
								</c:choose>
								<div class="form-group has-feedback">
									<button class="btn btn-success" type="submit" id="submit">회원 정보 수정</button>
								</div>
							</form>
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
