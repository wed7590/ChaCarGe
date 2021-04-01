<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="net.chacarge.model1.BoardTO" %>
<%@ page import="net.chacarge.model1.PictureTO" %>
<%@ page import="java.util.List" %>

<%
	int flag = (Integer)request.getAttribute( "flag" );
	BoardTO bto = (BoardTO)request.getAttribute( "bto" );
	List<PictureTO> lpto = (List)request.getAttribute( "lpto" );
	
	String board_seq = "";
	String board_subject = "";
	String board_content = "";
	String board_hit = "";
	String board_wdate = ""; 
	String user_seq = "";
	
	String board_pic_seq = "";
	String o_pic_name = "";
	String u_pic_name = "";
	
	int size = 0;
	if( flag == 1 ) {
		board_seq = bto.getBoard_seq();
		board_subject = bto.getBoard_subject();
		board_content = bto.getBoard_content();
		board_hit = bto.getBoard_hit();
		board_wdate = bto.getBoard_wdate();
		user_seq = bto.getUser_seq();
		
		size = lpto.size();
		
		for( PictureTO pto : lpto ) {
			u_pic_name = pto.getU_pic_name();	
		}
	} else {
		out.println( "<script type='text/javascript'>" );
		out.println( "alert( '수정 정보를 불러오는데 실패했습니다.' );" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );

	
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>ChaCarGe - 차카게 차량 매물 수정</title>

<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/modern-business.css" rel="stylesheet">

<!-- SummerNote CSS -->
<link rel="stylesheet" href="resources/summernote/summernote-lite.css" >

<script type="text/javascript">
	const checkfrm = function() {
		if ( document.wfrm.board_subject.value.trim() == '' ) {
			alert( '글제목을 입력하셔야합니다.' );
			return false;
		}
		if ( document.wfrm.board_content.value.trim() == '' ) {
			alert( '내용을 입력하셔야합니다.' );
			return false;
		}
/* 		// 이미지 게시판에서 추가되는 Javascript
		if( document.wfrm.files.value.trim() == '' ) {
			alert( '사진을 업로드하셔야 합니다.');
			return false;
		} else {
			const extension = document.wfrm.files.value.split( '.' ).pop();
			if( extension != 'png' && extension != 'jpg' && extenstion != 'jpeg' ){
				alert( '사진파일을 업로드하셔야 합니다.(png, jpg, ipeg 파일)')
			}
		} */
		document.wfrm.submit();
	};
</script>

<%@ include file="header.jsp" %>

<!-- 페이지 내용 -->
	<!-- Page Content -->
	<div class="container">
	
	<!-- 페이지 제목 -->
		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3"> 차량 매물 수정 </h1>

		<form action="chacarge_deal_modify_ok.do" method="post" name="wfrm" onsubmit="return checkfrm()" enctype="multipart/form-data">
			<input type="hidden" name="user_seq" value="${login.user_seq}" />
			<input type="hidden" name="board_seq" value="<%=board_seq %>" />
			<div class="write">
				<div class="subject" >
					<label>제목</label>
					<input type="text" name="board_subject" value="<%= board_subject%>" />
				</div>
			<!--게시판-->
				<div class="content">
					<textarea id="summernote" name="board_content">
						<%= board_content %>
					</textarea>
				</div>
				<div class="btn_area">
					<c:forEach var="PictureTO" items="${lpto}" >
					기존 파일 : <c:out value="${PictureTO.o_pic_name }" /><br />
					</c:forEach>
					<input multiple="multiple" type="file" name="files" id="files" />
					<div class="align_left">
						<a href="chacarge_deal_list.do">
						<input type="button" value="차량매물" class="btn_list btn_txt02" style="cursor: pointer;"  />
						</a>
					</div>
					<div class="align_right">			
						<button id="wbtn" class="btn_write btn_txt01" style="cursor: pointer;">수정</button>			
					</div>	
				</div>		
			<!--//게시판-->
			</div>
		</form>
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
		toolbar: toolbar,
		callbacks: { // 이미지 첨부 부분
			onImageUpload: function( files, editor, welEditable ) {
				for( var i = files.length - 1; i >= 0; i-- ) {
					uploadSummernoteImageFile( files[i], this );
				}
			},
			onPaste: function (e) {
				var clipboardData = e.originalEvent.clipboardData;
				if (clipboardData && clipboardData.items && clipboardData.items.length) {
					var item = clipboardData.items[0];
					if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
						e.preventDefault();
					}
				}
			}
		}
	};
	
	// 이미지 파일 업로드
	function uploadSummernoteImageFile(file, el) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "uploadSummernoteImageFile",
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(data) {
				$(el).summernote('editor.insertImage', data.url);
			}
		});
	}
	
	$('#summernote').summernote(setting); 
});

</script>
	
</body>
</html>