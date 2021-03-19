<%@page import="com.web_five.dto.orderDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String clickName = request.getParameter("click");
	System.out.println("click = " + clickName);
	
	String user_userId = request.getParameter("ordererId");
	String ordReceiver = request.getParameter("recieverName");
	System.out.println("셀렉트 받는 분 = " + ordReceiver);
	
	String ordRcvAddress = request.getParameter("receiverAddr1") + ", " + request.getParameter("receiverAddr2") + ", " + request.getParameter("receiverAddr3");
	String ordRcvPhone = request.getParameter("receiverTel1") + "-" + request.getParameter("receiverTel2") + "-" + request.getParameter("receiverTel3");
	String ordPay = request.getParameter("total");
	String ordBank = request.getParameter("selectBank");
	System.out.println("은행명 = " + ordBank);
	String ordCardNo = request.getParameter("cardNum1") + "-" + request.getParameter("cardNum2") + "-" + request.getParameter("cardNum3") + "-" + request.getParameter("cardNum4");
	String ordCard1 = request.getParameter("cardNum1");
	String ordCard2 = request.getParameter("cardNum2");
	String ordCard3 = request.getParameter("cardNum3");
	String ordCard4 = request.getParameter("cardNum4");
	String ordCardPass = request.getParameter("cardPassword");
	
	switch(clickName){
	case("주문자정보와 동일"):
		response.sendRedirect("getMyInfo.five");
		break;
		
	case("결제"):
		orderDto dto = new orderDto(user_userId, ordReceiver, ordRcvAddress, ordRcvPhone, ordPay, ordBank, ordCardNo, ordCardPass, ordCard1, ordCard2, ordCard3, ordCard4);
		
		response.sendRedirect("purchaseOk.five");
		break;
		
	case("취소"):
		response.sendRedirect("purchaseNo.five");
		break;

	default:
		response.sendRedirect("mibbdaMain.five");
		break;
	}

%>