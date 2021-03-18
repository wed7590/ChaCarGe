<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="resources/css/board_write.css" rel="stylesheet">
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
	};
</script>
</head>

<body>
<!-- 상단 디자인 -->
<div class="contents1"> 
	<div class="con_title"> 
		<p style="margin: 0px; text-align: right">
			<img style="vertical-align: middle" alt="" src="../../images/home_icon.gif" /> &gt; 커뮤니티 &gt; <strong>여행지리뷰</strong>
		</p>
	</div> 

	<form action="chacarge_deal_write_ok.do" method="get" name="wfrm" onsubmit="return checkfrm()">
		<div class="contents_sub">
		<!--게시판-->
			<div class="chacarge_deal_write">
				<table>
				<tr>
					<th>글제목</th>
					<td colspan="3"><input type="text" name="board_subject" value="" class="board_view_input" maxlength="30" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3">
						<textarea name="board_content" class="board_editor_area" maxlength="3000" ></textarea>
					</td>
				</tr>
				<tr>
					<th>파일첨부</th>
					<td colspan="3"><input type="file" name="upload" value="" class="board_view_input" /></td>
				</tr>
				<%--
				<tr>
					<th>이메일</th>
					<td colspan="3"><input type="text" name="mail1" value="" class="board_view_input_mail"/> @ <input type="text" name="mail2" value="" class="board_view_input_mail"/></td>
				</tr>
				--%>
				<%-- 
				</table>
				<table>	
				<tr>
					<br />
					<td style="text-align:left;border:1px solid #e0e0e0;background-color:f9f9f9;padding:5px">
						<div style="padding-top:7px;padding-bottom:5px;font-weight:bold;padding-left:7px;font-family: Gulim,Tahoma,verdana;">※ 개인정보 수집 및 이용에 관한 안내</div>
						<div style="padding-left:10px;">
							<div style="width:97%;height:95px;font-size:11px;letter-spacing: -0.1em;border:1px solid #c5c5c5;background-color:#fff;padding-left:14px;padding-top:7px;"> 
								 1. 수집 개인정보 항목 : 회사명, 담당자명, 메일 주소, 전화번호, 홈페이지 주소, 팩스번호, 주소 <br />
								 2. 개인정보의 수집 및 이용목적 : 제휴신청에 따른 본인확인 및 원활한 의사소통 경로 확보 <br />
								 3. 개인정보의 이용기간 : 모든 검토가 완료된 후 3개월간 이용자의 조회를 위하여 보관하며, 이후 해당정보를 지체 없이 파기합니다. <br />
								 4. 그 밖의 사항은 개인정보취급방침을 준수합니다.
							</div>
						</div>
						<div style="padding-top:7px;padding-left:5px;padding-bottom:7px;font-family: Gulim,Tahoma,verdana;">
							<input type="checkbox" name="info" value="1" class="input_radio"> 개인정보 수집 및 이용에 대해 동의합니다.
						</div>
						--%>
					</td>
				</tr>
				</table>
			</div>
			
			<div class="btn_area">
				<div class="align_left">
					<a href="chacarge_deal_list.do">	
					<input type="button" value="차량매물" class="btn_list btn_txt02" style="cursor: pointer;"  />
					</a>
				</div>
				<div class="align_right">			
					<button id="wbtn" class="btn_write btn_txt01" style="cursor: pointer;">등록</button>			
				</div>	
			</div>		
			<!--//게시판-->
		</div>
	</form>
</div>
<!-- 하단 디자인 -->

</body>
</html>