package ddw.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ddw.service.MiniHomeService;
import ddw.service.MiniHomeServiceImpl;
import ddw.vo.MiniVO;

@WebServlet("/deldrag.do")
public class deldrag extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String ddadd = request.getParameter("ddadd");
	
		MiniHomeService service = MiniHomeServiceImpl.getInstance();
		
		MiniVO vo = new MiniVO();
		vo.setDd_add("test01dd");
		vo.setMini_type("사용");
		
//		List<MiniVO> list = service.miniSelect(ddadd);
		List<MiniVO> list = service.miniSelect(vo);
		
		
		MiniVO vo2 = new MiniVO();
		vo2.setDd_add("test01dd");
		vo2.setMini_type("보유");
		
//		List<MiniVO> list = service.miniSelect(ddadd);
		List<MiniVO> list2 = service.miniSelect(vo2);
		
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		request.getRequestDispatcher("jsp/deldrag.jsp").forward(request, response);
		
		
//		Gson gson = new Gson();
//		
//		String result = gson.toJson(list);
////		String loginmem = gson.toJson(login);
//		
//		System.out.println(result);
////		System.out.println("ddddddddddddddd" + loginmem);
//		response.setContentType("application/json; charset=utf-8");
//		PrintWriter out = response.getWriter();
//		
//		out.println(result);
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
