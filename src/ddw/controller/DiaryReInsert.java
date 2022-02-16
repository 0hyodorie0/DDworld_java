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
import ddw.vo.DiaryreVO;
import ddw.vo.MemberVO;

@WebServlet("/diaryReInsert.do")
public class DiaryReInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("--------------rein---------");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		Map<String, String> keys = (Map<String, String>) session.getAttribute("keys");
		String keyDdworld = keys.get("keyDdworld");
		
		DdVO ddvo = (DdVO)session.getAttribute(keyDdworld);
		MemberVO loginMember =  (MemberVO)session.getAttribute("loginMember");
		
		String dd_add = ddvo.getDd_add();
		
		int DIARYNO = Integer.parseInt(request.getParameter("diaryNo"));
		String DIARYRECON = request.getParameter("diaryRe");
		String memName = loginMember.getMem_name();
		String memId = loginMember.getMem_id();
		
		
		DiaryreVO vo = new DiaryreVO();
		vo.setDiary_no(DIARYNO);
		vo.setDiary_recon(DIARYRECON);
		vo.setMem_name(memName);
		vo.setMem_id(memId);
		
		MiniHomeService service = MiniHomeServiceImpl.getInstance();
		
		int cnt = service.insertDiaryRe(vo);
		System.out.println(DIARYRECON);
//		request.setAttribute("sid", cnt);
//		
//		request.getRequestDispatcher("diary/lastlastdiary.jsp").forward(request, response);
		
		
		response.sendRedirect("jsp/mini_diary.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
	}

}
