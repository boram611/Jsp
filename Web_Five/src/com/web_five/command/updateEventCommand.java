package com.web_five.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.EDao;

public class updateEventCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		String eSeqno = request.getParameter("eSeqno");
		String eTitle = request.getParameter("eTitle");
		String eContent = request.getParameter("eContent");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String eFilename = (String) session.getAttribute("eFilename");
		EDao dao = new EDao();
		dao.eventModify(eSeqno, eTitle, eContent, startDate, eFilename, endDate);
	}

}
