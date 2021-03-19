package com.web_five.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.PDao;

public class deleteProductCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
	String prdNo = request.getParameter("prdNo");
		
		PDao dao = new PDao();
		dao.productDelete(prdNo);
	}

}
