<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css" >
#profile {
	backgroung-color : white;
	text-align : center;
	color : white;
	border : 1px solid gray;
	padding-top:.3125rem;
	padding-bottom:.3125rem;
	margin-left:2rem;
	margin-right:1rem;
	font-size:1rem;
	line-height:inherit;
	white-space:nowrap
}
</style>  

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

					<c:if test="${login.user_grade == 2}">
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="cursor:pointer">관리자 페이지</a>
							<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
								<a class="dropdown-item" href="chacarge_admin_member.do">회원 관리</a>
								<a class="dropdown-item" href="chacarge_admin_deal.do">매물 게시판 관리</a>
								<a class="dropdown-item" href="chacarge_admin_statistics_visitor.do">방문자 통계</a>
								<a class="dropdown-item" href="chacarge_admin_statistics_member.do">회원 통계</a>
								<a class="dropdown-item" href="chacarge_admin_statistics_deal.do">게시물 통계</a>
							</div>
						</li>
						<li class="nav-item"><a>&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
					</c:if>

					<c:choose>
						<c:when test="${empty login}">
							<li class="nav-item"><a class="nav-link" href="chacarge_login.do">로그인</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link" href="chacarge_logout.do">로그아웃</a></li>
							<li class="nav-item"><div id="profile">로그인 유저 : ${login.user_name}</div></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>