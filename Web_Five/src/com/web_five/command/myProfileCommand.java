package com.web_five.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.myPageDao;
import com.web_five.dto.userDto;

public class myProfileCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String userId = (String)session.getAttribute("Log_userId");
		System.out.println("접속한 아이디 : " + userId);
		myPageDao dao = new myPageDao();
		userDto dtos = dao.showUserInfo(userId);
		request.setAttribute("userDto", dtos);
		session.setAttribute("beforeUserEmail", dtos.getBeforeUserEmail1() + "@" + dtos.getBeforeUserEmail2());
	}

}
