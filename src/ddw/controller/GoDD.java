package ddw.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import ddw.service.DDWorldServiceImpl;
import ddw.service.IDDWorldService;
import ddw.vo.DdVO;
import ddw.vo.MemberVO;
import ddw.vo.OneVO;
import ddw.vo.VisitVO;



@WebServlet("/goDD.do")
public class GoDD extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//1.세션의 아이디로 DD정보를 불러와야 한다.
		String mem_id = request.getParameter("id");
		System.out.println("goDD서블릿이 받은 파라미터============>" + mem_id);
		
		IDDWorldService service = DDWorldServiceImpl.getInstance();
		
		//방문자 수 증가
		service.insertVisit(mem_id);
		//dd월드데이터 얻기
		DdVO ddvo = service.selectOneDD(mem_id);
		String ddid = ddvo.getMem_id();
		
		//일촌리스트 데이터 얻기
		List<OneVO> onelist = service.selectAllOne(mem_id);
		//방문자 카운트 데이터 얻기
		VisitVO visitvo = service.countVisit(mem_id);
		
		System.out.println("투데이===============" + visitvo.getToday());
		System.out.println("토탈===============" + visitvo.getTotal());
		
		HttpSession session = request.getSession();
		
		
		//session key설정 >> 미니홈피 주인의 아이디로 세션키가 설정되고 있다??
		String keyDdworld = "ddworld" + ddid;
		String keyOnelist = "onelist" + ddid;
		String keyVisit = "visit" + ddid;
		System.out.println(keyDdworld +"/"+keyOnelist+"/"+keyVisit);
		
		//이 미니홈피에 방문하려는 로그인멤버의 정보--------------------------------------
		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
		/* 개발중 입니다-김개웅
		OneVO onevo = new OneVO();
		onevo.setMem_id(mem_id);	//미니홈피 주인
		onevo.setMem_id2(loginMember.getMem_id());	//로그인한 사람
		*/
		//----------------------------------------------------------------
		
		/* 미니홈피 주인과 로그인자의 관계 검사 mem_id>미니홈피주인 mem_id2>방문자 */
		int oneChk = 0;
		String mem_id2 = null;
		if(loginMember != null) { mem_id2 = loginMember.getMem_id(); }
		
		System.out.println("미니홈피 주인 : " + mem_id + " / " + " 로그인 자 : " + mem_id2);
		
		OneVO onevo = new OneVO();
		if(mem_id2 == null) { oneChk = 0;	//비회원
		}else if(mem_id2 != null) {
			if(mem_id2.equals(mem_id)) { oneChk = 5;	//본인
			}else {
				/*미니홈피 주인*/onevo.setMem_id(mem_id);
				/*로그인 자*/onevo.setMem_id2(mem_id2);
				String result = null;
				//select ONE_ING from ONE where MEM_ID = #mem_id# and MEM_ID2 = #mem_id2#
				result = service.checkOne(onevo);
				if(result != null && result.equals("일촌")) { oneChk = 1; //일촌
				}else if(result != null && result.equals("대기")) { oneChk = 2; //로그인자에게 신청 온 상태
				}else {
					onevo.setMem_id(mem_id2);
					onevo.setMem_id2(mem_id);
					result = service.checkOne(onevo);
					if(result != null && result.equals("대기")) { oneChk = 3;  //로그인자에게 신청 받은 상태
					}else { oneChk = 4; //아직 관계없음
					}
				}
			}
		}
		System.out.println("검사결과 : " + oneChk);
		session.setAttribute("oneChk", oneChk);
		
		//키 스트링 세션----------------------------
		Map<String, String> keys = new HashMap<>();
		keys.put("keyDdworld", keyDdworld);
		keys.put("keyOnelist", keyOnelist);
		keys.put("keyVisit", keyVisit);
		
		session.setAttribute("keys", keys);
		
		session.setAttribute(keyDdworld, ddvo);
		session.setAttribute(keyOnelist, onelist);
		session.setAttribute(keyVisit, visitvo);
		//------------------------------------
		
		/*
		session.setAttribute("ddworld", ddvo);
		session.setAttribute("onelist", onelist);
		session.setAttribute("visit", visitvo);
		*/
		
		//request.setAttribute("onelist", onelist);
		//request.getRequestDispatcher("/jsp/minihome_shs.jsp").forward(request, response);
		response.sendRedirect(request.getContextPath()+"/jsp/minihome_shs.jsp");
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
