package com.web_five.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.NDao;

public class insertNoticeCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		String nTitle = request.getParameter("nTitle");
		String nContent = request.getParameter("nContent");
		String admin_adminId = request.getParameter("admin_adminId");
		
		NDao dao = new NDao();
		dao.noticeWrite(nTitle, nContent, admin_adminId);
	}

}
