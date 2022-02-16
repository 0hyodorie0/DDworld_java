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

import ddw.service.DDWorldServiceImpl;
import ddw.service.IDDWorldService;
import ddw.vo.DdVO;
import ddw.vo.MemberVO;
import ddw.vo.OneVO;



@WebServlet("/selectOneConList.do")
public class SelectOneConList extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("일촌평 조회 서블릿 도착");
		
		HttpSession session = request.getSession();
		
		Map<String, String> keys = (Map<String, String>) session.getAttribute("keys");
		String keyDdworld = keys.get("keyDdworld");
		
		DdVO ddvo = (DdVO)session.getAttribute(keyDdworld);
		
		String mem_id = ddvo.getMem_id();
		
		IDDWorldService service = DDWorldServiceImpl.getInstance();
		
		List<OneVO> list = service.selectAllOne(mem_id);
		
		Gson gson = new Gson();
		String result = gson.toJson(list);
				
		response.setContentType("application/json; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
				
		out.print(result);
		
		//request.getRequestDispatcher("jsp/mini_home.jsp").forward(request, response);
		//response.sendRedirect("jsp/mini_home.jsp");
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
