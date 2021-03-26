<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="net.chacarge.model1.EstimateTO" %>
<%@ page import="net.chacarge.model1.EstimateOkTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="header.jsp" %>


<%
	/* 페이지 구성할 초기 데이터 불러오기 */
	ArrayList<EstimateTO> estimate_forSelect_carNameData  = (ArrayList)request.getAttribute("estimate_forSelect_carNameData");
	ArrayList<EstimateTO> estimate_forSelect_carYearData  = (ArrayList)request.getAttribute("estimate_forSelect_carYearData");
	ArrayList<EstimateTO> estimate_forSelect_carAccidentData  = (ArrayList)request.getAttribute("estimate_forSelect_carAccidentData");
	ArrayList<EstimateTO> estimate_forSelect_carDistanceData  = (ArrayList)request.getAttribute("estimate_forSelect_carDistanceData");

	StringBuffer sbHtmlForSelectCarNameData = new StringBuffer();
	StringBuffer sbHtmlForSelectCarYearData = new StringBuffer();
	StringBuffer sbHtmlForSelectCarAccidentData = new StringBuffer();
	StringBuffer sbHtmlForSelectCarDistanceData = new StringBuffer();
	
	for (EstimateTO to : estimate_forSelect_carNameData) {
		String car_name = to.getCar_name();
		sbHtmlForSelectCarNameData.append("<label>");
		sbHtmlForSelectCarNameData.append("		<input type='radio' name='car_name_selected' value='" + car_name + "'>");
		sbHtmlForSelectCarNameData.append("		<span>");
		sbHtmlForSelectCarNameData.append("			<a>" + car_name + "</a>");
		sbHtmlForSelectCarNameData.append("		</span>");
		sbHtmlForSelectCarNameData.append("</label>");
	}

	for (EstimateTO to : estimate_forSelect_carYearData) {
		String car_year = to.getCar_year();
		sbHtmlForSelectCarYearData.append("<option value='" + car_year +"'>" + car_year + "</option>");
	}
	
	for (EstimateTO to : estimate_forSelect_carAccidentData) {
		String car_ref_accident = to.getCar_ref_accident();
		if (car_ref_accident.equals("1")) {
			String car_ref_accident_name = "무사고";
			sbHtmlForSelectCarAccidentData.append("<option value='" + car_ref_accident +"'>" + car_ref_accident_name + "</option>");
		} else if (car_ref_accident.equals("2")) {
			String car_ref_accident_name = "경미";
			sbHtmlForSelectCarAccidentData.append("<option value='" + car_ref_accident +"'>" + car_ref_accident_name + "</option>");
		} else if (car_ref_accident.equals("3")) {
			String car_ref_accident_name = "보통";
			sbHtmlForSelectCarAccidentData.append("<option value='" + car_ref_accident +"'>" + car_ref_accident_name + "</option>");
		} else if (car_ref_accident.equals("4")) {
			String car_ref_accident_name = "심각";
			sbHtmlForSelectCarAccidentData.append("<option value='" + car_ref_accident +"'>" + car_ref_accident_name + "</option>");
		}
	}
	
	for (EstimateTO to : estimate_forSelect_carDistanceData) {
		String car_ref_distance = to.getCar_ref_distance();
		sbHtmlForSelectCarDistanceData.append("<option value='" + car_ref_distance +"'>" + car_ref_distance + " km</option>");
	}
	
	/* 차 이미지 동적 연동 */
