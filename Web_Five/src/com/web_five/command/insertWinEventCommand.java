package com.web_five.command;

import java.util.ArrayList;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.EDao;
import com.web_five.dao.NDao;
import com.web_five.dto.ParticipateDto;

public class insertWinEventCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		String eSeqno = (String) session.getAttribute("eSeqno");
		System.out.println("eSeqno : " + eSeqno+"끝");
		EDao dao = EDao.getInstance();
		EDao dao1 = new EDao();
		String[] winnerName = new String[10];
		for(int i =0 ; i<10;i++) {
			winnerName[i]=null;
		}
		ArrayList<ParticipateDto> lists = new ArrayList<ParticipateDto>();
		lists = dao.AllParticipant(eSeqno);
		Random random = new Random();
		int[] randomNumber = new int [10];
		for(int i = 0 ; i<10 ; i++) {								// 범위 받아오기
			randomNumber[i] = random.nextInt(dao1.getEventAllCount(eSeqno));
			for(int l =0 ;l<i;l++) {
				if(randomNumber[i] == randomNumber[l]) {
					i--;
				}
			}
		}
		for(int i=0; i<10;i++) {
			winnerName[i]=lists.get(randomNumber[i]).getUser_userId();
		}
		dao.insertWinner(eSeqno, winnerName);
		
	}

}
