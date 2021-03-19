package com.web_five.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.orderInfoDao;
import com.web_five.dto.userDto;

public class productCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		String loginId = (String)session.getAttribute("Log_userId");
		String prdNo = request.getParameter("prdNo");
		String strprdPrice = request.getParameter("prdPrice");
		String strcartQty = request.getParameter("cartQty");
		session.setAttribute("prdPrice", strprdPrice);
		session.setAttribute("cartQty", strcartQty);
		int prdPrice = Integer.parseInt(strprdPrice);
		int cartQty = Integer.parseInt(strcartQty);
		int total = prdPrice*cartQty;
		
		orderInfoDao dao = new orderInfoDao();
		userDto dto = dao.showOrderInfo(loginId);
		session.setAttribute("userDto", dto);
		session.setAttribute("realTotal", total);
		
	}

}
