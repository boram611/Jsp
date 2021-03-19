package com.web_five.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.QDao;

public class qnaInsertCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		String qChapter = request.getParameter("qChapter");
		String qTitle = request.getParameter("qTitle");
		String qContent = request.getParameter("qContent");
		String quserId = (String) session.getAttribute("Log_userId");
		String qFile = (String) session.getAttribute("filename");
		QDao qnadao = new QDao();
		System.out.println(qTitle);
		System.out.println(qContent);
		System.out.println(qFile);
		qnadao.write(qChapter, qTitle, qContent, qFile, quserId);

	}

}
