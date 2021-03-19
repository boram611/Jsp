package com.web_five.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.orderInfoDao;
import com.web_five.dto.OrderinfoDto;

public class salesListfiveCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		orderInfoDao dao = orderInfoDao.getInstance();
		ArrayList<OrderinfoDto> dtos = new ArrayList<OrderinfoDto>();
		dtos = dao.salesList();
		request.setAttribute("salesList", dtos);

	}

}
