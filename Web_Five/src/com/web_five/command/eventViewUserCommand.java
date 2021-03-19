package com.web_five.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.EDao;
import com.web_five.dto.EDto;
import com.web_five.dto.ParticipateDto;

public class eventViewUserCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		String eSeqno = request.getParameter("eSeqno");
		String userId = (String) session.getAttribute("Log_userId");
		EDao dao = new EDao();
		EDto dto = dao.eventView(eSeqno);
		
		session.setAttribute("eventfilenameD", dto.geteFilename());
		request.setAttribute("eventView", dto);
		request.setAttribute("participant", dao.participant(eSeqno, userId));
		ArrayList<ParticipateDto> lists = new ArrayList<ParticipateDto>();
		EDao dao2 = EDao.getInstance();
		lists = dao2.WinnerList(eSeqno);
		request.setAttribute("eventResultView", lists);

	}

}
