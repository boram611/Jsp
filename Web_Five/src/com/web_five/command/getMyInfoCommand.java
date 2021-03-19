package com.web_five.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.orderInfoDao;
import com.web_five.dto.orderDto;
import com.web_five.dto.userDto;

public class getMyInfoCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		String loginId = (String)session.getAttribute("Log_userId");
		System.out.println("주문자 정보 동일 아이디 : " + loginId);
		
		orderInfoDao dao = new orderInfoDao();
		orderDto dto = dao.myInfo(loginId);
		request.setAttribute("orderDto", dto);

	}

}
