package com.web_five.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.mainDao;
import com.web_five.dto.NDto;
import com.web_five.dto.prdDto;

public class mibbaMainCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		System.out.println("command");
		//-------------------------실시간
		mainDao dao = new mainDao();
		ArrayList<prdDto> dtos = dao.real();
		request.setAttribute("real", dtos);
		
		//-------------------------신상품
		ArrayList<prdDto> dto = dao.nw();
		request.setAttribute("nw", dto);
		
		//------------------------공지사항
		
		ArrayList<NDto> ddto = dao.noticeView();
		request.setAttribute("notice", ddto);
		

		
		
		
		
	}
}
