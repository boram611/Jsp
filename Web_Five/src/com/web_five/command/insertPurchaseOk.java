package com.web_five.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.changeStatusDao;

public class insertPurchaseOk implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		int ordNo = Integer.parseInt(request.getParameter("ordNo"));
		String prdNo = (String)session.getAttribute("prdNo");
		System.out.println("구매 확정 ordNo : " + ordNo);
		System.out.println("구매 확정 prdNo : " + prdNo);
		session.setAttribute("prdNo", prdNo);
		System.out.println("구매 확정 시 세션 prdNo : " + session.getAttribute("prdNo"));
		changeStatusDao dao = new changeStatusDao();
		dao.updateDelivery(ordNo, "구매 확정");
		
		
		
	}

}
