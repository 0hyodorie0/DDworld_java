package ddw.controller;

import java.io.IOException;
import java.util.List;
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

@WebServlet("/miniroomSetselect.do")
public class MIniroomSetselect extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		Map<String, String> keys = (Map<String, String>) session.getAttribute("keys");
		String keyDdworld = keys.get("keyDdworld");
		
		DdVO ddvo = (DdVO)session.getAttribute(keyDdworld);
		
		String ddadd = request.getParameter("ddadd");
		
		MemberVO loginMember =  (MemberVO)session.getAttribute("loginMember");
	
		MiniHomeService service = MiniHomeServiceImpl.getInstance();
		
		MiniVO vo = new MiniVO();
		vo.setDd_add(loginMember.getMem_id()+"dd");
		vo.setMini_type("사용");
		
		List<MiniVO> list = service.miniSelect(vo);
		
		
		MiniVO vo2 = new MiniVO();
		vo2.setDd_add(loginMember.getMem_id()+"dd");
		vo2.setMini_type("보유");
		
		List<MiniVO> list2 = service.miniSelect(vo2);
		
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		request.getRequestDispatcher("jsp/miniroomSetting.jsp").forward(request, response);
		
		
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
