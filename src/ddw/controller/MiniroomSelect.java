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

@WebServlet("/miniroomSelect.do")
public class MiniroomSelect extends HttpServlet {
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
		
		
		
//		List<MiniVO> list = service.miniSelect(ddadd);
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("jsp/miniroom2.jsp").forward(request, response);
		
		
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
