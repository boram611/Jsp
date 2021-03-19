package com.web_five.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.myPageDao;
import com.web_five.dto.userDto;

public class profileUpdateCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		userDto dto = new userDto();
		myPageDao dao = new myPageDao();
		
		int updateOk = 1;
		String userId = dto.getUserId();
		String userPw = dto.getUserPw2();
		String userName = dto.getUserName();
		String userBrith = dto.getUserBirth();
		String userAddress = dto.getUserAddress();
		String userTel = dto.getUserTel();
		String userEmail = dto.getUserEmail();
		
		System.out.println("조건 Id : " + userId);
		System.out.println("수정 Pw : " + userPw);
		System.out.println("수정 이름 : " + userName);
		System.out.println("수정 생년월일 : " + userBrith);
		System.out.println("수정 주소 : " + userAddress);
		System.out.println("수정 연락처 : " + userTel);
		System.out.println("수정 이메일 : " + userEmail);
		
		dao.updateProfile(userId, userPw, userName, userBrith, userAddress, userTel, userEmail);
		
		session.setAttribute("userName", userName);
		session.setAttribute("UpdateOk", updateOk);
		
		

	}

}
