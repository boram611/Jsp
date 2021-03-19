package com.web_five.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.QDao;
import com.web_five.dto.QDto;

public class oneToOneViewCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		String qSeqno = request.getParameter("qSeqno");
		QDao dao = new QDao();
		
		QDto dto = dao.contentView(qSeqno);
		
		request.setAttribute("content_view", dto);
	}

}
