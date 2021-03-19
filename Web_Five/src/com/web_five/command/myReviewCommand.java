package com.web_five.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.RDao;
import com.web_five.dto.RDto;

public class myReviewCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		String userId = (String)session.getAttribute("Log_userId");
		System.out.println("myReviewCommand userId: " + userId);
		RDao dao = new RDao();
		ArrayList<RDto> dtos = dao.UserDList(userId);
		request.setAttribute("myReviewList", dtos);

	}

}
