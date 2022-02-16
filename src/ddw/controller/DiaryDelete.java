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

@WebServlet("/diaryDelete.do")
public class DiaryDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		MiniHomeService service = MiniHomeServiceImpl.getInstance();
		
		int cnt = service.deleteDiary(no);
		
		response.sendRedirect("jsp/mini_diary.jsp");
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
