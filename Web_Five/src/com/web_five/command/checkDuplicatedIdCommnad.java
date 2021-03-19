package com.web_five.command;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.joinUsDao;
import com.web_five.dto.userDto;

public class checkDuplicatedIdCommnad implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
		
		userDto dto = new userDto();
		
		int TCI = 1;
		String userId = dto.getUserId();
		String userPw1 = dto.getUserPw1();
		String userPw2 = dto.getUserPw2();
		String userName = dto.getUserName();
		String userBrith = dto.getUserBirth();
		String userAddr1 = dto.getBeforeUserAddress1();
		String userAddr2 = dto.getBeforeUserAddress2();
		String userAddr3 = dto.getBeforeUserAddress3();
		String userTel1 = dto.getBeforeUserTel1();
		String userTel2 = dto.getBeforeUserTel2();
		String userTel3 = dto.getBeforeUserTel3();
		String userEmail1 = dto.getBeforeUserEmail1();
		String userEmail2 = dto.getBeforeUserEmail2();

		boolean idCheckValue = true;
		
		userDto dtos = new userDto(userId, userPw1, userPw2, userName, userAddr1, userAddr2, userAddr3, userTel1, userTel2, userTel3, userEmail1, userEmail2, userBrith);
		
		request.setAttribute("userDto", dtos);
		//여기까진 창 돌아와서 값 보존하기 위해 쓴 
		
		joinUsDao dao = new joinUsDao();
		
		String afterUserId = (String)session.getAttribute("userId");
		System.out.println("회원가입 아이디 after : " + afterUserId);
		
		if(dao.check_DuplicatedId(afterUserId) == 1) {
			idCheckValue = false;
		}else if(dao.check_DuplicatedId(afterUserId) == 0){
		
		}
		System.out.println("dto에 저장된 변경 후 userId: " + dtos.getUserId());
		System.out.println("수정 후 아이디 : " + afterUserId);
		session.setAttribute("idCheckValue", idCheckValue);
		session.setAttribute("TCI", TCI);
		System.out.println("아이디 체크벨류2 : " + session.getAttribute("idCheckValue"));

}
}