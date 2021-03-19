package com.web_five.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.dao.RDao;
import com.web_five.dto.RDto;

public class reviewShowCommand implements MainCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// TODO Auto-generated method stub
		String goods_prdNo = request.getParameter("prdNo");
		System.out.println("reviewShowCommand 상품번호: " + goods_prdNo);
		RDao dao = new RDao();
		ArrayList<RDto> dtos = dao.reviewList(goods_prdNo);
		ArrayList<String>arrayList = dao.avgOrdStar(goods_prdNo);
		
		String strAvgOrdStar = "";
		double avgOrdStar = 0;
		double remain = 0;
		int cnt1 = 0;
		int cnt2 = 0;
		int cnt3 = 0;
		int cnt4 = 0;
		int cnt5 = 0;
		int div = 0;
	
		if(arrayList.size() == 0) {
			request.setAttribute("avgOrdStar", 0);
			request.setAttribute("strAvgOrdStar", "☆☆☆☆☆");
		}else {
			System.out.println("reviewShowCommand arrayList : " + arrayList.get(0));
			
			System.out.println(arrayList.size());
			for(int i = 0; i < arrayList.size(); i ++) {
				System.out.println("오류 구간 1--------");	
				if(arrayList.get(i).equals("★")) {
					cnt1++;
				}
				System.out.println("오류 구간 2--------");	
				if(arrayList.get(i).equals("★★")) {
					cnt2++;
				}
				System.out.println("오류 구간 3--------");	
				if(arrayList.get(i).equals("★★★")) {
					cnt3++;
				}
				System.out.println("오류 구간 4--------");	
				if(arrayList.get(i).equals("★★★★")) {
					cnt4++;
				}
				System.out.println("오류 구간 5--------");	
				if(arrayList.get(i).equals("★★★★★")) {
					cnt5++;
				}
				System.out.println("오류 구간 6--------");	
				div++;
				
			}
			System.out.println("오류 구간 7--------");	
			cnt2 = cnt2 * 2;
			cnt3 = cnt3 * 3;
			cnt4 = cnt4 * 4;
			cnt5 = cnt5 * 5;
			System.out.println("오류 구간 8--------");	
			
			System.out.println(cnt1);
			System.out.println(cnt2);
			System.out.println(cnt3);
			System.out.println(cnt4);
			System.out.println(cnt5);
			
			System.out.println("나누는 수 " + div);
			
			if(div == 0) {
				avgOrdStar = 0;
			}else {
				avgOrdStar = (cnt1 + cnt2 + cnt3 + cnt4 + cnt5) / div;
				remain = (cnt1 + cnt2 + cnt3 + cnt4 + cnt5) % div;
			}
			avgOrdStar = avgOrdStar + (remain * 0.1);
			
			if(avgOrdStar >= 0 && avgOrdStar < 0.5) {
				strAvgOrdStar = "☆☆☆☆☆";
			}
			if(avgOrdStar >= 0.5 && avgOrdStar < 1.5) {
				strAvgOrdStar = "★☆☆☆☆";
			}
			if(avgOrdStar >= 1.5 && avgOrdStar < 2.5) {
				strAvgOrdStar = "★★☆☆☆";
			}
			if(avgOrdStar >= 2.5 && avgOrdStar < 3.5) {
				strAvgOrdStar = "★★★☆☆";
			}
			if(avgOrdStar >= 3.5 && avgOrdStar < 4.5) {
				strAvgOrdStar = "★★★★☆";
			}
			if(avgOrdStar >= 4.5) {
				strAvgOrdStar = "★★★★★";
			}
			
			System.out.println("평균평점 : " + avgOrdStar);
			System.out.println("평균별점 : " + strAvgOrdStar);
			
			request.setAttribute("reviewList", dtos);
			request.setAttribute("avgOrdStar", String.format("%.2f", avgOrdStar));
			request.setAttribute("strAvgOrdStar", strAvgOrdStar);
		
	}

	}

}
