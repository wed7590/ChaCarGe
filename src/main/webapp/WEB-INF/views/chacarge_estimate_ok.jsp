<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int flag_data = (Integer)request.getAttribute("flag_data");
	int flag_distance = (Integer)request.getAttribute("flag_distance");
	int flag_accident = (Integer)request.getAttribute("flag_accident");
	
	String car_name_selected = (String)request.getAttribute("car_name_selected");
	String car_year_selected = (String)request.getAttribute("car_year_selected");
	String car_distance_selected = (String)request.getAttribute("car_distance_selected");
	String car_accident_selected = (String)request.getAttribute("car_accident_selected");
	
	out.println( "<script type='text/javascript'>" );
	if (flag_data == 1) {
		out.println("alert('정확한 차종 및 생산년도를 입력하세요.');");
		out.println("history.back();");
	} else if (flag_distance == 1) {
		out.println("alert('주행거리를 입력하세요.');");
		out.println("history.back();");
	} else if (flag_accident == 1) {
		out.println("alert('사고이력을 입력하세요.');");
		out.println("history.back();");
	} else {
		out.println("location.href='chacarge_estimate.do?car_name_selected=" + car_name_selected + "&car_year_selected=" + car_year_selected + "&car_distance_selected=" + car_distance_selected +"&car_accident_selected=" + car_accident_selected + "';");
	}
	out.println( "</script>" );
%>
