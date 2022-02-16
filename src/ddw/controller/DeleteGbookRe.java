package ddw.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ddw.service.DDWorldServiceImpl;
import ddw.service.IDDWorldService;
import ddw.vo.GbookVO;



@WebServlet("/deleteGbookRe.do")
public class DeleteGbookRe extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		int guest_renum = Integer.parseInt(request.getParameter("gbookre_no"));
		
				
		IDDWorldService service = DDWorldServiceImpl.getInstance();
		service.deleteGuestRe(guest_renum);
		
		response.sendRedirect(request.getContextPath() + "/gbook.do");
	}

}
