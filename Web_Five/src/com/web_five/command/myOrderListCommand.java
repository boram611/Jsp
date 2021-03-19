package com.web_five.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.CartDao;
import com.web_five.dao.orderInfoDao;
import com.web_five.dto.CartDto;
import com.web_five.dto.orderListDto;

public class myOrderListCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		String userId = (String) session.getAttribute("Log_userId");
		System.out.println("cmd 1------------------");
		orderInfoDao dao = new orderInfoDao();
		orderListDto dto = new orderListDto();
		ArrayList<orderListDto> dtos = new ArrayList<orderListDto>();
		
		System.out.println("cmd 2------------------");
		dtos = dao.myOrderList(userId);
		
		
		
		
		

		
		request.setAttribute("myOrderList", dtos);
		System.out.println("cmd 3------------------");
		System.out.println("cmd 4------------------");
		System.out.println("주문번호 : " + dto.getOrdNo());
		System.out.println("주문번호 : " + dto.getPrdName());
		System.out.println("주문번호 : " + dto.getPrdPrice());
		System.out.println("주문번호 : " + dto.getOrdQty());
		System.out.println("주문번호 : " + dto.getTotal());
		System.out.println("주문번호 : " + dto.getOrdDate());
		System.out.println("주문번호 : " + dto.getPrdNo());
		System.out.println("cmd 5------------------");
	}

}
