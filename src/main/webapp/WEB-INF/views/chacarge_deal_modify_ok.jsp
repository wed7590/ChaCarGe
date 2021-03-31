<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="net.chacarge.model1.BoardTO" %>    

<%
	int flag = (Integer)request.getAttribute( "flag" );
	BoardTO bto = (BoardTO)request.getAttribute( "bto" );
	
	out.println( "<script type='text/javascript'>" );
	if( flag == 0 ) {
		out.println( "alert( '글수정에 성공했습니다.' );" );
		out.println( "location.href='./chacarge_deal_list.do?seq="+ bto.getBoard_seq() + "';" );
	} else {
		out.println( "alert( '글수정에 실패했습니다.' );" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
%>