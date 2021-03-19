package com.web_five.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class selectCartActionCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String [] check = request.getParameterValues("RowCheck");
		String select = request.getParameter("action");
		session.setAttribute("dcartNo", check);
		switch (select) {
		case "선택한 물건 구매하기":
			session.setAttribute("select", "구매");
			break;
		case "선택한 물건 장바구니에서 삭제하기":
			session.setAttribute("select", "삭제");
			break;
		case "전체 상품 구매":
			session.setAttribute("select", "전체 구매");
			
			break;

		default:
			break;
		}
	}

}