package com.web_five.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.joinUsDao;
import com.web_five.dto.userDto;

public class checkEmailCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		userDto dto = new userDto();
		boolean checkValue = true;
		int TCE = 1;
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
		
		userDto dtos = new userDto(userId, userPw1, userPw2, userName, userAddr1, userAddr2, userAddr3, userTel1, userTel2, userTel3, userEmail1, userEmail2, userBrith);
		
		request.setAttribute("userDto", dtos);
		
		
		System.out.println("체크벨류1 : " + session.getAttribute("checkValue"));
		
		
		joinUsDao dao = new joinUsDao();
		
		String afterUserEmail = (String)session.getAttribute("userEmail");
		String beforeUserEmail = (String)session.getAttribute("beforeUserEmail");
		System.out.println(beforeUserEmail);
		System.out.println(afterUserEmail);
		
		if(afterUserEmail.equals(beforeUserEmail) && dao.check_DuplicatedEmail(afterUserEmail) == 1) {

		}else if(dao.check_DuplicatedEmail(afterUserEmail) == 0){
		
		}else {
			checkValue = false;
		}
		System.out.println("dto에 저장된 변경 후 이메일 : " + dto.getBeforeUserEmail1());
		System.out.println("dto에 저장된 변경 후 이메일 : " + dto.getBeforeUserEmail2());
		System.out.println("수정 전 이메일 : " + beforeUserEmail);
		System.out.println("수정 후 이메일 : " + afterUserEmail);
		session.setAttribute("beforeEmail3", beforeUserEmail);
//		session.setAttribute("afterUserEmail", afterUserEmail);
		session.setAttribute("checkValue", checkValue);
		session.setAttribute("TCI", TCE);
		System.out.println("체크벨류2 : " + session.getAttribute("checkValue"));

		
		
		
	}

}
