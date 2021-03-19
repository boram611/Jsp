package com.web_five.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.CartDao;
import com.web_five.dao.orderInfoDao;
import com.web_five.dto.CartDto;
import com.web_five.dto.userDto;

public class showAllOrdererInfoCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String loginId = (String)session.getAttribute("Log_userId");
		orderInfoDao dao = new orderInfoDao();
		userDto dto = dao.showOrderInfo(loginId);
		session.setAttribute("userDto", dto);
		int carttotal = (int) session.getAttribute("total");
		session.setAttribute("realTotal", carttotal);
	}

}
