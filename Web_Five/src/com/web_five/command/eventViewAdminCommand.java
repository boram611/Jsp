package com.web_five.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.EDao;
import com.web_five.dto.EDto;

public class eventViewAdminCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		String eSeqno = request.getParameter("eSeqno");
		EDao dao = new EDao();
		EDto dto = dao.eventView(eSeqno);
		request.setAttribute("eventView", dto);
	}

}
