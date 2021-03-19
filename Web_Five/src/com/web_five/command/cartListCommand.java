package com.web_five.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.CartDao;
import com.web_five.dto.CartDto;

public class cartListCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		String userId = (String) session.getAttribute("Log_userId");
		
		CartDao dao = CartDao.getInstance();
		ArrayList<CartDto> dtos = new ArrayList<CartDto>();
		
		dtos = dao.CartList(userId);
		
		CartDao dao1 = new CartDao();
		int[] total = new int[2]; 
		total = dao1.getCartNo(userId);
		session.setAttribute("total", total[1]);
		
		request.setAttribute("userCart", dtos);
	}

}
