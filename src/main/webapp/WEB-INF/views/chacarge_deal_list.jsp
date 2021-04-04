<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="net.chacarge.model1.BoardTO" %>
<%@ page import="net.chacarge.model1.BoardListTO" %>
<%@ page import="java.util.List" %>

<%
	List<BoardTO> lists = (List)request.getAttribute( "boardLists" );
	BoardListTO blto = (BoardListTO)request.getAttribute( "blto" );
	
	int cpage = 1;
	// cpage 값이 있으면 cpage를 그 값으로 cpage 세팅
	if( request.getParameter( "cpage" ) != null && !request.getParameter("cpage").equals("" ) ) {
		cpage = Integer.parseInt( request.getParameter( "cpage" ) );
	}

	StringBuffer sbHtml = new StringBuffer();
	for( BoardTO to : lists ) {
		String board_seq = to.getBoard_seq();
		String board_subject = to.getBoard_subject();
		String content = to.getBoard_content();
 		String scontent[] = content.split( "</p>" );
		String board_content = "";
		for( int i=0; i<5; i++ ) {
			board_content += scontent[i] + "</p>";
		}
		String board_hit = to.getBoard_hit();
		String board_wdate = to.getBoard_wdate();
		String board_pic_seq = to.getBoard_pic_seq();
		String u_pic_name = to.getU_pic_name();
		
		sbHtml.append( "<div class='col-lg-3 col-md-4 col-sm-6 portfolio-item'>" );
		sbHtml.append( "	<div class='card h-100'>" );
		sbHtml.append( "	<a href='chacarge_deal_view.do?cpage=" + cpage + "&seq=" + board_seq + "'><img class='card-img-top' src='http://localhost:8080/img/" + u_pic_name + "' alt=''></a>" );
		sbHtml.append( "		<div class='card-body'>" );
		sbHtml.append( "			<h5 class='card-title'>" );
		sbHtml.append( "				<a href='chacarge_deal_view.do?cpage=" + cpage + "&seq=" + board_seq + "'>" + board_subject + "</a>" );
		sbHtml.append( "			</h5>" );
		sbHtml.append( "			<p class='card-text'>" + board_content + "</p>" );
		sbHtml.append( "		</div>" );
		sbHtml.append( "		<span class='write' id='hit'><img src='resources/css/images/view_icon.jpg' />" + board_hit + "</span>" );
		sbHtml.append( "	</div>" );
		sbHtml.append( "</div>" );
		
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

<link href="resources/css/deal_list.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">

<%@ include file="header.jsp" %>

<!-- 페이지 내용 -->
	<!-- Page Content -->
	<div class="container">

	<!-- 페이지 제목 -->
		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3"> 차량 매물 </h1>
		
	<!-- 게시글 작성 버튼 -->
		<div class="write">
			<%-- <span>총 <%= totalRecord %> 건</span> --%>
			<input type="button" value="매물등록" onclick="location.href='chacarge_deal_write.do'" />
		</div>
		
	<!-- 페이지 경로 표시 -->
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="chacarge_home.do">Home</a></li>
			<li class="breadcrumb-item">차량 매물</li>
		</ol>

	<!-- 매물 입력 부분 -->
		<div class="row">
			<%= sbHtml %>
		</div>

<!-- 페이징 부분 -->
		<!-- Pagination -->
		<ul class="pagination justify-content-center">
			<li class="page-item">
				<a class="page-link" href="#" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
					<span class="sr-only">Previous</span>
				</a>
			</li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item">
				<a class="page-link" href="#" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
					<span class="sr-only">Next</span>
				</a>
			</li>
		</ul>
	</div>
	
	<!-- /.container -->

<%@ include file="footer.jsp" %>

	<!-- Bootstrap core JavaScript -->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
