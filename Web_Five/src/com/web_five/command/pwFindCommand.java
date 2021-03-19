package com.web_five.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.findDao;

public class pwFindCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		String inputId = request.getParameter("inputId");
		String inputEmail1 = request.getParameter("inputEmail1");
		String inputEmail2 = request.getParameter("inputEmail2");
		String inputBirth = request.getParameter("inputBirth");
		String email = inputEmail1 + "@" + inputEmail2;
		
		System.out.println("찾는 이메일 : " + email);
		System.out.println("찾는 생년월일 : " + inputBirth);
		System.out.println("찾는 아이디 : " + inputId);
		findDao dao = new findDao();
		request.setAttribute("pw", dao.findPw(email, inputBirth, inputId));
	}

}
