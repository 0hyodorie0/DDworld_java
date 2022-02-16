package ddw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import ddw.service.MiniHomeService;
import ddw.service.MiniHomeServiceImpl;
import ddw.vo.DdVO;
import ddw.vo.DiaryVO;
import ddw.vo.DiaryreVO;
import ddw.vo.MemberVO;

@WebServlet("/diaryReSelect.do")
public class DiaryReSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("---------------------re------------------------");
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		Map<String, String> keys = (Map<String, String>) session.getAttribute("keys");
		String keyDdworld = keys.get("keyDdworld");
		
		DdVO ddvo = (DdVO)session.getAttribute(keyDdworld);
		
//		MemberVO loginMember =  (MemberVO)session.getAttribute("loginMember");
//		
//		String dd_add = ddvo.getDd_add();
		
		int no = Integer.parseInt(request.getParameter("no"));
		
//		String login = loginMember.getMem_id()+"dd";
		
		
		MiniHomeService service = MiniHomeServiceImpl.getInstance();
		
		
		List<DiaryreVO> list = service.selectDiaryRe(no);
		System.out.println("---------------------re2------------------------");
		
		System.out.println(list+"//////");
		
//		request.setAttribute("login", login);
//		
//        request.setAttribute("list", list);               
//    	
//		RequestDispatcher rd = 
//				request.getRequestDispatcher("/WEB-INF/views/diary/selectDiary.jsp");
//			rd.forward(request, response);
		
		
		
		
		Gson gson = new Gson();
		
		String result = gson.toJson(list);
//		String loginmem = gson.toJson(login);
		
		System.out.println(result);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println(result);
//		out.println(loginmem);
	
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
