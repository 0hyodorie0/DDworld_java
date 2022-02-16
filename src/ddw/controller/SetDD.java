package ddw.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ddw.service.DDWorldServiceImpl;
import ddw.service.IDDWorldService;
import ddw.vo.DdVO;



@WebServlet("/setDD.do")
public class SetDD extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		System.out.println("------------------------------------------------------------------");
		
		String dd_skin = request.getParameter("dd_skin"); System.out.println("스킨 / " + dd_skin);
			if(dd_skin == null) { dd_skin = "default.png";}
			
		String dd_edge = request.getParameter("dd_edge"); System.out.println("에지 / " + dd_edge);
			if(dd_edge == null || dd_edge.length() < 0) { dd_edge = "4FB4D8";}
			else {dd_edge = dd_edge.substring(1);}
			
		String dd_menu = request.getParameter("dd_menu"); System.out.println("메뉴 / " + dd_menu);
			if(dd_menu == null || dd_edge.equals("")) { dd_menu = "4FB4D8";}
			else {dd_menu = dd_menu.substring(1);}
			
		String dd_add  = request.getParameter("dd_add");
		System.out.println(dd_add + ">>>" +dd_edge + " / " + dd_menu); 
		
		DdVO vo = new DdVO();
		vo.setDd_add(dd_add);
		vo.setDd_edge(dd_edge);
		vo.setDd_menu(dd_menu);
		vo.setDd_skin(dd_skin);
		
		IDDWorldService service = DDWorldServiceImpl.getInstance();
		
		service.updateDDColor(vo);
		
		//request.getRequestDispatcher("/photoList.do?dd_add="+dd_add+"").forward(request, response);
		response.sendRedirect(request.getContextPath()+"/gbook.do?dd_add="+dd_add+"");
		
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
