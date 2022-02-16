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
import ddw.vo.MainVO;
import ddw.vo.MemberVO;




@WebServlet("/login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		MemberVO vo = new MemberVO();
		
		System.out.println("로그인 서블릿 도착");
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		System.out.println("도착 id : " + id + " / 도착 pass : " + pass);
		
		vo.setMem_id(id);
		vo.setMem_pass(pass);
		
		
		IDDWorldService service = DDWorldServiceImpl.getInstance();
		HttpSession session = request.getSession();
		
		vo = service.login(vo);
		
		if(vo == null) {	//로그인 실패
			request.getRequestDispatcher("/WEB-INF/views/member/loginFail.jsp").forward(request, response);
		}else {	//로그인 성공
			if(vo.getMem_type().equals("회원")) {	//회원로그인
				session.setAttribute("loginMember", vo);
				
				//추가로 로그인 성공한 회원의 통합 정보를 세션에 저장한다.
				MainVO mainvo = service.myAllData(id);
				session.setAttribute("myAllData", mainvo);
				
				request.getRequestDispatcher("/WEB-INF/views/member/loginMember.jsp").forward(request, response);
			}else if(vo.getMem_type().equals("관리자")) {//관리자로그인				
				session.setAttribute("loginMember", vo);
				request.getRequestDispatcher("/WEB-INF/views/member/loginAdmin.jsp").forward(request, response);
			}else {
				request.getRequestDispatcher("/WEB-INF/views/member/loginFail.jsp").forward(request, response);
			}
			System.out.println(vo.getMem_name());
		}
	}

}
