<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="net.chacarge.model1.CommentTO" %>

<% 
	int flag = (int)request.getAttribute( "flag" );
	String board_seq = (String)request.getAttribute( "seq" );
	
	int cpage = 1;
	
	out.println( "<script type='text/javascript'>" );
	if( flag == 1 ) {
		out.println( "alert( '댓글 삭제에 성공했습니다.' );" );
		out.println( "location.href='chacarge_deal_view.do?cpage=" + cpage + "&seq=" + board_seq + "';" );
	} else {
		out.println( "alert( '댓글 삭제에 실패했습니다.' );" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
 %>
