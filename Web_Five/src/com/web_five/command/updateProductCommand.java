package com.web_five.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.PDao;

public class updateProductCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		String ctgType = request.getParameter("ctgType");
		String prdNo = request.getParameter("prdNo");
		String prdName = request.getParameter("prdName");
		String prdPrice = request.getParameter("prdPrice");
		String prdStock = request.getParameter("prdStock");
		String prdContent = request.getParameter("prdContent");
		String prdFilename = (String) session.getAttribute("prdFilename");
		String prdDFilename = (String) session.getAttribute("prdDFilename");
		String prdAFilename = (String) session.getAttribute("prdAFilename");
		PDao pdao = new PDao();
		pdao.productModify(ctgType, prdNo, prdName, prdPrice, prdStock, prdContent, prdFilename, prdDFilename, prdAFilename);
	}

}
