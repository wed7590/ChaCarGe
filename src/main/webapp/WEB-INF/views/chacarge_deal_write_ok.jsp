<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	int flag = (Integer)request.getAttribute( "flag" );
		
	out.println( "<script type='text/javascript'>" );
	if( flag == 0 ) {
		out.println( "alert( '글쓰기에 성공했습니다.' );" );
		out.println( "location.href='./chacarge_deal_list.do';" );
	} else {
		out.println( "alert( '글쓰기에 실패했습니다.' );" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
%>