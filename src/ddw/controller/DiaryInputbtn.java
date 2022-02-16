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
import ddw.vo.DiaryVO;

@WebServlet("/diaryInputbtn.do")
public class DiaryInputbtn extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		Map<String, String> keys = (Map<String, String>) session.getAttribute("keys");
		String keyDdworld = keys.get("keyDdworld");
		
		DdVO ddvo = (DdVO)session.getAttribute(keyDdworld);
		
		String dd_add = ddvo.getDd_add();
		String date = request.getParameter("year") + request.getParameter("month");
		
		DiaryVO vo = new DiaryVO();
		vo.setDd_add(dd_add);
		vo.setDiary_date(date);
		
		MiniHomeService service = MiniHomeServiceImpl.getInstance();
		
		System.out.println("date==================" + date);
		
		List<Integer> list = service.inputbtnDay(vo);
		
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("WEB-INF/views/diary/inputDay.jsp").forward(request, response);
		
//		Gson gson = new Gson();
//		
//		String result = gson.toJson(list);
//		
//		System.out.println(result);
//		response.setContentType("application/json; charset=utf-8");
//		PrintWriter out = response.getWriter();
//		
//		out.println(result);
//		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
