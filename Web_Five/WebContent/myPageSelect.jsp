<%@page import="com.web_five.dto.userDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String clickName = request.getParameter("click");
		
	String userEmail = request.getParameter("useremail1") + "@" + request.getParameter("useremail2");
		
	String userId = request.getParameter("userid");
	String userPw = request.getParameter("userpw2");
	String userName = request.getParameter("username");
	String userBrith = request.getParameter("userBirth");
	String userAddr1 = request.getParameter("zipNo");
	String userAddr2 = request.getParameter("roadAddrPart1");
	String userAddr3 = request.getParameter("addrDetail");
	String userAddress = userAddr1 + ", " + userAddr2 + ", " + userAddr3;	
	String userTel1 = request.getParameter("tel1");
	String userTel2 = request.getParameter("tel2");
	String userTel3 = request.getParameter("tel3");
	String userTel = userTel1 + "-" + userTel2 + "-" + userTel3;
	String userEmail1 = request.getParameter("useremail1");
	String userEmail2 = request.getParameter("useremail2");
	
	
	
	
	
	switch(clickName){
	case("수정"):
		userDto updateDto = new userDto(userId, userPw, userName, userAddress, userTel, userEmail, userBrith);
		
		response.sendRedirect("profileUpdate.five");
		break;
		
	case("회원탈퇴"):
		
		response.sendRedirect("deleteUserInfo.five");
		break;
		
	case("이메일 중복확인"):
		userDto dto = new userDto(userId, userPw, userPw, userName, userAddr1, userAddr2, userAddr3, userTel1, userTel2, userTel3, userEmail1, userEmail2, userBrith);
	
		session.setAttribute("userEmail", userEmail);
		response.sendRedirect("check_Email.five");
		break;

	case("이전"):
		response.sendRedirect("myPage.five");
		break;
	default:
		response.sendRedirect("mibbdaMain.five");
		break;
	}

%>