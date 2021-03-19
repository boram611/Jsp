package com.web_five.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.PDao;
import com.web_five.dto.PDto;

public class productViewCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		String prdNo = request.getParameter("prdNo");
		PDao dao = new PDao();
		PDto dto = dao.productView(prdNo);
		request.setAttribute("productView", dto);

	}

}
