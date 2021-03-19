package com.web_five.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.orderInfoDao;
import com.web_five.dao.orderViewDao;
import com.web_five.dto.orderDto;
import com.web_five.dto.orderViewDto;

public class myOrderViewCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		String ordNo = request.getParameter("ordNo");
		String prdNo = request.getParameter("prdNo");
		session.setAttribute("ordNo", ordNo); // 주문번호 
		session.setAttribute("prdNo", prdNo); // 주문번호 
		System.out.println("ordNo : " + ordNo);
		System.out.println("prdNo : " + prdNo);
		System.out.println("구매확정 후 돌아온 세션 prdNo : " + session.getAttribute("prdNo"));
		orderViewDao dao = new orderViewDao();
		orderViewDto dto_I = dao.myOrderDetail_orderInfo(ordNo); // 주문날짜
		orderViewDto dto_P = dao.myOrderDetail_Product(prdNo); // 나머지
		orderViewDto dto_D = dao.myOrderDetail_orderDetail(prdNo, ordNo); // 상품명, 상품가격
		
		request.setAttribute("orderinfoDto", dto_I);
		request.setAttribute("productDto", dto_P);
		request.setAttribute("orderdetailDto", dto_D);
	}

}
