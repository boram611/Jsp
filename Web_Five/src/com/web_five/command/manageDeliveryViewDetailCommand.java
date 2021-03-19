package com.web_five.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.OrderdetailDao;
import com.web_five.dto.OrderdetailDto;




public class manageDeliveryViewDetailCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		String orderinfo_ordNo = (String) session.getAttribute("ordNo");
		String user_userId = (String) session.getAttribute("user_userId");
		System.out.println(orderinfo_ordNo);
		System.out.println(user_userId);
		OrderdetailDao dao = OrderdetailDao.getInstance();
		ArrayList<OrderdetailDto> dtos = new ArrayList<OrderdetailDto>();
		
		dtos = dao.manageDeliveryViewDetail(orderinfo_ordNo, user_userId);
		request.setAttribute("OrderdetailView", dtos);
	}

}
