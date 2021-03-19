package com.web_five.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.EDao;
import com.web_five.dto.ParticipateDto;

public class WinnerView implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		String eSeqno = request.getParameter("eSeqno");
		request.setAttribute("eSeqno", eSeqno);
		System.out.println("winner eSeqno : " + eSeqno);
		ArrayList<ParticipateDto> lists = new ArrayList<ParticipateDto>();
		EDao dao = EDao.getInstance();
		lists = dao.WinnerList(eSeqno);
		request.setAttribute("eventView", lists);
	}

}
