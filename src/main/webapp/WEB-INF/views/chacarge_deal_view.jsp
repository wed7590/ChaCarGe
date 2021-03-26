<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="net.chacarge.model1.BoardTO" %>
<%@ page import="net.chacarge.model1.PictureTO" %>
<%@ page import="java.util.List" %>

<%
	BoardTO bto = (BoardTO)request.getAttribute( "bto" );
	List<PictureTO> pto = (List)request.getAttribute( "pto" );
	
	int cpage = 1;
	
	String board_subject = bto.getBoard_subject();
	String board_content = bto.getBoard_content();
	String board_hit = bto.getBoard_hit();
	String board_wdate = bto.getBoard_wdate();
	
	StringBuffer sbHtml = new StringBuffer();
	for( PictureTO to : pto ) {
		String board_pic_seq = to.getBoard_pic_seq();
		String o_pic_name = to.getO_pic_name();
		String u_pic_name = to.getU_pic_name();	
		
		sbHtml.append( "<div class='car_pic'><img src='http://localhost:8080/img/" + u_pic_name + "' alt='' /></div> " );
	}
	
%>

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

<!-- bxslider -->
<link rel="stylesheet" href="resources/css/jquery.bxslider.css">

<style>
	img {
		height: auto;
		object-fit: cover;
	}
	
	.car_pic {
		overflow: hidden;
		display: flex;
		align-items: center;
		justify-content: center;
		max-height: 600px;
	}
</style>

<%@ include file="header.jsp" %>

<!-- 페이지 내용 -->
	<!-- Page Content -->
	<div class="container">

	<!-- 페이지 제목 -->
		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3"><%= board_subject %></h1>

	<!-- 페이지 경로 표시 -->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="chacarge_home.do">Home</a></li>
			<li class="breadcrumb-item"><a href="chacarge_deal_list.do?cpage=<%=cpage %>">차량 매물</a></li>
			<li class="breadcrumb-item"><%= board_subject %></li>
		</ol>

	<!-- 매물 설명 부분 -->
		<!-- Portfolio Item Row -->
		<div class="row">

		<!-- 사진 부분 -->
			<div class="col-md-8">
				<div class="bxslider">
					<%= sbHtml %>
				</div>
			</div>

		<!-- 설명 부분 -->
			<div class="col-md-4">
				<%= board_content %>
			</div>

		</div>
		<!-- /.row -->


<!-- 관련 매물 표시 부분 -->
		<!-- Related Projects Row -->
		<h3 class="my-4">관련 매물</h3>
		<div class="row">
			<div class="col-md-3 col-sm-6 mb-4">
				<a href="#"> <img class="img-fluid"	src="http://placehold.it/500x300" alt=""></a>
			</div>
			<div class="col-md-3 col-sm-6 mb-4">
				<a href="#"> <img class="img-fluid"	src="http://placehold.it/500x300" alt=""></a>
			</div>
			<div class="col-md-3 col-sm-6 mb-4">
				<a href="#"> <img class="img-fluid"	src="http://placehold.it/500x300" alt=""></a>
			</div>
			<div class="col-md-3 col-sm-6 mb-4">
				<a href="#"> <img class="img-fluid"	src="http://placehold.it/500x300" alt=""></a>
			</div>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

<%@ include file="footer.jsp" %>

<!-- Bootstrap core JavaScript -->
<script src="resources/vendor/jquery/jquery.min.js"></script>
<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script src="resources/js/jquery.bxslider.js"></script>
<script>
	( function($) {
		$('.bxslider').bxSlider({
			auto: true,
			speed: 500,
			pause: 10000,
			mode: 'horizontal',
			autoControls: true,
			pager: true,
			captions: false,
			autoHover: true,
			controls: true,
			adaptiveHeight: true
		});
	})( jQuery );
	
</script>

</body>

</html>
