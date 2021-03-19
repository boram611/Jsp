package com.web_five.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.NDao;
import com.web_five.dto.NDto;

public class contentViewCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		String nSeqno = request.getParameter("nSeqno");
		NDao dao = new NDao();
		NDto dto = dao.noticeView(nSeqno);
		request.setAttribute("noticeView", dto);
	}

}
