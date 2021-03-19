package com.web_five.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.PDao;
import com.web_five.dto.PDto;

public class productShowCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		String prdNo = request.getParameter("prdNo");
		PDao dao = new PDao();
		PDto dto = dao.storeMain(prdNo);
		request.setAttribute("storeMain", dto);
		System.out.println("productShowCommand 상품번호 : " + dto.getPrdNo());
		
		

	}

}
