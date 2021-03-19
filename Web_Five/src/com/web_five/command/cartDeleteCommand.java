package com.web_five.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.CartDao;

public class cartDeleteCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		String [] dcartNo = (String[]) session.getAttribute("dcartNo");
		String userId = (String) session.getAttribute("Log_userId");
		CartDao cartDelete = new CartDao();
		for(int i = 0; i<dcartNo.length ; i++) {
			System.out.println(dcartNo[i]);
		}
		cartDelete.cartDelete(dcartNo, userId);
		
	}

}
