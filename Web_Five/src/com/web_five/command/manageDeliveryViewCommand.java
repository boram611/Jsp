package com.web_five.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class manageDeliveryViewCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		String ordNo = request.getParameter("ordNo");
		String user_userId = request.getParameter("user_userId");
		String ordDate = request.getParameter("ordDate");
		String ordReceiver = request.getParameter("ordReceiver");
		String ordRcvAddress = request.getParameter("ordRcvAddress");
		String ordRcvPhone = request.getParameter("ordRcvPhone");
		String ordPay = request.getParameter("ordPay");
		String ordBank = request.getParameter("ordBank");
		String ordCardNo = request.getParameter("ordCardNo");
		String ordDelivery = request.getParameter("ordDelivery");
		String ordDeliveryDate = request.getParameter("ordDeliveryDate");
		
		request.setAttribute("ordNo", ordNo);
		request.setAttribute("user_userId", user_userId);
		request.setAttribute("ordDate", ordDate);
		request.setAttribute("ordReceiver", ordReceiver);
		request.setAttribute("ordRcvAddress", ordRcvAddress);
		request.setAttribute("ordPay", ordPay);
		request.setAttribute("ordRcvPhone", ordRcvPhone);
		request.setAttribute("ordBank", ordBank);
		request.setAttribute("ordCardNo", ordCardNo);
		request.setAttribute("ordDeliveryDate", ordDeliveryDate);
		request.setAttribute("ordDelivery", ordDelivery);
	}

}
