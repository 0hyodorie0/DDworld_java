package ddw.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ddw.service.MiniHomeService;
import ddw.service.MiniHomeServiceImpl;
import ddw.vo.DdVO;
import ddw.vo.GbookVO;
import ddw.vo.MemberVO;


@WebServlet("/insertGbook.do")
public class InsertGbook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       




	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String gbook_con = request.getParameter("gbook_con");
		System.out.println("방명록 추가서블릿 도착=======받은 값 : " + gbook_con);
		
		GbookVO vo = new GbookVO();
		HttpSession session = request.getSession();
		
		MemberVO memvo = (MemberVO)session.getAttribute("loginMember");
		
		Map<String, String> keys = new HashMap<>();
		keys= (Map<String, String>) session.getAttribute("keys");
		String keyDdworld = keys.get("keyDdworld");
		
		DdVO ddvo = (DdVO) session.getAttribute(keyDdworld);
		
		
		String mem_id = memvo.getMem_id();
		String dd_add = ddvo.getDd_add();
		
		
		vo.setGuest_con(gbook_con);
		vo.setMem_id(mem_id);
		vo.setDd_add(dd_add);
		
		
		MiniHomeService service = MiniHomeServiceImpl.getInstance();
		
		service.insertgbook(vo);
		
		
		response.sendRedirect(request.getContextPath()+"/gbook.do?dd_add="+dd_add+"");
	}

}
