package com.web_five.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.CartDao;

public class insertCartCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		String userId = (String) session.getAttribute("Log_userId");
//		int pNo = (Integer) session.getAttribute("sessionpNo");
		int prdNo = Integer.parseInt(request.getParameter("prdNo"));
		System.out.println("addCart 에 들어가는 pNo = " + prdNo);
		int prdPrice = Integer.parseInt(request.getParameter("prdPrice"));
		System.out.println("addCart 에 들어가는prdPrice = " + prdPrice);
		int cartQty = Integer.parseInt(request.getParameter("cartQty"));
		System.out.println("cartQty = " + request.getParameter("cartQty"));
		CartDao dao = new CartDao();
		
		int[] result = dao.getCartNo(userId);
		int cartNo = result[0];
		int TotalPrice = result[1];
		int cartTotalPrice = TotalPrice+(prdPrice*cartQty);
		// 동일 제품에 대한 장바구니 존재여부 검색
		int same = dao.cartCheck(userId, prdNo);
		
		session.setAttribute("cartcheck", Integer.toString(same));
		
		if(same == 0){ // 추가하지 않았다면 추가
			dao.cartInsert(userId, prdNo, cartQty, cartNo);
			dao.totalPriceInsert(cartTotalPrice, userId);
			session.setAttribute("cartcheck", 1);
		}else{ // 이미 장바구니에 있다면 장바구니에 수량만큼 추가
			dao.cartUpdate(userId, prdNo, cartQty, cartTotalPrice, cartNo);
		}
	}

}
