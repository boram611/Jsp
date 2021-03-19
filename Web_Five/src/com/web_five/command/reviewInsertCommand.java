package com.web_five.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.changeStatusDao;
import com.web_five.dao.orderViewDao;
import com.web_five.dto.orderViewDto;

public class reviewInsertCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		changeStatusDao dao = new changeStatusDao();
		orderViewDao dao1 = new orderViewDao();
		
		System.out.println("---------------------------------");
		System.out.println("reviewInsert cmd ordNo : " + session.getAttribute("ordNo"));
		System.out.println("reviewInsert cmd prdNo : " + session.getAttribute("prdNo"));
		String ordNo = (String)session.getAttribute("ordNo");
		String prdNo = (String)session.getAttribute("prdNo");
		String star = request.getParameter("starType");
		String nContent = request.getParameter("nContent");
		String userId = (String)session.getAttribute("Log_userId");
		
		orderViewDto dto_I = dao1.myOrderDetail_orderInfo(ordNo); // 주문날짜
		orderViewDto dto_P = dao1.myOrderDetail_Product(prdNo); // 나머지
		orderViewDto dto_D = dao1.myOrderDetail_orderDetail(prdNo, ordNo); // 상품명, 상품가격
		prdNo = dao1.myOrderDetail_prdNo(request.getParameter("nTitle")); // 상품번호
		System.out.println("상품번호 뽑은 것 : " + dao1.myOrderDetail_prdNo(request.getParameter("nTitle")));
		
		int o = Integer.parseInt(ordNo);
		int p = Integer.parseInt(prdNo);
		
		System.out.println("reviewInsertCommand ordNo : " + o);
		System.out.println("reviewInsertCommand prdNo : " + p);
		System.out.println("reviewInsertCommand star : " + star);
		System.out.println("reviewInsertCommand nContent : " + nContent);
		System.out.println("reviewInsertCommand userId : " + userId);
		
		dao.updateDelivery(o, "리뷰 작성 완료");
		dao.updateNewReview(o, p, userId, star, nContent);
		orderViewDto dto_I2 = dao1.myOrderDetail_orderInfo(ordNo); // 주문날짜
		
		
		request.setAttribute("orderinfoDto", dto_I2);
		request.setAttribute("productDto", dto_P);
		request.setAttribute("orderdetailDto", dto_D);
		request.setAttribute("prdNo", prdNo);
		
		
	}

}
