package com.web_five.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.UDao;
import com.web_five.dao.loginDao;

public class logInTryCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String userId = request.getParameter("id");
		String userPw = request.getParameter("pass");
		
		System.out.println("컨트롤러"+userId);
		loginDao loginDao = new loginDao();
		UDao dao = new UDao();
		
		int check = loginDao.login(userId,userPw);
		session.setAttribute("check", check);
		session.setAttribute("Log_userId", userId);
		int check2 = loginDao.adminlogin(userId,userPw);
		session.setAttribute("check2", check2);
		
		System.out.println("check : " + check);
		System.out.println("check2 : " + check2);
		if( loginDao.login(userId,userPw)==0) {
			String userName = dao.showUserName(userId);
			session.setAttribute("userName", userName);
			System.out.println("결과"+"true");
			
		}else {
		
			session.setAttribute("errMsg", "로그인 정보가 올바르지 않습니다.");
			System.out.println("결과"+ "false");
		}
	}

}
