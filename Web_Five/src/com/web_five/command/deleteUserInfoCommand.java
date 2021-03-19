package com.web_five.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.myPageDao;

public class deleteUserInfoCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		System.out.println("탈퇴할 아이디 : " + session.getAttribute("Log_userId"));
		String userId = (String)session.getAttribute("Log_userId");
		
		myPageDao dao = new myPageDao();
		dao.deleteUserInfo(userId);
		session.invalidate();
		
		
	}

}
