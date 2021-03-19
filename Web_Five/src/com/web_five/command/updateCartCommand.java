package com.web_five.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.CartDao;

public class updateCartCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		
		String cartNo = request.getParameter("cartNo");
		String strcartQty = request.getParameter("cartQuantity");
		String DcartNo = request.getParameter("DcartNo");
		String chk = request.getParameter("chk");
		String user_userId = request.getParameter("user_userId");
		String goods_prdNo = request.getParameter("goods_prdNo");
		String strprdPrice = request.getParameter("prdPrice");
		String strcartTotalPrice = request.getParameter("cartTotalPrice");
		
		int cartQty = Integer.parseInt(strcartQty);
		int prdPrice = Integer.parseInt(strprdPrice);
		int cartTotalPrice = Integer.parseInt(strcartTotalPrice);
		
		CartDao dao = new CartDao();
		
		
		if(chk.equals("up")) {
			cartTotalPrice += prdPrice;
			cartQty += 1;
			dao.updateCart(cartNo, cartQty, DcartNo, user_userId, goods_prdNo, cartTotalPrice);
		} else if(chk.equals("down")) {
			if(dao.zero(user_userId, DcartNo)>1) {
				cartTotalPrice -= prdPrice;
				cartQty -= 1;
				session.setAttribute("result", "1");
				dao.updateCart(cartNo, cartQty, DcartNo, user_userId, goods_prdNo, cartTotalPrice);
			}else if(dao.zero(user_userId, DcartNo)<=1) {
				cartQty = 1;
				session.setAttribute("result", "0");
			}
		}
	}

}
