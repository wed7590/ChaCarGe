<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<!-- 매물 관리 내용 부분 -->
		<!-- Content Row -->
		<div class="row">
		
		<!-- 사이드바 설정 -->
			<!-- Sidebar Column -->
			<div class="col-lg-3 mb-4">
				<div class="list-group">
					<a href="chacarge_mypage_privacy.do?user_id=${login.user_id}" class="list-group-item">내 정보 관리</a>
					<a href="chacarge_mypage_deal.do?user_id=${login.user_id}" class="list-group-item">내 활동 보기</a>
					<a href="chacarge_mypage_withdrawal.do?user_id=${login.user_id}" class="list-group-item">회원 탈퇴</a>
				</div>
			</div>