package com.web_five.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.EDao;

public class insertEventCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String eTitle = request.getParameter("eTitle");
		String eContent = request.getParameter("eContent");
		String eFilename = (String) session.getAttribute("eFilename");
		EDao eDao = new EDao();
		eDao.eventWrite(eTitle, eContent, eFilename, startDate, endDate);
	}

}
