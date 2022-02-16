package ddw.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ddw.service.MiniHomeService;
import ddw.service.MiniHomeServiceImpl;
import ddw.vo.MiniVO;

@WebServlet("/miniroomUpdate.do")
public class MiniroomUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
//		HttpSession session = request.getSession();
//		
//		Map<String, String> keys = (Map<String, String>) session.getAttribute("keys");
//		String keyDdworld = keys.get("keyDdworld");
//		
//		DdVO ddvo = (DdVO)session.getAttribute(keyDdworld);
//		
//		String dd_add = ddvo.getDd_add();
		
		
		
		int minicode = Integer.parseInt(request.getParameter("minicode"));
		
		String prodnum = request.getParameter("prodnum");
		Double minileft = Double.parseDouble((request.getParameter("minileft")));
		Double minitop = Double.parseDouble((request.getParameter("minitop")));
		
		
		MiniVO vo = new MiniVO();
		vo.setDd_add("test01dd");
		vo.setProd_num(prodnum);
		vo.setMini_left(minileft);
		vo.setMini_top(minitop);
		
		MiniHomeService service = MiniHomeServiceImpl.getInstance();
		
		int cnt = service.updateMiniroom(vo);
		
//		request.setAttribute("sid", cnt);
//		
//		request.getRequestDispatcher("diary/lastlastdiary.jsp").forward(request, response);
		
		if(minicode==1) {
			response.sendRedirect(request.getContextPath() + "/miniroomSelect.do");
		}else if((minicode==2)){
			response.sendRedirect(request.getContextPath() + "/miniroomSetselect.do");
		}
	
	}

}
