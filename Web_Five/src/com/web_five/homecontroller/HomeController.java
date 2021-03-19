package com.web_five.homecontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web_five.command.*;

/**
 * Servlet implementation class HomeController
 */
@WebServlet("*.five")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionFive(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		actionFive(request, response);
	}
	
	
	private void actionFive(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String uri = request.getRequestURI();
		// /MVCBoard/aaa.do
		
		String conPath = request.getContextPath();
		// /MVCBoard
		
		String com = uri.substring(conPath.length());
		
		MainCommand command = null;
		String viewPage = null;
		
		
		
		
		switch(com) {
//--------------------메인페이지-------------------------
		case("/mibbdaMain.five"):
			command = new mibbaMainCommand();
			command.execute(request, response, session);
			viewPage = "mibbdaMain.jsp";
			break;
			
		case("/searchProduct.five"): // 메인 페이지에서 상품 검색
			command = new searchProductAdminCommand();
			command.execute(request, response, session);
			viewPage = "searchResults.jsp";
			break;
//---------------------------------------------------
			
			
//--------------------인트로-------------------------			
		case("/intro.five"):
			viewPage = "intro.jsp";
			break;
//---------------------------------------------------
			
			
			

		
//--------------------스토어 탭-------------------------		
			
		case("/storeMain.five"): // 메인 페이지에 있는 스토어 클릭
			command = new manageProductCommand();
			command.execute(request, response, session);
			viewPage = "storeMain.jsp";
			break;
		case("/store1.five"): // 생활/주방
			command = new store1Command();
			command.execute(request, response, session);
			viewPage = "store1.jsp";
			break;
		case("/store2.five"): // 화장품
			command = new store2Command();
			command.execute(request, response, session);
			viewPage = "store2.jsp";
			break;
		case("/store3.five"): // 유아/완구
			command = new store3Command();
			command.execute(request, response, session);
			viewPage = "store3.jsp";
			break;
		case("/store4.five"): // 태블릿/핸드폰
			command = new store4Command();
			command.execute(request, response, session);
			viewPage = "store4.jsp";
			break;
		case("/productShowMain.five"): // 상품 상세보기
			command = new productShowCommand();
			command.execute(request, response, session);
			viewPage = "productView.jsp";
			break;
		case("/review.five"): // 상품 후기보기
			command = new reviewShowCommand();
			command.execute(request, response, session);
			viewPage = "review.jsp";
			break;
			
		case("/selectCartAction.five"): // 선택한거 나누기
	         command = new selectCartActionCommand();
	         command.execute(request, response, session);
	         if(session.getAttribute("select").equals("구매")) {
	            viewPage = "purchaseInsertView.five";
	         }else if(session.getAttribute("select").equals("삭제")) {
	            viewPage = "cartDelete.five";
	         }
	         break;
	         
		case("/insertCart.five"): // 장바구니 담기
	         command = new insertCartCommand();
	         command.execute(request, response, session);
	         viewPage = "cartList.five";
	         break;
	         
		case("/cartList.five"): // 장바구니 보기
			command = new cartListCommand();
			command.execute(request, response, session);
			viewPage = "cartList.jsp";
			break;
			
		case("/updateCart.five"): // 장바구니 수정
			command = new updateCartCommand();
			command.execute(request, response, session);
			viewPage = "cartList.five";
			break;
			
		case("/cartDelete.five"): // 장바구니 삭제
			command = new cartDeleteCommand();
			command.execute(request, response, session);
			viewPage = "cartList.five";
			break;
			
		case("/purchase.five"): // 바로 구매하기
			command = new productCommand();
			command.execute(request, response, session);
			viewPage = "purchaseInsertView.jsp";
			break;
			

		case("/purchaseInsertView.five"): // 결제페이지
			command = new showOrdererInfoCommand();
			command.execute(request, response, session);
			viewPage = "purchaseInsertView.jsp";
			break;
			
		case("/purchaseAllInsertView.five"): // 전체 결제페이지
			command = new showAllOrdererInfoCommand();
			command.execute(request, response, session);
			viewPage = "purchaseInsertView.jsp";
		break;
			
		case("/purchaseOk.five"): // 결제하기
			command = new purchaserProgressCommand();
			command.execute(request, response, session);
			viewPage = "purchaseOk.jsp";
			break;
		
		case("/getMyInfo.five"): // 주문자 정보 동일
			System.out.println("주문자정보------------");
			command = new getMyInfoCommand();
			command.execute(request, response, session);
			viewPage = "purchaseInsertView.jsp";
			break;	
			
			
		case("/purchaseNo.five"): // 취소하기
			viewPage = "mibbdaMain.jsp";
			break;
//---------------------------------------------------
			
			
//---------------------공지하기 탭-------------------------
		case("/eventList.five"): // 이벤트 탭
			command = new eventCommand();
			command.execute(request, response, session);
			viewPage = "eventList.jsp";
			break;
			
		case("/eventViewUser.five"): // 이벤트 상세보기
			command = new eventViewUserCommand();
			command.execute(request, response, session);
			viewPage = "eventViewUser.jsp";
			break;
			
				
		case("/noticeList.five"): // 공지사항 탭 (리스트)
			command = new noticeCommand();
			command.execute(request, response, session);
			viewPage = "noticeList.jsp";
			break;
			
		case("/noticeView.five"): // 공지사항 상세보기
			command = new noticeViewCommand();
			command.execute(request, response, session);
			viewPage = "noticeView.jsp";
			break;
			
		case("/qnaListView.five"): // 문의하기 탭 (리스트)
			command = new qnaListCommand();
			command.execute(request, response, session);
			viewPage = "qnaListView.jsp";
			break;
			
		case("/qnaInsertView.five"): // 문의하기 작성
			viewPage = "qnaInsertView.jsp";
			break;
			
		case("/qnaInsert.five"): // 문의하기 글 등록
			command = new qnaInsertCommand();
			command.execute(request, response, session);
			viewPage = "qnaListView.five";
			break;
			
		case("/qnaView.five"): // 문의하기 상세보기
			command = new qnaViewCommand();
			command.execute(request, response, session);
			viewPage = "qnaView.jsp";
			break;
			
		case("/qnaFileUpload.five"): // 문의하기 파일 업로드
			command = new qnaFileUpdateCommand();
			command.execute(request, response, session);
			viewPage = "filecheck.jsp";
			break;
			
//------------------------------------------------------
			

			
//---------------------회원가입--------------------------	
			
		case("/agree.five"): // 회원가입(동의화면)
			viewPage = "JoinAgree.jsp";
			break;
		case("/agreeOk.five"): // 회원가입 화면
			viewPage = "joinUsView.jsp";
			break;
		
			
		case("/joinUsOk.five"): // 회원정보 INSERT 후 완료화면
			command = new joinUsCommand();
			command.execute(request, response, session);
			viewPage = "JoinResult.jsp";
				
			break;
		case("/selectPage.five"):
			viewPage = "selectPage.jsp";
			break;
			
		case("/idCheck.five"):
			command = new checkDuplicatedIdCommnad();
			command.execute(request, response, session);
			viewPage = "joinUsView.jsp";
			break;

		case("/check_Email.five"): // 이메일 중복확인
			System.out.println("--------------------");
			command = new checkEmailCommand();
			System.out.println("--------------------");
			command.execute(request, response, session);
			System.out.println("체크벨류 값 : " + session.getAttribute("checkValue"));
			viewPage = "myProfile.jsp";
			break;
		case("/joinUs_Check_Email.five"): // 이메일 중복확인
			command = new checkEmailCommand();
			command.execute(request, response, session);
			viewPage = "joinUsView.jsp";
			break;


//------------------------------------------------------
			
			

//---------------------로그인 및 로그아웃--------------------------				
			
			
		case("/logIn.five"): // 로그인 화면
			viewPage = "logInView.jsp";
			break;
			
		case("/logInTry.five"): // 로그인 시도
			System.out.println("login check");
			command = new logInTryCommand();
			command.execute(request, response, session);
			
			if((Integer)session.getAttribute("check")== 0 && (Integer)session.getAttribute("check2") == 3) {
				System.out.println("1------------");
				viewPage = "mibbdaMain.five";
				}
			if((Integer)session.getAttribute("check")== 1 && (Integer)session.getAttribute("check2") == 2) {
				System.out.println("2------------");
				viewPage = "manageNotice.five";
				}
			if((Integer)session.getAttribute("check")== 1 && (Integer)session.getAttribute("check2") == 3) {
				System.out.println("2------------");
				viewPage = "logInView.jsp";
				}
	
			
			
			break;
			
		case("/idFind.five"): // 아이디 찾기
			command = new idFindCommand();
			command.execute(request, response, session);
			viewPage = "yourId.jsp";
			break;
			
		case("/pwFind.five"): // 비밀번호 찾기
			command = new pwFindCommand();
			command.execute(request, response, session);
			viewPage = "yourPw.jsp";
			break;
			
		case("/logOut.five"): // 로그아웃
			viewPage = "mibbdaMain.five";
			break;
			
		
			
			
//------------------------------------------------------	
			
			
			
//---------------------마이페이지--------------------------				
			
			
		case("/myPage.five"): // 마이페이지 메인
			viewPage = "myOrderListView.jsp";
			break;
			
		case("/myProfile.five"): // 프로필 화면
			command = new myProfileCommand();
			command.execute(request, response, session);
			viewPage = "myProfile.jsp";
			break;
			
		case("/deleteUserInfo.five"): // 탈퇴
			command = new deleteUserInfoCommand();
			command.execute(request, response, session);
			viewPage = "mibbdaMain.five";
			break;
		case("/profileUpdate.five"): // 수정
			command = new profileUpdateCommand();
			command.execute(request, response, session);
			viewPage = "myProfile.five";
			break;
			
		case("/myOrderList.five"): // 주문 조회 화면
			command = new myOrderListCommand();
			command.execute(request, response, session);
			viewPage = "myOrderListView.jsp";
			break;
		
		case("/click.five"): // 주문 조회 화면
			String clickName = request.getParameter("click");
			
			if(clickName.equals("주문 목록보기")) {
				viewPage = "myOrderList.five";
				break;
			}
			if(clickName.equals("구매 확정")) {
				command = new insertPurchaseOk();
				command.execute(request, response, session);
				viewPage = "myOrderView.five";
				break;
			}
			if(clickName.equals("리뷰 쓰기")) {
				viewPage = "myReview.jsp";
				break;
			}
			
		
		
		case("/myOrderView.five"): // 주문 조회 상세보기
			command = new myOrderViewCommand();
			command.execute(request, response, session);
			viewPage = "myOrderView.jsp";
			break;
			
		case("/reviewInsert.five"): // 리뷰 쓰기 
			command = new reviewInsertCommand();
			command.execute(request, response, session);
			viewPage = "myOrderView.jsp";
			break;
			

			
		case("/wtireMySelf.five"): // 게시물 관리
			viewPage = "writeMySelf.jsp";
			break;
			
		case("/myReviewList.five"): // 내가 쓴 리뷰 리스트
			command = new myReviewCommand();
			command.execute(request, response, session);
			viewPage = "myReviewList.jsp";
			break;
			
//		case("/deleteMyReview.five"): // 내가 쓴 리뷰 지우기
//			command = new deleteMyReviewCommand();
//			command.execute(request, response, session);
//			viewPage = "myReviewList.five";
//			break;
//			
//		case("/updateMyReview.five"): // 내가 쓴 리뷰 수정
//			command = new updateMyReviewCOmmand();
//			command.execute(request, response, session);
//			viewPage = "myReviewList.five";
//			break;
			
		case("/myQnaList.five"): // 내가 쓴 문의글 리스트
			command = new qnaListCommand();
			command.execute(request, response, session);
			viewPage = "myQnaList.jsp";
			break;
			
		case("/myEventList.five"): // 내가 참여한 이벤트 리스트
			command = new myEventListCommand();
			command.execute(request, response, session);
			viewPage = "myEventList.jsp";
			break;

			
//		case("/myTempCartList.five"): // 찜한 상품 리스트
//			command = new myTempCartCommand();
//			command.execute(request, response, session);
//			viewPage = "myTempCartList.jsp";
//			break;
			
//		case("/myTempCartOff.five"): // 찜하기 OFF
//			command = new tempCartOffCommand();
//			command.execute(request, response, session);
//			viewPage = "myOrderView.jsp";
//			break;
//------------------------------------------------------	
			
			
//---------------------관리자 페이지--------------------------			
			
		case("/manageMain.five"):	//관리자 메인 가기
			viewPage = "manageNoticeList.jsp";
			break;	
			
		case("/manageUser.five"): // 유저리스트
			command = new manageUserCommand();
			command.execute(request, response, session);
			viewPage = "manageUserList.jsp";
			break;
			
		case("/deleteFromAdmin.five"): // 유저 정보 삭제
			command = new deleteFromAdminCommand();
			command.execute(request, response, session);
			viewPage = "manageUser.five";
			break;
			
		case("/manaDUserList.five"): // 유저 탈퇴 리스트
			command = new manaDUserCommand();
			command.execute(request, response, session);
			viewPage = "manaDUserList.jsp";
			break;
			
			
		case("/manageProduct.five"): // 상품리스트
			command = new manageProductCommand();
			command.execute(request, response, session);
			viewPage = "manageProductList.jsp";
			break;
		
		case("/manageDelivery.five"): // 배송관리
			viewPage = "manageDeliveryList.jsp";
			command = new manageDeliveryListCommand();
			command.execute(request, response, session);
			break;
		
		case("/salesList.five"):
			command = new salesListfiveCommand();
			command.execute(request, response, session);
			viewPage = "sales.jsp";
			break;
		
		case("/insertProduct.five"): // 상품 등록
			command = new insertProductCommand();
			command.execute(request, response, session);
			viewPage = "manageProduct.five";
			break;
			
		case("/insertProductView.five"): // 상품 등록 페이지
			viewPage = "insertProductView.jsp";
			break;
			
		case("/showProduct.five"): // 상품 상세보기
			command = new productViewCommand();
			command.execute(request, response, session);
			viewPage = "productViewAdmin.jsp";
			break;
			
		case("/deleteProduct.five"): // 상품 삭제
			command = new deleteProductCommand();
			command.execute(request, response, session);
			viewPage = "manageProduct.five";
			break;
			
		case("/updateProductView.five"): // 상품 정보 수정
			command = new updateProductCommand();
			command.execute(request, response, session);
			viewPage = "manageProduct.five";
			break;
		
		case("/proFileUpload1.five"): // 상품 파일 업로드
			command = new proFileCommand1();
			command.execute(request, response, session);
			viewPage = "proFilecheck1.jsp";
			break;
			
		case("/searchProductAdmin.five"): // 상품 리스트에서 검색
			command = new searchProductAdminCommand();
			command.execute(request, response, session);
			viewPage = "productList.jsp";
			break;
	
		case("/manageDeliveryList.five"): // 배송관리
			command = new manageDeliveryListCommand();
			command.execute(request, response, session);
			viewPage = "manageDeliveryList.jsp";
			break;
			
		case("/updateDelivery.five"): // 배송 상태 수정
			command = new updateDeliveryCommand();
			command.execute(request, response, session);
			viewPage = "manageDeliveryList.five";
			break;
		
		case("/manageDeliveryView.five"): // 배송 상태 상세보기
			command = new manageDeliveryViewCommand();
			command.execute(request, response, session);
			viewPage = "manageDeliveryView.jsp";
			break;
		
		case("/manageDeliveryViewDetail.five"): // 배송 상태 상세보기
			command = new manageDeliveryViewDetailCommand();
			command.execute(request, response, session);
			viewPage = "manageDeliveryViewDetail.jsp";
			break;
		
			
			
		case("/manageEvent.five"): // 이벤트 리스트
			command = new manageEventCommand();
			command.execute(request, response, session);
			viewPage = "manageEventList.jsp";
			break;
			
		case("/insertEventView.five"): // 이벤트 등록 페이지
			viewPage = "insertEventView.jsp";
			break;
		
		case("/insertEvent.five"): // 이벤트 등록
			command = new insertEventCommand();
			command.execute(request, response, session);
			viewPage = "manageEvent.five";
			break;
			
		case("/eventFileUpload.five"): // 이벤트 파일 업로드
			command = new eventFileCommand();
			command.execute(request, response, session);
			viewPage = "eventFilecheck.jsp";
		break;
			
		case("/eventViewAdmin.five"): // 이벤트 상세보기
			command = new eventViewAdminCommand();
			command.execute(request, response, session);
			viewPage = "eventViewAdmin.jsp";
			break;
			
		case("/participateInEvent.five"): // 이벤트 참가
			command = new participateInEventCommand();
			command.execute(request, response, session);
			viewPage = "eventViewUser.five";
		break;

			
			
		case("/updateEvent.five"): // 이벤트 수정
			command = new updateEventCommand();
			command.execute(request, response, session);
			viewPage = "manageEvent.five";
			break;
			
		case("/deleteEvent.five"): // 이벤트 삭제
			command = new deleteEventCommand();
			command.execute(request, response, session);
			viewPage = "manageEvent.five";
			break;
			
			
		case("/insertWinViewEvent.five"): // 이벤트별 당첨자 리스트
			command = new updateEventCommand();
			command.execute(request, response, session);
			viewPage = "insertWinView.jsp";
			break;
			
			
		case("/insertWinEventView.five"): // 당첨자 추첨 페이지
			command = new WinnerView();
			command.execute(request, response, session);
			viewPage = "insertWinEventView.jsp";
			break;
			
		case("/insertWinEvent.five"): // 당첨자 등록
			command = new insertWinEventCommand();
			command.execute(request, response, session);
			viewPage = "manageEvent.five";
			break;
			
			
			//******************************
		case("/oneToOneList.five"): // 일대일 문의 리스트
			command = new oneToOneCommand();
			command.execute(request, response, session);
			viewPage = "oneToOneList.jsp";
			break;
			
		case("/insertCommentView.five"): // 일대일 문의 답글 입력 페이지
			command = new oneToOneViewCommand();
			command.execute(request, response, session);
			viewPage = "oneToOneView.jsp";
			break;
			
		case("/insertComment.five"): // 일대일 문의 답글 입력
			command = new insertCommentCommand();
			command.execute(request, response, session);
			viewPage = "oneToOneList.five";
			break;
			
		case("/manageNotice.five"): // 공지사항 리스트
			command = new manageNoticeCommand();
			command.execute(request, response, session);
			viewPage = "manageNoticeList.jsp";
			break;
			
			
		case("/insertNoticeView.five"): // 공지사항 등록 페이지
			viewPage = "insertNoticeView.jsp";
			break;
			
		case("/insertNotice.five"): // 공지사항 저장
			command = new insertNoticeCommand();
			command.execute(request, response, session);
			viewPage = "manageNotice.five";
			break;
			
		case("/manaNoticeView.five"): // 공지사항 내용보기
			command = new contentViewCommand();
			command.execute(request, response, session);
			viewPage = "manaViewNotice.jsp";
			break;
			
		case("/updateNotice.five"): // 공지사항 수정
			command = new updateNoticeCommnad();
			command.execute(request, response, session);
			viewPage = "manageNotice.five";
			break;
			
		case("/deleteNotice.five"): // 공지사항 삭제
			command = new deleteNoticeCommand();
			command.execute(request, response, session);
			viewPage = "manageNotice.five";
			break;
			
		case("/searchNotice.five"): // 공지사항 리스트에서 검색
			command = new searchNoticeCommand();
			command.execute(request, response, session);
			viewPage = "manageNoticeList.jsp";
			break;
//------------------------------------------------------	
			
			
			
		default: // 이외의 모든 연결
			System.out.println("잘못연걸했을 때------------");
			viewPage = "error.jsp";
			break;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
