package com.web_five.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.UDao;

public class deleteFromAdminCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String userId = request.getParameter("userId");

		UDao dao = new UDao();
		dao.deleteUser(userId);
	}

}
