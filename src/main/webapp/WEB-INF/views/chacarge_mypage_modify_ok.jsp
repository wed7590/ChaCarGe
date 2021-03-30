<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int flag = (Integer)request.getAttribute("flag");

	out.println( "<script type='text/javascript'>" );
	if (flag==1) {
		out.println("alert('회원 정보 관련 오류가 있습니다.')");
		out.println("history.back();");
	} else if (flag==0) {
		out.println("alert('수정되었습니다.')");
		out.println("location.href='chacarge_mypage_privacy.do';");
	}
	out.println( "</script>" );
%>