package com.web_five.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.mainDao;
import com.web_five.dao.searchDao;
import com.web_five.dto.prdDto;

public class searchProductAdminCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		
		String search = request.getParameter("search");
		
		prdDto dto = new prdDto();
		searchDao dao = new searchDao();
		ArrayList<prdDto> ddto = dao.searchaction(search);
		session.setAttribute("search", ddto);
		
		

	}

}
