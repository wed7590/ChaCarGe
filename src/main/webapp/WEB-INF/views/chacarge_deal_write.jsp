<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>ChaCarGe - 차카게 차량 매물 등록</title>

<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/modern-business.css" rel="stylesheet">

<!-- SummerNote CSS -->
<link rel="stylesheet" href="resources/summernote/summernote-lite.css" >

<style>
.btn-space {margin-right: 5px;}
</style>

<script type="text/javascript">
window.onload = function() {
	document.getElementById( 'submit1' ).onclick = function() {
		if ( document.wfrm.board_subject.value.trim() == '' ) {
			alert( '글제목을 입력하셔야합니다.' );
			return false;
		}
		if ( document.wfrm.board_content.value.trim() == '' ) {
			alert( '내용을 입력하셔야합니다.' );
			return false;
		}
		
		if( document.wfrm.files[1].value.trim().split( '.' ).pop() == '' ) {
			alert( '파일을 업로드하셔야 합니다.');
			return false;
		} 
		
		document.wfrm.submit();
	}		
}
</script>

<%@ include file="header.jsp" %>

<!-- 페이지 내용 -->
	<!-- Page Content -->
	<div class="container">
	
	<!-- 페이지 제목 -->
		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3"> 차량 매물 등록 </h1>

		<form action="chacarge_deal_write_ok.do" method="post" name="wfrm" enctype="multipart/form-data">
			<input type="hidden" name="user_seq" value="${login.user_seq}" />
			<div class="write">
				<div class="subject" >
					<label>제목</label>
					<input type="text" name="board_subject" />
				</div>
			<!--게시판-->
				<div class="content">
					<textarea id="summernote" name="board_content">
<p><b>차종 :</b></p>
<p><b>출고 연도 :</b></p>
<p><b>운행 거리 :</b></p>
<p><b>사고 정도 :</b></p>
<p><b>판매 가격 :</b></p><br>
<p></p>
					</textarea>
				</div>
			</div>
			<div class="row">
				<div class="col-6">
					<div class="btn_area">
						<input multiple="multiple" type="file" name="files" id="files" accept="image/*"/>
					</div>
				</div>
				<div class="col-6">
					<div class="btn_area">
						<input type="button" id="submit1" value="등록" class="btn btn-secondary float-right btn-space" style="cursor: pointer;" />
						<a href="chacarge_deal_list.do">
							<input type="button" value="매물 목록 보기" class="btn btn-secondary float-right btn-space" style="cursor: pointer;"  />
						</a>
					</div>
				</div>
			</div>
		</form>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<!--//게시판-->
	</div>
	<!-- /.container -->

<%@ include file="footer.jsp" %>

<!-- Bootstrap core JavaScript -->
<script src="resources/vendor/jquery/jquery.min.js"></script>
<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- SummerNote -->
<script src="resources/summernote/summernote-lite.js" ></script>
<script src="resources/summernote/lang/summernote-ko-KR.js" ></script>

<script>
$(document).ready(function() {
	fontSizeUnits: ['8px','9px','10px','11px','12px','14px','16px','18px','20px','24px','30px','36px'];
	
	var toolbar = [
		[ 'fontname', ['fontname'] ],
		[ 'fontsize', ['fontsize'] ],
		[ 'style', ['bold', 'italic', 'underline', 'strikethrough', 'clear'] ],
		[ 'color', ['forecolor', 'color'] ],
		[ 'table', ['table'] ],
		[ 'para', ['ul', 'ol', 'paragraph'] ],
		[ 'height', ['height'] ],
		[ 'insert', ['picture', 'link', 'video'] ],
		[ 'view', ['codeview', 'help'] ]
	];
	
	var setting = {
		height: 300,
		minHeight: null,
		maxHeight: null,
		focus: true,
		lang: "ko-KR",
	 	placeholder: 'Hello stand alone ui',
        tabsize: 2,	
		toolbar: toolbar
	};
	
	$('#summernote').summernote(setting); 
});

</script>
	
</body>
</html>