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
import ddw.vo.DiaryVO;

@WebServlet("/diaryUpdate.do")
public class DiaryUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		Map<String, String> keys = (Map<String, String>) session.getAttribute("keys");
		String keyDdworld = keys.get("keyDdworld");
		
		DdVO ddvo = (DdVO)session.getAttribute(keyDdworld);
		
		String dd_add = ddvo.getDd_add();
		
		
		int diaNo = Integer.parseInt(request.getParameter("diaNo"));
		String diaContent = request.getParameter("diaContent");
		String diaType = request.getParameter("diaType");
		
		DiaryVO vo = new DiaryVO();
		vo.setDiary_no(diaNo);
		vo.setDiary_cont(diaContent);
		vo.setDiary_type(diaType);
		
		MiniHomeService service = MiniHomeServiceImpl.getInstance();
		
		int cnt = service.updateDiary(vo);
		
//		request.setAttribute("sid", cnt);
//		
//		request.getRequestDispatcher("diary/lastlastdiary.jsp").forward(request, response);
		
		
		response.sendRedirect("jsp/mini_diary.jsp");
	
	}

}
