package com.web_five.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.UDao;
import com.web_five.dto.UDto;

public class manaDUserCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		UDao dao = new UDao();
		ArrayList<UDto> dtos = dao.UserDList();
		request.setAttribute("manaDUser", dtos);

	}

}
