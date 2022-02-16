package ddw.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ddw.service.DDWorldServiceImpl;
import ddw.service.IDDWorldService;
import ddw.vo.DdVO;
import ddw.vo.OneVO;



@WebServlet("/deleteOneCon.do")
public class DeleteOneCon extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String mem_id2 = request.getParameter("mem_id2");
		System.out.println("일촌평 삭제 서블릿이 받은 아이디 >>> " + mem_id2);

		HttpSession session = request.getSession();
		
		Map<String, String> keys = (Map<String, String>) session.getAttribute("keys");
		String keyDdworld = keys.get("keyDdworld");
		DdVO ddvo = (DdVO)session.getAttribute(keyDdworld);
		String mem_id = ddvo.getMem_id();
		
		OneVO vo = new OneVO();
		
		vo.setMem_id(mem_id);
		vo.setMem_id2(mem_id2);
		
		//서비스부터 만들기
		IDDWorldService service = DDWorldServiceImpl.getInstance();
		service.setNullOneCon(vo);
		
		//selectOneConList.do
		
		//request.getRequestDispatcher("selectOneConList.do").forward(request, response);
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
