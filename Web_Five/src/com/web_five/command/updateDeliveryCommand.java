package com.web_five.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.orderInfoDao;

public class updateDeliveryCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		String ordNo = request.getParameter("ordNo");
		String user_userId = request.getParameter("user_userId");
		String status = request.getParameter("status");
		System.out.println(ordNo);
		System.out.println(user_userId);
		System.out.println(status);
		orderInfoDao dao = new orderInfoDao();
		dao.updateDelivery(ordNo, user_userId, status);
	}

}
