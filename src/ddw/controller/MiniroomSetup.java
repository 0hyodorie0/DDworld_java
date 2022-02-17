package ddw.controller;

import java.io.IOException;
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
import ddw.vo.MemberVO;
import ddw.vo.MiniVO;

/**
 * Servlet implementation class MiniroomSetup
 */
@WebServlet("/miniroomSetup.do")
public class MiniroomSetup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
//		Map<String, String> keys = (Map<String, String>) session.getAttribute("keys");
//		String keyDdworld = keys.get("keyDdworld");
		System.out.println("ssssss==========================");
//		DdVO ddvo = (DdVO)session.getAttribute(keyDdworld);
		
//		String dd_add = ddvo.getDd_add();
		MemberVO loginMember =  (MemberVO)session.getAttribute("loginMember");
		
		MiniHomeService service = MiniHomeServiceImpl.getInstance();
		

		String prodnum = request.getParameter("prodnum2");
		String minitype = request.getParameter("minitype2");
		String backgr = request.getParameter("backgr");
		
		String pnum = prodnum.substring(0,4);
		
		if(pnum.equals("P601")) {
			MiniVO vo4 = new MiniVO();
			vo4.setDd_add(loginMember.getMem_id()+"dd");
			vo4.setMini_type("보유");
			vo4.setProd_num(backgr);
			
			int cnt = service.updateSetMiniroom(vo4);
		}
		
		System.out.println(pnum);
		System.out.println("  33"+backgr);
		
		MiniVO vo3 = new MiniVO();
		vo3.setDd_add(loginMember.getMem_id()+"dd");
		vo3.setMini_type(minitype);
		vo3.setProd_num(prodnum);
		
		
		int cnt = service.updateSetMiniroom(vo3);
		System.out.println("------------------------------");
		
		response.sendRedirect(request.getContextPath() + "/miniroomSetselect.do");
	
	}

}
