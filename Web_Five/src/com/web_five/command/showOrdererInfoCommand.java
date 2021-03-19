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
import com.web_five.dto.orderDto;
import com.web_five.dto.userDto;

public class showOrdererInfoCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		String loginId = (String)session.getAttribute("Log_userId");
		orderInfoDao dao = new orderInfoDao();
		userDto dto = dao.showOrderInfo(loginId);
		session.setAttribute("userDto", dto);
		String[] dcartNo = (String[]) session.getAttribute("dcartNo");
		CartDao cartdao = CartDao.getInstance();
		ArrayList<CartDto> dtos = new ArrayList<CartDto>();
		System.out.println("시작");
		int carttotal = 0;
		for(int i = 0 ; i<dcartNo.length;i++) {
			dtos.addAll(cartdao.purchaselist(loginId, dcartNo[i]));
		}
		for(int i = 0 ; i<dtos.size() ; i++) {
			carttotal += (dtos.get(i).getCartQty()*dtos.get(i).getPrdPrice());
		}
		session.setAttribute("realTotal", carttotal);
	}

}
