package com.web_five.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.EDao;

public class participateInEventCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		int eSeqno = Integer.parseInt(request.getParameter("eSeqno"));
		String euserId = (String) session.getAttribute("Log_userId");
		EDao dao = new EDao();
		request.setAttribute("result", dao.participateInEvent(eSeqno, euserId));
		request.setAttribute("eSeqno", eSeqno);
		request.setAttribute("startDate", request.getParameter("startDate"));
		request.setAttribute("endDate", request.getParameter("endDate"));
		request.setAttribute("eTitle", request.getParameter("eTitle"));
		request.setAttribute("eContent", request.getParameter("eContent"));
		
	}

}
