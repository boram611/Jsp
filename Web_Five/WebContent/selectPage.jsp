<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String clickName = request.getParameter("click");
	
	switch(clickName){
	case("로그인"):
		response.sendRedirect("mibbdaMain.five");
		break;
		
	case("미쁘다 메인"):
		response.sendRedirect("logIn.five");
		break;

	}

%>
