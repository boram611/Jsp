package com.web_five.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.findDao;
import com.web_five.dao.myPageDao;
import com.web_five.dto.userDto;

public class idFindCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		String inputEmail1 = request.getParameter("inputEmail1");
		String inputEmail2 = request.getParameter("inputEmail2");
		String inputBirth = request.getParameter("inputBirth");
		String email = inputEmail1 + "@" + inputEmail2;
		
		System.out.println("찾는 이메일 : " + email);
		System.out.println("찾는 생년월일 : " + inputBirth);
		findDao dao = new findDao();
		request.setAttribute("id", dao.findId(email, inputBirth));
	}

}
