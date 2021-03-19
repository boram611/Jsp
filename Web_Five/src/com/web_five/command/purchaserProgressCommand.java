package com.web_five.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.CartDao;
import com.web_five.dao.OrderdetailDao;
import com.web_five.dao.orderInfoDao;
import com.web_five.dto.CartDto;
import com.web_five.dto.orderDto;

public class purchaserProgressCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		orderDto dto = new orderDto();
		orderInfoDao dao = new orderInfoDao();
		OrderdetailDao orderDao = new OrderdetailDao();
		CartDao cartdao = CartDao.getInstance();
		CartDao cartdao1 = new CartDao();
		ArrayList<CartDto> dtos = new ArrayList<CartDto>();
		int carttotal = (int)session.getAttribute("total");
		int realtotal = (int) session.getAttribute("realTotal");
		System.out.println("카트 금액 : "+carttotal);
		System.out.println("주문 금액 : "+realtotal);
		String user_userId = dto.getUser_userId();
		String ordReceiver = dto.getOrdReceiver();
		String ordRcvAddress = dto.getOrdRcvAddress();
		String ordRcvPhone = dto.getOrdRcvPhone();
		String ordPay = dto.getOrdPay();
		String ordBank = dto.getOrdBank();
		String ordCardNo = dto.getOrdCardNo();
		String ordCard1 = dto.getOrdCard1();
		String ordCard2 = dto.getOrdCard2();
		String ordCard3 = dto.getOrdCard3();
		String ordCard4 = dto.getOrdCard4();
		String ordCardPass = dto.getOrdCardPass();
		System.out.println("카드 패스 : "+ordCardPass);
		String[] dcartNo = (String[]) session.getAttribute("dcartNo");
		int ordNo = dao.recentOrderNo(user_userId);
		dao.insertOrderInfo(user_userId, ordReceiver, ordRcvAddress, ordRcvPhone, ordPay, ordBank, ordCardNo, ordCardPass);
		if(dcartNo!=null) {
			for(int i = 0 ; i<dcartNo.length;i++) {
				dtos.addAll(cartdao.purchaselist(user_userId, dcartNo[i]));
			}
			for(int i = 0 ; i<dtos.size() ; i++) {
				orderDao.insertDetail(dtos.get(i).getCartQty(), dtos.get(i).getGoods_prdNo(), dtos.get(i).getUser_userId(), ordNo);
			}
			int remnants = carttotal-realtotal;
			cartdao.updateTotal(remnants, user_userId);
			cartdao1.cartDelete(dcartNo, user_userId);
		}else {
			System.out.println("시");
			String prdNo = (String) session.getAttribute("prdNo");
			String strcartQty = (String) session.getAttribute("cartQty");
			int cartQty = Integer.parseInt(strcartQty);
			orderDao.insertDetail(cartQty, prdNo, user_userId, ordNo);
		}
//		System.out.println("총 수량 : "+dtos.get(0).getCartQty());
		orderDto dto2 = new orderDto(user_userId, ordReceiver, ordRcvAddress, ordRcvPhone, ordPay, ordBank, ordCardNo, ordCardPass, ordCard1, ordCard2, ordCard3, ordCard4);
		request.setAttribute("orderDto", dto2);
		System.out.println("진행9");

}
}
