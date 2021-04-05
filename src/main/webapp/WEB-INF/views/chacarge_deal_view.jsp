<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="net.chacarge.model1.BoardTO" %>
<%@ page import="net.chacarge.model1.PictureTO" %>
<%@ page import="net.chacarge.model1.CommentTO" %>
<%@ page import="java.util.List" %>

<%
	BoardTO bto = (BoardTO)request.getAttribute( "bto" );
	List<PictureTO> lpto = (List)request.getAttribute( "lpto" );
	List<CommentTO> lcto = (List)request.getAttribute( "lcto" );
	
	int cpage = 1;
	String board_seq = bto.getBoard_seq();
	String board_subject = bto.getBoard_subject();
	String board_content = bto.getBoard_content();
	String board_hit = bto.getBoard_hit();
	String board_wdate = bto.getBoard_wdate();
	String user_seq = bto.getUser_seq();
	
	StringBuffer sbHtml = new StringBuffer();
	for( PictureTO pto : lpto ) {
		String board_pic_seq = pto.getBoard_pic_seq();
		String o_pic_name = pto.getO_pic_name();
		String u_pic_name = pto.getU_pic_name();	
		
		sbHtml.append( "<div class='car_pic'><img src='http://localhost:8080/img/" + u_pic_name + "' alt='' /></div> " );
	}
	
	StringBuffer comHtml = new StringBuffer();
	for( CommentTO cto : lcto ) {
		String comment_seq = cto.getComment_seq();
		String user_id = cto.getUser_id();
		String comment_user_seq = cto.getUser_seq();
		String comment_wdate = cto.getComment_wdate();
		String comment_content = cto.getComment_content();
		
		comHtml.append( "<tr>" );
		comHtml.append( "	<td class='comment_re' width='20%'>" );
		comHtml.append( "		<strong>" + user_id + "</strong> ("+ comment_wdate + ")" );
		comHtml.append( "		<div class='comment_re_txt'>" );
		comHtml.append( 			comment_content );
		comHtml.append( "		</div>" );
		comHtml.append( "	</td>" );
		comHtml.append( "	<td class='comment_re' width='1%'>" );
		comHtml.append( "		<form action='chacarge_deal_comment_delete.do' method='post' name='dcfrm'>" );
		comHtml.append( "			<input type='hidden' name='cpage' value='" + cpage + "'/>" );
		comHtml.append( "			<input type='hidden' name='comment_seq' value='" + comment_seq + "' />");
		comHtml.append( "			<input type='submit' value='댓글삭제' />" );
		comHtml.append( "		</form> " );
		comHtml.append( "	</td>" );
		comHtml.append( "</tr>" );

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

<link href="resources/css/deal_view.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">

<script type="text/javascript">
	window.onload = function() {
		document.getElementById( 'submit1' ).onclick = function() {
			if( document.wcfrm.ccontent.value.trim() == '' ) {
				alert( '댓글 내용을 입력하셔야 합니다.' );
				return false;
			}
			document.wcfrm.submit();
		}
	}
</script>

<style>
.btn-space {margin-right: 5px;}
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
		
	<!-- 조회수 표시 -->
		<div class="row align_right"><img src="resources/css/images/view_icon.jpg" id="hit"/> <%= board_hit %></div>
		
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
		
		<div class = "row">
			<a href="chacarge_deal_delete.do?cpage=<%=cpage %>&seq=<%=board_seq %>&user_seq=${login.user_seq}"><button class="btn btn-secondary float-right btn-space" id="delete">글 삭제</button></a>
			<a href="chacarge_deal_modify.do?cpage=<%=cpage %>&seq=<%=board_seq %>&user_seq=${login.user_seq}"><button class="btn btn-secondary float-right btn-space" id="modify">글 수정</button></a>
		</div>

		<div class="comment">
			<form action="chacarge_deal_comment_write.do" method="post" name="wcfrm">
				<input type="hidden" name="board_seq" value="<%=board_seq %>" />
				<input type="hidden" name="cpage" value="<%=cpage %>" />
				<input type="hidden" name="user_seq" value="${login.user_seq}" />
				<table>
					<tr>
						<td width="3%"></td>
						<td width="92%">
							<label>작성자 : ${login.user_id} </label> 
						</td>
						<td width="5%"></td>
					</tr>
					<tr>
						<td width="3%"></td>
						<td width="47%">
							<textarea name="ccontent" cols="130" rows="3" class=""></textarea>
						</td>
						<td width="20%">
							<input type="button" id="submit1" value="댓글등록" class="" />
						</td>
						<td width="30%">&nbsp;&nbsp;&nbsp;&nbsp;</td>
					</tr>
					
				</table>
			</form>
				<table>
					<%= comHtml %>
				</table>
			
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->
	<!-- 댓글 -->
	

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
