package ddw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
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
import ddw.vo.MemberVO;

@WebServlet("/diarySelect.do")
public class DiarySelect extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		Map<String, String> keys = (Map<String, String>) session.getAttribute("keys");
		String keyDdworld = keys.get("keyDdworld");
		
		DdVO ddvo = (DdVO)session.getAttribute(keyDdworld);
		
//		MemberVO loginMember =  (MemberVO)session.getAttribute("loginMember");
		
		String dd_add = ddvo.getDd_add();
		String day = request.getParameter("day");
		
//		String login = loginMember.getMem_id()+"dd";
		
//		System.out.println("셀렉 ------" + login);
		DiaryVO vo = new DiaryVO();
		vo.setDd_add(dd_add);
		vo.setDiary_date(day);
		
		MiniHomeService service = MiniHomeServiceImpl.getInstance();
		
		System.out.println("date==================" + day);
		
		List<DiaryVO> list = service.selectDiary(vo);
		
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
//		System.out.println("ddddddddddddddd" + loginmem);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println(result);
//		out.println(loginmem);
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
