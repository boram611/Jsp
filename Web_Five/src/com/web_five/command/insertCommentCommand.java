package com.web_five.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.QDao;

public class insertCommentCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		String qComent = request.getParameter("qnaComment");
		int qnaSeqno = Integer.parseInt(request.getParameter("qnaSeqno"));
		System.out.println(qnaSeqno);
		QDao dao = new QDao();
		if(dao.commentwrite(qComent, qnaSeqno)==true) {
			request.setAttribute("result", "true");
		}else {
			request.setAttribute("result", "false");
		}
	}

}
