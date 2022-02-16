package ddw.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ddw.service.MiniHomeService;
import ddw.service.MiniHomeServiceImpl;
import ddw.vo.MemberVO;

@WebServlet("/diaryReDelete.do")
public class DiaryReDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("memid");
		int no = Integer.parseInt(request.getParameter("renum"));
		
		MiniHomeService service = MiniHomeServiceImpl.getInstance();
		
		HttpSession session = request.getSession();
		
		MemberVO loginMember =  (MemberVO)session.getAttribute("loginMember");
		
		if(id.equals(loginMember.getMem_id())){
			int cnt = service.deleteDiaryRe(no);
		}
		response.sendRedirect("jsp/mini_diary.jsp");
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
