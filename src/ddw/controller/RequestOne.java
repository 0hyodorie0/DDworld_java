package ddw.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ddw.service.DDWorldServiceImpl;
import ddw.service.IDDWorldService;
import ddw.vo.MemberVO;
import ddw.vo.OneVO;



@WebServlet("/requestOne.do")
public class RequestOne extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String requestId = request.getParameter("requestId");
		String responseId = request.getParameter("responseId");
		String onename = request.getParameter("onename");
		System.out.println("------------------------------------------------");
		System.out.println(requestId);
		System.out.println(responseId);
		System.out.println(onename);
		
		
		OneVO onevo = new OneVO();
		int result = 0;
		
		IDDWorldService service = DDWorldServiceImpl.getInstance();
		
		onevo.setMem_id(requestId);
		onevo.setMem_id2(responseId);
		onevo.setOne_name(onename);

		String status = service.checkOne(onevo);
		
		if(status == null) {
			result = service.insertRequestOne(onevo);	//result = 1 / 일촌 신청 인서트
		}else {
			if(status.equals("일촌")) {
				result = 2;
				//이미 일촌입니다.
			}else if(status.equals("대기")){
				result = 3;
				//이미 신청하셨습니다.
			}
		}
		
		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
		/* 미니홈피 주인과 로그인자의 관계 검사 mem_id>미니홈피주인 mem_id2>방문자 */
		int oneChk = 0;
		
		System.out.println("미니홈피 주인 : " + responseId + " / " + " 로그인 자 : " + requestId);
		
		OneVO onevoChk = new OneVO();
		if(requestId == null) { oneChk = 0;	//비회원
		}else if(requestId != null) {
			if(requestId.equals(responseId)) { oneChk = 5;	//본인
			}else {
				/*미니홈피 주인*/onevoChk.setMem_id(responseId);
				/*로그인 자*/onevoChk.setMem_id2(requestId);
				String resultAgain = null;
				//select ONE_ING from ONE where MEM_ID = #mem_id# and MEM_ID2 = #mem_id2#
				resultAgain = service.checkOne(onevoChk);
				if(resultAgain != null && resultAgain.equals("일촌")) { oneChk = 1; //일촌
				}else if(resultAgain != null && resultAgain.equals("대기")) { oneChk = 2; //로그인자에게 신청 온 상태
				}else {
					onevoChk.setMem_id(requestId);
					onevoChk.setMem_id2(responseId);
					resultAgain = service.checkOne(onevoChk);
					if(resultAgain != null && resultAgain.equals("대기")) { oneChk = 3;  //로그인자에게 신청 받은 상태
					}else { oneChk = 4; //아직 관계없음
					}
				}
			}
		}
		System.out.println("검사결과 : " + oneChk);
		session.setAttribute("oneChk", oneChk);
		
		request.setAttribute("result", result);
		request.getRequestDispatcher("jsp/resultCheckOne.jsp").forward(request, response);
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
