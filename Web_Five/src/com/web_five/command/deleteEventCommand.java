package com.web_five.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.EDao;

public class deleteEventCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		String eSeqno = request.getParameter("eSeqno");
		
		EDao dao = new EDao();
		dao.eventDelete(eSeqno);
	}

}