/* 	ArrayList<EstimateTO> estimate_carImage = (ArrayList)request.getAttribute("estimate_carImage");
	StringBuffer carImage = new StringBuffer(); */
	
	ArrayList<EstimateOkTO> estimate_car_data_selected  = (ArrayList)request.getAttribute("estimate_car_data_selected");
	ArrayList<EstimateOkTO> estimate_car_distance_selected  = (ArrayList)request.getAttribute("estimate_car_distance_selected");
	ArrayList<EstimateOkTO> estimate_car_accident_selected  = (ArrayList)request.getAttribute("estimate_car_accident_selected");

	StringBuffer sbHtmlCarNameSelected = new StringBuffer();
	StringBuffer sbHtmlCarYearSelected = new StringBuffer();
	StringBuffer sbHtmlCarPictureSelected = new StringBuffer();
	StringBuffer sbHtmlCarRefDistance = new StringBuffer();
	StringBuffer sbHtmlCarRefDistanceRate = new StringBuffer();
	StringBuffer sbHtmlCarRefAccident = new StringBuffer();
	StringBuffer sbHtmlCarRefAccidentRate = new StringBuffer();
	
	
	for (EstimateOkTO took : estimate_car_data_selected) {
		sbHtmlCarNameSelected.append(took.getCar_name());
		sbHtmlCarYearSelected.append(took.getCar_year());
		sbHtmlCarYearSelected.append(" 년");
		sbHtmlCarPictureSelected.append("upload/car_default_image/");
		sbHtmlCarPictureSelected.append(took.getCar_picture());
	}
	
	for (EstimateOkTO took : estimate_car_distance_selected) {
		sbHtmlCarRefDistance.append(took.getCar_ref_distance());
		sbHtmlCarRefDistance.append(" km");
		sbHtmlCarRefDistanceRate.append(took.getCar_ref_distance_rate());
	}
	
	for (EstimateOkTO took : estimate_car_accident_selected) {
		String car_ref_accident = took.getCar_ref_accident();
		String car_ref_accident_name = "";
		if (car_ref_accident.equals("1")) {
			car_ref_accident_name = "무사고";
		} else if (car_ref_accident.equals("2")) {
			car_ref_accident_name = "경미";
		} else if (car_ref_accident.equals("3")) {
			car_ref_accident_name = "보통";
		} else if (car_ref_accident.equals("4")) {
			car_ref_accident_name = "심각";
		}
		sbHtmlCarRefAccident.append(car_ref_accident_name);
		sbHtmlCarRefAccidentRate.append(took.getCar_ref_accident_rate());
	}
	
/* 	sbHtmlCarPictureSelected.append("upload/car_default_image/Avante.jpg"); */
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>ChaCarGe - 차카게 차량 견적</title>

<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/modern-business.css" rel="stylesheet">

<!-- 기타 css 설정 -->
<link href="resources/css/estimate.css" rel="stylesheet">

<!-- 최종 견적 창 grid 설정 -->
<style>
#estimate_result{display:flex; flex-direction:column;}
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
			<li class="breadcrumb-item">차량 견적</li>
		</ol>

	<!-- 이미지 입력 부분 -->
	<!-- Image Header -->
		<form method="get" action="chacarge_estimate_ok.do">
			<div class="col-lg-12 mb-4">
				<h2>차종 선택</h2>
				<div class="grid-container">
					<%=sbHtmlForSelectCarNameData %>
				</div>
			</div>
			<hr/>
			<div class="col-lg-12 mb-4">
				<h2>차량 상태 선택</h2>
				<div class="grid-container">
					<li>
						<select class="slct_detail" name="car_year_selected" title="연식">
							<option value="" hidden>연식</option>
							<%=sbHtmlForSelectCarYearData %>
						</select>
					</li>
					<li>
						<select class="slct_detail" name="car_accident_selected" title="사고이력">
							<option value="" hidden>사고 이력</option>
							<%=sbHtmlForSelectCarAccidentData %>
						</select>
					</li>
					<li>
						<select class="slct_detail" name="car_distance_selected" title="주행거리">
							<option value="" hidden>주행 거리</option>
							<%=sbHtmlForSelectCarDistanceData %>
						</select>
					</li>
				</div>
	   		</div>

   		
	   		<hr style="border:solid 5px;"/>
	   		
	   		<div class="row">
		   		<div class="col">
					<div style="text-align:center;">
						<input type="submit" class="btn btn-secondary btn-block btn-lg" value="ChaCarGe.net 견적 검색"/>
					</div>
					<hr/>
					<div class="row">
						<div class="col-lg-6" >
							<li>차종 : <%=sbHtmlCarNameSelected %></li>
						</div>
						<div class="col-lg-6" >
							<li>연식 : <%=sbHtmlCarYearSelected %></li>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6" >
							<li>사고이력 : <%=sbHtmlCarRefAccident %></li>
						</div>
						<div class="col-lg-6" >
							<li>주행거리 : <%=sbHtmlCarRefDistance %></li>
						</div>
					</div>
					<hr/>
					<div>
						<li>가격 표시 부분</li>
					</div>
				</div>
				<div class="col">
		   			<img class="img-fluid rounded mb-4" src=<%=sbHtmlCarPictureSelected %> width="600" height="800" alt="">
				</div>
	   		</div>
   		</form>
	</div>
	<!-- /.container -->

<%@ include file="footer.jsp" %>

	<!-- Bootstrap core JavaScript -->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
